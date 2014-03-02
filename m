From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Mar 2014 17:52:42 +0100
Subject: [Buildroot] [PATCH 01/19] package/libgles: rename package and the
	_HAS and _PROVIDES variables
In-Reply-To: <cover.1393778339.git.yann.morin.1998@free.fr>
References: <cover.1393778339.git.yann.morin.1998@free.fr>
Message-ID: <73269cc1254dc8287c0e5751ca237507532ea3b9.1393778339.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The basic rule for a package is to have its options named
after the package name. There is no reason this should not
also be the case for virtual packages.

Besides, this will allow us to switch libgles to use the
soon-to-be-introduced virtual-package infrastructure.

Rename the package to opnegl-libgles so:
  - it has 'opengl' in its name, so it is easier to find
  - it has 'libgles' (the name of the library file), as the
    other Khronos-related packages have

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 package/cairo/cairo.mk                                         |  4 ++--
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in               |  4 ++--
 package/gstreamer1/gst1-plugins-bad/Config.in                  |  2 +-
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk        |  2 +-
 package/opengl/Config.in                                       |  2 +-
 package/opengl/libgles/Config.in                               |  6 ------
 package/opengl/opengl-libgles/Config.in                        |  6 ++++++
 .../{libgles/libgles.mk => opengl-libgles/opengl-libgles.mk}   | 10 +++++-----
 package/qt/Config.in                                           |  2 +-
 package/qt/qt.mk                                               |  2 +-
 package/qt5/qt5base/Config.in                                  |  4 ++--
 package/qt5/qt5base/qt5base.mk                                 |  2 +-
 package/qt5/qt5declarative/Config.in                           |  4 ++--
 package/qt5/qt5graphicaleffects/Config.in                      |  4 ++--
 package/qt5/qt5multimedia/Config.in                            |  4 ++--
 package/qt5/qt5quick1/Config.in                                |  4 ++--
 package/qt5/qt5quickcontrols/Config.in                         |  4 ++--
 package/rpi-userland/Config.in                                 |  4 ++--
 package/sunxi-mali/Config.in                                   |  4 ++--
 package/ti-gfx/Config.in                                       |  4 ++--
 20 files changed, 39 insertions(+), 39 deletions(-)
 delete mode 100644 package/opengl/libgles/Config.in
 create mode 100644 package/opengl/opengl-libgles/Config.in
 rename package/opengl/{libgles/libgles.mk => opengl-libgles/opengl-libgles.mk} (56%)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index aa03a27..ddd57db 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -54,9 +54,9 @@ else
 	CAIRO_CONF_OPT += --disable-directfb
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_OPENGL_ES),y)
+ifeq ($(BR2_PACKAGE_HAS_OPENGL_LIBGLES),y)
 	CAIRO_CONF_OPT += --enable-glesv2
-	CAIRO_DEPENDENCIES += libgles
+	CAIRO_DEPENDENCIES += opengl-libgles
 else
 	CAIRO_CONF_OPT += --disable-glesv2
 endif
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
index e084568..4518df2 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -5,7 +5,7 @@ comment "gpu-viv-bin-mx6q needs an (e)glibc toolchain"
 config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 	bool "gpu-viv-bin-mx6q"
 	select BR2_PACKAGE_HAS_OPENGL_EGL
-	select BR2_PACKAGE_HAS_OPENGL_ES
+	select BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	depends on BR2_arm # Only relevant for i.MX6
@@ -27,7 +27,7 @@ if BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 	default "gpu-viv-bin-mx6q"
 
-config BR2_PACKAGE_PROVIDES_OPENGL_ES
+config BR2_PACKAGE_PROVIDES_OPENGL_LIBGLES
 	default "gpu-viv-bin-mx6q"
 
 config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_EXAMPLES
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 0685322..97af97e 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -463,7 +463,7 @@ comment "rsvg plugin needs a toolchain w/ C++, wchar, threads"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_EGLGLES
 	bool "eglgles"
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	help
 	  EGL/GLES sink
 
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index dbd0625..cacf3d6 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -651,7 +651,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_EGLGLES),y)
 GST1_PLUGINS_BAD_CONF_OPT += --enable-eglgles
