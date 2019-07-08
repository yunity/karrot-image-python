FROM debian:buster

RUN apt-get update && \
    apt-get install -y \
        curl \
        gnupg \
        gnupg1 \
        gnupg2 \
        python3.7 \
        python3.7-dev \
        virtualenv \
        build-essential \
        git \
        wget \
        rsync \
        python3-pip \
        entr \
        nodejs \
        yarn

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" > \
      /etc/apt/sources.list.d/yarn.list        

RUN apt-get update && \
    apt-get install -y \
        yarn        

RUN curl -o /usr/local/bin/circleci \
        https://circle-downloads.s3.amazonaws.com/releases/build_agent_wrapper/circleci && \
    chmod +x /usr/local/bin/circleci

RUN pip3 install pip-tools
COPY requirements.txt /tmp/
RUN pip3 install -r /tmp/requirements.txt