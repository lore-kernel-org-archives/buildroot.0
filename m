From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 15 Dec 2015 23:40:40 +0100
Subject: [Buildroot] [PATCH v10 28/28] package/efl: rename libefl to efl
In-Reply-To: <1450219240-16938-1-git-send-email-romain.naour@openwide.fr>
References: <1450219240-16938-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1450219240-16938-29-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to avoid duplicate dependencies between efl and
libefl [1] change the BR2_PACKAGE_EFL from a menuconfig
to a simple menu.

This allow to rename the libefl package to efl to keep
backward compatibility with older defconfig files.

Add efl dependency on libelementary package.

Don't add Config.in.legacy entry for libefl since it's
not part of any Buildroot release.

[1] http://lists.busybox.net/pipermail/buildroot/2015-December/147128.html

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Config.in.legacy                                   |  20 +--
 package/dbus-cpp/dbus-cpp.mk                       |   2 +-
 package/efl/Config.in                              |  30 +---
 ...ecore_fb_private.h-define-EAPI-before-use.patch |   0
 .../0002-ecore_x-Remove-XPrint-usage.patch         |   0
 package/efl/{libefl => efl}/Config.in              |  91 ++++++-----
 package/efl/{libefl/libefl.hash => efl/efl.hash}   |   0
 package/efl/{libefl/libefl.mk => efl/efl.mk}       | 179 ++++++++++-----------
 package/efl/libelementary/Config.in                |   2 +
 package/efl/libelementary/libelementary.mk         |   4 +-
 package/enlightenment/Config.in                    |   6 +-
 package/enlightenment/enlightenment.mk             |   4 +-
 package/expedite/expedite.mk                       |   4 +-
 .../libemotion-generic-players.mk                  |   2 +-
 .../libevas-generic-loaders.mk                     |   2 +-
 15 files changed, 170 insertions(+), 176 deletions(-)
 rename package/efl/{libefl => efl}/0001-ecore_fb_private.h-define-EAPI-before-use.patch (100%)
 rename package/efl/{libefl => efl}/0002-ecore_x-Remove-XPrint-usage.patch (100%)
 rename package/efl/{libefl => efl}/Config.in (73%)
 rename package/efl/{libefl/libefl.hash => efl/efl.hash} (100%)
 rename package/efl/{libefl/libefl.mk => efl/efl.mk} (55%)

diff --git a/Config.in.legacy b/Config.in.legacy
index e1ea06f..4f5bfe5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -112,70 +112,70 @@ config BR2_PACKAGE_LIBEINA
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libeina is now provided by the libefl package.
+	  With EFL 1.15, libeina is now provided by the efl package.
 
 config BR2_PACKAGE_LIBEET
 	bool "libeet package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libeet is now provided by the libefl package.
+	  With EFL 1.15, libeet is now provided by the efl package.
 
 config BR2_PACKAGE_LIBEVAS
 	bool "libevas package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libevas is now provided by the libefl package.
+	  With EFL 1.15, libevas is now provided by the efl package.
 
 config BR2_PACKAGE_LIBECORE
 	bool "libecore package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libecore is now provided by the libefl package.
+	  With EFL 1.15, libecore is now provided by the efl package.
 
 config BR2_PACKAGE_LIBEDBUS
 	bool "libedbus package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libedbus is now provided by the libefl package.
+	  With EFL 1.15, libedbus is now provided by the efl package.
 
 config BR2_PACKAGE_LIBEFREET
 	bool "libefreet package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libefreet is now provided by the libefl package.
+	  With EFL 1.15, libefreet is now provided by the efl package.
 
 config BR2_PACKAGE_LIBEIO
 	bool "libeio package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libeio is now provided by the libefl package.
+	  With EFL 1.15, libeio is now provided by the efl package.
 
 config BR2_PACKAGE_LIBEMBRYO
 	bool "libembryo package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libembryo is now provided by the libefl package.
+	  With EFL 1.15, libembryo is now provided by the efl package.
 
 config BR2_PACKAGE_LIBEDJE
 	bool "libedje package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libedje is now provided by the libefl package.
+	  With EFL 1.15, libedje is now provided by the efl package.
 
 config BR2_PACKAGE_LIBETHUMB
 	bool "libethumb package has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.15, libethumb is now provided by the libefl package.
+	  With EFL 1.15, libethumb is now provided by the efl package.
 
 config BR2_PACKAGE_INFOZIP
 	bool "infozip option has been renamed to zip"
