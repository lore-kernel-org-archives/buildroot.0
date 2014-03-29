From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:11:08 +0100
Subject: [Buildroot] [git commit] mesa3d: modularize and bump to version
	10.0.4
Message-ID: <20140329222157.D0D409C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3199fd4ef58ba33e7f8742491a0f081af4944a9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add options to select mesa3d drivers
- uClibc support was fixed in mesa3d v9.2
  https://bugs.freedesktop.org/show_bug.cgi?id=51782
  therefore mesa3d-uclibc-locale.patch was removed
- removed MESA3D_AUTORECONF=yes as it was needed only
  for mesa3d-uclibc-locale.patch

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in                           |  116 +++++++++++++++++-
 package/mesa3d/mesa3d-uclibc-locale.patch          |   56 ---------
 package/mesa3d/mesa3d.mk                           |  125 ++++++++++++++++----
 .../xserver_xorg-server/xserver_xorg-server.mk     |    4 +-
 4 files changed, 214 insertions(+), 87 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 0ce168e..217528b 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -1,14 +1,118 @@
 config BR2_PACKAGE_MESA3D
 	bool "Mesa 3D Graphics Library"
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_XLIB_LIBXXF86VM
-	select BR2_PACKAGE_XLIB_LIBXDAMAGE
-	select BR2_PACKAGE_XLIB_LIBXFIXES
-	select BR2_PACKAGE_XPROTO_DRI2PROTO
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_HOST_LIBXML2_PYTHON
-	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
+	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XSERVER_XORG_SERVER
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE
 	help
 	  Mesa 3D, an open-source implementation of the OpenGL specification.
