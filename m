From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 22:39:14 +0200
Subject: [Buildroot] qt5webengine: new package
In-Reply-To: <20160626060803.3494-1-akihiko.odaki.4i@stu.hosei.ac.jp>
References: <20160626060803.3494-1-akihiko.odaki.4i@stu.hosei.ac.jp>
Message-ID: <20160827223914.26a019d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 15:08:03 +0900, Akihiko Odaki wrote:

> diff --git a/package/qt5/qt5webengine/0001-prefer-arm_tune.patch b/package/qt5/qt5webengine/0001-prefer-arm_tune.patch
> new file mode 100644
> index 0000000..a4662d0
> --- /dev/null
> +++ b/package/qt5/qt5webengine/0001-prefer-arm_tune.patch
> @@ -0,0 +1,19 @@
> +Prefer arm_tune to arm_arch
> +
> +If user specifies arm_tune, ignore default arm_arch.
> +
> +Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>

Why is this needed?

> diff --git a/package/qt5/qt5webengine/0002-marm.patch b/package/qt5/qt5webengine/0002-marm.patch
> new file mode 100644
> index 0000000..9de912b
> --- /dev/null
> +++ b/package/qt5/qt5webengine/0002-marm.patch
> @@ -0,0 +1,16 @@
> +Allow to set arm_thumb=0 with -marm
> +
> +Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>

Same question.

> diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
> new file mode 100644
> index 0000000..ffb4243
> --- /dev/null
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -0,0 +1,30 @@
> +config BR2_PACKAGE_QT5WEBENGINE
> +	bool "qt5webengine"
> +	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
> +	select BR2_PACKAGE_QT5BASE
> +	select BR2_PACKAGE_QT5BASE_GUI
> +	select BR2_PACKAGE_QT5BASE_FONTCONFIG
> +	select BR2_PACKAGE_QT5BASE_DBUS
> +	select BR2_PACKAGE_QT5BASE_ICU
> +	select BR2_PACKAGE_QT5DECLARATIVE

This package has:

        depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE

so you need to replicate the same dependency.

> diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
> new file mode 100644
> index 0000000..e186e4a
> --- /dev/null
> +++ b/package/qt5/qt5webengine/qt5webengine.mk
> @@ -0,0 +1,113 @@
> +################################################################################
> +#
> +# qt5webengine
> +#
> +################################################################################
> +
> +QT5WEBENGINE_VERSION = $(QT5_VERSION)
> +QT5WEBENGINE_SITE = $(QT5_SITE)
> +QT5WEBENGINE_SOURCE = qtwebengine-opensource-src-$(QT5WEBENGINE_VERSION).tar.xz
> +QT5WEBENGINE_DEPENDENCIES = qt5base qt5declarative qt5webchannel \
> +	libcap libglib2 opus libvpx webp ffmpeg openssl host-gperf host-python
> +ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
> +QT5WEBENGINE_DEPENDENCIES += xlib_libXScrnSaver xlib_libXcomposite \
> +	xlib_libXcursor xlib_libXi xlib_libXrandr xlib_libXtst
> +endif
> +QT5WEBENGINE_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> +QT5WEBENGINE_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> +# Source files contain references to LGPL_EXCEPTION.txt but it is not included
> +# in the archive.
> +QT5WEBENGINE_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2
> +else
> +QT5WEBENGINE_LICENSE = Commercial license
> +QT5WEBENGINE_REDISTRIBUTE = NO
> +endif

Could you take into account the comment made by Peter Seiderer about
the licensing?

> +
> +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
> +QT5WEBENGINE_DEPENDENCIES += qt5declarative
> +endif

You have already included qt5declarative in the list of mandatory
dependencies above, so this chunk is useless.

> +
> +ifneq ($(BR2_GCC_TARGET_CPU),)
> +QT5WEBENGINE_QMAKE_CFLAGS += -mtune=$(BR2_GCC_TARGET_CPU)
> +endif
> +
> +ifneq ($(BR2_GCC_TARGET_FLOAT_ABI),)
> +QT5WEBENGINE_QMAKE_CFLAGS += -mfloat-abi=$(BR2_GCC_TARGET_FLOAT_ABI)
> +endif
> +
> +ifneq ($(BR2_GCC_TARGET_FPU),)
> +QT5WEBENGINE_QMAKE_CFLAGS += -mfpu=$(BR2_GCC_TARGET_FPU)
> +endif
> +
> +# Do not consider variants because this value will be used only to determine
> +# the version number.
> +ifeq ($(BR2_ARM_CPU_ARMV6),y)
> +QT5WEBENGINE_QMAKE_CFLAGS += -march=armv6
> +else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> +QT5WEBENGINE_QMAKE_CFLAGS += -march=armv7-a
> +endif
> +
> +ifeq ($(BR2_ARM_INSTRUCTIONS_ARM),y)
> +QT5WEBENGINE_QMAKE_CFLAGS += -marm
> +else ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> +QT5WEBENGINE_QMAKE_CFLAGS += -mthumb
> +else ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB2),y)
> +QT5WEBENGINE_QMAKE_CFLAGS += -mthumb
> +endif

None of this ARM-specific stuff should be needed. The compiler is
already configured to generate code with the right mtune, mfloat-abi,
mfpu, march and marm/mthumb options. Please explain why you think all
of this is needed.

> +# Use system ffmpeg because the embedded FFmpeg requires to create a
> +# configuration scripts which is difficult to use due to architecture-dependent
> +# arguments.

And because we prefer to use system-provided versions of the comments.

> +QT5WEBENGINE_QMAKEFLAGS = WEBENGINE_CONFIG=use_system_ffmpeg
> +
> +ifdef QT5WEBENGINE_QMAKE_CFLAGS
> +QT5WEBENGINE_QMAKEFLAGS += 'QMAKE_CFLAGS+=$(QT5WEBENGINE_QMAKE_CFLAGS)'
> +endif
> +
> +QT5WEBENGINE_MAKE_ENV = $(TARGET_MAKE_ENV) PATH="$(@D):$$PATH"

This looks fishy, why does $(@D) needs to be in the PATH ? A comment
above it would be useful. I guess it's because of the python -> python2
symbolic link below.

> +
> +define QT5WEBENGINE_CONFIGURE_CMDS
> +	ln -s $(HOST_DIR)/usr/bin/python2 $(@D)/python
> +	(cd $(@D); $(QT5WEBENGINE_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake $(QT5WEBENGINE_QMAKEFLAGS))
> +endef

Could you have a look at those issues and submit an updated patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
