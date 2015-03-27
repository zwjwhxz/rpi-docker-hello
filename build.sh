#!/bin/sh
tar cv --files-from /dev/null | docker import - nothing
cd home
docker run --rm -v $(pwd):/home -it ontouchstart/rpi-base cc -static -o hello hello.c
cd ..
docker build -t ontouchstart/rpi-docker-hello . > build.log
rm home/hello
./test.sh
