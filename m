From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Nov 2013 23:41:01 +0100
Subject: [Buildroot] [PATCH 1/2] qt5base: use -device-option to set
 mkspec variables
In-Reply-To: <1384436438-2119-1-git-send-email-fatih.asici@gmail.com>
References: <1384436438-2119-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <528A977D.40909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/11/13 14:40, Fatih A??c? wrote:
> In additon to the simplification of code, this change is a preparation
> to solve problems occurring when QMAKE_CXX is prepended with ccache path.

  Please also mention that you replace part of our custom qmake.conf with 
linux_device_pre.conf.

>
> Upstream patch is needed by configure to parse device options correctly.
>
> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> ---
>   .../qt5/qt5base/qt5base-0002-mkspecs-files.patch   | 39 ++--------------------
>   ...igure-Parse-device-option-value-correctly.patch | 36 ++++++++++++++++++++
>   package/qt5/qt5base/qt5base.mk                     | 18 +++-------
>   3 files changed, 43 insertions(+), 50 deletions(-)
>   create mode 100644 package/qt5/qt5base/qt5base-0008-configure-Parse-device-option-value-correctly.patch
>
> diff --git a/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch b/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
> index e406cfc..3fddeac 100644
> --- a/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
> +++ b/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
> @@ -14,50 +14,17 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
>   ===================================================================
>   --- /dev/null
>   +++ b/mkspecs/devices/linux-buildroot-g++/qmake.conf
> -@@ -0,0 +1,44 @@
> -+MAKEFILE_GENERATOR      = UNIX
> -+CONFIG                 += incremental gdb_dwarf_index
> -+QMAKE_INCREMENTAL_STYLE = sublib
> -+
> -+include(../../common/linux.conf)
> -+include(../../common/gcc-base-unix.conf)
> -+include(../../common/g++-unix.conf)
> -+
> -+load(device_config)
> -+
> -+QT_QPA_DEFAULT_PLATFORM = eglfs
> -+
> -+BUILDROOT_CROSS_COMPILE =
> -+BUILDROOT_COMPILER_CFLAGS =
> -+BUILDROOT_COMPILER_CXXFLAGS =
> -+BUILDROOT_INCLUDE_PATH =
> -+
> -+# modifications to g++.conf
> -+QMAKE_CC                = $${BUILDROOT_CROSS_COMPILE}gcc
> -+QMAKE_CXX               = $${BUILDROOT_CROSS_COMPILE}g++
> -+QMAKE_LINK              = $${QMAKE_CXX}
> -+QMAKE_LINK_SHLIB        = $${QMAKE_CXX}
> -+
> -+# modifications to linux.conf
> -+QMAKE_AR                = $${BUILDROOT_CROSS_COMPILE}ar cqs
> -+QMAKE_OBJCOPY           = $${BUILDROOT_CROSS_COMPILE}objcopy
> -+QMAKE_NM                = $${BUILDROOT_CROSS_COMPILE}nm -P
> -+QMAKE_STRIP             = $${BUILDROOT_CROSS_COMPILE}strip
> +@@ -0,0 +1,11 @@
> ++include(../common/linux_device_pre.conf)
>   +
>   +#modifications to gcc-base.conf
>   +QMAKE_CFLAGS           += $${BUILDROOT_COMPILER_CFLAGS}
>   +QMAKE_CXXFLAGS         += $${BUILDROOT_COMPILER_CXXFLAGS}
>   +QMAKE_CXXFLAGS_RELEASE += -O3
> -+INCLUDEPATH            += $${BUILDROOT_INCLUDE_PATH}

  I guess this is indeed redundant, since it just adds 
$(STAGING_DIR)/usr/include which is unnecessary. But you should at least 
mention this explicitly in the commit message.

>   +
>   +QMAKE_LIBS             += -lrt -lpthread -ldl
>   +
> -+# device specific glue code
> -+EGLFS_PLATFORM_HOOKS_SOURCES =
> -+
> -+# Sanity check
> -+deviceSanityCheckCompiler()
> -+
> ++include(../common/linux_device_post.conf)

  Unfortunately, linux_device_post.conf is broken. It contains:

contains(DISTRO_OPTS, hard-float) {
     COMPILER_FLAGS += -mfloat-abi=hard
} else {
     COMPILER_FLAGS += -mfloat-abi=softfp
}

  It seems this file is ARM-specific, and it's only used by imx6, 
