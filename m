From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 31 Mar 2014 22:06:28 +0200
Subject: [Buildroot] [PATCH WIP 15/16] xbmc: Bump version to Gotham_beta3
In-Reply-To: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396296389-28821-16-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add support for uClibc, X.org, mesa3d, vaapi

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/Config.in |   26 +++++++++--------
 package/xbmc/xbmc.mk   |   73 ++++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 76 insertions(+), 23 deletions(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index e078d2f..758ad2d 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -1,11 +1,5 @@
-comment "xbmc needs an (e)glibc toolchain w/ C++, threads"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "xbmc requires an OpenGL ES and EGL backend"
-	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+comment "xbmc requires an OpenGL backend"
+	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES || !BR2_PACKAGE_HAS_OPENGL_GL
 
 menuconfig BR2_PACKAGE_XBMC
 	bool "xbmc"
@@ -23,6 +17,8 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_LIBCDIO
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBFRIBIDI
+	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBID3TAG
 	select BR2_PACKAGE_LIBMAD
@@ -35,6 +31,7 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_LIBUNGIF
 	select BR2_PACKAGE_LIBVORBIS
 	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
@@ -50,16 +47,21 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_PYTHON_UNICODEDATA
 	select BR2_PACKAGE_PYTHON_ZLIB
 	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_SDL if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_SDL_X11 if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_SDL_IMAGE if BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_TAGLIB
 	select BR2_PACKAGE_TIFF
 	select BR2_PACKAGE_TINYXML
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XLIB_XMU if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XLIB_XRANDR if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XLIB_XT if BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES
+	depends on (BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES) || BR2_PACKAGE_HAS_OPENGL_GL
 	help
 	  XBMC is an award-winning free and open source (GPL) software
 	  media player and entertainment hub for digital media.
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 9e346bd..974b4dd 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XBMC_VERSION = 12.3-Frodo
+XBMC_VERSION = Gotham_beta3
 XBMC_SITE = $(call github,xbmc,xbmc,$(XBMC_VERSION))
 XBMC_LICENSE = GPLv2
 XBMC_LICENSE_FILES = LICENSE.GPL
@@ -12,10 +12,10 @@ XBMC_LICENSE_FILES = LICENSE.GPL
 # called TexturePacker. It is responsible to take all the images used in the
 # GUI and pack them in a blob.
 # http://wiki.xbmc.org/index.php?title=TexturePacker
-XBMC_DEPENDENCIES = host-gperf host-lzo host-sdl_image host-swig
+XBMC_DEPENDENCIES = host-gawk host-gperf host-lzo host-nasm host-sdl_image host-swig
 XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
-	libass libcdio libcurl libegl libfribidi libgcrypt libgles libmad libmodplug libmpeg2 \
-	libogg libplist libpng libsamplerate libungif libvorbis libxml2 lzo ncurses \
+	libass libcdio libcurl libfribidi libgcrypt libmad libmodplug libmpeg2 \
+	libogg libplist libpng libsamplerate libungif libvorbis libxml2 libxslt lzo ncurses \
 	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
 
 XBMC_CONF_ENV = \
@@ -27,11 +27,9 @@ XBMC_CONF_ENV = \
 	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
 
 XBMC_CONF_OPT +=  \
-	--disable-alsa \
 	--disable-crystalhd \
 	--disable-debug \
 	--disable-dvdcss \
-	--disable-gl \
 	--disable-hal \
 	--disable-joystick \
 	--disable-mysql \
@@ -39,14 +37,11 @@ XBMC_CONF_OPT +=  \
 	--disable-optical-drive \
 	--disable-projectm \
 	--disable-pulse \
-	--disable-sdl \
 	--disable-ssh \
-	--disable-vaapi \
 	--disable-vdpau \
 	--disable-vtbdecoder \
-	--disable-x11 \
-	--disable-xrandr \
-	--enable-gles \
+	--disable-rsxs \
+	--enable-goom \
 	--enable-optimizations
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
@@ -60,6 +55,62 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 XBMC_DEPENDENCIES += dbus
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVA),y)
+XBMC_DEPENDENCIES += libva
+XBMC_CONF_OPT += --enable-vaapi
+else
+XBMC_CONF_OPT += --disable-vaapi
+endif
+
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
+XBMC_DEPENDENCIES += \
+	libglew \
+	libglu \
+	mesa3d \
+	sdl_image \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXmu \
+	xlib_libXrandr \
+	xlib_libXt
+XBMC_CONF_OPT += \
+	--enable-x11 \
+	--enable-xrandr \
+	--enable-gl \
+	--enable-sdl
+else
+XBMC_CONF_OPT += \
+	--disable-x11 \
+	--disable-xrandr \
+	--disable-gl \
+	--disable-sdl
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_OPENGL_EGL),y)
+XBMC_DEPENDENCIES += libegl
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_OPENGL_ES),y)
+XBMC_DEPENDENCIES += libgles
+XBMC_CONF_OPT += --enable-gles
+else
+XBMC_CONF_OPT += --disable-gles
+endif
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+XBMC_DEPENDENCIES += alsa-lib
+XBMC_CONF_OPT += --enable-alsa
+else
+XBMC_CONF_OPT += --disable-alsa
+endif
+
+ifeq ($(BR2_PACKAGE_LAME),y)
+XBMC_DEPENDENCIES += lame
+XBMC_CONF_OPT += --enable-libmp3lame
+else
+XBMC_CONF_OPT += --disable-libmp3lame
+endif
+
 ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
 XBMC_DEPENDENCIES += libusb-compat
 XBMC_CONF_OPT += --enable-libusb
-- 
1.7.10.4
