From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 Apr 2014 21:46:50 +0200
Subject: [Buildroot] [PATCH v2 36/41] WIP: xbmc: Add X.org support
In-Reply-To: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396468015-1724-36-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/Config.in |   10 ++++++++++
 package/xbmc/xbmc.mk   |   42 ++++++++++++++++++++++++++++++++++++------
 2 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index e0576b6..765f325 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -20,6 +20,8 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_LIBCDIO
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBFRIBIDI
+	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBID3TAG
 	select BR2_PACKAGE_LIBMAD
@@ -48,10 +50,18 @@ menuconfig BR2_PACKAGE_XBMC
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
 	depends on BR2_LARGEFILE
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index e5eadd9..691cad6 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -14,7 +14,7 @@ XBMC_LICENSE_FILES = LICENSE.GPL
 # http://wiki.xbmc.org/index.php?title=TexturePacker
 XBMC_DEPENDENCIES = host-gawk host-gperf host-infozip host-lzo host-sdl_image host-swig
 XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
-	libass libcdio libcurl libegl libfribidi libgcrypt libgles libmad libmodplug libmpeg2 \
+	libass libcdio libcurl libfribidi libgcrypt libmad libmodplug libmpeg2 \
 	libogg libplist libpng libsamplerate libungif libvorbis libxml2 libxslt lzo ncurses \
 	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
 
@@ -31,7 +31,6 @@ XBMC_CONF_OPT +=  \
 	--disable-crystalhd \
 	--disable-debug \
 	--disable-dvdcss \
-	--disable-gl \
 	--disable-hal \
 	--disable-joystick \
 	--disable-mysql \
@@ -39,14 +38,10 @@ XBMC_CONF_OPT +=  \
 	--disable-optical-drive \
 	--disable-projectm \
 	--disable-pulse \
-	--disable-sdl \
 	--disable-ssh \
 	--disable-vaapi \
 	--disable-vdpau \
 	--disable-vtbdecoder \
-	--disable-x11 \
-	--disable-xrandr \
-	--enable-gles \
 	--enable-optimizations
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
@@ -60,6 +55,41 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 XBMC_DEPENDENCIES += dbus
 endif
 
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
 ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
 XBMC_DEPENDENCIES += libusb-compat
 XBMC_CONF_OPT += --enable-libusb
-- 
1.7.10.4
