From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jun 2012 00:09:47 +0200
Subject: [Buildroot] [PATCH v2 5/5] opencv: bump to version 2.4.0
In-Reply-To: <1338674987-2053-1-git-send-email-s.martin49@gmail.com>
References: <1338674987-2053-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1338674987-2053-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update Config.in and .mk according to the new features.

Remove the pacth the uclibc without long double support, which seems
not necessary anymore.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 delete mode 100644 package/opencv/opencv-uclibc-optional-long-double-support.patch

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 961282f..0581c14 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_OPENCV
+menuconfig BR2_PACKAGE_OPENCV
 	bool "opencv"
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -11,28 +11,90 @@ config BR2_PACKAGE_OPENCV
 
 if BR2_PACKAGE_OPENCV
 
-config BR2_PACKAGE_OPENCV_BUILD_TESTS
-	bool "build tests"
+comment "OpenCV modules"
 
-config BR2_PACKAGE_OPENCV_INSTALL_DATA
-	bool "install extra data"
-	help
-	  Install various data that is used by cv libraries and/or demo
-	  applications, specifically for haarcascades and lbpcascades
-	  features.
+config BR2_PACKAGE_OPENCV_BUILD_opencv_calib3d
+	bool "include opencv_calib3d module into the OpenCV build"
+	default y
 
-	  For further information: see OpenCV documentation.
+config BR2_PACKAGE_OPENCV_BUILD_opencv_contrib
+	bool "include opencv_contrib module into the OpenCV build"
+	default y
+
+config BR2_PACKAGE_OPENCV_BUILD_opencv_core
+	bool "include opencv_core module into the OpenCV build"
+	default y
+
+config BR2_PACKAGE_OPENCV_BUILD_opencv_features2d
+	bool "include opencv_features2d module into the OpenCV build"
+	default y
+
+config BR2_PACKAGE_OPENCV_BUILD_opencv_flann
+	bool "include opencv_flann module into the OpenCV build"
+	default y
 
-comment "Build options"
+config BR2_PACKAGE_OPENCV_BUILD_opencv_gpu
+	bool "include opencv_gpu module into the OpenCV build"
 
-config BR2_PACKAGE_OPENCV_WITH_PYTHON
-	bool "python support"
-	depends on BR2_PACKAGE_PYTHON
+config BR2_PACKAGE_OPENCV_BUILD_opencv_highgui
+	bool "include opencv_highgui module into the OpenCV build"
+	default y
+
+config BR2_PACKAGE_OPENCV_BUILD_opencv_imgproc
+	bool "include opencv_imgproc module into the OpenCV build"
+	default y
+
+config BR2_PACKAGE_OPENCV_BUILD_opencv_legacy
+	bool "include opencv_legacy module into the OpenCV build"
+	default y
+
+config BR2_PACKAGE_OPENCV_BUILD_opencv_ml
+	bool "include opencv_ml module into the OpenCV build"
+	default y
+
+config BR2_PACKAGE_OPENCV_BUILD_opencv_nonfree
+	bool "include opencv_nonfree module into the OpenCV build"
+
+config BR2_PACKAGE_OPENCV_BUILD_opencv_objdetect
+	bool "include opencv_objdetect module into the OpenCV build"
+	default y
+
+config BR2_PACKAGE_OPENCV_BUILD_opencv_photo
+	bool "include opencv_photo module into the OpenCV build"
+	default y
+
+comment "opencv_python module requires numpy which is not yet available."
+
+config BR2_PACKAGE_OPENCV_BUILD_opencv_stitching
+	bool "include opencv_stitching module into the OpenCV build"
+	default y
+
+config BR2_PACKAGE_OPENCV_BUILD_opencv_ts
+	bool "include opencv_ts module into the OpenCV build"
+	default y
+
+config BR2_PACKAGE_OPENCV_BUILD_opencv_video
+	bool "include opencv_video module into the OpenCV build"
+	default y
+
+config BR2_PACKAGE_OPENCV_BUILD_opencv_videostab
+	bool "include opencv_videostab module into the OpenCV build"
+	default y
+
+comment "Test sets"
+config BR2_PACKAGE_OPENCV_BUILD_TESTS
+	bool "build tests"
+
+config BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS
+	bool "build performance tests"
+
+comment "3rd party support"
 
 config BR2_PACKAGE_OPENCV_WITH_FFMPEG
 	bool "ffmpeg support"
 	depends on BR2_LARGEFILE
 	depends on BR2_INET_IPV6
+	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	help
@@ -43,18 +105,17 @@ comment "ffmpeg support requires a toolchain with LARGEFILE and IPV6 support"
 
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
 	bool "gstreamer support"
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
 
 config BR2_PACKAGE_OPENCV_WITH_GTK
 	bool "gtk support"
-	depends on BR2_PACKAGE_LIBGTK2
-
-config BR2_PACKAGE_OPENCV_WITH_QT
-	bool "qt backend support"
-	depends on BR2_PACKAGE_QT
-	default y
+	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
+	depends on BR2_USE_WCHAR
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBGTK2
 
 config BR2_PACKAGE_OPENCV_WITH_JPEG
 	bool "jpeg support"