diff --git a/package/dbus-cpp/dbus-cpp.mk b/package/dbus-cpp/dbus-cpp.mk
index 9236ba7..0b51967 100644
--- a/package/dbus-cpp/dbus-cpp.mk
+++ b/package/dbus-cpp/dbus-cpp.mk
@@ -28,7 +28,7 @@ DBUS_CPP_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_EFL),y)
 DBUS_CPP_CONF_OPTS += --enable-ecore
-DBUS_CPP_DEPENDENCIES += libefl
+DBUS_CPP_DEPENDENCIES += efl
 else
 DBUS_CPP_CONF_OPTS += --disable-ecore
 endif
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 80658b2..d92d877 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -1,30 +1,6 @@
-menuconfig BR2_PACKAGE_EFL
-	bool "Enlightenment Foundation Libraries"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_HAS_UDEV # libudev
-	depends on BR2_PACKAGE_LUA # lua 5.1 or better
-	depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
-	depends on BR2_USE_MMU
-	depends on BR2_USE_WCHAR # use wchar_t
-	depends on !BR2_STATIC_LIBS # dlfcn.h
-	select BR2_PACKAGE_LIBEFL
-	help
-	  Enlightenment Foundation Libraries
+menu "Enlightenment Foundation Libraries"
 
-	  http://enlightenment.org
-
-if BR2_PACKAGE_EFL
-
-source "package/efl/libefl/Config.in"
+source "package/efl/efl/Config.in"
 source "package/efl/libelementary/Config.in"
 
-endif # BR2_PACKAGE_EFL
-
-comment "EFL needs udev /dev management and a toolchain w/ C++, dynamic library, threads, wchar"
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-	depends on BR2_USE_MMU
-
-comment "EFL needs lua"
-	depends on !BR2_PACKAGE_LUA
-	depends on BR2_USE_MMU
+endmenu
diff --git a/package/efl/libefl/0001-ecore_fb_private.h-define-EAPI-before-use.patch b/package/efl/efl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
similarity index 100%
rename from package/efl/libefl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
rename to package/efl/efl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
diff --git a/package/efl/libefl/0002-ecore_x-Remove-XPrint-usage.patch b/package/efl/efl/0002-ecore_x-Remove-XPrint-usage.patch
similarity index 100%
rename from package/efl/libefl/0002-ecore_x-Remove-XPrint-usage.patch
rename to package/efl/efl/0002-ecore_x-Remove-XPrint-usage.patch
diff --git a/package/efl/libefl/Config.in b/package/efl/efl/Config.in
similarity index 73%
rename from package/efl/libefl/Config.in
rename to package/efl/efl/Config.in
index 7f76b94..80d8c1e 100644
--- a/package/efl/libefl/Config.in
+++ b/package/efl/efl/Config.in
@@ -1,5 +1,12 @@
-config BR2_PACKAGE_LIBEFL
-	bool "libefl"
+config BR2_PACKAGE_EFL
+	bool "efl"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_UDEV # libudev
+	depends on BR2_PACKAGE_LUA # lua 5.1 or better
+	depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
+	depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR # use wchar_t
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG # Emile needs libjpeg
@@ -13,18 +20,18 @@ config BR2_PACKAGE_LIBEFL
 
 	  https://enlightenment.org
 
-if BR2_PACKAGE_LIBEFL
+if BR2_PACKAGE_EFL
 
-config BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG
+config BR2_PACKAGE_EFL_RECOMMENDED_CONFIG
 	bool "Use recommended and tested configuration"
 	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
-	select BR2_PACKAGE_LIBEFL_BULLET
-	select BR2_PACKAGE_LIBEFL_FONTCONFIG
-	select BR2_PACKAGE_LIBEFL_GSTREAMER1
-	select BR2_PACKAGE_LIBEFL_LIBFRIBIDI
-	select BR2_PACKAGE_LIBEFL_LIBSNDFILE
-	select BR2_PACKAGE_LIBEFL_PULSEAUDIO
-	select BR2_PACKAGE_LIBEFL_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_EFL_BULLET
+	select BR2_PACKAGE_EFL_FONTCONFIG
+	select BR2_PACKAGE_EFL_GSTREAMER1
+	select BR2_PACKAGE_EFL_LIBFRIBIDI
+	select BR2_PACKAGE_EFL_LIBSNDFILE
+	select BR2_PACKAGE_EFL_PULSEAUDIO
+	select BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
 	default y
 	help
 	  Enable the basic set of recommended features.
@@ -32,7 +39,7 @@ config BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG
 	  Without that, the EFL developpers consider the build to be
 	  potentially broken and won't provide any support for it.
 
