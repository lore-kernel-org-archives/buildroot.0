From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 May 2014 22:41:26 +0200
Subject: [Buildroot] [PATCH v9 27/29] xbmc: Add X.org/OpenGL support
In-Reply-To: <1400618488-6995-1-git-send-email-bernd.kuhls@t-online.de>
References: <1400618488-6995-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1400618488-6995-28-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- on ARM xbmc only supports EGL/GLES
- rsxs gets enabled when OpenGL is available,
  therefore the compile fix, courtesy of
  https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/mediacenter/xbmc/package.mk#L109
  is part of this patch

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/Config.in |   32 +++++++++++++++++++++++++++++---
 package/xbmc/xbmc.mk   |   25 +++++++++++++++++++------
 2 files changed, 48 insertions(+), 9 deletions(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index 05ceea4..8119688 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -2,9 +2,27 @@ comment "xbmc needs a toolchain w/ C++, IPv6, largefile, threads, wchar"
 	depends on BR2_arm || BR2_i386 || BR2_x86_64
 	depends on !BR2_INET_IPV6 || !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
+config BR2_PACKAGE_XBMC_EGL_GLES
+	bool
+	default y
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on !BR2_PACKAGE_XBMC_GL # prefer GL if available
+
+config BR2_PACKAGE_XBMC_GL
+	bool
+	default y
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on !BR2_arm # xbmc needs egl/gles on arm
+
+comment "xbmc needs an OpenGL backend, or an openGL ES and EGL backend"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_PACKAGE_XBMC_GL && !BR2_PACKAGE_XBMC_EGL_GLES
+
 comment "xbmc requires an OpenGL ES and EGL backend"
-	depends on BR2_arm || BR2_i386 || BR2_x86_64
-	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_arm
+	depends on !BR2_PACKAGE_XBMC_EGL_GLES
 
 menuconfig BR2_PACKAGE_XBMC
 	bool "xbmc"
@@ -22,6 +40,8 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_LIBCDIO
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBFRIBIDI
+	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_XBMC_GL
+	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_XBMC_GL
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBID3TAG
 	select BR2_PACKAGE_LIBMAD
@@ -50,17 +70,23 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_PYTHON_UNICODEDATA
 	select BR2_PACKAGE_PYTHON_ZLIB
 	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_SDL if BR2_PACKAGE_XBMC_GL
+	select BR2_PACKAGE_SDL_X11 if BR2_PACKAGE_XBMC_GL
+	select BR2_PACKAGE_SDL_IMAGE if BR2_PACKAGE_XBMC_GL
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_TAGLIB
 	select BR2_PACKAGE_TIFF
 	select BR2_PACKAGE_TINYXML
+	select BR2_PACKAGE_XLIB_XMU if BR2_PACKAGE_XBMC_GL # needed by rsxs screensaver
+	select BR2_PACKAGE_XLIB_XRANDR if BR2_PACKAGE_XBMC_GL
+	select BR2_PACKAGE_XLIB_XT if BR2_PACKAGE_XBMC_GL # needed by rsxs screensaver
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_INET_IPV6
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_XBMC_EGL_GLES || BR2_PACKAGE_XBMC_GL
 	depends on BR2_USE_MMU # python
 	depends on BR2_USE_WCHAR
 	depends on BR2_arm || BR2_i386 || BR2_x86_64
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index cbc51f4..b713b5c 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -16,7 +16,7 @@ XBMC_LICENSE_FILES = LICENSE.GPL
 # http://wiki.xbmc.org/index.php?title=TexturePacker
 XBMC_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-lzo host-sdl_image host-swig
 XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
-	libass libcdio libcurl libegl libfribidi libgcrypt libgles libmad libmodplug libmpeg2 \
+	libass libcdio libcurl libfribidi libgcrypt libmad libmodplug libmpeg2 \
 	libogg libplist libpng libsamplerate libungif libvorbis libxml2 libxslt lzo ncurses \
 	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
 
@@ -45,7 +45,6 @@ XBMC_CONF_OPT +=  \
 	--disable-crystalhd \
 	--disable-debug \
 	--disable-dvdcss \
-	--disable-gl \
 	--disable-hal \
 	--disable-joystick \
 	--disable-mysql \
@@ -53,14 +52,10 @@ XBMC_CONF_OPT +=  \
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
@@ -88,9 +83,27 @@ else
 XBMC_CONF_OPT += --disable-libmp3lame
 endif
 
+# quote from xbmc/configure.in: "GLES overwrites GL if both set to yes."
+# we choose the opposite because opengl offers more features, like libva support
+ifeq ($(BR2_PACKAGE_XBMC_GL),y)
+XBMC_DEPENDENCIES += libglew libglu libgl sdl_image xlib_libX11 xlib_libXext \
+	xlib_libXmu xlib_libXrandr xlib_libXt
+XBMC_CONF_OPT += --enable-gl --enable-sdl --enable-x11 --enable-xrandr--disable-gles
+# fix rsxs compile
+XBMC_CONF_ENV += jm_cv_func_gettimeofday_clobber=no
+XBMC_CONF_OPT += --enable-rsxs
+else
+XBMC_CONF_OPT += --disable-gl --disable-rsxs --disable-sdl --disable-x11 --disable-xrandr
+ifeq ($(BR2_PACKAGE_XBMC_EGL_GLES),y)
+XBMC_DEPENDENCIES += libegl libgles
+XBMC_CONF_OPT += --enable-gles
 XBMC_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
 	CXXFLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
+else
+XBMC_CONF_OPT += --disable-gles
+endif
+endif
 
 ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
 XBMC_DEPENDENCIES += libusb-compat
-- 
1.7.10.4
