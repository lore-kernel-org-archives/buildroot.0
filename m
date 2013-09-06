From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  5 Sep 2013 23:25:18 -0500
Subject: [Buildroot] [PATCH v2 4/7] mesa3d: modularize and bump to version
	9.1.6
In-Reply-To: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1378441521-10050-5-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/mesa3d/Config.in                           | 177 ++++++++++++++++++++-
 package/mesa3d/mesa3d-cross-glsl-compiler.patch    |  41 +++++
 package/mesa3d/mesa3d-gbm-without-dri.patch        |  30 ++++
 package/mesa3d/mesa3d-uclibc-locale.patch          |  56 -------
 package/mesa3d/mesa3d.mk                           | 115 +++++++++++--
 package/opengl/Config.in                           |   3 +
 package/opengl/libegl/libegl.mk                    |   4 +
 package/opengl/libgl/libgl.mk                      |  20 +++
 package/opengl/libgles/libgles.mk                  |   4 +
 package/opengl/libopenvg/libopenvg.mk              |   4 +
 .../xserver_xorg-server/xserver_xorg-server.mk     |   4 +-
 11 files changed, 378 insertions(+), 80 deletions(-)
 create mode 100644 package/mesa3d/mesa3d-cross-glsl-compiler.patch
 create mode 100644 package/mesa3d/mesa3d-gbm-without-dri.patch
 delete mode 100644 package/mesa3d/mesa3d-uclibc-locale.patch
 create mode 100644 package/opengl/libgl/libgl.mk

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 080f56a..4b48021 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -1,15 +1,180 @@
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
+	select BR2_PACKAGE_XPROTO_DRI2_PROTO if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XSERVER_XORG_SERVER
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_XORG7
 	help
 	  Mesa 3D, an open-source implementation of the OpenGL specification.
 