-config BR2_PACKAGE_LIBEFL_BULLET
+config BR2_PACKAGE_EFL_BULLET
 	bool "Enable bullet support (recommended)"
 	select BR2_PACKAGE_BULLET
 	default y
@@ -43,7 +50,7 @@ config BR2_PACKAGE_LIBEFL_BULLET
 	  cause a series of breakages. This is simply not tested so you are
 	  on your own in terms of ensuring everything works if you do this.
 
-config BR2_PACKAGE_LIBEFL_FONTCONFIG
+config BR2_PACKAGE_EFL_FONTCONFIG
 	bool "Enable fontconfig support (recommended)"
 	select BR2_PACKAGE_FONTCONFIG
 	default y
@@ -55,7 +62,7 @@ config BR2_PACKAGE_LIBEFL_FONTCONFIG
 	  highly reconsider turning fontconfig off. Having it off will
 	  lead to visual problems like missing text in many UI areas etc...
 
-config BR2_PACKAGE_LIBEFL_GSTREAMER1
+config BR2_PACKAGE_EFL_GSTREAMER1
 	bool "Enable gstreamer1 support (recommended)"
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
@@ -65,7 +72,7 @@ config BR2_PACKAGE_LIBEFL_GSTREAMER1
 	  media support options and render some functionality as useless,
 	  leading to visible application bugs.
 
-config BR2_PACKAGE_LIBEFL_LIBFRIBIDI
+config BR2_PACKAGE_EFL_LIBFRIBIDI
 	bool "Enable libfribidi support (recommended)"
 	select BR2_PACKAGE_LIBFRIBIDI
 	default y
@@ -77,7 +84,7 @@ config BR2_PACKAGE_LIBEFL_LIBFRIBIDI
 	  we don't test with fribidi disabled so you may also trigger code
 	  paths with bugs that are never normally used.
 
-config BR2_PACKAGE_LIBEFL_LIBSNDFILE
+config BR2_PACKAGE_EFL_LIBSNDFILE
 	bool "Enable libsndfile support (recommended)"
 	select BR2_PACKAGE_LIBSNDFILE
 	default y
@@ -86,7 +93,7 @@ config BR2_PACKAGE_LIBEFL_LIBSNDFILE
 	  create bugs for you due to it creating untested code paths.
 	  Reconsider disabling audio.
 
-config BR2_PACKAGE_LIBEFL_PULSEAUDIO
+config BR2_PACKAGE_EFL_PULSEAUDIO
 	bool "Enable pulseaudio support (recommended)"
 	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
@@ -99,7 +106,7 @@ config BR2_PACKAGE_LIBEFL_PULSEAUDIO
 	  NOTE: multisense support is automatically enabled with
 	  pulseaudio.
 
-config BR2_PACKAGE_LIBEFL_UTIL_LINUX_LIBMOUNT
+config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
 	bool "Enable libmount support (recommended)"
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	default y
@@ -109,20 +116,20 @@ config BR2_PACKAGE_LIBEFL_UTIL_LINUX_LIBMOUNT
 	  Enlightenment and its filemanager.
 
 comment "Warning: one of the recommended option for EFL is not enabled"
-	depends on !BR2_PACKAGE_LIBEFL_BULLET \
-		|| !BR2_PACKAGE_LIBEFL_FONTCONFIG \
-		|| !BR2_PACKAGE_LIBEFL_GSTREAMER1 \
-		|| !BR2_PACKAGE_LIBEFL_LIBFRIBIDI \
-		|| !BR2_PACKAGE_LIBEFL_LIBSNDFILE \
-		|| !BR2_PACKAGE_LIBEFL_PULSEAUDIO \
-		|| !BR2_PACKAGE_LIBEFL_UTIL_LINUX_LIBMOUNT
+	depends on !BR2_PACKAGE_EFL_BULLET \
+		|| !BR2_PACKAGE_EFL_FONTCONFIG \
+		|| !BR2_PACKAGE_EFL_GSTREAMER1 \
+		|| !BR2_PACKAGE_EFL_LIBFRIBIDI \
+		|| !BR2_PACKAGE_EFL_LIBSNDFILE \
+		|| !BR2_PACKAGE_EFL_PULSEAUDIO \
+		|| !BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
 
 comment "libecore video support"
 
-config BR2_PACKAGE_LIBEFL_FB
+config BR2_PACKAGE_EFL_FB
 	bool "FB support"
 
