From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Aug 2017 16:01:57 +0200
Subject: [Buildroot] [PATCH v7 0/3] Qt WebEngine support
In-Reply-To: <20170813135650.14067-1-gael.portay@savoirfairelinux.com>
References: <20170813135650.14067-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170813160157.5819cf80@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Aug 2017 09:56:47 -0400, Ga?l PORTAY wrote:

> The last patch is a special defconfig that provides a Qt WebEngine setup on
> raspberrypi3.
> 
> With this patchset, one can run the Qt quicknanobrowser sample on a rpi3 with
> the following options:
>   - BR2_TOOLCHAIN_BUILDROOT_LIBC="glibc" and
>     BR2_TOOLCHAIN_BUILDROOT_CXX=y (Qt 5 needs a toolchain w/ wchar, NPTL, C++,
>     dynamic library)
>   - BR2_PACKAGE_LIBERATION (Qt 5.8 requires a least one font)
>   - BR2_PACKAGE_RPI_USERLAND (to enable OpenGL backend)
>   - BR2_PACKAGE_QT5BASE_EXAMPLES (to install quicknanobrowser sample)
>   - BR2_PACKAGE_QT5QUICKCONTROLS (needed by quicknanobrowser)
>   - BR2_PACKAGE_QT5WEBENGINE (because it is what we want :))
> 
> To browse for HTTPS websites, please consider adding the following options as
> well:
>   - BR2_PACKAGE_CA_CERT (for certificates)
>   - BR2_PACKAGE_NTPD (to sync date)
> 
> To run quicknanobrowser:
> 	# cd /usr/lib/qt/examples/webengine/quicknanobrowser/
> 	# ./quicknanobrowser

These details would be good to have in the commit log of the
qtwebengine package.

> Note: For now, quicknanobrowser will just display the qt website without any
> input backend.
> 
> Note 2: Since bump to 5.9.1, the chromium's copy of opus fails with neon [7].
> BR2_PACKAGE_QT5WEBENGINE_SYSTEM_FFMPEG option allows one to use buildroot copy
> (which compiles fine).
> 
> 	In file included from ../../3rdparty/chromium/third_party/opus/src/silk/arm/NSQ_neon.c:31:0:
> 	/home/gportay/src/buildroot/output-rpi3-qt5.9/host/lib/gcc/arm-buildroot-linux-gnueabihf/6.4.0/include/arm_neon.h:8997:1: error: inlining failed in call to always_inline ?vld1q_s32?: target specific option mismatch
> 	 vld1q_s32 (const int32_t * __a)
> 	 ^~~~~~~~~
> 	../../3rdparty/chromium/third_party/opus/src/silk/arm/NSQ_neon.c:40:15: note: called from here
> 	     int32x4_t coef0 = vld1q_s32(coef32);
> 		       ^~~~~
> 	../../3rdparty/chromium/third_party/opus/src/silk/arm/NSQ_neon.c: At top level:
> 	cc1: warning: unrecognized command line option ?-Wno-#pragma-messages?

Those notes too.

> 
> Note 3: Since bump to 5.9.1, chromium requires udev.
> 
> Note 4: Tested against:
>         - GCC 6.x and binutils 2.27 on rpi 3.
>         - GCC 7.x and binutils 2.28 on rpi 3.
> 
> Note 5: Version 5.6.2 causes a build issue while building chromium. I disabled
>         the build against this version and am waiting for the release 5.6.3.

This note too.

> Changes since v6:
>  - rpi-userland commit message:
>    fix output of ls -l snippet
>    update url to link to qtwe-5.9.1
>    add upstream-status
>  - qtwe:
>    add missing host-bison, host-flex and host-pkgconf dependencies
>    select BR2_HOSTARCH_NEEDS_IA32_COMPILER for 32-bit targets

BR2_HOSTARCH_NEEDS_IA32_COMPILER has nothing to do with 32-bit targets.
It has to do with the fact that qtwebengine builds programs for the
*host* (and not the target) using -m32. Therefore, on x86-64 machines,
it requires multilib support, in order to build (and run) 32 bits
programs.

Or, do you have some evidence/explanation that qtwebengine builds its
host programs 32 bits when the target is 32 bits, and builds its host
programs 64 bits when the target is 64 bits ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
