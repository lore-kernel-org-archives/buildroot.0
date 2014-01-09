From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Wed, 8 Jan 2014 20:38:10 -0700
Subject: [Buildroot] Problems building SDL, SDL_image, SDL_ttf,
	SDL_gfx via buildroot-2013.11
Message-ID: <CAGrGpJBkBcVq+N8X2z_mArrzM30Sbq0_m4T4B3hzDaoaZWtoWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I created a igepv2 target rootfs using buildroot-2013.11 ==> configured as
follows:
ARM (little endian),
arm926t,
ct-ng-1.18.0 external toolchain, and
SDL + SDL framebuffer console video driver +
SDL_gfx  +
SDL_image +
SDL_ttf.

I used the following before cross-compiling my application.   I do have SDL
on my host so for pkg-config to work, the felabs path has to appear first
in the path list
export CROSS_COMPILE=arm-linux-
export ARCH=arm
export PATH=/usr/local/xtools/arm-unknown-linux-uclibcgnueabi/bin:$PATH
export
PATH=/home/peter/Documents/felabs/sysdev/buildsdl/buildroot-2013.11/output/host/usr/bin:$PATH

While just SDL seems to work fine using
arm-linux-gcc -o lazystatic -static lazyfoo1.c $(pkg-config --libs --cflags
sdl)


the combo of SDL + SDL_image + SDL_ttf + SDL_gfx using
arm-linux-g++  -o oz         \
    /home/peter/Documents/oz3/display/main.cpp    \
        ....(list of about 10 files)
    /home/peter/Documents/oz4/keyboard/ttfopen.c        \
    -lSDL -lSDL_image -lSDL_gfx -lSDL_ttf                   \
    $(pkg-config --libs --cflags sdl SDL_image SDL_gfx      \
           SDL_ttf)

doesn't seem to work.

The dynamic .so cross-compiles ok but has a seg fault part way through when
running on IGEPv2.   The source is complex so I haven't figured out the
point of error but I suspect a .so error.   I am preparing a simpler
version for testing to track it down.

The static won't cross-compile because for some reason SDL_image.a is
missing from
/home/peter/Documents/felabs/sysdev/buildsdl/buildroot-2013.11/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib

I tried copying SDL_image.a from a different library I had cross-compiled
from-scratch but that didn't seem to help.

A copy of my .config file is attached.

Super thanks in advance for any advice or pointers you can give.

Peter
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140108/8276fc59/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: copyof.config
Type: application/octet-stream
Size: 37809 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140108/8276fc59/attachment-0001.obj>