-config BR2_PACKAGE_LIBEFL_X_XLIB
+config BR2_PACKAGE_EFL_X_XLIB
 	bool "X11 support (xlib)"
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -141,15 +148,15 @@ config BR2_PACKAGE_LIBEFL_X_XLIB
 
 choice
 	bool "OpenGL support"
-	default BR2_PACKAGE_LIBEFL_OPENGLES if BR2_PACKAGE_HAS_LIBGLES
+	default BR2_PACKAGE_EFL_OPENGLES if BR2_PACKAGE_HAS_LIBGLES
 	help
 	  libevas can be configured to use HW acceleration only with
 	  OpenGLES.
 
-config BR2_PACKAGE_LIBEFL_OPENGL_NONE
+config BR2_PACKAGE_EFL_OPENGL_NONE
 	bool "none"
 
-config BR2_PACKAGE_LIBEFL_OPENGLES
+config BR2_PACKAGE_EFL_OPENGLES
 	bool "opengles"
 	depends on BR2_PACKAGE_HAS_LIBGLES
 
@@ -160,43 +167,53 @@ endchoice # OpenGL support
 
 comment "libevas loaders"
 
-config BR2_PACKAGE_LIBEFL_PNG
+config BR2_PACKAGE_EFL_PNG
 	bool "libevas png loader"
 	select BR2_PACKAGE_LIBPNG
 	help
 	  This enables the loader code that loads png files using
 	  libpng.
 
-config BR2_PACKAGE_LIBEFL_JP2K
+config BR2_PACKAGE_EFL_JP2K
 	bool "libevas jp2k loader"
 	select BR2_PACKAGE_OPENJPEG
 	help
 	  This enables the loader code that loads jp2k files using
 	  openjpeg.
 
-config BR2_PACKAGE_LIBEFL_JPEG
+config BR2_PACKAGE_EFL_JPEG
 	bool "libevas jpeg loader"
 	help
 	  This enables the loader code that loads jpeg files using
 	  libjpeg.
 
-config BR2_PACKAGE_LIBEFL_GIF
+config BR2_PACKAGE_EFL_GIF
 	bool "libevas gif loader"
 	select BR2_PACKAGE_GIFLIB
 	help
 	  This enables the loader code that loads gif files using
 	  libungif.
 
-config BR2_PACKAGE_LIBEFL_TIFF
+config BR2_PACKAGE_EFL_TIFF
 	bool "libevas tiff loader"
 	select BR2_PACKAGE_TIFF
 	help
 	  This enables the loader code that loads tiff files.
 
-config BR2_PACKAGE_LIBEFL_WEBP
+config BR2_PACKAGE_EFL_WEBP
 	bool "libevas webp image loader"
 	select BR2_PACKAGE_WEBP
 	help
 	  This enables the loader code that loads images using WebP.
 
-endif # BR2_PACKAGE_LIBEFL
+endif # BR2_PACKAGE_EFL
+
+comment "EFL needs udev /dev management and a toolchain w/ C++, dynamic library, threads, wchar"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on BR2_USE_MMU
+
+comment "EFL needs lua"
+	depends on !BR2_PACKAGE_LUA
+	depends on BR2_USE_MMU
+
diff --git a/package/efl/libefl/libefl.hash b/package/efl/efl/efl.hash
similarity index 100%
rename from package/efl/libefl/libefl.hash
rename to package/efl/efl/efl.hash
diff --git a/package/efl/libefl/libefl.mk b/package/efl/efl/efl.mk
similarity index 55%
rename from package/efl/libefl/libefl.mk
rename to package/efl/efl/efl.mk
index c60a507..1aa5508 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/efl/efl.mk
@@ -1,14 +1,13 @@
 ################################################################################
 #
-# libefl
+# efl
 #
 ################################################################################
 
-LIBEFL_VERSION = $(EFL_VERSION)
-LIBEFL_SOURCE = efl-$(LIBEFL_VERSION).tar.xz
-LIBEFL_SITE = http://download.enlightenment.org/rel/libs/efl
-LIBEFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
-LIBEFL_LICENSE_FILES = \
+EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
+EFL_SITE = http://download.enlightenment.org/rel/libs/efl
+EFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
+EFL_LICENSE_FILES = \
 	COMPLIANCE \
 	COPYING \
 	licenses/COPYING.BSD \
@@ -17,23 +16,23 @@ LIBEFL_LICENSE_FILES = \
 	licenses/COPYING.LGPL \
 	licenses/COPYING.SMALL
 
-LIBEFL_INSTALL_STAGING = YES
+EFL_INSTALL_STAGING = YES
 
