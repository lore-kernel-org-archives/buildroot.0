From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Mar 2014 17:52:43 +0100
Subject: [Buildroot] [PATCH 02/19] package/libegl: rename package and the
	_HAS and _PROVIDES variables
In-Reply-To: <cover.1393778339.git.yann.morin.1998@free.fr>
References: <cover.1393778339.git.yann.morin.1998@free.fr>
Message-ID: <bdab4a6acd512c37b514710f121b1cb91cacb4eb.1393778339.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The basic rule for a package is to have its options named
after the package name. There is no reason this should not
also be the case for virtual packages.

Besides, this will allow us to switch libegl to use the
soon-to-be-introduced virtual-package infrastructure.

Rename the package to opnegl-libgles so:
  - it has 'opengl' in its name, so it is easier to find
  - it has 'libgles' (the name of the library file), as the
    other Khronos-related packages do

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in               |  4 ++--
 package/gstreamer1/gst1-plugins-bad/Config.in                  |  2 +-
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk        |  2 +-
 package/opengl/Config.in                                       |  2 +-
 package/opengl/libegl/Config.in                                |  6 ------
 package/opengl/opengl-libegl/Config.in                         |  6 ++++++
 .../{libegl/libegl.mk => opengl-libegl/opengl-libegl.mk}       | 10 +++++-----
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
 19 files changed, 37 insertions(+), 37 deletions(-)
 delete mode 100644 package/opengl/libegl/Config.in
 create mode 100644 package/opengl/opengl-libegl/Config.in
 rename package/opengl/{libegl/libegl.mk => opengl-libegl/opengl-libegl.mk} (57%)

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
index 4518df2..7174297 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -4,7 +4,7 @@ comment "gpu-viv-bin-mx6q needs an (e)glibc toolchain"
 
 config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 	bool "gpu-viv-bin-mx6q"
-	select BR2_PACKAGE_HAS_OPENGL_EGL
+	select BR2_PACKAGE_HAS_OPENGL_LIBEGL
 	select BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
@@ -24,7 +24,7 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 
 if BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 
-config BR2_PACKAGE_PROVIDES_OPENGL_EGL
+config BR2_PACKAGE_PROVIDES_OPENGL_LIBEGL
 	default "gpu-viv-bin-mx6q"
 
 config BR2_PACKAGE_PROVIDES_OPENGL_LIBGLES
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 97af97e..b54f3ff 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -463,7 +463,7 @@ comment "rsvg plugin needs a toolchain w/ C++, wchar, threads"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_EGLGLES
 	bool "eglgles"
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_LIBGLES
+	depends on BR2_PACKAGE_HAS_OPENGL_LIBEGL && BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	help
 	  EGL/GLES sink
 
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index cacf3d6..6b75c8a 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -651,7 +651,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_EGLGLES),y)
 GST1_PLUGINS_BAD_CONF_OPT += --enable-eglgles
-GST1_PLUGINS_BAD_DEPENDENCIES += libegl opengl-libgles
+GST1_PLUGINS_BAD_DEPENDENCIES += opengl-libegl opengl-libgles
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 # RPI has odd locations for several required headers.
diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index 4916a85..483a211 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -1,4 +1,4 @@
-source "package/opengl/libegl/Config.in"
+source "package/opengl/opengl-libegl/Config.in"
 source "package/opengl/opengl-libgles/Config.in"
 source "package/opengl/libopenvg/Config.in"
 source "package/opengl/libopenmax/Config.in"
diff --git a/package/opengl/libegl/Config.in b/package/opengl/libegl/Config.in
deleted file mode 100644
index 2d81a20..0000000
--- a/package/opengl/libegl/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_HAS_OPENGL_EGL
-	bool
-
-config BR2_PACKAGE_PROVIDES_OPENGL_EGL
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL
-	string
diff --git a/package/opengl/opengl-libegl/Config.in b/package/opengl/opengl-libegl/Config.in
new file mode 100644
index 0000000..dc1ebf4
--- /dev/null
+++ b/package/opengl/opengl-libegl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_OPENGL_LIBEGL
+	bool
+
+config BR2_PACKAGE_PROVIDES_OPENGL_LIBEGL
+	depends on BR2_PACKAGE_HAS_OPENGL_LIBEGL
+	string
diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/opengl-libegl/opengl-libegl.mk
similarity index 57%
rename from package/opengl/libegl/libegl.mk
rename to package/opengl/opengl-libegl/opengl-libegl.mk
index 3311e50..a16c414 100644
--- a/package/opengl/libegl/libegl.mk
+++ b/package/opengl/opengl-libegl/opengl-libegl.mk
@@ -1,14 +1,14 @@
 ################################################################################
 #
