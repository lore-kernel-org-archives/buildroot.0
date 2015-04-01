From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:35:56 +0200
Subject: [Buildroot] [PATCH/RFC 03/27] package/kodi: bump version to 15.0
	Alpha2-Isengard
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/0001-Fixup-include-path.patch |   20 --------------
 package/kodi/0002-texturepacker.patch      |   12 ++++++++
 package/kodi/0003-lirc-PR6783.patch        |   41 ++++++++++++++++++++++++++++
 package/kodi/Config.in                     |   15 +++++-----
 package/kodi/kodi.mk                       |   33 ++++++++++++----------
 5 files changed, 78 insertions(+), 43 deletions(-)
 create mode 100644 package/kodi/0002-texturepacker.patch
 create mode 100644 package/kodi/0003-lirc-PR6783.patch

diff --git a/package/kodi/0001-Fixup-include-path.patch b/package/kodi/0001-Fixup-include-path.patch
index be99bd6..5798528 100644
--- a/package/kodi/0001-Fixup-include-path.patch
+++ b/package/kodi/0001-Fixup-include-path.patch
@@ -59,23 +59,3 @@ index e170c7e..25ee893 100644
 -fi      
 +      echo $dvdreadlib
 +fi
-diff --git a/lib/timidity/configure.in b/lib/timidity/configure.in
-index 9f2835b..733470a 100644
---- a/lib/timidity/configure.in
-+++ b/lib/timidity/configure.in
-@@ -100,9 +100,9 @@ done
- 
- # add $prefix if specified.
- if test "x$prefix" != xNONE -a "x$prefix" != "x$ac_default_prefix" -a "x$prefix" != "x/usr"; then
--  LDFLAGS="-L$prefix/lib $LDFLAGS"
--  SHLDFLAGS="-L$prefix/lib $SHLDFLAGS"
--  CPPFLAGS="-I$prefix/include $CPPFLAGS"
-+  LDFLAGS="$LDFLAGS"
-+  SHLDFLAGS="$SHLDFLAGS"
-+  CPPFLAGS="$CPPFLAGS"
- fi
- 
- dnl add --with-includes, --with-libraries
--- 
-1.8.5.2
-
diff --git a/package/kodi/0002-texturepacker.patch b/package/kodi/0002-texturepacker.patch
new file mode 100644
index 0000000..c9e28dd
--- /dev/null
+++ b/package/kodi/0002-texturepacker.patch
@@ -0,0 +1,12 @@
+diff -uNr xbmc-656cba5d5c7c5edb166196b48560825b9b1f03fd.org/tools/depends/native/TexturePacker/Makefile xbmc-656cba5d5c7c5edb166196b48560825b9b1f03fd/tools/depends/native/TexturePacker/Makefile
+--- xbmc-656cba5d5c7c5edb166196b48560825b9b1f03fd.org/tools/depends/native/TexturePacker/Makefile	2015-01-25 09:00:48.000000000 +0100
++++ xbmc-656cba5d5c7c5edb166196b48560825b9b1f03fd/tools/depends/native/TexturePacker/Makefile	2015-01-25 13:03:23.606140953 +0100
+@@ -36,7 +36,7 @@
+ 	-rm -rf $(PLATFORM)/*; mkdir -p $(PLATFORM)
+ 	cd $(PLATFORM); cp -a $(SOURCE)/* .
+ 	cd $(PLATFORM); ./autogen.sh
+-	cd $(PLATFORM); ./configure --prefix=$(PREFIX) $(EXTRA_CONFIGURE) EXTRA_DEFINES="$(NATIVE_ARCH_DEFINES)"
++	cd $(PLATFORM); ./configure --prefix=$(PREFIX) EXTRA_DEFINES="$(NATIVE_ARCH_DEFINES)"
+ 
+ 
+ $(APP): $(PLATFORM)
diff --git a/package/kodi/0003-lirc-PR6783.patch b/package/kodi/0003-lirc-PR6783.patch
new file mode 100644
index 0000000..bf11eac
--- /dev/null
+++ b/package/kodi/0003-lirc-PR6783.patch
@@ -0,0 +1,41 @@
+From b641e1eea54b4b9ab7f1b95092ab0a755abc63be Mon Sep 17 00:00:00 2001
+From: wsnipex <wsnipex@a1.net>
+Date: Sun, 22 Mar 2015 13:01:34 +0100
+Subject: [PATCH] [configure] add option to disable lirc
+
+---
+ configure.ac  | 6 ++++++
+ xbmc/system.h | 2 ++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index b377e8c..8a5b760 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -500,6 +500,12 @@ AC_ARG_ENABLE([texturepacker],
+   [use_texturepacker=$enableval],
+   [use_texturepacker=auto])
+ 
++AC_ARG_ENABLE([lirc],
++  [AS_HELP_STRING([--disable-lirc],
++  [disable lirc support (default is enabled)])],
++  [AC_MSG_RESULT("Lirc disabled")],
++  [AC_DEFINE([HAVE_LIRC], [1], ["Lirc enabled"])])
++
+ AC_ARG_WITH([lirc-device],
+   [AS_HELP_STRING([--with-lirc-device=file],
+   [specify the default LIRC device (default is /dev/lircd)])],
+diff --git a/xbmc/system.h b/xbmc/system.h
+index b6e262d..268eebe 100644
+--- a/xbmc/system.h
++++ b/xbmc/system.h
+@@ -172,7 +172,9 @@
+ #endif
+ #endif
+ #define HAS_LINUX_NETWORK
++#ifdef HAVE_LIRC
+ #define HAS_LIRC
++#endif
+ #ifdef HAVE_LIBPULSE
+ #define HAS_PULSEAUDIO
+ #endif
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 1bc8b15..0abc228 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm || BR2_i386 || BR2_x86_64
+	default y if BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64
 
 comment "kodi needs a toolchain w/ C++, IPv6, largefile, threads, wchar"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
@@ -50,15 +50,12 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_KODI_GL
 	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_KODI_GL
 	select BR2_PACKAGE_LIBGCRYPT
-	select BR2_PACKAGE_LIBID3TAG
-	select BR2_PACKAGE_LIBMAD
-	select BR2_PACKAGE_LIBMODPLUG
 	select BR2_PACKAGE_LIBMPEG2
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBPLIST
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBSAMPLERATE
-	select BR2_PACKAGE_LIBUNGIF
+	select BR2_PACKAGE_LIBSQUISH
 	select BR2_PACKAGE_LIBVORBIS
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
@@ -78,9 +75,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_PYTHON_UNICODEDATA
 	select BR2_PACKAGE_PYTHON_ZLIB
 	select BR2_PACKAGE_READLINE
-	select BR2_PACKAGE_SDL if BR2_PACKAGE_KODI_GL
-	select BR2_PACKAGE_SDL_X11 if BR2_PACKAGE_KODI_GL
-	select BR2_PACKAGE_SDL_IMAGE if BR2_PACKAGE_KODI_GL
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_TAGLIB
 	select BR2_PACKAGE_TIFF
@@ -169,6 +163,11 @@ config BR2_PACKAGE_KODI_LIBCEC
 comment "hdmi cec support needs udev /dev management and a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_UDEV
 
+config BR2_PACKAGE_KODI_LIRC
+	bool "lirc"
+	help
+	  Enable lirc support
+
 config BR2_PACKAGE_KODI_LIBMICROHTTPD
 	bool "web server"
 	select BR2_PACKAGE_LIBMICROHTTPD
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index ca8563d..e64b068 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -4,22 +4,19 @@
 #
 ################################################################################
 
-KODI_VERSION = 14.2-Helix
+KODI_VERSION = 15.0a2-Isengard
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPLv2
 KODI_LICENSE_FILES = LICENSE.GPL
 # needed for audioencoder addons
 KODI_INSTALL_STAGING = YES
-# Kodi needs host-sdl_image (and therefore host-sdl) for a host tools it builds
-# called TexturePacker. It is responsible to take all the images used in the
-# GUI and pack them in a blob.
-# http://wiki.xbmc.org/index.php?title=TexturePacker
-KODI_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-lzo \
-	host-nasm host-sdl_image host-swig
+KODI_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-giflib \
+	host-libjpeg host-lzo host-nasm host-libpng host-swig
 KODI_DEPENDENCIES += boost bzip2 expat ffmpeg fontconfig freetype jasper jpeg \
-	libass libcdio libcurl libfribidi libgcrypt libmad libmodplug libmpeg2 \
-	libogg libplist libpng libsamplerate libungif libvorbis libxml2 libxslt lzo ncurses \
-	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
+	libass libcdio libcurl libfribidi libgcrypt libmpeg2 \
+	libogg libplist libpng libsamplerate libsquish libvorbis libxml2 \
+	libxslt lzo ncurses openssl pcre python readline sqlite taglib tiff \
+	tinyxml yajl zlib
 
 KODI_CONF_ENV = \
 	PYTHON_VERSION="$(PYTHON_VERSION_MAJOR)" \
@@ -33,9 +30,7 @@ KODI_CONF_ENV = \
 
 KODI_CONF_OPTS +=  \
 	--with-ffmpeg=shared \
-	--disable-crystalhd \
 	--disable-dvdcss \
-	--disable-hal \
 	--disable-joystick \
 	--disable-openmax \
 	--disable-projectm \
@@ -92,9 +87,9 @@ endif
 # GL means X11, and under X11, Kodi needs libdrm; libdrm is forcefully selected
 # by a modular Xorg server, which Kodi already depends on.
 ifeq ($(BR2_PACKAGE_KODI_GL),y)
-KODI_DEPENDENCIES += libglew libglu libgl sdl_image xlib_libX11 xlib_libXext \
+KODI_DEPENDENCIES += libglew libglu libgl xlib_libX11 xlib_libXext \
 	xlib_libXmu xlib_libXrandr xlib_libXt libdrm
-KODI_CONF_OPTS += --enable-gl --enable-sdl --enable-x11 --enable-xrandr --disable-gles
+KODI_CONF_OPTS += --enable-gl --enable-x11 --enable-xrandr --disable-gles
 ifeq ($(BR2_PACKAGE_KODI_RSXS),y)
 # fix rsxs compile
 # make sure target libpng-config is used, options taken from rsxs-0.9/acinclude.m4
@@ -110,7 +105,7 @@ else
 KODI_CONF_OPTS += --disable-rsxs
 endif
 else
-KODI_CONF_OPTS += --disable-gl --disable-rsxs --disable-sdl --disable-x11 --disable-xrandr
+KODI_CONF_OPTS += --disable-gl --disable-rsxs --disable-x11 --disable-xrandr
 ifeq ($(BR2_PACKAGE_KODI_EGL_GLES),y)
 KODI_DEPENDENCIES += libegl libgles
 KODI_CONF_OPTS += --enable-gles
@@ -188,6 +183,12 @@ else
 KODI_CONF_OPTS += --disable-libcec
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_LIRC),y)
+KODI_CONF_OPTS += --enable-lirc
+else
+KODI_CONF_OPTS += --disable-lirc
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_WAVPACK),y)
 KODI_DEPENDENCIES += wavpack
 endif
@@ -212,6 +213,8 @@ endif
 
 # Add HOST_DIR to PATH for codegenerator.mk to find swig
 define KODI_BOOTSTRAP
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/tools/depends/native/JsonSchemaBuilder
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/tools/depends/native/TexturePacker
 	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
 endef
 KODI_PRE_CONFIGURE_HOOKS += KODI_BOOTSTRAP
-- 
1.7.10.4
