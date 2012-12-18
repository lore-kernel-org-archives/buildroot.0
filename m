From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Dec 2012 10:09:54 +0100
Subject: [Buildroot] allyespackageconfig build on ARM/Linaro
Message-ID: <20121218100954.2d59c70f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Following Arnout's comment suggesting to try a allyespackageconfig
build on ARM with a Linaro external toolchain (to complement Arnout
excellent work on allyespackageconfig testing for x86-64), I did this
test yesterday and I have now have the results.

Here are my notes:

 * I've disabled JamVM and Classpath, because my testing chroot does
   not have javac. So those packages are not tested.

 * mplayer failed to build, so I had to disable it, and also disable
   libplayer, which was selecting mplayer. The mplayer build failure is
   FPU related:

{standard input}: Assembler messages:
{standard input}:2855: Error: selected FPU does not support instruction -- `vmul.f32 q0,q0,q1'
{standard input}:2949: Error: selected processor does not support ARM mode `veor q0,q0,q2'
{standard input}:2950: Error: selected FPU does not support instruction -- `vmul.f32 q0,q0,q1'
{standard input}:3021: Error: selected FPU does not support instruction -- `vmul.f32 d0,d0,d1'
{standard input}:3104: Error: selected processor does not support ARM mode `veor d0,d0,d2'
{standard input}:3105: Error: selected FPU does not support instruction -- `vmul.f32 d0,d0,d1'
make[3]: *** [libavcodec/aacdec.o] Error 1
make[2]: *** [ffmpeg/libavcodec/libavcodec.a] Error 2
make[2]: *** Waiting for unfinished jobs....

 * ltp-testsuite fails to build (build failures already seen with the
   autobuilders):

common.c: In function 'create_net_namespace':
common.c:64:17: error: 'CLONE_NEWNS' undeclared (first use in this function)
common.c:64:17: note: each undeclared identifier is reported only once for each function it appears in
common.c: In function 'child_fn':
common.c:124:11: error: 'CLONE_NEWNS' undeclared (first use in this function)
common.c:127:11: error: 'CLONE_FS' undeclared (first use in this function)
common.c:147:2: warning: implicit declaration of function 'unshare' [-Wimplicit-function-declaration]
make[6]: *** [common.o] Error 1
make[5]: *** [all] Error 2
make[4]: *** [all] Error 2
make[3]: *** [all] Error 2
make[2]: *** [testcases-all] Error 2

 * matchbox-desktop failed to build:

/home/test/outputs/allpkg/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld: mbdesktop.o: undefined reference to symbol 'dlsym@@GLIBC_2.4'
/home/test/outputs/allpkg/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld: note: 'dlsym@@GLIBC_2.4' is defined in DSO /home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/arm-linux-gnueabihf/libdl.so.2 so try adding it to the linker command line
/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/arm-linux-gnueabihf/libdl.so.2: could not read symbols: Invalid operation
collect2: error: ld returned 1 exit status
make[4]: *** [matchbox-desktop] Error 1
make[3]: *** [all-recursive] Error 1
make[2]: *** [all] Error 2
make[1]: *** [/home/test/outputs/allpkg/build/matchbox-desktop-0.9.1/.stamp_built] Error 2
make: *** [all] Error 2

 * metacity failed to build:

/home/test/outputs/allpkg/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld: metacity-mag.o: undefined reference to symbol 'lrint@@GLIBC_2.4'
/home/test/outputs/allpkg/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld: note: 'lrint@@GLIBC_2.4' is defined in DSO /home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/arm-linux-gnueabihf/libm.so.6 so try adding it to the linker command line
/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/arm-linux-gnueabihf/libm.so.6: could not read symbols: Invalid operation
collect2: error: ld returned 1 exit status
make[6]: *** [metacity-mag] Error 1
make[6]: *** Waiting for unfinished jobs....

 * pcmanfm failed to build:

/home/test/outputs/allpkg/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld: fm-desktop.o: undefined reference to symbol 'XSendEvent'
/home/test/outputs/allpkg/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld: note: 'XSendEvent' is defined in DSO /home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libX11.so.6 so try adding it to the linker command line
/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libX11.so.6: could not read symbols: Invalid operation
collect2: error: ld returned 1 exit status
make[4]: *** [pcmanfm] Error 1

 * sconeserver failed to build (still the ImageMagick++ problem):

checking for InitializeMagick in -lMagick++... no
configure: error: library 'Magick++' is required for Sconesite:image
make[1]: *** [/home/test/outputs/allpkg/build/sconeserver-183/.stamp_configured] Error 1
make: *** [all] Error 2

 * valgrind failed to build (due to glibc 2.16):

checking the GLIBC_VERSION version... unsupported version 2.15
configure: error: Valgrind requires glibc version 2.2 - 2.14
make[1]: *** [/home/test/outputs/allpkg/build/valgrind-3.7.0/.stamp_configured] Error 1
make: *** [all] Error 2

 * xstroke failed to build

/home/test/outputs/allpkg/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld: backing.o: undefined reference to symbol 'XRenderComposite'
/home/test/outputs/allpkg/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld: note: 'XRenderComposite' is defined in DSO /home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libXrender.so.1 so try adding it to the linker command line
/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libXrender.so.1: could not read symbols: Invalid operation
collect2: error: ld returned 1 exit status

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
