From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 18 Aug 2011 23:04:56 +0200
Subject: [Buildroot] [PATCH v3] package: add opencv
Message-ID: <1313701496-6182-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenCV is a free, open-source, cross-platform computer vision library

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/Config.in        |    1 +
 package/opencv/Config.in |   70 ++++++++++++++++++++++++++++++++++++++++++++++
 package/opencv/opencv.mk |   61 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 132 insertions(+), 0 deletions(-)
 create mode 100644 package/opencv/Config.in
 create mode 100644 package/opencv/opencv.mk

diff --git a/package/Config.in b/package/Config.in
index 7112e05..d8b13b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -291,6 +291,7 @@ source "package/libraw/Config.in"
 source "package/librsvg/Config.in"
 source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
+source "package/opencv/Config.in"
 source "package/pango/Config.in"
 source "package/pixman/Config.in"
 source "package/tiff/Config.in"
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
new file mode 100644
index 0000000..d0187b6
--- /dev/null
+++ b/package/opencv/Config.in
@@ -0,0 +1,70 @@
+menuconfig BR2_PACKAGE_OPENCV
+	bool "opencv"
+	select BR2_PACKAGE_ZLIB
+	help
+	  OpenCV (Open Source Computer Vision) is a library of programming
+	  functions for real time computer vision.
+
+	  http://opencv.willowgarage.com/wiki/
+
+if BR2_PACKAGE_OPENCV
+
+comment "Built targets"
+
+config BR2_PACKAGE_OPENCV_BUILD_EXAMPLES
+	bool "All examples"
+
+config BR2_PACKAGE_OPENCV_BUILD_NEW_PYTHON_SUPPORT
+	bool "Python support"
+	select BR2_PACKAGE_PYTHON
+
+config BR2_PACKAGE_OPENCV_BUILD_TESTS
+	bool "Tests"
+
+comment "Build options"
+
+config BR2_PACKAGE_OPENCV_WITH_FFMPEG
+	bool "FFMPEG support"
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_SWSCALE
+	help
+	  Use ffmpeg from the target system.
+
+config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
+	bool "Gstreamer support"
+	select BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
+
+config BR2_PACKAGE_OPENCV_WITH_GTK
+	bool "GTK support"
+	depends on BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_LIBGLIB2
+
+config BR2_PACKAGE_OPENCV_WITH_JPEG
+	bool "JPEG support"
+	select BR2_PACKAGE_JPEG
+	help
+	  Use shared libjpeg from the target system.
+
+config BR2_PACKAGE_OPENCV_WITH_PNG
+	bool "PNG support"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  Use shared libpng from the target system.
+
+config BR2_PACKAGE_OPENCV_WITH_QT
+	bool "Qt Backend support"
+	select BR2_PACKAGE_QT
+
+config BR2_PACKAGE_OPENCV_WITH_TIFF
+	bool "TIFF support"
+	select BR2_PACKAGE_TIFF
+	help
+	  Use shared libtiff from the target system.
+
+config BR2_PACKAGE_OPENCV_WITH_V4L
+	bool "Video 4 Linux support"
+	select BR2_PACKAGE_LIBV4L
+	default y
+
+endif
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
new file mode 100644
index 0000000..de823b8
--- /dev/null
+++ b/package/opencv/opencv.mk
@@ -0,0 +1,61 @@
+#############################################################
+#
+# OpenCV (Open Source Computer Vision)
+#
+#############################################################
+OPENCV_SERIES  = 2.3
+OPENCV_VERSION = $(OPENCV_SERIES).0
+OPENCV_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_SERIES)
+OPENCV_SOURCE  = OpenCV-$(OPENCV_VERSION).tar.bz2
+OPENCV_INSTALL_STAGING = YES
+
+# Build type
+OPENCV_CONF_OPT += -DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release)
+# Built targets
+OPENCV_CONF_OPT += -DBUILD_DOCS=OFF
+OPENCV_CONF_OPT += -DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_OPENCV_BUILD_EXAMPLES),ON,OFF)
+OPENCV_CONF_OPT += -DBUILD_NEW_PYTHON_SUPPORT=$(if $(BR2_PACKAGE_OPENCV_BUILD_NEW_PYTHON_SUPPORT),ON,OFF)
+OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_OPENCV_BUILD_NEW_PYTHON_SUPPORT),python host-python,)
+OPENCV_CONF_OPT += -DBUILD_PACKAGE=OFF
+OPENCV_CONF_OPT += -DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF)
+# Build options
+OPENCV_CONF_OPT += -DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON)
+OPENCV_CONF_OPT += -DOPENCV_BUILD_3RDPARTY_LIBS=OFF
+OPENCV_CONF_OPT += -DENABLE_PROFILING=OFF
+OPENCV_CONF_OPT += -DCMAKE_SKIP_RPATH=OFF
+OPENCV_CONF_OPT += -DUSE_FAST_MATH=ON
+OPENCV_CONF_OPT += -DUSE_OMIT_FRAME_POINTER=ON
+OPENCV_CONF_OPT += -DUSE_PRECOMPILED_HEADERS=ON
+OPENCV_CONF_OPT += -DWITH_1394=OFF
+OPENCV_CONF_OPT += -DWITH_CUDA=OFF
+OPENCV_CONF_OPT += -DWITH_EIGEN=OFF
+OPENCV_CONF_OPT += -DWITH_FFMPEG=$(if $(BR2_PACKAGE_OPENCV_WITH_FFMPEG),ON,OFF)
+OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_OPENCV_WITH_FFMPEG),ffmpeg,)
+OPENCV_CONF_OPT += -DWITH_GSTREAMER=$(if $(BR2_PACKAGE_OPENCV_WITH_GSTREAMER),ON,OFF)
+OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_OPENCV_WITH_GSTREAMER),gstreamer gst-plugins-base,)
+OPENCV_CONF_OPT += -DWITH_GTK=$(if $(BR2_PACKAGE_OPENCV_WITH_GTK),ON,OFF)
+OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_OPENCV_WITH_GTK),libgtk2 libglib2,)
+OPENCV_CONF_OPT += -DWITH_IPP=OFF
+OPENCV_CONF_OPT += -DWITH_JASPER=OFF
+OPENCV_CONF_OPT += -DWITH_JPEG=$(if $(BR2_PACKAGE_OPENCV_WITH_JPEG),ON,OFF)
+OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_OPENCV_WITH_JPEG),jpeg,)
+OPENCV_CONF_OPT += -DWITH_OPENEXR=OFF
+OPENCV_CONF_OPT += -DWITH_OPENNI=OFF
+OPENCV_CONF_OPT += -DWITH_PNG=$(if $(BR2_PACKAGE_OPENCV_WITH_PNG),ON,OFF)
+OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_OPENCV_WITH_PNG),libpng,)
+OPENCV_CONF_OPT += -DWITH_PVAPI=OFF
+OPENCV_CONF_OPT += -DWITH_QT=$(if $(BR2_PACKAGE_OPENCV_WITH_QT),ON,OFF)
+OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_OPENCV_WITH_QT),qt,)
+OPENCV_CONF_OPT += -DWITH_QT_OPENGL=OFF
+OPENCV_CONF_OPT += -DWITH_TBB=OFF
+OPENCV_CONF_OPT += -DWITH_TIFF=$(if $(BR2_PACKAGE_OPENCV_WITH_TIFF),ON,OFF)
+OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_OPENCV_WITH_TIFF),tiff,)
+OPENCV_CONF_OPT += -DWITH_UNICAP=OFF
+OPENCV_CONF_OPT += -DWITH_V4L=$(if $(BR2_PACKAGE_OPENCV_WITH_V4L),ON,OFF)
+OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_OPENCV_WITH_V4L),libv4l,)
+OPENCV_CONF_OPT += -DWITH_XINE=OFF
+# Install options
+OPENCV_CONF_OPT += -DINSTALL_C_EXAMPLES=OFF
+OPENCV_CONF_OPT += -DINSTALL_PYTHON_EXAMPLES=OFF
+
+$(eval $(call CMAKETARGETS,package,opencv))
-- 
1.7.0.4