-GST1_PLUGINS_BAD_DEPENDENCIES += libegl libgles
+GST1_PLUGINS_BAD_DEPENDENCIES += libegl opengl-libgles
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 # RPI has odd locations for several required headers.
diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index ed81835..4916a85 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -1,4 +1,4 @@
 source "package/opengl/libegl/Config.in"
-source "package/opengl/libgles/Config.in"
+source "package/opengl/opengl-libgles/Config.in"
 source "package/opengl/libopenvg/Config.in"
 source "package/opengl/libopenmax/Config.in"
diff --git a/package/opengl/libgles/Config.in b/package/opengl/libgles/Config.in
deleted file mode 100644
index 75ccfc8..0000000
--- a/package/opengl/libgles/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_HAS_OPENGL_ES
-	bool
-
-config BR2_PACKAGE_PROVIDES_OPENGL_ES
-	depends on BR2_PACKAGE_HAS_OPENGL_ES
-	string
diff --git a/package/opengl/opengl-libgles/Config.in b/package/opengl/opengl-libgles/Config.in
new file mode 100644
index 0000000..1ee88db
--- /dev/null
+++ b/package/opengl/opengl-libgles/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_OPENGL_LIBGLES
+	bool
+
+config BR2_PACKAGE_PROVIDES_OPENGL_LIBGLES
+	depends on BR2_PACKAGE_HAS_OPENGL_LIBGLES
+	string
diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/opengl-libgles/opengl-libgles.mk
similarity index 56%
rename from package/opengl/libgles/libgles.mk
rename to package/opengl/opengl-libgles/opengl-libgles.mk
index 7a07e37..357bfd5 100644
--- a/package/opengl/libgles/libgles.mk
+++ b/package/opengl/opengl-libgles/opengl-libgles.mk
@@ -1,14 +1,14 @@
 ################################################################################
 #
-# libgles
+# opengl-libgles
 #
 ################################################################################
 
-LIBGLES_SOURCE =
-LIBGLES_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENGL_ES))
+OPENGL_LIBGLES_SOURCE =
+OPENGL_LIBGLES_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENGL_LIBGLES))
 
-ifeq ($(BR2_PACKAGE_HAS_OPENGL_ES),y)
-ifeq ($(LIBGLES_DEPENDENCIES),)
+ifeq ($(BR2_PACKAGE_HAS_OPENGL_LIBGLES),y)
+ifeq ($(OPENGL_LIBGLES_DEPENDENCIES),)
 $(error No libGLES implementation selected. Configuration error.)
 endif
 endif
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 5105e5d..f922c5a 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -294,7 +294,7 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
 
 config BR2_PACKAGE_QT_OPENGL_ES
 	bool "OpenGL ES v2.x support"
-	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
 	help
 	  Enable the OpenGL ES v2.x support.
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index bc329f0..6fbae4f 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -326,7 +326,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT_OPENGL_ES),y)
 QT_CONFIGURE_OPTS += -opengl es2 -egl
-QT_DEPENDENCIES   += libgles libegl
+QT_DEPENDENCIES   += opengl-libgles libegl
 QT_CFLAGS   += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
 QT_CXXFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
 QT_LDFLAGS  += $(shell $(PKG_CONFIG_HOST_BINARY) --libs egl)
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 5c404d1..318876e 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -138,10 +138,10 @@ comment "X.org XCB backend available if X.org is enabled"
 config BR2_PACKAGE_QT5BASE_EGLFS
 	bool "eglfs support"
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
-	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_OPENGL_LIBGLES
 
 comment "eglfs backend available if OpenGLES and EGL are enabled"
-	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES
+	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES
 
 config BR2_PACKAGE_QT5BASE_PRINTSUPPORT
 	bool "print support module"
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 618251e..e719523 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -98,7 +98,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
 QT5BASE_CONFIGURE_OPTS += -opengl es2 -eglfs
-QT5BASE_DEPENDENCIES   += libgles libegl
+QT5BASE_DEPENDENCIES   += opengl-libgles libegl
 ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
 QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
 	$(@D)/mkspecs/devices/linux-imx6-g++/qeglfshooks_imx6.cpp
diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index c5753b1..35e5713 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_EGLFS
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
-	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
@@ -16,5 +16,5 @@ config BR2_PACKAGE_QT5DECLARATIVE
 	  http://qt-project.org
 
 comment "qt5declarative requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
