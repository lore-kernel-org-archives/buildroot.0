From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 28 Jun 2016 23:07:47 +0200
Subject: [Buildroot] qt5webengine: new package
In-Reply-To: <20160626060803.3494-1-akihiko.odaki.4i@stu.hosei.ac.jp>
References: <20160626060803.3494-1-akihiko.odaki.4i@stu.hosei.ac.jp>
Message-ID: <20160628230747.10acb0e6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Akihiko,

On Sun, 26 Jun 2016 15:08:03 +0900, Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp> wrote:

> Based on http://lists.busybox.net/pipermail/buildroot/2015-July/132010.html
> 
> - Bump version to 5.6.1-1
> - Remove 0001-allow_all_linux_gxx.patch
> - Remove the patch to set float abi flag and set in QMAKE_CFLAGS
> - Backport a change in Chromium to remove dependency on Python bzip2 module
> - Include QDebug in qwebengineprofile.cpp to fix a build issue
> - Prefer arm_tune to arm_arch
> - Allow to set arm_thumb with -marm, set by BR2_ARM_INSTRUCTIONS_ARM
> - Depend on X libraries when it will be compiled for XCB
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
> 
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index 84cbb0f..d3f7328 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -47,6 +47,7 @@ source "package/qt5/qt5serialport/Config.in"
>  source "package/qt5/qt5svg/Config.in"
>  source "package/qt5/qt5tools/Config.in"
>  source "package/qt5/qt5webchannel/Config.in"
> +source "package/qt5/qt5webengine/Config.in"
>  source "package/qt5/qt5websockets/Config.in"
>  source "package/qt5/qt5x11extras/Config.in"
>  source "package/qt5/qt5xmlpatterns/Config.in"
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
> +---
> +Index: qt5webengine-5.6.1/src/3rdparty/chromium/build/common.gypi
> +===================================================================
> +--- qt5webengine-5.6.1.orig/src/3rdparty/chromium/build/common.gypi
> ++++ qt5webengine-5.6.1/src/3rdparty/chromium/build/common.gypi
> +@@ -3977,7 +3977,7 @@
> +                       '-target arm-linux-gnueabihf',
> +                     ],
> +                   }],
> +-                  ['arm_arch!=""', {
> ++                  ['arm_arch!="" and arm_tune==""', {
> +                     'cflags': [
> +                       '-march=<(arm_arch)',
> +                     ],
> diff --git a/package/qt5/qt5webengine/0002-marm.patch b/package/qt5/qt5webengine/0002-marm.patch
> new file mode 100644
> index 0000000..9de912b
> --- /dev/null
> +++ b/package/qt5/qt5webengine/0002-marm.patch
> @@ -0,0 +1,16 @@
> +Allow to set arm_thumb=0 with -marm
> +
> +Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
> +---
> +Index: qt5webengine-5.6.1/src/core/gyp_run.pro
> +===================================================================
> +--- qt5webengine-5.6.1.orig/src/core/gyp_run.pro
> ++++ qt5webengine-5.6.1/src/core/gyp_run.pro
> +@@ -80,6 +80,7 @@
> +         else: GYP_CONFIG += arm_fpu=\"$$MFPU\" arm_neon=0 arm_neon_optional=0
> +     }
> + 
> ++    contains(QMAKE_CFLAGS, "-marm"): GYP_CONFIG += arm_thumb=0
> +     contains(QMAKE_CFLAGS, "-mthumb"): GYP_CONFIG += arm_thumb=1
> + }
> + 
> diff --git a/package/qt5/qt5webengine/0003-js2c.patch b/package/qt5/qt5webengine/0003-js2c.patch
> new file mode 100644
> index 0000000..0141142
> --- /dev/null
> +++ b/package/qt5/qt5webengine/0003-js2c.patch
> @@ -0,0 +1,26 @@
> +Remove unused imports from tools/js2c.py
> +
> +Review URL: https://codereview.chromium.org/1359033002
> +
> +Cr-Commit-Position: refs/heads/master@{#30941}
> +
> +This is a backport of commit fd1024ffb7e24bf03dd3fa3cd3806dd46b04ee6d.
> +
> +Signed-off-by: <akihiko.odaki.4i@stu.hosei.ac.jp>
> +---
> +Index: qt5webengine-5.6.1/src/3rdparty/chromium/v8/tools/js2c.py
> +===================================================================
> +--- qt5webengine-5.6.1.orig/src/3rdparty/chromium/v8/tools/js2c.py
> ++++ qt5webengine-5.6.1/src/3rdparty/chromium/v8/tools/js2c.py
> +@@ -31,10 +31,9 @@
> + # char arrays. It is used for embedded JavaScript code in the V8
> + # library.
> + 
> +-import os, re, sys, string
> ++import os, re
> + import optparse
> + import jsmin
> +-import bz2
> + import textwrap
> + 
> + 
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
> +	select BR2_PACKAGE_QT5WEBCHANNEL
> +	select BR2_PACKAGE_FFMPEG
> +	select BR2_PACKAGE_OPUS
> +	select BR2_PACKAGE_LIBVPX
> +	select BR2_PACKAGE_WEBP_DEMUX

Got the following two warnings/errors:

warning: (BR2_PACKAGE_QT5WEBENGINE) selects BR2_PACKAGE_WEBP_DEMUX which has unmet direct dependencies (BR2_PACKAGE_WEBP)
    
    Makefile:477: *** webp is in the dependency chain of qt5webengine that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes by adding:

	select BR2_PACKAGE_WEBP


With this qt5webengine package starts to compile (and is still compiling....).


> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBCAP
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_QT5BASE_XCB
> +	select BR2_PACKAGE_XLIB_LIBXCURSOR if BR2_PACKAGE_QT5BASE_XCB
> +	select BR2_PACKAGE_XLIB_LIBXI if BR2_PACKAGE_QT5BASE_XCB
> +	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_QT5BASE_XCB
> +	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER if BR2_PACKAGE_QT5BASE_XCB
> +	select BR2_PACKAGE_XLIB_LIBXTST if BR2_PACKAGE_QT5BASE_XCB
> +	help
> +	  Qt is a cross-platform application and UI framework for
> +	  developers using C++.
> +
> +	  This package corresponds to the qt5webengine module.
> +
> +	  http://qt.io
> diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
> new file mode 100644
> index 0000000..38d322a
> --- /dev/null
> +++ b/package/qt5/qt5webengine/qt5webengine.hash
> @@ -0,0 +1,4 @@
> +# Hashes from: https://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtwebengine-opensource-src-5.6.1-1.tar.xz.mirrorlist
> +sha256 c80e90237bb7bd52a3fa843415c17a8e8e6d779b65efd1393472f24f8642e04c qtwebengine-opensource-src-5.6.1-1.tar.xz
> +sha1   607003d55d34caaeeff9d2f93ecad93a3f3fd7f1                         qtwebengine-opensource-src-5.6.1-1.tar.xz
> +md5    26b6c06c867dc428050fdf05530c0935                                 qtwebengine-opensource-src-5.6.1-1.tar.xz
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

Source package only contains the following files in the root directory:

  LICENSE.GPLv2
  LICENSE.GPLv3
  LICENSE.LGPLv3

and 179 additional LICENSE files under qt5webengine-5.6.1-1/src/3rdparty/...

Regards,
Peter

> +else
> +QT5WEBENGINE_LICENSE = Commercial license
> +QT5WEBENGINE_REDISTRIBUTE = NO
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
> +QT5WEBENGINE_DEPENDENCIES += qt5declarative
> +endif
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
> +
> +# Use system ffmpeg because the embedded FFmpeg requires to create a
> +# configuration scripts which is difficult to use due to architecture-dependent
> +# arguments.
> +QT5WEBENGINE_QMAKEFLAGS = WEBENGINE_CONFIG=use_system_ffmpeg
> +
> +ifdef QT5WEBENGINE_QMAKE_CFLAGS
> +QT5WEBENGINE_QMAKEFLAGS += 'QMAKE_CFLAGS+=$(QT5WEBENGINE_QMAKE_CFLAGS)'
> +endif
> +
> +QT5WEBENGINE_MAKE_ENV = $(TARGET_MAKE_ENV) PATH="$(@D):$$PATH"
> +
> +define QT5WEBENGINE_CONFIGURE_CMDS
> +	ln -s $(HOST_DIR)/usr/bin/python2 $(@D)/python
> +	(cd $(@D); $(QT5WEBENGINE_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake $(QT5WEBENGINE_QMAKEFLAGS))
> +endef
> +
> +define QT5WEBENGINE_BUILD_CMDS
> +	$(QT5WEBENGINE_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define QT5WEBENGINE_INSTALL_STAGING_CMDS
> +	$(QT5WEBENGINE_MAKE_ENV) $(MAKE) -C $(@D) install
> +	$(QT5_LA_PRL_FILES_FIXUP)
> +endef
> +
> +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
> +define QT5WEBENGINE_INSTALL_TARGET_QMLS
> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebEngine $(TARGET_DIR)/usr/qml/
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
> +define QT5WEBENGINE_INSTALL_TARGET_EXAMPLES
> +	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/webengine* $(TARGET_DIR)/usr/lib/qt/examples/
> +endef
> +endif
> +
> +ifneq ($(BR2_STATIC_LIBS),y)
> +define QT5WEBENGINE_INSTALL_TARGET_LIBS
> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebEngine*.so.* $(TARGET_DIR)/usr/lib
> +	cp -dpf $(STAGING_DIR)/usr/libexec/QtWebEngineProcess $(TARGET_DIR)/usr/libexec/
> +	cp -dpfr $(STAGING_DIR)/usr/resources/ $(TARGET_DIR)/usr/
> +	cp -dpfr $(STAGING_DIR)/usr/translations/qtwebengine_locales $(TARGET_DIR)/usr/translations/
> +	-cp -dpf $(STAGING_DIR)/usr/icudtl.dat $(TARGET_DIR)/usr/
> +endef
> +endif
> +
> +define QT5WEBENGINE_INSTALL_TARGET_CMDS
> +	$(QT5WEBENGINE_INSTALL_TARGET_LIBS)
> +	$(QT5WEBENGINE_INSTALL_TARGET_QMLS)
> +	$(QT5WEBENGINE_INSTALL_TARGET_EXAMPLES)
> +endef
> +
> +$(eval $(generic-package))
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
