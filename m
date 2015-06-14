From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:03 +0200
Subject: [Buildroot] [PATCH/RFC v2 04/44] package/kodi: bump version to 15.0
	Beta2 Isengard
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- added libsquish as new dependency
  https://github.com/xbmc/xbmc/commit/f73653d62b09db8cab7662ae7c4b2dab596b4ab0#diff-3b3a6ec97232deb43dc14319a73872c1R2207

- updated build procedure for host version of texturepacker

- removed SDL dependencies
  http://kodi.wiki/view/Kodi_v15_%28Isengard%29_changelog#Linux_Specific
  "Removed dependencies of SDL (Simple DirectMedia Layer) for everything
   but hardware abstraction for input devices"

- added mips support:
  https://github.com/xbmc/xbmc/commit/5d1746ad5b2272ba5f906ad9a49a87b650bda14a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/0001-Fixup-include-path.patch |   48 ----------------------------
 package/kodi/0002-texturepacker.patch      |   12 +++++++
 package/kodi/Config.in                     |   10 ++----
 package/kodi/kodi.mk                       |   31 ++++++++++--------
 4 files changed, 31 insertions(+), 70 deletions(-)
 create mode 100644 package/kodi/0002-texturepacker.patch

diff --git a/package/kodi/0001-Fixup-include-path.patch b/package/kodi/0001-Fixup-include-path.patch
index be99bd6..9298981 100644
--- a/package/kodi/0001-Fixup-include-path.patch
+++ b/package/kodi/0001-Fixup-include-path.patch
@@ -14,34 +14,6 @@ Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
  lib/timidity/configure.in                    | 6 +++---
  4 files changed, 6 insertions(+), 12 deletions(-)
 
-diff --git a/lib/enca/configure b/lib/enca/configure
-index c839a51..7af5a09 100644
---- a/lib/enca/configure
-+++ b/lib/enca/configure
-@@ -12011,9 +12011,6 @@ fi
- if test "$prefix" = "NONE"; then
-   LDFLAGS="$LDFLAGS -L$ac_default_prefix/lib"
-   CPPFLAGS="$CPPFLAGS -I$ac_default_prefix/include"
--else
--  LDFLAGS="$LDFLAGS -L$prefix/lib"
--  CPPFLAGS="$CPPFLAGS -I$prefix/include"
- fi
- 
- 
-diff --git a/lib/enca/configure.ac b/lib/enca/configure.ac
-index 41434df..47d5367 100644
---- a/lib/enca/configure.ac
-+++ b/lib/enca/configure.ac
-@@ -100,9 +100,6 @@ dnl Dirty path hack.  Helps some people with badly set up search paths.
- if test "$prefix" = "NONE"; then
-   LDFLAGS="$LDFLAGS -L$ac_default_prefix/lib"
-   CPPFLAGS="$CPPFLAGS -I$ac_default_prefix/include"
--else
--  LDFLAGS="$LDFLAGS -L$prefix/lib"
--  CPPFLAGS="$CPPFLAGS -I$prefix/include"
- fi
- 
- dnl Checks for libraries.
 diff --git a/lib/libdvd/libdvdread/misc/dvdread-config.sh b/lib/libdvd/libdvdread/misc/dvdread-config.sh
 index e170c7e..25ee893 100644
 --- a/lib/libdvd/libdvdread/misc/dvdread-config.sh
@@ -59,23 +31,3 @@ index e170c7e..25ee893 100644
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
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index bc845f8..62553d4 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
-	default y if (BR2_arm || BR2_i386 || BR2_x86_64) && BR2_PACKAGE_BOOST_ARCH_SUPPORTS
-
+	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) && BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 
 comment "kodi needs a toolchain w/ C++, threads, wchar, dynamic library"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
@@ -52,14 +51,12 @@ menuconfig BR2_PACKAGE_KODI
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
+	select BR2_PACKAGE_LIBSQUISH
 	select BR2_PACKAGE_LIBVORBIS
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
@@ -79,9 +76,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_PYTHON_UNICODEDATA
 	select BR2_PACKAGE_PYTHON_ZLIB
 	select BR2_PACKAGE_READLINE
-	select BR2_PACKAGE_SDL if BR2_PACKAGE_KODI_GL
-	select BR2_PACKAGE_SDL_X11 if BR2_PACKAGE_KODI_GL
-	select BR2_PACKAGE_SDL_IMAGE if BR2_PACKAGE_KODI_GL
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_TAGLIB
 	select BR2_PACKAGE_TIFF
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index cc42df4..0971bfc 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -4,21 +4,17 @@
 #
 ################################################################################
 
-KODI_VERSION = 14.2-Helix
+KODI_VERSION = 15.0b2-Isengard
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
-	libogg libplist libpng libsamplerate libvorbis libxml2 libxslt lzo ncurses \
+	libass libcdio libcurl libfribidi libgcrypt libmpeg2 libogg libplist \
+	libpng libsamplerate libsquish libvorbis libxml2 libxslt lzo ncurses \
 	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
 
 KODI_CONF_ENV = \
@@ -33,8 +29,6 @@ KODI_CONF_ENV = \
 
 KODI_CONF_OPTS +=  \
 	--with-ffmpeg=shared \
-	--disable-crystalhd \
-	--disable-hal \
 	--disable-joystick \
 	--disable-openmax \
 	--disable-projectm \
@@ -91,9 +85,9 @@ endif
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
@@ -109,7 +103,7 @@ else
 KODI_CONF_OPTS += --disable-rsxs
 endif
 else
-KODI_CONF_OPTS += --disable-gl --disable-rsxs --disable-sdl --disable-x11 --disable-xrandr
+KODI_CONF_OPTS += --disable-gl --disable-rsxs --disable-x11 --disable-xrandr
 ifeq ($(BR2_PACKAGE_KODI_EGL_GLES),y)
 KODI_DEPENDENCIES += libegl libgles
 KODI_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
@@ -212,10 +206,19 @@ endif
 
 # Add HOST_DIR to PATH for codegenerator.mk to find swig
 define KODI_BOOTSTRAP
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/tools/depends/native/JsonSchemaBuilder
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/tools/depends/native/TexturePacker
 	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
 endef
 KODI_PRE_CONFIGURE_HOOKS += KODI_BOOTSTRAP
 
+# needed to fix binary addons compile
+# https://github.com/OpenELEC/OpenELEC.tv/commit/ecb91611931a4f89bd6551b4a2eaaf0b7cbf19fc
+define KODI_FIX_CONFIG_CMAKE
+	$(SED) "s:INCLUDE_DIR /usr/include/kodi:INCLUDE_DIR $(STAGING_DIR)/usr/include/kodi:g" $(STAGING_DIR)/usr/lib/kodi/kodi-config.cmake
+endef
+KODI_POST_INSTALL_STAGING_HOOKS += KODI_FIX_CONFIG_CMAKE
+
 define KODI_CLEAN_UNUSED_ADDONS
 	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/screensaver.rsxs.plasma
 	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/visualization.milkdrop
-- 
1.7.10.4
