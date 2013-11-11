From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 11 Nov 2013 22:00:11 +0100
Subject: [Buildroot] [PATCH 5/7] opencv: bump to version 2.4.7
In-Reply-To: <1384203613-17871-1-git-send-email-s.martin49@gmail.com>
References: <1384203613-17871-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1384203613-17871-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps OpenCV version without adding support for Qt5 though
OpenCV support both Qt4 and Qt5 since this 2.4.6 release.
This will be addressed in others patches.

This patch also does:
- add new modules options and update existing ones;
- clean redundant C++ dependency (in the Qt knob);
- add license details;
- explicitly disable python support to avoid being confuse by the one
  from the host.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/opencv/Config.in | 12 +++++++++---
 package/opencv/opencv.mk | 21 +++++++++++++++------
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 5b970e8..bd466ca 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -98,6 +98,13 @@ config BR2_PACKAGE_OPENCV_LIB_STITCHING
 	help
 	  Include opencv_stitching module into the OpenCV build.
 
+config BR2_PACKAGE_OPENCV_LIB_SUPERRES
+	bool "superres"
+	default y
+	help
+	  Include opencv_superres "super resolution" - module into the OpenCV
+	  build.
+
 config BR2_PACKAGE_OPENCV_LIB_TS
 	bool "ts (touchscreen)"
 	default y
@@ -170,14 +177,13 @@ config BR2_PACKAGE_OPENCV_WITH_PNG
 	  Use shared libpng from the target system.
 
 config BR2_PACKAGE_OPENCV_WITH_QT
-	bool "qt backend support"
-	depends on BR2_INSTALL_LIBSTDCPP
+	bool "qt4 backend support"
 	depends on !BR2_avr32 # qt
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_STL
 	default y
 	help
-	  Use Qt with STL support
+	  Use Qt4 with STL support
 
 config BR2_PACKAGE_OPENCV_WITH_TIFF
 	bool "tiff support"
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 8556272..c53d984 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-OPENCV_VERSION = 2.4.2
+OPENCV_VERSION = 2.4.7
 OPENCV_SITE    = http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
-OPENCV_SOURCE  = OpenCV-$(OPENCV_VERSION).tar.bz2
 OPENCV_INSTALL_STAGING = YES
+OPENCV_LICENSE = BSD-3c
+OPENCV_LICENSE_FILES = doc/license.txt
 
 OPENCV_CONF_OPT += \
 	-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release)   \
@@ -19,6 +20,7 @@ OPENCV_CONF_OPT += \
 	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
 	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),ON,OFF) \
 	-DBUILD_WITH_DEBUG_INFO=OFF             \
+	-DINSTALL_CREATE_DISTRIB=OFF            \
 	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF \
 	-DCMAKE_SKIP_RPATH=OFF                  \
 	-DCMAKE_USE_RELATIVE_PATHS=OFF          \
@@ -47,13 +49,19 @@ OPENCV_CONF_OPT += \
 	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF)   \
 	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
 	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF)       \
-	-DBUILD_opencv_python=OFF                                               \
 	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
+	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
 	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF)             \
 	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF)       \
 	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
 	-DBUILD_opencv_world=OFF
 
+# Explicitly disable python to avoid confusing OpenCV, which comes with its
+# own implementation of the Python detection CMake module.
+OPENCV_CONF_OPT += \
+	-DBUILD_opencv_python=OFF \
+	-DPYTHON_EXECUTABLE=OFF
+
 # Hardware support options.
 #
 # * PowerPC support is turned off since its only effect is altering CFLAGS,
@@ -94,6 +102,7 @@ OPENCV_CONF_OPT += \
 	-DWITH_JASPER=OFF         \
 	-DWITH_OPENEXR=OFF        \
 	-DWITH_OPENGL=OFF         \
+	-DWITH_OPENMP=OFF         \
 	-DWITH_OPENNI=OFF         \
 	-DWITH_PVAPI=OFF          \
 	-DWITH_QUICKTIME=OFF      \
@@ -141,7 +150,7 @@ OPENCV_CONF_OPT += -DWITH_PNG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
-OPENCV_CONF_OPT += -DWITH_QT=ON
+OPENCV_CONF_OPT += -DWITH_QT=4
 OPENCV_DEPENDENCIES += qt
 else
 OPENCV_CONF_OPT += -DWITH_QT=OFF
@@ -155,10 +164,10 @@ OPENCV_CONF_OPT += -DWITH_TIFF=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_V4L),y)
-OPENCV_CONF_OPT += -DWITH_V4L=ON
+OPENCV_CONF_OPT += -DWITH_V4L=ON -DWITH_LIBV4L=ON
 OPENCV_DEPENDENCIES += libv4l
 else
-OPENCV_CONF_OPT += -DWITH_V4L=OFF
+OPENCV_CONF_OPT += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
 endif
 
 # Installation hooks:
-- 
1.8.4.2