raspberrypi and tegra2. Note that linux_device_pre.conf is also only used 
by these three, but that one looks generic enough :-)

  So I propose that you leave the last part as it was.

>   +load(qt_config)
>   Index: b/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
>   ===================================================================
> diff --git a/package/qt5/qt5base/qt5base-0008-configure-Parse-device-option-value-correctly.patch b/package/qt5/qt5base/qt5base-0008-configure-Parse-device-option-value-correctly.patch
> new file mode 100644
> index 0000000..7eb9229
> --- /dev/null
> +++ b/package/qt5/qt5base/qt5base-0008-configure-Parse-device-option-value-correctly.patch
> @@ -0,0 +1,36 @@
> +From 4723f3fd04edf1aad6750ca91fd4648216d8b408 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
> +Date: Sat, 21 Sep 2013 00:14:39 +0300
> +Subject: [PATCH] configure: Parse -device-option value correctly
> +
> +The regular expression does not parse correctly when a device option value
> +contains the character '=' (e.g. QMAKE_CFLAGS="-D_FILE_OFFSET_BITS=64").
> +
> +In order to break string at the first equal sign and to simplify code,
> +use "cut" command as in other places in configure script.
> +
> +Task-number: QTBUG-33584
> +Change-Id: I05b474d2ba6bff84c1e40d00475963bab36d94b6
> +Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@digia.com>

  You should still add your own Signed-off-by, even if this is not 
required by upstream.


  Regards,
  Arnout

> +---
> + configure | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 64568dd..388899e 100755
> +--- a/configure
> ++++ b/configure
> +@@ -1609,8 +1609,8 @@ while [ "$#" -gt 0 ]; do
> +         [ "$XPLATFORM" = "undefined" ] && exit 101
> +         ;;
> +     device-option)
> +-        DEV_VAR=`echo $VAL | sed "s,^\(.*\)=.*,\1,"`
> +-        DEV_VAL=`echo $VAL | sed "s,^.*=\(.*\),\1,"`
> ++        DEV_VAR=`echo $VAL | cut -d '=' -f 1`
> ++        DEV_VAL=`echo $VAL | cut -d '=' -f 2-`
> +         DeviceVar set $DEV_VAR "$DEV_VAL"
> +         ;;
> +     qpa)
> +--
> +1.8.4.rc3
> +
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index ce78d31..febdc9b 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -152,21 +152,7 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
>
>   QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
>
> -# Ideally, we could use -device-option to substitute variable values
> -# in our linux-buildroot-g++/qmake.config, but this mechanism doesn't
> -# nicely support variable values that contain spaces. So we use the
> -# good old sed solution here.
> -define QT5BASE_CONFIG_SET
> -	$(SED) 's%^$(1).*%$(1) = $(2)%g' $(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
> -endef
> -
>   define QT5BASE_CONFIGURE_CMDS
> -	$(call QT5BASE_CONFIG_SET,BUILDROOT_CROSS_COMPILE,$(TARGET_CROSS))
> -	$(call QT5BASE_CONFIG_SET,BUILDROOT_COMPILER_CFLAGS,$(TARGET_CFLAGS))
> -	$(call QT5BASE_CONFIG_SET,BUILDROOT_COMPILER_CXXFLAGS,$(TARGET_CXXFLAGS))
> -	$(call QT5BASE_CONFIG_SET,BUILDROOT_INCLUDE_PATH,$(STAGING_DIR)/usr/include)
> -	$(call QT5BASE_CONFIG_SET,EGLFS_PLATFORM_HOOKS_SOURCES, \
> -		$(QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES))
>   	(cd $(@D); \
>   		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>   		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
> @@ -181,6 +167,10 @@ define QT5BASE_CONFIGURE_CMDS
>   		-no-rpath \
>   		-nomake examples -nomake tests \
>   		-device buildroot \
> +		-device-option CROSS_COMPILE="$(TARGET_CROSS)" \
> +		-device-option BUILDROOT_COMPILER_CFLAGS="$(TARGET_CFLAGS)" \
> +		-device-option BUILDROOT_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS)" \
> +		-device-option EGLFS_PLATFORM_HOOKS_SOURCES="$(QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES)" \
>   		-no-c++11 \
>   		$(QT5BASE_CONFIGURE_OPTS) \
>   	)
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
