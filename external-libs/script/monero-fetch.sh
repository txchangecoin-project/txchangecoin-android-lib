#!/usr/bin/env bash

set -e

source script/env.sh

cd $EXTERNAL_LIBS_BUILD_ROOT

url="https://github.com/txchangecoin-project/txchangecoin"
version="release-v0.1.1.0"

if [ ! -d "txchangecoin" ]; then
  git clone ${url} -b ${version} monero
  cd monero
  git submodule update --recursive --init
else
  cd monero
  git checkout ${version}
  git pull
  git submodule update --recursive --init
fi