-LIBEFL_DEPENDENCIES = host-pkgconf host-libefl dbus freetype jpeg lua udev \
+EFL_DEPENDENCIES = host-pkgconf host-efl dbus freetype jpeg lua udev \
 	util-linux zlib
 
 # Regenerate the autotools:
 #  - to fix an issue in eldbus-codegen: https://phab.enlightenment.org/T2718
 #  - to remove dependency on libXp: https://phab.enlightenment.org/D3150
-LIBEFL_AUTORECONF = YES
-LIBEFL_GETTEXTIZE = YES
+EFL_AUTORECONF = YES
+EFL_GETTEXTIZE = YES
 
 # Configure options:
 # --disable-cxx-bindings: disable C++11 bindings.
 # --disable-sdl: disable sdl2 support.
 # --disable-systemd: disable systemd support.
 # --enable-lua-old: disable Elua and remove luajit dependency.
-LIBEFL_CONF_OPTS = \
+EFL_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
 	--disable-cxx-bindings \
@@ -42,115 +41,115 @@ LIBEFL_CONF_OPTS = \
 	--enable-lua-old
 
 # Disable untested configuration warning.
-ifeq ($(BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG),)
-LIBEFL_CONF_OPTS += --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
+ifeq ($(BR2_PACKAGE_EFL_RECOMMENDED_CONFIG),)
+EFL_CONF_OPTS += --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
-LIBEFL_DEPENDENCIES += util-linux
-LIBEFL_CONF_OPTS += --enable-libmount
+EFL_DEPENDENCIES += util-linux
+EFL_CONF_OPTS += --enable-libmount
 else
-LIBEFL_CONF_OPTS += --disable-libmount
+EFL_CONF_OPTS += --disable-libmount
 endif
 
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
-LIBEFL_CONF_OPTS += --enable-fontconfig
-LIBEFL_DEPENDENCIES += fontconfig
+EFL_CONF_OPTS += --enable-fontconfig
+EFL_DEPENDENCIES += fontconfig
 else
-LIBEFL_CONF_OPTS += --disable-fontconfig
+EFL_CONF_OPTS += --disable-fontconfig
 endif
 
 ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
-LIBEFL_CONF_OPTS += --enable-fribidi
-LIBEFL_DEPENDENCIES += libfribidi
+EFL_CONF_OPTS += --enable-fribidi
+EFL_DEPENDENCIES += libfribidi
 else
-LIBEFL_CONF_OPTS += --disable-fribidi
+EFL_CONF_OPTS += --disable-fribidi
 endif
 
 ifeq ($(BR2_PACKAGE_GSTREAMER1)$(BR2_PACKAGE_GST1_PLUGINS_BASE),yy)
-LIBEFL_CONF_OPTS += --enable-gstreamer1
-LIBEFL_DEPENDENCIES += gstreamer1 gst1-plugins-base
+EFL_CONF_OPTS += --enable-gstreamer1
+EFL_DEPENDENCIES += gstreamer1 gst1-plugins-base
 else
-LIBEFL_CONF_OPTS += --disable-gstreamer1
+EFL_CONF_OPTS += --disable-gstreamer1
 endif
 
 ifeq ($(BR2_PACKAGE_BULLET),y)
-LIBEFL_CONF_OPTS += --enable-physics
-LIBEFL_DEPENDENCIES += bullet
+EFL_CONF_OPTS += --enable-physics
+EFL_DEPENDENCIES += bullet
 else
-LIBEFL_CONF_OPTS += --disable-physics
+EFL_CONF_OPTS += --disable-physics
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
-LIBEFL_CONF_OPTS += --enable-audio
-LIBEFL_DEPENDENCIES += libsndfile
+EFL_CONF_OPTS += --enable-audio
+EFL_DEPENDENCIES += libsndfile
 else
-LIBEFL_CONF_OPTS += --disable-audio
+EFL_CONF_OPTS += --disable-audio
 endif
 
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
-LIBEFL_CONF_OPTS += --enable-pulseaudio
-LIBEFL_DEPENDENCIES += pulseaudio
+EFL_CONF_OPTS += --enable-pulseaudio
+EFL_DEPENDENCIES += pulseaudio
 else
-LIBEFL_CONF_OPTS += --disable-pulseaudio
+EFL_CONF_OPTS += --disable-pulseaudio
 endif
 
 ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
-LIBEFL_DEPENDENCIES += harfbuzz
-LIBEFL_CONF_OPTS += --enable-harfbuzz
+EFL_DEPENDENCIES += harfbuzz
+EFL_CONF_OPTS += --enable-harfbuzz
 else