+	  http://mesa3d.org
+
+if BR2_PACKAGE_MESA3D
+
+menu "libraries"
+
+config BR2_PACKAGE_MESA3D_GBM
+	depends on BR2_PACKAGE_UDEV
+	bool "gbm support"
+	help
+	  Add support for Graphics Buffer Manager.
+
+config BR2_PACKAGE_MESA3D_XVMC
+	bool "xvmc support"
+	help
+	  Add support for X Video Motion Compensation.
+
+config BR2_PACKAGE_MESA3D_VDPAU
+	bool "vdpau support"
+	help
+	  Add support for Video Decode and Presentation API for Unix.
+
+endmenu
+
+menu "Drivers"
+
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
+	bool "Gallium i915 driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_INTEL
+	help
+	  Supports intel chips with Gallium. In most cases, the DRI i965 driver
+	  should be used as it is better maintained by Intel.
+
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
+	bool "Gallium nouveau driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_NOUVEAU
+	help
+	  Supports all Nvidia GPUs.
+
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300
+	bool "Gallium r300 driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_RADEON
+	help
+	  Supports the R300, R400, and R500 series of ATI/AMD GPUs.
+
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
+	bool "Gallium r600 driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_RADEON
+	help
+	  Supports the R600, R700, and R800 series of ATI/AMD GPUs.
+
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
+	bool "Gallium radeonsi driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_RADEON
+	help
+	  Supports the Radeon HD7000/HD8000/HD9000 series of ATI/AMD GPUs.
+
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
+	bool "Gallium vmware svga driver"
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
+config BR2_PACKAGE_MESA3D_DRI_DRIVERS_SWRAST
+	bool "DRI swrast driver"
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER
+	help
+	  This is a software opengl implementation using the DRI infrastructure.
+
+config BR2_PACKAGE_MESA3D_DRI_DRIVERS_I965
+	bool "DRI i965 driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER
+	select BR2_PACKAGE_LIBDRM_INTEL
+	help
+	  Supports all Intel GPUs.  This version is most supported by Intel.
+
+config BR2_PACKAGE_MESA3D_DRI_DRIVERS_RADEON
+	bool "DRI radeon driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER
+	select BR2_PACKAGE_LIBDRM_RADEON
+	help
+	  Legacy Radeon driver for R100 series GPUs.
+
+endmenu
+
+# The following hidden options inform gallium or dri driver selection.
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_DRIVER
+	bool
+
+config BR2_PACKAGE_MESA3D_DRI_DRIVER
+	select BR2_PACKAGE_MESA3D_DRIVER
+	bool
+
+config BR2_PACKAGE_MESA3D_DRIVER
+	bool
+
+menu "API Support"
+depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER || BR2_PACKAGE_MESA3D_DRI_DRIVER
+
+config BR2_PACKAGE_MESA3D_OPENGL
+	bool "OpenGL"
+	select BR2_PACKAGE_HAS_OPENGL
+	help
+	  Use the Khronos OpenGL API.  This is a desktop computer API and is not
+	  normally implemented by embedded systems.
+
+config BR2_PACKAGE_MESA3D_EGL
+	bool "EGL"
+	select BR2_PACKAGE_MESA3D_GBM
+	select BR2_PACKAGE_HAS_OPENGL_EGL
+	help
+	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL applications
+	  similar to GLX, for X, and WGL, for Windows.
+
+ config BR2_PACKAGE_MESA3D_OPENGL_ES
+	bool "OpenGL ES"
+	select BR2_PACKAGE_HAS_OPENGL_ES
+	help
+	  Use the Khronos OpenGL ES APIs.  This is commonly used on embedded
+	  systems and represents a subset of the OpenGL API.
+
+config BR2_PACKAGE_MESA3D_OPENVG
+	bool "OpenVG"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_HAS_OPENVG
+	select BR2_PACKAGE_MESA3D_OPENGL_EGL
+	help
+	  Use the Khronos OpenVG APIs. This is a 2D API commonly used on
+	  embedded systems.
+
+config BR2_PACKAGE_MESA3D_OPENCL
+	bool "OpenCL"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_HAS_OPENCL
+	help
+	  Use the Khronos OpenCL APIs. This is a GPU computation language
+	  commonly used in GPGPU computing applications.
+
+endmenu
+
+endif
diff --git a/package/mesa3d/mesa3d-cross-glsl-compiler.patch b/package/mesa3d/mesa3d-cross-glsl-compiler.patch
new file mode 100644
index 0000000..1028ea1
--- /dev/null
+++ b/package/mesa3d/mesa3d-cross-glsl-compiler.patch
@@ -0,0 +1,41 @@
+This patch fixes a cross compile issue as described here
+https://bugs.freedesktop.org/show_bug.cgi?id=44618
+
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+---
+diff --git a/src/glsl/builtin_compiler/Makefile.am b/src/glsl/builtin_compiler/Makefile.am
+index e11a17f..8ebe0a2 100644
+--- a/src/glsl/builtin_compiler/Makefile.am
++++ b/src/glsl/builtin_compiler/Makefile.am
+@@ -64,6 +64,8 @@ AM_CXXFLAGS = $(AM_CFLAGS)
+ include ../Makefile.sources
+ 
+ noinst_PROGRAMS = builtin_compiler
++
++if !CROSS_COMPILING
+ noinst_LTLIBRARIES = libglslcore.la libglcpp.la
+ 
+ libglcpp_la_SOURCES =					\
+@@ -73,6 +75,7 @@ libglcpp_la_SOURCES =					\
+ libglslcore_la_SOURCES =				\
+ 	$(BUILTIN_COMPILER_GENERATED_CXX_FILES)		\
+ 	$(LIBGLSL_FILES)
++endif
+ 
+ builtin_compiler_SOURCES = \
+ 	$(top_srcdir)/src/mesa/main/hash_table.c	\
+@@ -81,4 +84,14 @@ builtin_compiler_SOURCES = \
+ 	$(top_srcdir)/src/mesa/program/symbol_table.c	\
+ 	$(BUILTIN_COMPILER_CXX_FILES)			\
+ 	$(GLSL_COMPILER_CXX_FILES)
++
++if CROSS_COMPILING
++builtin_compiler_SOURCES += \
++	$(LIBGLCPP_GENERATED_FILES) \
++	$(LIBGLCPP_FILES) \
++	$(BUILTIN_COMPILER_GENERATED_CXX_FILES) \
++	$(LIBGLSL_FILES)
++builtin_compiler_CPPFLAGS = $(AM_CPPFLAGS)
++else
+ builtin_compiler_LDADD = libglslcore.la libglcpp.la
++endif
diff --git a/package/mesa3d/mesa3d-gbm-without-dri.patch b/package/mesa3d/mesa3d-gbm-without-dri.patch
new file mode 100644
index 0000000..2c417f4
--- /dev/null
+++ b/package/mesa3d/mesa3d-gbm-without-dri.patch
@@ -0,0 +1,30 @@
+Fix build issue when gbm backend is built without dri support.
+
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+
+---
+Index: mesa3d-9.1.6/src/gbm/main/backend.c
+===================================================================
+--- mesa3d-9.1.6.orig/src/gbm/main/backend.c	2012-11-24 11:57:41.000000000 -0600
++++ mesa3d-9.1.6/src/gbm/main/backend.c	2013-08-16 10:59:58.844753588 -0500
+@@ -36,7 +36,9 @@
+ 
+ #define ARRAY_SIZE(a) (sizeof(a)/sizeof((a)[0]))
+ 
++#ifdef HAVE_DRI
+ extern const struct gbm_backend gbm_dri_backend;
++#endif
+ 
+ struct backend_desc {
+    const char *name;
+@@ -44,7 +46,9 @@
+ };
+ 
+ static const struct backend_desc backends[] = {
+-   { "gbm_dri.so", &gbm_dri_backend },
++#ifdef HAVE_DRI
++	{ "gbm_dri.so", &gbm_dri_backend },
++#endif
+    { "gbm_gallium_drm.so", NULL },
+ };
+ 
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
index d4080d4..77fbfa7 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESA3D_VERSION = 7.10.3
+MESA3D_VERSION = 9.1.6
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.gz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/older-versions/7.x/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -13,22 +13,7 @@ MESA3D_LICENSE_FILES = docs/license.html
 MESA3D_AUTORECONF = YES
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
 	libdrm \
 	expat \
 	host-xutil_makedepend \
