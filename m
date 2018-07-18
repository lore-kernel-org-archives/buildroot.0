From: IoriBranford <ioribranford@gmail.com>
Date: Tue, 17 Jul 2018 23:53:16 -0700
Subject: [Buildroot] LOVE can't build with external toolchain - wrong
 tool(s) used to link
In-Reply-To: <2ed8a475-08a9-4c1f-3ac6-f3e6cfa057d2@gmail.com>
References: <2ed8a475-08a9-4c1f-3ac6-f3e6cfa057d2@gmail.com>
Message-ID: <0969c0e3-117a-2780-6047-559f62716e56@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I narrowed down the issue to a configure problem in love.

https://bitbucket.org/rude/love/issues/1431/

(I also simplified my package a little.)

On 07/17/2018 06:48 PM, IoriBranford wrote:
> Hello,
>
> I've started a package for LOVE, the 2D Lua game engine. 
> https://love2d.org My project is a Raspberry Pi 3 based game system 
> running this engine.
>
> It builds and runs fine with a Buildroot toolchain. But an external 
> toolchain fails at the last link step. I'd prefer using the external 
> toolchain to save rebuild time.
>
> This happens with Linaro toolchain. (The test-pkg tests, using 
> love-rpi.testconfig, were all failed or skipped too.) Here the build 
> tries to use host tools instead of toolchain ones.
>
> (Note that I happen to be building a previous version, 0.10.2.)
>
> >>> love 0.10.2 Building
> PATH="/home/ioribranford/buildroot/output/host/bin:/home/ioribranford/buildroot/output/host/sbin:/home/ioribranford/.nvm/versions/node/v9.4.0/bin:/home/ioribranford/bin:/home/ioribranford/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin" 
> /usr/bin/make -j5? -C 
> /home/ioribranford/buildroot/output/build/love-0.10.2/
> /usr/bin/make? all-recursive
> Making all in src
> /bin/bash ../libtool? --tag=CXX? --mode=link g++???? -o love love.o? 
> liblove.la 
> -L/home/ioribranford/buildroot/output/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/lib 
> -lluajit-5.1?? -lphysfs
>
> *** Warning: Linking the executable love against the loadable module
> *** liblove.so is not portable!
>
> libtool: link: _*g++*_ -o love love.o ./.libs/liblove.so 
> -L/home/ioribranford/buildroot/output/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/lib 
> /home/ioribranford/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libSDL2.so 
> -ldl -lbrcmEGL -lbrcmGLESv2 -lvchostif -lbcm_host -lvcos -lvchiq_arm 
> -lpthread -lrt 
> /home/ioribranford/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libfreetype.so 
> -lopenal -lz 
> /home/ioribranford/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libmodplug.so 
> /home/ioribranford/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libvorbisfile.so 
> /home/ioribranford/buildroot/output/build/libvorbis-1.3.6/lib/.libs/libvorbis.so 
> -lm 
> /home/ioribranford/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libtheoradec.so 
> /home/ioribranford/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libogg.so 
> -lluajit-5.1 -lphysfs -pthread -Wl,-rpath 
> -Wl,/home/ioribranford/buildroot/output/build/love-0.10.2/src/.libs 
> -Wl,-rpath 
> -Wl,/home/ioribranford/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib 
> -Wl,-rpath 
> -Wl,/home/ioribranford/buildroot/output/build/libvorbis-1.3.6/lib/.libs 
> -Wl,-rpath 
> -Wl,/home/ioribranford/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
> (Should be using 
> /home/ioribranford/buildroot/output/host/bin/arm-linux-gnueabihf-g++)
>
> _*/usr/bin/x86_64-linux-gnu-ld*_: love.o: Relocations in generic ELF 
> (EM: 40)
> _*/usr/bin/x86_64-linux-gnu-ld*_: love.o: Relocations in generic ELF 
> (EM: 40)
> (Should be using 
> /home/ioribranford/buildroot/output/host/bin/arm-linux-gnueabihf-ld)
>
> love.o: error adding symbols: File in wrong format
> collect2: error: ld returned 1 exit status
> Makefile:3190: recipe for target 'love' failed
> make[5]: *** [love] Error 1
> Makefile:3740: recipe for target 'all-recursive' failed
> make[4]: *** [all-recursive] Error 1
> Makefile:623: recipe for target 'all-recursive' failed
> make[3]: *** [all-recursive] Error 1
> Makefile:424: recipe for target 'all' failed
> make[2]: *** [all] Error 2
> package/pkg-generic.mk:223: recipe for target 
> '/home/ioribranford/buildroot/output/build/love-0.10.2/.stamp_built' 
> failed
> make[1]: *** 
> [/home/ioribranford/buildroot/output/build/love-0.10.2/.stamp_built] 
> Error 2
> Makefile:79: recipe for target '_all' failed
> make: *** [_all] Error 2
>
>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180717/1173a932/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: love.tar.gz
Type: application/gzip
Size: 12492 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180717/1173a932/attachment.bin>