-LIBEFL_CONF_OPTS += --disable-harfbuzz
+EFL_CONF_OPTS += --disable-harfbuzz
 endif
 
 ifeq ($(BR2_PACKAGE_TSLIB),y)
-LIBEFL_DEPENDENCIES += tslib
-LIBEFL_CONF_OPTS += --enable-tslib
+EFL_DEPENDENCIES += tslib
+EFL_CONF_OPTS += --enable-tslib
 else
-LIBEFL_CONF_OPTS += --disable-tslib
+EFL_CONF_OPTS += --disable-tslib
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-LIBEFL_DEPENDENCIES += libglib2
-LIBEFL_CONF_OPTS += --with-glib=yes
+EFL_DEPENDENCIES += libglib2
+EFL_CONF_OPTS += --with-glib=yes
 else
-LIBEFL_CONF_OPTS += --with-glib=no
+EFL_CONF_OPTS += --with-glib=no
 endif
 
 # Prefer openssl (the default) over gnutls.
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBEFL_DEPENDENCIES += openssl
-LIBEFL_CONF_OPTS += --with-crypto=openssl
+EFL_DEPENDENCIES += openssl
+EFL_CONF_OPTS += --with-crypto=openssl
 else ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
-LIBEFL_DEPENDENCIES += gnutls libgcrypt
-LIBEFL_CONF_OPTS += --with-crypto=gnutls \
+EFL_DEPENDENCIES += gnutls libgcrypt
+EFL_CONF_OPTS += --with-crypto=gnutls \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
-LIBEFL_CONF_OPTS += --with-crypto=none
+EFL_CONF_OPTS += --with-crypto=none
 endif # BR2_PACKAGE_OPENSSL
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
-LIBEFL_DEPENDENCIES += wayland libxkbcommon
-LIBEFL_CONF_OPTS += --enable-wayland
+EFL_DEPENDENCIES += wayland libxkbcommon
+EFL_CONF_OPTS += --enable-wayland
 else
-LIBEFL_CONF_OPTS += --disable-wayland
+EFL_CONF_OPTS += --disable-wayland
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEFL_FB),y)
-LIBEFL_CONF_OPTS += --enable-fb
+ifeq ($(BR2_PACKAGE_EFL_FB),y)
+EFL_CONF_OPTS += --enable-fb
 else
-LIBEFL_CONF_OPTS += --disable-fb
+EFL_CONF_OPTS += --disable-fb
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB),y)
+ifeq ($(BR2_PACKAGE_EFL_X_XLIB),y)
 # --enable-xinput22 is recommended
-LIBEFL_CONF_OPTS += \
+EFL_CONF_OPTS += \
 	--with-x11=xlib \
 	--with-x=$(STAGING_DIR) \
 	--x-includes=$(STAGING_DIR)/usr/include \
 	--x-libraries=$(STAGING_DIR)/usr/lib \
 	--enable-xinput22
 
-LIBEFL_DEPENDENCIES += \
+EFL_DEPENDENCIES += \
 	xlib_libX11 \
 	xlib_libXcomposite \
 	xlib_libXcursor \
@@ -163,68 +162,68 @@ LIBEFL_DEPENDENCIES += \
 	xlib_libXScrnSaver \
 	xlib_libXtst
 else
-LIBEFL_CONF_OPTS += --with-x11=none
+EFL_CONF_OPTS += --with-x11=none
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEFL_OPENGLES),y)
-LIBEFL_CONF_OPTS += --with-opengl=es
-LIBEFL_DEPENDENCIES += libgles
+ifeq ($(BR2_PACKAGE_EFL_OPENGLES),y)
+EFL_CONF_OPTS += --with-opengl=es
+EFL_DEPENDENCIES += libgles
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEFL_OPENGL_NONE),y)
-LIBEFL_CONF_OPTS += --with-opengl=none
+ifeq ($(BR2_PACKAGE_EFL_OPENGL_NONE),y)
+EFL_CONF_OPTS += --with-opengl=none
 endif
 
 # Loaders that need external dependencies needs to be --enable-XXX=yes
 # otherwise the default is '=static'.
 # All other loaders are statically built-in
-ifeq ($(BR2_PACKAGE_LIBEFL_PNG),y)
-LIBEFL_CONF_OPTS += --enable-image-loader-png=yes
-LIBEFL_DEPENDENCIES += libpng
+ifeq ($(BR2_PACKAGE_EFL_PNG),y)
+EFL_CONF_OPTS += --enable-image-loader-png=yes
+EFL_DEPENDENCIES += libpng
 else
