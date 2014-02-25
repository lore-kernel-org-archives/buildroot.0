From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Feb 2014 23:02:04 +0100
Subject: [Buildroot] [PATCH 04/10] package/libgles: convert to the
	virtual-package infrastructure
In-Reply-To: <cover.1393365231.git.yann.morin.1998@free.fr>
References: <cover.1393365231.git.yann.morin.1998@free.fr>
Message-ID: <e5ab224ecb5e29abe6baf8433cdaa023e95ac6de.1393365231.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
---
 package/cairo/cairo.mk                           |  2 +-
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in |  4 ++--
 package/gstreamer1/gst1-plugins-bad/Config.in    |  2 +-
 package/opengl/libgles/Config.in                 |  6 +++---
 package/opengl/libgles/libgles.mk                | 12 +-----------
 package/qt/Config.in                             |  2 +-
 package/qt5/qt5base/Config.in                    |  4 ++--
 package/qt5/qt5declarative/Config.in             |  4 ++--
 package/qt5/qt5graphicaleffects/Config.in        |  4 ++--
 package/qt5/qt5multimedia/Config.in              |  4 ++--
 package/qt5/qt5quick1/Config.in                  |  4 ++--
 package/qt5/qt5quickcontrols/Config.in           |  4 ++--
 package/rpi-userland/Config.in                   |  4 ++--
 package/sunxi-mali/Config.in                     |  4 ++--
 package/ti-gfx/Config.in                         |  4 ++--
 15 files changed, 27 insertions(+), 37 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index aa03a27..ee58aff 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -54,7 +54,7 @@ else
 	CAIRO_CONF_OPT += --disable-directfb
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_OPENGL_ES),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 	CAIRO_CONF_OPT += --enable-glesv2
 	CAIRO_DEPENDENCIES += libgles
 else
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
index e084568..379402d 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -5,7 +5,7 @@ comment "gpu-viv-bin-mx6q needs an (e)glibc toolchain"
 config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 	bool "gpu-viv-bin-mx6q"
 	select BR2_PACKAGE_HAS_OPENGL_EGL
-	select BR2_PACKAGE_HAS_OPENGL_ES
+	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	depends on BR2_arm # Only relevant for i.MX6
@@ -27,7 +27,7 @@ if BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 	default "gpu-viv-bin-mx6q"
 
-config BR2_PACKAGE_PROVIDES_OPENGL_ES
+config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "gpu-viv-bin-mx6q"
 
 config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_EXAMPLES
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index efad91e..92150cc 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -454,7 +454,7 @@ comment "rsvg plugin needs a toolchain w/ C++, wchar, threads"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_EGLGLES
 	bool "eglgles"
-	depends on BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_LIBGLES
 	help
 	  EGL/GLES sink
 
diff --git a/package/opengl/libgles/Config.in b/package/opengl/libgles/Config.in
index 75ccfc8..b7b800f 100644
--- a/package/opengl/libgles/Config.in
+++ b/package/opengl/libgles/Config.in
@@ -1,6 +1,6 @@
-config BR2_PACKAGE_HAS_OPENGL_ES
+config BR2_PACKAGE_HAS_LIBGLES
 	bool
 
-config BR2_PACKAGE_PROVIDES_OPENGL_ES
-	depends on BR2_PACKAGE_HAS_OPENGL_ES
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	depends on BR2_PACKAGE_HAS_LIBGLES
 	string
diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/libgles/libgles.mk
index 0dcbaa7..407f8f9 100644
--- a/package/opengl/libgles/libgles.mk
+++ b/package/opengl/libgles/libgles.mk
@@ -4,14 +4,4 @@
 #
 ################################################################################
 
-LIBGLES_SOURCE =
-LIBGLES_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENGL_ES))
-
-ifeq ($(LIBGLES_DEPENDENCIES),)
-define LIBGLES_CONFIGURE_CMDS
-	echo "No libGLES implementation selected. Configuration error."
-	exit 1
-endef
-endif
-
-$(eval $(generic-package))
+$(eval $(virtual-package))
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 5105e5d..d3f6a5a 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -294,7 +294,7 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
 
 config BR2_PACKAGE_QT_OPENGL_ES
 	bool "OpenGL ES v2.x support"
-	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
 	help
 	  Enable the OpenGL ES v2.x support.
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 5c404d1..437b1d2 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -138,10 +138,10 @@ comment "X.org XCB backend available if X.org is enabled"
 config BR2_PACKAGE_QT5BASE_EGLFS
 	bool "eglfs support"
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
-	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_LIBGLES
 
 comment "eglfs backend available if OpenGLES and EGL are enabled"
