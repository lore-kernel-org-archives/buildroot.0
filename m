From: Espen Frimann Koren <espenfk@gmail.com>
Date: Mon, 16 Sep 2013 14:39:56 +0200
Subject: [Buildroot] Building Qt5 Declarative on nitrogen6x with
	buildroot 2013.08
In-Reply-To: <CA+csPL6BGsmEFAag7uXsUxo73Bv5KcqCjLhLJifV_t4M6Oy8WQ@mail.gmail.com>
References: <CA+csPL6BGsmEFAag7uXsUxo73Bv5KcqCjLhLJifV_t4M6Oy8WQ@mail.gmail.com>
Message-ID: <CA+csPL43ygbFLgBgqfHyU7JP10x7=cejdaQGKdBDNAUXcBDoDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again.

Not much response here, so therefore I had to dig more myself :-)

The problem (for me) is the difference between the files (inside Qt):
output/build/qt5base-5.0.2/mkspecs/devices/linux-imx6-g++/qmake.conf
output/build/qt5base-5.0.2/mkspecs/devices/linux-buildroot-g++/qmake.conf

The first file is part of the Qt distribution, the second is defined in
buildroot:
package/qt5/qt5base/qt5base-mkspecs-files.patch

I see a challenge here in that the linux-buildroot-g++-"device" that
buildroot "generates" must have some platform dependent stuff in it. How
this is done in buildroot, I do not know, but two things must into the
qmake.conf file of linux-buildroot-g++:

- the EGL and GAL libraries (in the imx6-file it is: QMAKE_LIBS_OPENGL_ES2
+= -lEGL -lGAL)
- the symbol EGL_API_FB must be defined (in the imx6-file it is:
IMX6_CFLAGS             = -DEGL_API_FB=1)

I understand that it cannot be put into the patch-file, since the EGL and
GAL libraries are interesting for imx6 only.

I will try to explore this more, but maybe someone may do it faster?

Sp1


On 15 September 2013 21:51, Espen Frimann Koren <espenfk@gmail.com> wrote:

> Hi.
>
> I have been trying to get the mentioned configuration to compile. It is
> not straight forward :-)
>
> First of all I compiled the nitrogen6x_defconfig without any problems. But
> I need Qt5 Declarative so I tried to figure out how to configure it. From
> the default config I had to do this:
>
> 1. Add C++ and WCHAR support in the tool chain. This made Qt5 available.
> 2. Qt5 Declarative was not available though needing an Open GL capable
> backend, according to the menuconfig tool.
> 3. The Open GL-backend I found was in Target packages/Hardware
> handling/Freescale i.MX libraries/gpu-viv-bin-mx6q. It needs eglibc, so I
> had to change to that from uclibc.
>
> But this configuration does not compile. I connot figure out what I am
> missing. The first problem is that when Qt5 are running a lot of tests to
> figure out what the target supports, it fails when trying to link the
> libGLESv2.so in output/build/qt5base-5.0.2/config.tests/unix/openglesv2.
> The libraries it needs is in the toolchain (in
> output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib): libGAL.so and
> libEGL.so exists, so I got the compilation a little bit further by adding
> the following lines into
> output/build/qt5base-5.0.2/mkspecs/devices/linux-buildroot-g++/qmake.conf:
>
> QMAKE_LIBS_OPENGL_ES2 += -lGAL
> QMAKE_LIBS_OPENGL_ES2 += -lEGL
>
> The problem now is compiling EGL (still in Qt5 config.tests/qpa/egl):
>
> EGL auto-detection... ()
> gmake[1]: Entering directory
> `/home/espenfk/imx6/buildroot-2013.08/output/build/qt5base-5.0.2/config.tests/qpa/egl'
> /home/espenfk/imx6/buildroot-2013.08/output/host/usr/bin/arm-buildroot-linux-gnueabi-g++
> -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> -pipe -Os
> --sysroot=/home/espenfk/imx6/buildroot-2013.08/output/host/usr/arm-buildroot-linux-gnueabi/sysroot
> -O2 -O3 -Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
> -I/home/espenfk/imx6/buildroot-2013.08/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include
> -o egl.o egl.cpp
> In file included from
> /home/espenfk/imx6/buildroot-2013.08/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/EGL/eglplatform.h:38:0,
>                  from
> /home/espenfk/imx6/buildroot-2013.08/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/EGL/egl.h:34,
>                  from egl.cpp:42:
> /home/espenfk/imx6/buildroot-2013.08/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/EGL/eglvivante.h:224:22:
> fatal error: X11/Xlib.h: No such file or directory
> compilation terminated.
> gmake[1]: *** [egl.o] Error 1
> gmake[1]: Leaving directory
> `/home/espenfk/imx6/buildroot-2013.08/output/build/qt5base-5.0.2/config.tests/qpa/egl'
> EGL disabled.
>  The EGL functionality test failed; EGL is required by some QPA plugins to
> manage contexts & surfaces.
>  You might need to modify the include and library search paths by editing
>  QMAKE_INCDIR_EGL, QMAKE_LIBDIR_EGL and QMAKE_LIBS_EGL in
> /home/espenfk/imx6/buildroot-2013.08/output/build/qt5base-5.0.2/mkspecs/devices/linux-buildroot-g++.
> make: ***
> [/home/espenfk/imx6/buildroot-2013.08/output/build/qt5base-5.0.2/.stamp_configured]
> Error 1
>
> The reason that it fails in eglvivante.h is that a symbol should have been
> defined: EGL_API_FB (or EGL_API_DFB, but I think I cannot use DirectFB). At
> this point I think it is a bit too much to hack the stuff in. I haven't
> studied the inner makings of buildroot so much that I can figure out how to
> define that symbol. So therefore I think that someone who knows this better
> than me may either fix it in the next buildroot version or direct me to a
> solution.
>
> Sp1
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130916/77f3747f/attachment.html>
