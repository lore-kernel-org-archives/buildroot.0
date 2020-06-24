From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Wed, 24 Jun 2020 09:27:18 +0100
Subject: [Buildroot] Fwd: [autobuild.buildroot.net] Your daily results for
 2020-06-23
In-Reply-To: <5ef2f432.1c69fb81.a5cd0.f985SMTPIN_ADDED_MISSING@mx.google.com>
References: <5ef2f432.1c69fb81.a5cd0.f985SMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <b0717fe9-df31-7e18-6d38-96a312eec677@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all (libcamera, and buildroot lists joined).


Buildroot build-bots are reporting some compilation failures for libcamera.

The Nios2 one is some architecture-specific 8-byte alignment issue?
I'd be tempted to disable builds on Nios2...

Then there are also two build failures for x86_64 and mipsel64...

> http://autobuild.buildroot.net/results/03a83b88d0f541f567e54cb2b29ed4bca58a52ad/build-end.log


The configuration is:

> The Meson build system
> Version: 0.54.2
> Source dir: /home/naourr/work/instance-1/output-1/build/libcamera-96fab38e02792a109c0d35ca2154e95a7b4c8fcb
> Build dir: /home/naourr/work/instance-1/output-1/build/libcamera-96fab38e02792a109c0d35ca2154e95a7b4c8fcb/build
> Build type: cross build
> Project name: libcamera
> Project version: 0.0.0
> C compiler for the build machine: cc (gcc 10.1.1 "cc (GCC) 10.1.1 20200507 (Red Hat 10.1.1-1)")
> C linker for the build machine: cc ld.bfd 2.34-3
> C++ compiler for the build machine: c++ (gcc 10.1.1 "c++ (GCC) 10.1.1 20200507 (Red Hat 10.1.1-1)")
> C++ linker for the build machine: c++ ld.bfd 2.34-3
> C compiler for the host machine: /home/naourr/work/instance-1/output-1/host/bin/x86_64-amd-linux-gnu-gcc (gcc 6.2.0 "x86_64-amd-linux-gnu-gcc (Sourcery CodeBench Lite 2016.11-19) 6.2.0")
> C linker for the host machine: /home/naourr/work/instance-1/output-1/host/bin/x86_64-amd-linux-gnu-gcc ld.bfd 2.26.51
> C++ compiler for the host machine: /home/naourr/work/instance-1/output-1/host/bin/x86_64-amd-linux-gnu-g++ (gcc 6.2.0 "x86_64-amd-linux-gnu-g++ (Sourcery CodeBench Lite 2016.11-19) 6.2.0")
> C++ linker for the host machine: /home/naourr/work/instance-1/output-1/host/bin/x86_64-amd-linux-gnu-g++ ld.bfd 2.26.51
> Build machine cpu family: x86_64
> Build machine cpu: x86_64
> Host machine cpu family: x86_64
> Host machine cpu: 
> Target machine cpu family: x86_64
> Target machine cpu: 
> Header <execinfo.h> has symbol "backtrace" : YES 
> Header <stdlib.h> has symbol "secure_getenv" : YES 
> Compiler for C supports arguments -Wno-c99-designator -Wc99-designator: NO 
> Configuring version.h using configuration
> Program openssl found: YES (/home/naourr/work/instance-1/output-1/host/bin/openssl)
> Library atomic found: YES
> Library dl found: YES
> Library gnutls found: YES
> Found pkg-config: /home/naourr/work/instance-1/output-1/host/bin/pkgconf (1.6.1)
> Found CMake: NO
> Run-time dependency libudev found: NO (tried pkgconfig and cmake)
> Run-time dependency threads found: YES
> Run-time dependency Boost found: YES 1.73.0 (/home/naourr/work/instance-1/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr)
> Program ipa-sign-install.sh found: YES (/home/naourr/work/instance-1/output-1/build/libcamera-96fab38e02792a109c0d35ca2154e95a7b4c8fcb/src/ipa/ipa-sign-install.sh)
> WARNING: rcc dependencies will not work reliably until this upstream issue is fixed: https://bugreports.qt.io/browse/QTBUG-45460
> Run-time dependency qt5 (modules: Core, Gui, Widgets) found: NO (tried pkgconfig)
> Run-time dependency glib-2.0 found: YES 2.64.3
> Run-time dependency gstreamer-video-1.0 found: YES 1.16.2
> Run-time dependency gstreamer-allocators-1.0 found: YES 1.16.2
> Configuring config.h using configuration
> Build targets in project: 20