@@ -68,6 +129,12 @@ config BR2_PACKAGE_OPENCV_WITH_PNG
 	help
 	  Use shared libpng from the target system.
 
+config BR2_PACKAGE_OPENCV_WITH_QT
+	bool "qt backend support"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_QT
+	default y
+
 config BR2_PACKAGE_OPENCV_WITH_TIFF
 	bool "tiff support"
 	select BR2_PACKAGE_TIFF
@@ -81,6 +148,18 @@ config BR2_PACKAGE_OPENCV_WITH_V4L
 	help
 	  Enable Video 4 Linux support.
 
+comment "Install options"
+
+config BR2_PACKAGE_OPENCV_INSTALL_DATA
+	bool "install extra data"
+	help
+	  Install various data that is used by cv libraries and/or demo
+	  applications, specifically for haarcascades and lbpcascades
+	  features.
+
+	  For further information: see OpenCV documentation.
+
+
 comment "v4l support requires a toolchain with LARGEFILE support"
 	depends on !BR2_LARGEFILE
 
@@ -88,3 +167,4 @@ endif # BR2_PACKAGE_OPENCV
 
 comment "opencv requires a toolchain with C++ and WCHAR support"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+
diff --git a/package/opencv/opencv-uclibc-optional-long-double-support.patch b/package/opencv/opencv-uclibc-optional-long-double-support.patch
deleted file mode 100644
index b319849..0000000
--- a/package/opencv/opencv-uclibc-optional-long-double-support.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Upstream: https://code.ros.org/trac/opencv/ticket/1515
-
-[PATCH] Fix compile issue in flann module on uClibc without long double support
-
-uClibc configured without UCLIBC_HAS_LONG_DOUBLE_MATH (because of user
-choice or simply that the arch doesn't provide long doubles) doesn't
-provide fabsl(), breaking the build in the flann module.
-
-Work around it by not providing the long double template specialization.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- modules/flann/include/opencv2/flann/dist.h |    5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-Index: opencv-2.3.1a/modules/flann/include/opencv2/flann/dist.h
-===================================================================
---- opencv-2.3.1a.orig/modules/flann/include/opencv2/flann/dist.h
-+++ opencv-2.3.1a/modules/flann/include/opencv2/flann/dist.h
-@@ -40,6 +40,7 @@
- #else
- #include <stdint.h>
- #endif
-+#include <features.h>
- 
- #include "defines.h"
- 
-@@ -59,9 +60,11 @@
- template<>
- inline double abs<double>(double x) { return fabs(x); }
- 
-+/* uClibc configured without long double math doesn't provide fabsl */
-+#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LONG_DOUBLE_MATH__))
- template<>
- inline long double abs<long double>(long double x) { return fabsl(x); }
--
-+#endif
- 
- template<typename T>
- struct Accumulator { typedef T Type; };
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index ec94715..cd6a361 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -3,50 +3,73 @@
 # OpenCV (Open Source Computer Vision)
 #
 #############################################################
-OPENCV_VERSION = 2.3.1a
-OPENCV_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/opencvlibrary/opencv-unix/2.3.1
+OPENCV_VERSION = 2.4.0
+OPENCV_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
 OPENCV_SOURCE  = OpenCV-$(OPENCV_VERSION).tar.bz2
 OPENCV_INSTALL_STAGING = YES
 
 OPENCV_CONF_OPT = \
 	-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release) \
-	-DBUILD_DOCS=$(if $(BR2_HAVE_DOCUMENTATION),ON,OFF) \
-	-DBUILD_EXAMPLES=OFF \
-	-DBUILD_PACKAGE=OFF \
-	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
 	-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON) \
+	-DBUILD_WITH_DEBUG_INFO=OFF \
+	-DCMAKE_SKIP_RPATH=OFF \
+	-DENABLE_FAST_MATH=ON \
+	-DENABLE_OMIT_FRAME_POINTER=ON \
+	-DENABLE_PRECOMPILED_HEADERS=OFF \
+	-DENABLE_PROFILING=OFF \
+	-DENABLE_SOLUTION_FOLDERS=OFF \
+	-DENABLE_SSE=$(if $(BR2_CPU_HAS_SSE),ON,OFF) \
+	-DENABLE_SSE2=$(if $(BR2_CPU_HAS_SSE2),ON,OFF) \
+	-DENABLE_SSE3=$(if $(BR2_CPU_HAS_SSE3),ON,OFF) \
+	-DENABLE_SSE41=$(if $(BR2_CPU_HAS_SSE41),ON,OFF) \
+	-DENABLE_SSE42=$(if $(BR2_CPU_HAS_SSE42),ON,OFF) \
+	-DENABLE_SSSE3=$(if $(BR2_CPU_HAS_SSSE3),ON,OFF) \
 	-DINSTALL_C_EXAMPLES=OFF \
 	-DINSTALL_PYTHON_EXAMPLES=OFF \