-# libegl
+# opengl-libegl
 #
 ################################################################################
 
-LIBEGL_SOURCE =
-LIBEGL_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENGL_EGL))
+OPENGL_LIBEGL_SOURCE =
+OPENGL_LIBEGL_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENGL_LIBEGL))
 
-ifeq ($(BR2_PACKAGE_HAS_OPENGL_EGL),y)
-ifeq ($(LIBEGL_DEPENDENCIES),)
+ifeq ($(BR2_PACKAGE_HAS_OPENGL_LIBEGL),y)
+ifeq ($(OPENGL_LIBEGL_DEPENDENCIES),)
 $(error No libEGL implementation selected. Configuration error.)
 endif
 endif
diff --git a/package/qt/Config.in b/package/qt/Config.in
index f922c5a..3d3a35f 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -295,7 +295,7 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
 config BR2_PACKAGE_QT_OPENGL_ES
 	bool "OpenGL ES v2.x support"
 	depends on BR2_PACKAGE_HAS_OPENGL_LIBGLES
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_OPENGL_LIBEGL
 	help
 	  Enable the OpenGL ES v2.x support.
 
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 6fbae4f..4c2ce5e 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -326,7 +326,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT_OPENGL_ES),y)
 QT_CONFIGURE_OPTS += -opengl es2 -egl
-QT_DEPENDENCIES   += opengl-libgles libegl
+QT_DEPENDENCIES   += opengl-libgles opengl-libegl
 QT_CFLAGS   += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
 QT_CXXFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
 QT_LDFLAGS  += $(shell $(PKG_CONFIG_HOST_BINARY) --libs egl)
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 318876e..4d869e8 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -137,11 +137,11 @@ comment "X.org XCB backend available if X.org is enabled"
 
 config BR2_PACKAGE_QT5BASE_EGLFS
 	bool "eglfs support"
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_OPENGL_LIBEGL
 	depends on BR2_PACKAGE_HAS_OPENGL_LIBGLES
 
 comment "eglfs backend available if OpenGLES and EGL are enabled"
-	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES
+	depends on !BR2_PACKAGE_HAS_OPENGL_LIBEGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES
 
 config BR2_PACKAGE_QT5BASE_PRINTSUPPORT
 	bool "print support module"
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e719523..c010d83 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -98,7 +98,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
 QT5BASE_CONFIGURE_OPTS += -opengl es2 -eglfs
-QT5BASE_DEPENDENCIES   += opengl-libgles libegl
+QT5BASE_DEPENDENCIES   += opengl-libgles opengl-libegl
 ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
 QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
 	$(@D)/mkspecs/devices/linux-imx6-g++/qeglfshooks_imx6.cpp
diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index 35e5713..a198961 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_EGLFS
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_OPENGL_LIBEGL
 	depends on BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
@@ -16,5 +16,5 @@ config BR2_PACKAGE_QT5DECLARATIVE
 	  http://qt-project.org
 
 comment "qt5declarative requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES) && \
+	depends on (!BR2_PACKAGE_HAS_OPENGL_LIBEGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES) && \
 		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5graphicaleffects/Config.in b/package/qt5/qt5graphicaleffects/Config.in
index 1edc3ee..04ee795 100644
--- a/package/qt5/qt5graphicaleffects/Config.in
+++ b/package/qt5/qt5graphicaleffects/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5DECLARATIVE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_OPENGL_LIBEGL
 	depends on BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	help
 	  Qt is a cross-platform application and UI framework for
@@ -14,5 +14,5 @@ config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	  http://qt-project.org
 
 comment "qt5graphicaleffects requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES) && \
+	depends on (!BR2_PACKAGE_HAS_OPENGL_LIBEGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES) && \
 		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5multimedia/Config.in b/package/qt5/qt5multimedia/Config.in