+
+	  http://mesa3d.org
+
+if BR2_PACKAGE_MESA3D
+
+# inform the .mk file of gallium or dri driver selection
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_DRIVER
+	bool
+
+config BR2_PACKAGE_MESA3D_DRI_DRIVER
+	select BR2_PACKAGE_MESA3D_DRIVER
+	depends on !BR2_PREFER_STATIC_LIB
+	bool
+
+comment "DRI drivers need shared libdrm"
+	depends on BR2_PREFER_STATIC_LIB
+
+config BR2_PACKAGE_MESA3D_DRIVER
+	bool
+
+menu "Drivers"
+
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
+	bool "Gallium nouveau driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_NOUVEAU
+	help
+	  Supports all Nvidia GPUs.
+
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
+	bool "Gallium vmware svga driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_VMWGFX
+	help
+	  This is a virtual GPU driver for VMWare virtual machines.
+
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
+	bool "Gallium swrast driver"
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	help
+	  This is a software opengl implementation using the Gallium3D
+	  infrastructure.
+
+config BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
+	bool "DRI swrast driver"
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER
+	help
+	  This is a software opengl implementation using the DRI
+	  infrastructure.
+
+config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
+	bool "DRI i965 driver"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER
+	select BR2_PACKAGE_LIBDRM_INTEL
+	help
+	  Supports all Intel GPUs.  This version is most supported by Intel.
+
+config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
+	bool "DRI radeon driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER
+	select BR2_PACKAGE_LIBDRM_RADEON
+	help
+	  Legacy Radeon driver for R100 series GPUs.
+
+endmenu
+
+menu "Additional API Support"
+depends on BR2_PACKAGE_MESA3D_DRIVER
+
+config BR2_PACKAGE_MESA3D_OPENGL_EGL
+	bool "EGL"
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_HAS_OPENGL_EGL
+	help
+	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL applications
+	  similar to GLX, for X, and WGL, for Windows.
+
+config BR2_PACKAGE_MESA3D_OPENGL_ES
+	bool "OpenGL ES"
+	select BR2_PACKAGE_HAS_OPENGL_ES
+	help
+	  Use the Khronos OpenGL ES APIs.  This is commonly used on embedded
+	  systems and represents a subset of the OpenGL API.
+
+endmenu
+
+config BR2_PACKAGE_PROVIDES_OPENGL_EGL
+	default "mesa3d"
+
+config BR2_PACKAGE_PROVIDES_OPENGL_ES
+	default "mesa3d"
+
+endif
+
+comment "mesa3d needs a toolchain w/ C++, largefile"
+	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/mesa3d/mesa3d-uclibc-locale.patch b/package/mesa3d/mesa3d-uclibc-locale.patch
deleted file mode 100644
index 99afe8d..0000000
--- a/package/mesa3d/mesa3d-uclibc-locale.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-[PATCH] Fix compilation on uClibc without locale support
-
-Based on similar patch from OE:
-
-http://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch?id=e4039eb74b20e96d4b8837cd58cf2d13d091e1ad
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- configure.ac            |    3 +++
- src/glsl/strtod.c       |    2 +-
- src/mesa/main/imports.c |    2 +-
- 3 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index fbaa376..454dad2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -450,6 +450,9 @@ AC_SUBST([DLOPEN_LIBS])
- dnl See if posix_memalign is available
- AC_CHECK_FUNC([posix_memalign], [DEFINES="$DEFINES -DHAVE_POSIX_MEMALIGN"])
- 
-+dnl See if newlocale is available
-+AC_CHECK_FUNCS_ONCE(newlocale)
-+
- dnl SELinux awareness.
- AC_ARG_ENABLE([selinux],
-     [AS_HELP_STRING([--enable-selinux],
-diff --git a/src/glsl/strtod.c b/src/glsl/strtod.c
-index a876e13..9fce7e9 100644
---- a/src/glsl/strtod.c
-+++ b/src/glsl/strtod.c
-@@ -44,7 +44,7 @@ double
- double
- glsl_strtod(const char *s, char **end)
- {
--#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
-+#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && defined(HAVE_NEWLOCALE)
-    static locale_t loc = NULL;
-    if (!loc) {
-       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
-diff --git a/src/mesa/main/imports.c b/src/mesa/main/imports.c
-index d3727ef..363bf32 100644
---- a/src/mesa/main/imports.c
-+++ b/src/mesa/main/imports.c
-@@ -757,7 +757,7 @@ float
- float
- _mesa_strtof( const char *s, char **end )
- {
--#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
-+#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && defined(HAVE_NEWLOCALE)
-    static locale_t loc = NULL;
-    if (!loc) {
-       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
--- 
-1.7.10.4
-
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index d4080d4..f40b2ee 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,37 +4,116 @@
 #
 ################################################################################
 
-MESA3D_VERSION = 7.10.3
-MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.gz
-MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/older-versions/7.x/$(MESA3D_VERSION)
+MESA3D_VERSION = 10.0.4
+MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
+MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.html
 
-MESA3D_AUTORECONF = YES
 MESA3D_INSTALL_STAGING = YES
 
-MESA3D_CONF_OPT = \
-	--disable-egl \
-	--disable-glu \
-	--disable-glw \
-	--disable-glut \
-	--disable-gallium \
-	--with-driver=dri \
-	--with-dri-drivers=swrast \
-	--disable-static
-
 MESA3D_DEPENDENCIES = \
-	xproto_glproto \
-	xlib_libXxf86vm \
-	xlib_libXdamage \
-	xlib_libXfixes \
-	xproto_dri2proto \
-	libdrm \
 	expat \
-	host-xutil_makedepend \
+	host-bison \
+	host-flex \
+	host-gettext \
 	host-libxml2 \
 	host-python \
-	host-bison \
-	host-flex
+	host-xutil_makedepend \
+	libdrm
+
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
+MESA3D_DEPENDENCIES += \
+	xproto_xf86driproto \
+	xproto_dri2proto \
+	xproto_glproto \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXdamage \
+	xlib_libXfixes \
+	libxcb
+MESA3D_CONF_OPT += \
+	--enable-glx \
+	--enable-xa
+else
+MESA3D_CONF_OPT += \
+	--disable-glx \
+	--disable-xa
+endif
+
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+# fix for "configure: error: Cannot use static libraries for DRI drivers"
+MESA3D_CONF_OPT += --disable-static
+endif
+
+# Drivers
+
+#Gallium Drivers
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
+# DRI Drivers
+MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST) += swrast
+MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
+MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += radeon
+
+# at least one API is required, for buildroot enable OpenGL API by default
+# other APIs (EGL, EGL_ES) are optional
+ifeq ($(MESA3D_GALLIUM_DRIVERS-y)$(MESA3D_DRI_DRIVERS-y),)
+MESA3D_CONF_OPT += \
+	--disable-opengl
+else
+MESA3D_CONF_OPT += \
+	--enable-opengl
+endif
+
+ifeq ($(MESA3D_GALLIUM_DRIVERS-y),)
+MESA3D_CONF_OPT += \
+	--without-gallium-drivers
+else
+MESA3D_CONF_OPT += \
+	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y))
+endif
+
+ifeq ($(MESA3D_DRI_DRIVERS-y),)
+MESA3D_CONF_OPT += \
+	--disable-dri \
+	--disable-shared-glapi \
+	--without-dri-drivers
+else
+MESA3D_CONF_OPT += \
+	--enable-dri \
+	--enable-shared-glapi \
+	--with-dri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
+endif
+
+# APIs
+
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+# egl depends on gbm, gbm depends on udev
+MESA3D_DEPENDENCIES += udev
+MESA3D_EGL_PLATFORMS = drm
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+MESA3D_DEPENDENCIES += wayland
+MESA3D_EGL_PLATFORMS += wayland
+endif
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
+MESA3D_EGL_PLATFORMS += x11
+endif
+MESA3D_CONF_OPT += \
+	--enable-gbm \
+	--enable-egl \
+	--with-egl-platforms=$(subst $(space),$(comma),$(MESA3D_EGL_PLATFORMS))
+else
+MESA3D_CONF_OPT += \
+	--disable-gbm \
+	--disable-egl
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES),y)
+MESA3D_CONF_OPT += --enable-gles1 --enable-gles2
+else
+MESA3D_CONF_OPT += --disable-gles1 --disable-gles2
+endif
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 576579b..034b591 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -99,7 +99,7 @@ else # modular
 XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive --disable-xfbdev
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D),y)
+ifeq ($(BR2_PACKAGE_MESA3D_DRIVER),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
 else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-dri
@@ -172,7 +172,7 @@ ifneq ($(BR2_PACKAGE_XLIB_LIBDMX),y)
 XSERVER_XORG_SERVER_CONF_OPT += --disable-dmx
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D),y)
+ifeq ($(BR2_PACKAGE_MESA3D_DRIVER),y)
 XSERVER_XORG_SERVER_CONF_OPT += --enable-glx
 else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-glx