-LIBEFL_CONF_OPTS += --disable-image-loader-png
+EFL_CONF_OPTS += --disable-image-loader-png
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEFL_JPEG),y)
-LIBEFL_CONF_OPTS += --enable-image-loader-jpeg=yes
-# libefl already depends on jpeg.
+ifeq ($(BR2_PACKAGE_EFL_JPEG),y)
+EFL_CONF_OPTS += --enable-image-loader-jpeg=yes
+# efl already depends on jpeg.
 else
-LIBEFL_CONF_OPTS += --disable-image-loader-jpeg
+EFL_CONF_OPTS += --disable-image-loader-jpeg
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEFL_GIF),y)
-LIBEFL_CONF_OPTS += --enable-image-loader-gif=yes
-LIBEFL_DEPENDENCIES += giflib
+ifeq ($(BR2_PACKAGE_EFL_GIF),y)
+EFL_CONF_OPTS += --enable-image-loader-gif=yes
+EFL_DEPENDENCIES += giflib
 else
-LIBEFL_CONF_OPTS += --disable-image-loader-gif
+EFL_CONF_OPTS += --disable-image-loader-gif
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEFL_TIFF),y)
-LIBEFL_CONF_OPTS += --enable-image-loader-tiff=yes
-LIBEFL_DEPENDENCIES += tiff
+ifeq ($(BR2_PACKAGE_EFL_TIFF),y)
+EFL_CONF_OPTS += --enable-image-loader-tiff=yes
+EFL_DEPENDENCIES += tiff
 else
-LIBEFL_CONF_OPTS += --disable-image-loader-tiff
+EFL_CONF_OPTS += --disable-image-loader-tiff
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEFL_JP2K),y)
-LIBEFL_CONF_OPTS += --enable-image-loader-jp2k=yes
-LIBEFL_DEPENDENCIES += openjpeg
+ifeq ($(BR2_PACKAGE_EFL_JP2K),y)
+EFL_CONF_OPTS += --enable-image-loader-jp2k=yes
+EFL_DEPENDENCIES += openjpeg
 else
-LIBEFL_CONF_OPTS += --disable-image-loader-jp2k
+EFL_CONF_OPTS += --disable-image-loader-jp2k
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEFL_WEBP),y)
-LIBEFL_CONF_OPTS += --enable-image-loader-webp=yes
-LIBEFL_DEPENDENCIES += webp
+ifeq ($(BR2_PACKAGE_EFL_WEBP),y)
+EFL_CONF_OPTS += --enable-image-loader-webp=yes
+EFL_DEPENDENCIES += webp
 else
-LIBEFL_CONF_OPTS += --disable-image-loader-webp
+EFL_CONF_OPTS += --disable-image-loader-webp
 endif
 
 $(eval $(autotools-package))
 
 ################################################################################
 #
-# host-libefl
+# host-efl
 #
 ################################################################################
 
@@ -237,7 +236,7 @@ $(eval $(autotools-package))
 # * host-libglib2: for libecore
 # * host-libjpeg, host-libpng: for libevas image loader
 # * host-lua: disable luajit dependency
-HOST_LIBEFL_DEPENDENCIES = \
+HOST_EFL_DEPENDENCIES = \
 	host-pkgconf \
 	host-dbus \
 	host-freetype \
@@ -262,7 +261,7 @@ HOST_LIBEFL_DEPENDENCIES = \
 # --with-crypto=none: remove dependencies on openssl or gnutls.
 # --with-x11=none: remove dependency on X.org.
 #   Yes I really know what I am doing.
-HOST_LIBEFL_CONF_OPTS += \
+HOST_EFL_CONF_OPTS += \
 	--disable-audio \
 	--disable-cxx-bindings \
 	--disable-fontconfig \
diff --git a/package/efl/libelementary/Config.in b/package/efl/libelementary/Config.in
index 1f8c962..75993a4 100644
--- a/package/efl/libelementary/Config.in
+++ b/package/efl/libelementary/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBELEMENTARY
 	bool "libelementary"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elm_store.c
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_EFL
 	help
 	  Elementary is a widget toolkit and EFL wrapper and convenience
 	  library to make it easy to build applications and tools with UIs
@@ -10,4 +11,5 @@ config BR2_PACKAGE_LIBELEMENTARY
 	  https://enlightenment.org
 
 comment "libelementary needs a toolchain w/ threads, dynamic library"