index e67becf..c7afa27 100644
--- a/package/qt5/qt5multimedia/Config.in
+++ b/package/qt5/qt5multimedia/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 	bool "qt5multimedia"
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5DECLARATIVE
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_OPENGL_LIBEGL
 	depends on BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
@@ -14,5 +14,5 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 	  http://qt-project.org
 
 comment "qt5multimedia requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES) && \
+	depends on (!BR2_PACKAGE_HAS_OPENGL_LIBEGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES) && \
 		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index 56496ae..cb17b77 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_QT5QUICK1
 	select BR2_PACKAGE_QT5DECLARATIVE
 	# This module does not support static linking
 	depends on !BR2_PREFER_STATIC_LIB
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_OPENGL_LIBEGL
 	depends on BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
@@ -21,5 +21,5 @@ config BR2_PACKAGE_QT5QUICK1
 
 comment "qt5quick1 needs a toolchain w/ dynamic library and an OpenGL-capable backend"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES || \
+	depends on !BR2_PACKAGE_HAS_OPENGL_LIBEGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES || \
 		BR2_PREFER_STATIC_LIB
diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
index 9bbf6f6..2eab344 100644
--- a/package/qt5/qt5quickcontrols/Config.in
+++ b/package/qt5/qt5quickcontrols/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
 	select BR2_PACKAGE_QT5BASE_NETWORK
 	select BR2_PACKAGE_QT5DECLARATIVE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_OPENGL_LIBEGL
 	depends on BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	help
 	  Qt is a cross-platform application and UI framework for
@@ -15,5 +15,5 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
 	  http://qt-project.org
 
 comment "qt5quickcontrols requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES) && \
+	depends on (!BR2_PACKAGE_HAS_OPENGL_LIBEGL || !BR2_PACKAGE_HAS_OPENGL_LIBGLES) && \
 		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index fe8dda5..aaba7dd 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_RPI_USERLAND
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_HAS_OPENGL_EGL
+	select BR2_PACKAGE_HAS_OPENGL_LIBEGL
 	select BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	select BR2_PACKAGE_HAS_OPENVG
 	select BR2_PACKAGE_HAS_OPENMAX
@@ -19,7 +19,7 @@ config BR2_PACKAGE_RPI_USERLAND
 
 if BR2_PACKAGE_RPI_USERLAND
 
-config BR2_PACKAGE_PROVIDES_OPENGL_EGL
+config BR2_PACKAGE_PROVIDES_OPENGL_LIBEGL
 	default "rpi-userland"
 
 config BR2_PACKAGE_PROVIDES_OPENGL_LIBGLES
diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
index e1266de..4fdd302 100644
--- a/package/sunxi-mali/Config.in
+++ b/package/sunxi-mali/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SUNXI_MALI
 	bool "sunxi-mali"
-	select BR2_PACKAGE_HAS_OPENGL_EGL
+	select BR2_PACKAGE_HAS_OPENGL_LIBEGL
 	select BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	# The egl/gles mali libraries are provided as a git submodule of the
 	# sunxi-mali repo and are downloaded by the sunxi-mali-prop package.
@@ -18,7 +18,7 @@ config BR2_PACKAGE_SUNXI_MALI
 
 if BR2_PACKAGE_SUNXI_MALI
 
-config BR2_PACKAGE_PROVIDES_OPENGL_EGL
+config BR2_PACKAGE_PROVIDES_OPENGL_LIBEGL
 	default "sunxi-mali"
 
 config BR2_PACKAGE_PROVIDES_OPENGL_LIBGLES
diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index 0d1509c..70d1abd 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_TI_GFX
 	bool "ti-gfx"
-	select BR2_PACKAGE_HAS_OPENGL_EGL
+	select BR2_PACKAGE_HAS_OPENGL_LIBEGL
 	select BR2_PACKAGE_HAS_OPENGL_LIBGLES
 	select BR2_PACKAGE_HAS_POWERVR
 	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
@@ -11,7 +11,7 @@ config BR2_PACKAGE_TI_GFX
 
 if BR2_PACKAGE_TI_GFX
 
-config BR2_PACKAGE_PROVIDES_OPENGL_EGL
+config BR2_PACKAGE_PROVIDES_OPENGL_LIBEGL
 	default "ti-gfx"
 
 config BR2_PACKAGE_PROVIDES_OPENGL_LIBGLES
-- 
1.8.3.2