+	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES) && \
 		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5graphicaleffects/Config.in b/package/qt5/qt5graphicaleffects/Config.in
index f4029e9..1edc3ee 100644
--- a/package/qt5/qt5graphicaleffects/Config.in
+++ b/package/qt5/qt5graphicaleffects/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	select BR2_PACKAGE_QT5DECLARATIVE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
-	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -14,5 +14,5 @@ config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	  http://qt-project.org
 
 comment "qt5graphicaleffects requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
+	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES) && \
 		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5multimedia/Config.in b/package/qt5/qt5multimedia/Config.in
index 53b7f86..e67becf 100644
--- a/package/qt5/qt5multimedia/Config.in
+++ b/package/qt5/qt5multimedia/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5DECLARATIVE
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
-	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
@@ -14,5 +14,5 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 	  http://qt-project.org
 
 comment "qt5multimedia requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
+	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES) && \
 		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index 1a0b8bf..56496ae 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_QT5QUICK1
 	# This module does not support static linking
 	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
-	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
@@ -21,5 +21,5 @@ config BR2_PACKAGE_QT5QUICK1
 
 comment "qt5quick1 needs a toolchain w/ dynamic library and an OpenGL-capable backend"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES || \
+	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES || \
 		BR2_PREFER_STATIC_LIB
diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
index e72f2a4..9bbf6f6 100644
--- a/package/qt5/qt5quickcontrols/Config.in
+++ b/package/qt5/qt5quickcontrols/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
 	select BR2_PACKAGE_QT5DECLARATIVE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
-	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -15,5 +15,5 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
 	  http://qt-project.org
 
 comment "qt5quickcontrols requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
+	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES) && \
 		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 2303942..fe8dda5 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_RPI_USERLAND
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_HAS_OPENGL_EGL
-	select BR2_PACKAGE_HAS_OPENGL_ES
+	select BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	select BR2_PACKAGE_HAS_OPENVG
 	select BR2_PACKAGE_HAS_OPENMAX
 	help
@@ -22,7 +22,7 @@ if BR2_PACKAGE_RPI_USERLAND
 config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 	default "rpi-userland"
 
-config BR2_PACKAGE_PROVIDES_OPENGL_ES
+config BR2_PACKAGE_PROVIDES_OPENGL_LIBGLES
 	default "rpi-userland"
 
 config BR2_PACKAGE_PROVIDES_OPENVG
diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
index 9f188a3..e1266de 100644
--- a/package/sunxi-mali/Config.in
+++ b/package/sunxi-mali/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SUNXI_MALI
 	bool "sunxi-mali"
 	select BR2_PACKAGE_HAS_OPENGL_EGL
-	select BR2_PACKAGE_HAS_OPENGL_ES
+	select BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	# The egl/gles mali libraries are provided as a git submodule of the
 	# sunxi-mali repo and are downloaded by the sunxi-mali-prop package.
 	select BR2_PACKAGE_SUNXI_MALI_PROP
@@ -21,7 +21,7 @@ if BR2_PACKAGE_SUNXI_MALI
 config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 	default "sunxi-mali"
 
-config BR2_PACKAGE_PROVIDES_OPENGL_ES
+config BR2_PACKAGE_PROVIDES_OPENGL_LIBGLES
 	default "sunxi-mali"
 
 config BR2_PACKAGE_SUNXI_MALI_DBG
diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index f455f4c..0d1509c 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_TI_GFX
 	bool "ti-gfx"
 	select BR2_PACKAGE_HAS_OPENGL_EGL
-	select BR2_PACKAGE_HAS_OPENGL_ES
+	select BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	select BR2_PACKAGE_HAS_POWERVR
 	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
 	help
@@ -14,7 +14,7 @@ if BR2_PACKAGE_TI_GFX
 config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 	default "ti-gfx"
 
-config BR2_PACKAGE_PROVIDES_OPENGL_ES
+config BR2_PACKAGE_PROVIDES_OPENGL_LIBGLES
 	default "ti-gfx"
 
 config BR2_PACKAGE_PROVIDES_POWERVR
-- 
1.8.3.2