-	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES
+	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_LIBGLES
 
 config BR2_PACKAGE_QT5BASE_PRINTSUPPORT
 	bool "print support module"
diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index c5753b1..5e1516d 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_EGLFS
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
-	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
@@ -16,5 +16,5 @@ config BR2_PACKAGE_QT5DECLARATIVE
 	  http://qt-project.org
 
 comment "qt5declarative requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
+	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_LIBGLES) && \
 		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5graphicaleffects/Config.in b/package/qt5/qt5graphicaleffects/Config.in
index f4029e9..a821b40 100644
--- a/package/qt5/qt5graphicaleffects/Config.in
+++ b/package/qt5/qt5graphicaleffects/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	select BR2_PACKAGE_QT5DECLARATIVE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
-	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_LIBGLES
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -14,5 +14,5 @@ config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	  http://qt-project.org
 
 comment "qt5graphicaleffects requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
+	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_LIBGLES) && \
 		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5multimedia/Config.in b/package/qt5/qt5multimedia/Config.in
index 53b7f86..765bdc1 100644
--- a/package/qt5/qt5multimedia/Config.in
+++ b/package/qt5/qt5multimedia/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5DECLARATIVE
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
-	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
@@ -14,5 +14,5 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 	  http://qt-project.org
 
 comment "qt5multimedia requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
+	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_LIBGLES) && \
 		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index 1a0b8bf..1ffcc0d 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_QT5QUICK1
 	# This module does not support static linking
 	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
-	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
@@ -21,5 +21,5 @@ config BR2_PACKAGE_QT5QUICK1
 
 comment "qt5quick1 needs a toolchain w/ dynamic library and an OpenGL-capable backend"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES || \
+	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_LIBGLES || \
 		BR2_PREFER_STATIC_LIB
diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
index e72f2a4..355aef0 100644
--- a/package/qt5/qt5quickcontrols/Config.in
+++ b/package/qt5/qt5quickcontrols/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
 	select BR2_PACKAGE_QT5DECLARATIVE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
-	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_LIBGLES
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -15,5 +15,5 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
 	  http://qt-project.org
 
 comment "qt5quickcontrols requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
+	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_LIBGLES) && \
 		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 2303942..68b535b 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_RPI_USERLAND
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_HAS_OPENGL_EGL
-	select BR2_PACKAGE_HAS_OPENGL_ES
+	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_OPENVG
 	select BR2_PACKAGE_HAS_OPENMAX
 	help
@@ -22,7 +22,7 @@ if BR2_PACKAGE_RPI_USERLAND
 config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 	default "rpi-userland"
 
-config BR2_PACKAGE_PROVIDES_OPENGL_ES
+config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "rpi-userland"
 
 config BR2_PACKAGE_PROVIDES_OPENVG
diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
index 9f188a3..c47b6a3 100644
--- a/package/sunxi-mali/Config.in
+++ b/package/sunxi-mali/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SUNXI_MALI
 	bool "sunxi-mali"
 	select BR2_PACKAGE_HAS_OPENGL_EGL
-	select BR2_PACKAGE_HAS_OPENGL_ES
+	select BR2_PACKAGE_HAS_LIBGLES
 	# The egl/gles mali libraries are provided as a git submodule of the
 	# sunxi-mali repo and are downloaded by the sunxi-mali-prop package.
 	select BR2_PACKAGE_SUNXI_MALI_PROP
@@ -21,7 +21,7 @@ if BR2_PACKAGE_SUNXI_MALI
 config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 	default "sunxi-mali"
 
-config BR2_PACKAGE_PROVIDES_OPENGL_ES
+config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "sunxi-mali"
 
 config BR2_PACKAGE_SUNXI_MALI_DBG
diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index f455f4c..2bdc972 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_TI_GFX
 	bool "ti-gfx"
 	select BR2_PACKAGE_HAS_OPENGL_EGL
-	select BR2_PACKAGE_HAS_OPENGL_ES
+	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_POWERVR
 	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
 	help
@@ -14,7 +14,7 @@ if BR2_PACKAGE_TI_GFX
 config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 	default "ti-gfx"
 
-config BR2_PACKAGE_PROVIDES_OPENGL_ES
+config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "ti-gfx"
 
 config BR2_PACKAGE_PROVIDES_POWERVR
-- 
1.8.3.2