And failure :

> ../src/gstreamer/gstlibcamerapad.cpp: In function 'GType gst_libcamera_pad_get_type()':
> /home/naourr/work/instance-1/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib/gatomic.h:128:15: error: variable 'gapg_temp_atomic' set but not used [-Werror=unused-but-set-variable]
>      gpointer *gapg_temp_atomic = (gpointer *)(atomic);                       \
>                ^
> /home/naourr/work/instance-1/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib/gthread.h:251:7: note: in expansion of macro 'g_atomic_pointer_get'
>      (!g_atomic_pointer_get (location) &&                             \
>        ^~~~~~~~~~~~~~~~~~~~
> /home/naourr/work/instance-1/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/gobject/gtype.h:2004:7: note: in expansion of macro 'g_once_init_enter'
>    if (g_once_init_enter (&g_define_type_id__volatile))  \
>        ^~~~~~~~~~~~~~~~~
> /home/naourr/work/instance-1/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/gobject/gtype.h:2036:3: note: in expansion of macro '_G_DEFINE_TYPE_EXTENDED_BEGIN_REGISTER'
>    _G_DEFINE_TYPE_EXTENDED_BEGIN_REGISTER(TypeName, type_name, TYPE_PARENT, flags) \
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /home/naourr/work/instance-1/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/gobject/gtype.h:1763:60: note: in expansion of macro '_G_DEFINE_TYPE_EXTENDED_BEGIN'
>  #define G_DEFINE_TYPE_EXTENDED(TN, t_n, T_P, _f_, _C_)     _G_DEFINE_TYPE_EXTENDED_BEGIN (TN, t_n, T_P, _f_) {_C_;} _G_DEFINE_TYPE_EXTENDED_END()
>                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /home/naourr/work/instance-1/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/gobject/gtype.h:1604:43: note: in expansion of macro 'G_DEFINE_TYPE_EXTENDED'
>  #define G_DEFINE_TYPE(TN, t_n, T_P)       G_DEFINE_TYPE_EXTENDED (TN, t_n, T_P, 0, {})
>                                            ^~~~~~~~~~~~~~~~~~~~~~
> ../src/gstreamer/gstlibcamerapad.cpp:30:1: note: in expansion of macro 'G_DEFINE_TYPE'
>  G_DEFINE_TYPE(GstLibcameraPad, gst_libcamera_pad, GST_TYPE_PAD);
>  ^~~~~~~~~~~~~
> cc1plus: all warnings being treated as errors


Looks like we're hitting compile warnings in external glib, which we're
treating as errors ;-(


That's annoying...

In terms of 'buildroot', I expect we could wait for that to be 'fixed'
upstream in glib-2.0 (this build was using 2.64.3)


Generally I'd really like to keep -Werror enabled, as it will help catch
issues faster, and specifically keep our build warning clean.

I guess we can't easily say '"But ignore warnings in externally included
files"' ...

--

Kieran




-------- Forwarded Message --------
Subject: [autobuild.buildroot.net] Your daily results for 2020-06-23
Date: Wed, 24 Jun 2020 06:26:32 -0000
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>

Hello,

Recent build failures and runtime-tests failures
================================================

This is the list of Buildroot build failures that occurred on
2020-06-23, and for which you are a registered architecture developer,
package developer or defconfig developer. This list also include
runtime tests failures. Please help us improving the quality of
Buildroot by investigating those build failures and sending patches to
fix them. Thanks!

Results for the 'master' branch
-------------------------------

Build failures related to your packages:

    arch     |             reason             |
              url
-------------+--------------------------------+---------------------------------------------------------------------------------
   nios2     | libcamera-96fab38e02792a109... |
http://autobuild.buildroot.net/results/0c6647e0df1c531d278c5c099a33469304ecf640
   x86_64    | libcamera-96fab38e02792a109... |
http://autobuild.buildroot.net/results/03a83b88d0f541f567e54cb2b29ed4bca58a52ad
  mips64el   | libcamera-96fab38e02792a109... |
http://autobuild.buildroot.net/results/e0fad5835baaaa2d86f355385dbd68e92287e495



-- 
http://autobuild.buildroot.net
