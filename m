From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 10:39:05 +0200
Subject: [Buildroot] [git commit] xbmc: Add X.org/OpenGL support
Message-ID: <20140803084505.8DEF49D379@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=713cedea06a0ffa440aa61be399fc23c4e81f0bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- on ARM xbmc only supports EGL/GLES
  https://github.com/xbmc/xbmc/blob/Gotham/configure.in#L695
- rsxs depends on OpenGL
  https://github.com/xbmc/xbmc/blob/Gotham/configure.in#L1469
  so include a compile fix, courtesy of
  https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/mediacenter/xbmc/package.mk#L109

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xbmc/Config.in |   31 ++++++++++++++++++++++++++++---
 package/xbmc/xbmc.mk   |   33 +++++++++++++++++++++++++++------
 2 files changed, 55 insertions(+), 9 deletions(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index 05d28ee..04bc86f 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -6,9 +6,26 @@ comment "xbmc needs a toolchain w/ C++, IPv6, largefile, threads, wchar"
 	depends on BR2_PACKAGE_XBMC_ARCH_SUPPORTS
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
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on !BR2_arm # xbmc needs egl/gles on arm
+
+comment "xbmc needs an OpenGL or an openGL ES and EGL backend"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_PACKAGE_XBMC_GL && !BR2_PACKAGE_XBMC_EGL_GLES
+
 comment "xbmc requires an OpenGL ES and EGL backend"
-	depends on BR2_PACKAGE_XBMC_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_arm
+	depends on !BR2_PACKAGE_XBMC_EGL_GLES
 
 menuconfig BR2_PACKAGE_XBMC
 	bool "xbmc"
@@ -26,6 +43,8 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_LIBCDIO
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBFRIBIDI
+	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_XBMC_GL
+	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_XBMC_GL
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBID3TAG
 	select BR2_PACKAGE_LIBMAD
@@ -55,17 +74,23 @@ menuconfig BR2_PACKAGE_XBMC
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
 	depends on BR2_PACKAGE_XBMC_ARCH_SUPPORTS
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index c3b0d71..c868b59 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -15,7 +15,7 @@ XBMC_LICENSE_FILES = LICENSE.GPL
 # http://wiki.xbmc.org/index.php?title=TexturePacker
 XBMC_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-lzo host-sdl_image host-swig
 XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
-	libass libcdio libcurl libegl libfribidi libgcrypt libgles libmad libmodplug libmpeg2 \
+	libass libcdio libcurl libfribidi libgcrypt libmad libmodplug libmpeg2 \
 	libogg libplist libpng libsamplerate libungif libvorbis libxml2 libxslt lzo ncurses \
 	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
 
@@ -44,7 +44,6 @@ XBMC_CONF_OPT +=  \
 	--disable-crystalhd \
 	--disable-debug \
 	--disable-dvdcss \
-	--disable-gl \
 	--disable-hal \
 	--disable-joystick \
 	--disable-mysql \
@@ -52,14 +51,10 @@ XBMC_CONF_OPT +=  \
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
@@ -88,6 +83,32 @@ else
 XBMC_CONF_OPT += --disable-libmp3lame
 endif
 
+# quote from xbmc/configure.in: "GLES overwrites GL if both set to yes."
+# we choose the opposite because opengl offers more features, like libva support
+ifeq ($(BR2_PACKAGE_XBMC_GL),y)
+XBMC_DEPENDENCIES += libglew libglu libgl sdl_image xlib_libX11 xlib_libXext \
+	xlib_libXmu xlib_libXrandr xlib_libXt
+XBMC_CONF_OPT += --enable-gl --enable-sdl --enable-x11 --enable-xrandr --disable-gles
+# fix rsxs compile
+# make sure target libpng-config is used, options taken from rsxs-0.9/acinclude.m4
+XBMC_CONF_ENV += \
+	jm_cv_func_gettimeofday_clobber=no \
+	mac_cv_pkg_png=$(STAGING_DIR)/usr/bin/libpng-config \
+	mac_cv_pkg_cppflags="`$(STAGING_DIR)/usr/bin/libpng-config --I_opts --cppflags`" \
+	mac_cv_pkg_cxxflags="`$(STAGING_DIR)/usr/bin/libpng-config --ccopts`" \
+	mac_cv_pkg_ldflags="`$(STAGING_DIR)/usr/bin/libpng-config --L_opts --R_opts`" \
+	mac_cv_pkg_libs="`$(STAGING_DIR)/usr/bin/libpng-config --libs`"
+XBMC_CONF_OPT += --enable-rsxs
+else
+XBMC_CONF_OPT += --disable-gl --disable-rsxs --disable-sdl --disable-x11 --disable-xrandr
+ifeq ($(BR2_PACKAGE_XBMC_EGL_GLES),y)
+XBMC_DEPENDENCIES += libegl libgles
+XBMC_CONF_OPT += --enable-gles
+else
+XBMC_CONF_OPT += --disable-gles
+endif
+endif
+
 ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
 XBMC_DEPENDENCIES += libusb-compat
 XBMC_CONF_OPT += --enable-libusb
