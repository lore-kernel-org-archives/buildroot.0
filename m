From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 15:17:40 +0200
Subject: [Buildroot] Results of allyespackageconfig on ARM
Message-ID: <20130510151740.21155224@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've done a allyespackageconfig build on ARM with a Linaro toolchain.
The build is done after disabling jamvm and classpath, because I don't
have a Java compiler installed in the chroot where the build takes
place.

There were four build issues before I could proceed with a complete
build, described below.

mplayer fails to build with:
============================

{standard input}: Assembler messages:
{standard input}:2857: Error: selected FPU does not support instruction -- `vmul.f32 q0,q0,q1'
{standard input}:2951: Error: selected processor does not support ARM mode `veor q0,q0,q2'
{standard input}:2952: Error: selected FPU does not support instruction -- `vmul.f32 q0,q0,q1'
{standard input}:3023: Error: selected FPU does not support instruction -- `vmul.f32 d0,d0,d1'
{standard input}:3106: Error: selected processor does not support ARM mode `veor d0,d0,d2'
{standard input}:3107: Error: selected FPU does not support instruction -- `vmul.f32 d0,d0,d1'

This was solved by disabling mplayer, and therefore the mplayer backend
of libplayer.

gst-plugins-bad-0.10.23 fails to build with:
============================================

/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/directfb/direct/os/waitqueue.h:47:25: warning: redundant redeclaration of 'direct_waitqueue_deinit' [-Wredundant-decls]
In file included from /home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/directfb/direct/os/types.h:59:0,
                 from /home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/directfb/direct/os/waitqueue.h:32,
                 from /home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/directfb/direct/thread.h:34,
                 from /home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/directfb/direct/debug.h:39,
                 from /home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/directfb/direct/interface.h:32,
                 from /home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/directfb/directfb.h:43,
                 from dfb-example.c:2:
/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/directfb/direct/os/linux/glibc/waitqueue.h:108:1: note: previous definition of 'direct_waitqueue_deinit' was here
  CC     libgstcog_la-cogvirtframe.lo
In file included from /home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gstreamer-0.10/gst/gst.h:49:0,
                 from dfb-example.c:4:
/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gstreamer-0.10/gst/gstinfo.h:274:48: error: expected ')' before '__attribute__'
/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gstreamer-0.10/gst/gstinfo.h:274:48: error: expected ',' or ';' before ')' token
/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gstreamer-0.10/gst/gstinfo.h:296:68: error: expected ')' before '__attribute__'
/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gstreamer-0.10/gst/gstinfo.h:296:68: error: expected ',' or ';' before ')' token
/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gstreamer-0.10/gst/gstinfo.h:321:51: error: expected ')' before '__attribute__'
/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gstreamer-0.10/gst/gstinfo.h:321:51: error: expected ',' or ';' before ')' token
/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gstreamer-0.10/gst/gstinfo.h:333:70: error: expected ')' before '__attribute__'
/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gstreamer-0.10/gst/gstinfo.h:333:70: error: expected ',' or ';' before ')' token
make[5]: *** [dfb_example-dfb-example.o] Error 1
make[5]: *** Waiting for unfinished jobs....
/usr/bin/make -C rsvg

This was solved by disabling the DirectFB plugin of gst-plugins-bad.

sconeserver fails to build with:
================================

checking for InitializeMagick in -lMagick++... no
configure: error: library 'Magick++' is required for Sconesite:image
make[1]: *** [/home/test/outputs/allpkg/build/sconeserver-183/.stamp_configured] Error 1
make: *** [all] Error 2

This was solved by disabling sconeserver.

wvstreams fails to build with:
==============================

./CXX -c utils/wvuid
utils/wvuid.cc: In function 'wvuid_t wvgetuid()':
utils/wvuid.cc:63:19: error: 'getuid' was not declared in this scope
utils/wvuid.cc:64:1: warning: control reaches end of non-void function [-Wreturn-type]
make[2]: *** [utils/wvuid.o] Error 1
make[1]: *** [/home/test/outputs/allpkg/build/wvstreams-4.6.1/.stamp_built] Error 2
make: *** [all] Error 2

This was solved by disabling wvstreams and wvdial.

The output/build/ directory weights 19 GB. The output/target/ directory
weights 1.1 GB.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