+	depends on BR2_PACKAGE_EFL
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index c920801..b0f6149 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -12,7 +12,7 @@ LIBELEMENTARY_LICENSE_FILES = COPYING
 
 LIBELEMENTARY_INSTALL_STAGING = YES
 
-LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-libefl host-libelementary libefl
+LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-efl host-libelementary efl
 
 LIBELEMENTARY_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
@@ -25,7 +25,7 @@ LIBELEMENTARY_CONF_OPTS = \
 
 # We need a host package in order to provide elm_prefs_cc and
 # elementary_codegen.
-HOST_LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-libefl
+HOST_LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-efl
 HOST_LIBELEMENTARY_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 7f0d583..3bfc444 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -12,9 +12,9 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	depends on BR2_PACKAGE_XORG7
 	# libevas-generic-loaders-svg -> librsvg -> pango -> cairo
 	depends on BR2_ARCH_HAS_ATOMICS
-	select BR2_PACKAGE_LIBEFL_X_XLIB
-	select BR2_PACKAGE_LIBEFL_JPEG # needed at runtime by enlightenment_start
-	select BR2_PACKAGE_LIBEFL_PNG # needed at runtime by enlightenment_start
+	select BR2_PACKAGE_EFL_X_XLIB
+	select BR2_PACKAGE_EFL_JPEG # needed at runtime by enlightenment_start
+	select BR2_PACKAGE_EFL_PNG # needed at runtime by enlightenment_start
 	select BR2_PACKAGE_LIBELEMENTARY
 	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index f2e0bc3..dba81d3 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -12,8 +12,8 @@ ENLIGHTENMENT_LICENSE_FILES = COPYING
 
 ENLIGHTENMENT_DEPENDENCIES = \
 	host-pkgconf \
-	host-libefl \
-	libefl \
+	host-efl \
+	efl \
 	libelementary \
 	libevas-generic-loaders \
 	xcb-util-keysyms
diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
index 4a4e2ee..8754dc0 100644
--- a/package/expedite/expedite.mk
+++ b/package/expedite/expedite.mk
@@ -11,12 +11,12 @@ EXPEDITE_SITE_METHOD = git
 EXPEDITE_LICENSE = BSD-2c
 EXPEDITE_LICENSE_FILES = COPYING
 
-EXPEDITE_DEPENDENCIES = host-libefl host-pkgconf libefl
+EXPEDITE_DEPENDENCIES = host-efl host-pkgconf efl
 
 # There is no configure script in the git tree.
 EXPEDITE_AUTORECONF = YES
 
-ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB),y)
+ifeq ($(BR2_PACKAGE_EFL_X_XLIB),y)
 EXPEDITE_CONF_OPTS += --with-x=$(STAGING_DIR) \
 	--x-includes=$(STAGING_DIR)/usr/include \
 	--x-libraries=$(STAGING_DIR)/usr/lib
diff --git a/package/libemotion-generic-players/libemotion-generic-players.mk b/package/libemotion-generic-players/libemotion-generic-players.mk
index ef41b2e..384cd97 100644
--- a/package/libemotion-generic-players/libemotion-generic-players.mk
+++ b/package/libemotion-generic-players/libemotion-generic-players.mk
@@ -12,6 +12,6 @@ LIBEMOTION_GENERIC_PLAYERS_LICENSE_FILES = COPYING
 
 LIBEMOTION_GENERIC_PLAYERS_INSTALL_STAGING = YES
 
-LIBEMOTION_GENERIC_PLAYERS_DEPENDENCIES = host-pkgconf libefl vlc
+LIBEMOTION_GENERIC_PLAYERS_DEPENDENCIES = host-pkgconf efl vlc
 
 $(eval $(autotools-package))
diff --git a/package/libevas-generic-loaders/libevas-generic-loaders.mk b/package/libevas-generic-loaders/libevas-generic-loaders.mk
index 2c1c1cd..ff8ea37 100644
--- a/package/libevas-generic-loaders/libevas-generic-loaders.mk
+++ b/package/libevas-generic-loaders/libevas-generic-loaders.mk
@@ -12,7 +12,7 @@ LIBEVAS_GENERIC_LOADERS_LICENSE_FILES = COPYING
 
 LIBEVAS_GENERIC_LOADERS_INSTALL_STAGING = YES
 
-LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = host-pkgconf libefl zlib
+LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = host-pkgconf efl zlib
 
 # poppler >= 0.32 is not supported by the current version of
 # libevas-generic-loaders.
-- 
2.4.3