@@ -37,4 +22,102 @@ MESA3D_DEPENDENCIES = \
 	host-bison \
 	host-flex
 
+MESA3D_CONF_OPT = \
+	--disable-static
+
+# Libraries
+
+ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
+MESA3D_DEPENDENCIES += udev
+MESA3D_CONF_OPT += --enable-gbm
+else
+MESA3D_CONF_OPT += --disable-gbm
+endif
+
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
+MESA3D_DEPENDENCIES += \
+	xproto_xf86driproto xproto_dri2proto xproto_glproto \
+	xlib_libX11 xlib_libXext xlib_libXdamage xlib_libXfixes libxcb
+MESA3D_CONF_OPT += \
+	--enable-dri \
+	--enable-xa \
+	--enable-glx
+else
+MESA3D_CONF_OPT += \
+	--disable-dri \
+	--disable-xa \
+	--disable-glx
+endif
+
+# Drivers
+
+#Gallium Drivers
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915)     += i915
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300)     += r300
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
+# DRI Drivers
+MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST) += swrast
+MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
+MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += radeon
+
+ifneq ($(MESA3D_GALLIUM_DRIVERS),)
+MESA3D_CONF_OPT += \
+	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y))
+else
+MESA3D_CONF_OPT += --without-gallium-drivers
+endif
+
+ifneq ($(MESA3D_DRI_DRIVERS),)
+MESA3D_CONF_OPT += \
+	--with-dri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
+else
+MESA3D_CONF_OPT += --without-dri-drivers
+endif
+
+# APIs
+
+ifeq ($(BR2_PACKAGE_MESA3D_EGL),y)
+MESA3D_EGL_PLATFORMS = drm
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+MESA3D_DEPENDENCIES += wayland
+MESA3D_EGL_PLATFORMS += wayland
+endif
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
+MESA3D_EGL_PLATFORMS += x11
+endif
+MESA3D_CONF_OPT += \
+	--enable-egl \
+	--with-egl-platforms=$(foreach subst $(space),$(comma),$(MESA3D_EGL_PLATFORMS))
+else
+MESA3D_CONF_OPT += --disable-egl
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL),y)
+MESA3D_CONF_OPT += --enable-opengl
+else
+MESA3D_CONF_OPT += --disable-opengl
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES),y)
+MESA3D_CONF_OPT += --enable-gles1 --enable-gles2
+else
+MESA3D_CONF_OPT += --disable-gles1 --disable-gles2
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_OPENVG),y)
+MESA3D_CONF_OPT += --enable-openvg --enable-gallium-egl
+else
+MESA3D_CONF_OPT += --disable-openvg --disable-gallium-egl
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
+MESA3D_CONF_OPT += --enable-opencl
+else
+MESA3D_CONF_OPT += --disable-opencl
+endif
+
 $(eval $(autotools-package))
diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index 1636807..c705446 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_HAS_OPENGL
+	bool
+
 config BR2_PACKAGE_HAS_OPENGL_EGL
 	bool
 
diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
index c194b02..2d52fe3 100644
--- a/package/opengl/libegl/libegl.mk
+++ b/package/opengl/libegl/libegl.mk
@@ -22,6 +22,10 @@ ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
 LIBEGL_DEPENDENCIES += gpu-viv-bin-mx6q
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_EGL),y)
+LIBEGL_DEPENDENCIES += mesa3d
+endif
+
 ifeq ($(LIBEGL_DEPENDENCIES),)
 define LIBEGL_CONFIGURE_CMDS
 	echo "No libEGL implementation selected. Configuration error."
diff --git a/package/opengl/libgl/libgl.mk b/package/opengl/libgl/libgl.mk
new file mode 100644
index 0000000..4b0d7f2
--- /dev/null
+++ b/package/opengl/libgl/libgl.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# libgl
+#
+################################################################################
+
+LIBGL_SOURCE =
+
+ifeq ($(BR2_PACKAGE_MESA_OPENGL),y)
+LIBGL_DEPENDENCIES += mesa3d
+endif
+
+ifeq ($(LIBGL_DEPENDENCIES),)
+define LIBOPENGL_CONFIGURE_CMDS
+	echo "No libOpenGL implementation selected. Configuration error."
+	exit 1
+endef
+endif
+
+$(eval $(generic-package))
diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/libgles/libgles.mk
index ec157ac..8e5cef1 100644
--- a/package/opengl/libgles/libgles.mk
+++ b/package/opengl/libgles/libgles.mk
@@ -22,6 +22,10 @@ ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
 LIBGLES_DEPENDENCIES += gpu-viv-bin-mx6q
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES),y)
+LIBGLES_DEPENDENCIES += mesa3d
+endif
+
 ifeq ($(LIBGLES_DEPENDENCIES),)
 define LIBGLES_CONFIGURE_CMDS
 	echo "No libGLES implementation selected. Configuration error."
diff --git a/package/opengl/libopenvg/libopenvg.mk b/package/opengl/libopenvg/libopenvg.mk
index 3296f63..e897423 100644
--- a/package/opengl/libopenvg/libopenvg.mk
+++ b/package/opengl/libopenvg/libopenvg.mk
@@ -10,6 +10,10 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 LIBOPENVG_DEPENDENCIES += rpi-userland
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_OPENVG),y)
+LIBOPENVG_DEPENDENCIES += mesa3d
+endif
+
 ifeq ($(LIBOPENVG_DEPENDENCIES),)
 define LIBOPENVG_CONFIGURE_CMDS
 	echo "No libOpenVG implementation selected. Configuration error."
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 4089aab..f5a4db6 100644
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
-- 
1.8.1.2
