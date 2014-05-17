From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 May 2014 17:57:49 +0200
Subject: [Buildroot] [PATCH v8 21/28] xbmc: Add X.org/OpenGL support
In-Reply-To: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1400342276-10303-22-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/Config.in |   24 ++++++++++++++++++++----
 package/xbmc/xbmc.mk   |   40 ++++++++++++++++++++++++++++++++++------
 2 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index f001209..40a1f63 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -2,9 +2,12 @@ comment "xbmc needs a toolchain w/ C++, IPv6, largefile, threads, wchar"
 	depends on BR2_arm || BR2_i386 || BR2_x86_64
 	depends on !BR2_INET_IPV6 || !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
-comment "xbmc requires an OpenGL ES and EGL backend"
-	depends on BR2_arm || BR2_i386 || BR2_x86_64
-	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
+comment "xbmc needs an OpenGL backend"
+	depends on (!BR2_arm && (BR2_i386 || BR2_x86_64)) && \
+		!BR2_PACKAGE_HAS_LIBGL && !(BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES)
+
+comment "xbmc needs EGL & GLES support"
+	depends on BR2_arm && !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGLES
 
 menuconfig BR2_PACKAGE_XBMC
 	bool "xbmc"
@@ -22,6 +25,8 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_LIBCDIO
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBFRIBIDI
+	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBID3TAG
 	select BR2_PACKAGE_LIBMAD
@@ -50,17 +55,28 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_PYTHON_UNICODEDATA
 	select BR2_PACKAGE_PYTHON_ZLIB
 	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_SDL if BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_SDL_X11 if BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_SDL_IMAGE if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_TAGLIB
 	select BR2_PACKAGE_TIFF
 	select BR2_PACKAGE_TINYXML
+
+	# mesa3d provides libgl only with dri drivers which depend on xorg
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_XLIB_XMU if BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_XLIB_XRANDR if BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_XLIB_XT if BR2_PACKAGE_HAS_LIBGL
+
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_INET_IPV6
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_HAS_LIBGL || (BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES)
 	depends on BR2_USE_MMU # python
 	depends on BR2_USE_WCHAR
 	depends on BR2_arm || BR2_i386 || BR2_x86_64
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 5a72dab..7fdaafc 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -14,7 +14,7 @@ XBMC_LICENSE_FILES = LICENSE.GPL
 # http://wiki.xbmc.org/index.php?title=TexturePacker
 XBMC_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-lzo host-sdl_image host-swig
 XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
-	libass libcdio libcurl libegl libfribidi libgcrypt libgles libmad libmodplug libmpeg2 \
+	libass libcdio libcurl libfribidi libgcrypt libmad libmodplug libmpeg2 \
 	libogg libplist libpng libsamplerate libungif libvorbis libxml2 libxslt lzo ncurses \
 	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
 
@@ -32,7 +32,6 @@ XBMC_CONF_OPT +=  \
 	--disable-crystalhd \
 	--disable-debug \
 	--disable-dvdcss \
-	--disable-gl \
 	--disable-hal \
 	--disable-joystick \
 	--disable-mysql \
@@ -40,14 +39,10 @@ XBMC_CONF_OPT +=  \
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
@@ -61,6 +56,39 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 XBMC_DEPENDENCIES += dbus
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+XBMC_DEPENDENCIES += \
+	libglew \
+	libglu \
+	libgl \
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
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
+XBMC_DEPENDENCIES += libegl libgles
+XBMC_CONF_OPT += --enable-gles
+XBMC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
+	CXXFLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
+else
+XBMC_CONF_OPT += --disable-gles
+endif
+
 ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
 XBMC_DEPENDENCIES += libusb-compat
 XBMC_CONF_OPT += --enable-libusb
-- 
1.7.10.4