-	-DOPENCV_BUILD_3RDPARTY_LIBS=OFF \
-	-DENABLE_PROFILING=OFF \
-	-DCMAKE_SKIP_RPATH=OFF \
-	-DUSE_FAST_MATH=ON \
-	-DUSE_OMIT_FRAME_POINTER=ON \
-	-DUSE_PRECOMPILED_HEADERS=OFF \
+	-DINSTALL_TO_MANGLED_PATHS=OFF \
 	-DWITH_1394=OFF \
+	-DWITH_CUBLAS=OFF\
 	-DWITH_CUDA=OFF \
+	-DWITH_CUFFT=OFF \
 	-DWITH_EIGEN=OFF \
 	-DWITH_IPP=OFF \
 	-DWITH_JASPER=OFF \
 	-DWITH_OPENEXR=OFF \
+	-DWITH_OPENGL=OFF \
 	-DWITH_OPENNI=OFF \
 	-DWITH_PVAPI=OFF \
 	-DWITH_TBB=OFF \
 	-DWITH_UNICAP=OFF \
-	-DWITH_XINE=OFF
+	-DWITH_XINE=OFF	\
+	-DBUILD_DOCS=$(if $(BR2_HAVE_DOCUMENTATION),ON,OFF) \
+	-DBUILD_EXAMPLES=OFF \
+	-DBUILD_PACKAGE=OFF \
+	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),ON,OFF) \
+	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
+	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_BUILD_opencv_calib3d),ON,OFF) \
+	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_BUILD_opencv_contrib),ON,OFF) \
+	-DBUILD_opencv_core=$(if $(BR2_PACKAGE_OPENCV_BUILD_opencv_core),ON,OFF) \
+	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV_BUILD_opencv_features2d),ON,OFF) \
+	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_BUILD_opencv_flann),ON,OFF) \
+	-DBUILD_opencv_gpu=$(if $(BR2_PACKAGE_OPENCV_BUILD_opencv_gpu),ON,OFF) \
+	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV_BUILD_opencv_highgui),ON,OFF) \
+	-DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV_BUILD_opencv_imgproc),ON,OFF) \
+	-DBUILD_opencv_legacy=$(if $(BR2_PACKAGE_OPENCV_BUILD_opencv_legacy),ON,OFF) \
+	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_BUILD_opencv_ml),ON,OFF) \
+	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_BUILD_opencv_nonfree),ON,OFF) \
+	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_BUILD_opencv_objdetect),ON,OFF) \
+	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_BUILD_opencv_photo),ON,OFF) \
+	-DBUILD_opencv_python=OFF \
+	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_BUILD_opencv_stitching),ON,OFF) \
+	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_BUILD_opencv_ts),ON,OFF) \
+	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_BUILD_opencv_video),ON,OFF) \
+	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_BUILD_opencv_videostab),ON,OFF)
 
 OPENCV_DEPENDENCIES += zlib
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_PYTHON),y)
-OPENCV_CONF_OPT += -DBUILD_NEW_PYTHON_SUPPORT=ON
-OPENCV_DEPENDENCIES += python
-else
-OPENCV_CONF_OPT += -DBUILD_NEW_PYTHON_SUPPORT=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_FFMPEG),y)
 OPENCV_CONF_OPT += -DWITH_FFMPEG=ON
-OPENCV_DEPENDENCIES += ffmpeg
+OPENCV_DEPENDENCIES += ffmpeg bzip2
 else
 OPENCV_CONF_OPT += -DWITH_FFMPEG=OFF
 endif
@@ -80,7 +103,7 @@ OPENCV_CONF_OPT += -DWITH_PNG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
-OPENCV_CONF_OPT += -DWITH_QT=ON -DWITH_QT_OPENGL=OFF
+OPENCV_CONF_OPT += -DWITH_QT=ON
 OPENCV_DEPENDENCIES += qt
 else
 OPENCV_CONF_OPT += -DWITH_QT=OFF
@@ -102,23 +125,22 @@ endif
 
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 define OPENCV_CLEAN_INSTALL_DOC
-	$(RM) -fr $(TARGET_DIR)/usr/share/opencv/doc
+	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/doc
 endef
-
 OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DOC
 endif
 
-ifneq ($(BR2_PACKAGE_CMAKE),y)
+ifneq ($(BR2_HAVE_DEVFILES),y)
 define OPENCV_CLEAN_INSTALL_CMAKE
-	$(RM) -f $(TARGET_DIR)/usr/share/opencv/OpenCVConfig.cmake
+	$(RM) -f $(TARGET_DIR)/usr/share/OpenCV/OpenCVConfig*.cmake
 endef
 OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_CMAKE
 endif
 
 ifneq ($(BR2_PACKAGE_OPENCV_INSTALL_DATA),y)
 define OPENCV_CLEAN_INSTALL_DATA
-	$(RM) -fr $(TARGET_DIR)/usr/share/opencv/haarcascades \
-		$(TARGET_DIR)/usr/share/opencv/lbpcascades
+	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/haarcascades \
+		$(TARGET_DIR)/usr/share/OpenCV/lbpcascades
 endef
 OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DATA
 endif
-- 
1.7.10.3
