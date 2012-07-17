From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 11:12:54 +0200
Subject: [Buildroot] [git commit] opencv: bump to version 2.4.2
Message-ID: <20120717091322.7844790AF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ff3d3d4710387fdf15ce8d129cda29eef16f8e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update Config.in and .mk according to the new features.

Remove the patch handling build with uclibc without long double support,
which seems not necessary anymore.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in                           |  155 +++++++++++++++++---
 ...pencv-uclibc-optional-long-double-support.patch |   40 -----
 package/opencv/opencv.mk                           |  144 +++++++++++++-----
 3 files changed, 238 insertions(+), 101 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 961282f..3e9ead6 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_OPENCV
+menuconfig BR2_PACKAGE_OPENCV
 	bool "opencv"
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -11,28 +11,124 @@ config BR2_PACKAGE_OPENCV
 
 if BR2_PACKAGE_OPENCV
 
-config BR2_PACKAGE_OPENCV_BUILD_TESTS
-	bool "build tests"
+comment "OpenCV modules"
 
-config BR2_PACKAGE_OPENCV_INSTALL_DATA
-	bool "install extra data"
+config BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	bool "calib3d"
+	default y
 	help
-	  Install various data that is used by cv libraries and/or demo
-	  applications, specifically for haarcascades and lbpcascades
-	  features.
+	  Include opencv_calib3d module into the OpenCV build.
 
-	  For further information: see OpenCV documentation.
+config BR2_PACKAGE_OPENCV_LIB_CONTRIB
+	bool "contrib"
+	default y
+	help
+	  Include opencv_contrib module into the OpenCV build.
 
-comment "Build options"
+config BR2_PACKAGE_OPENCV_LIB_CORE
+	bool "core"
+	default y
+	help
+	  Include opencv_core module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+	bool "features2d"
+	default y
+	help
+	  Include opencv_features2d module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_FLANN
+	bool "flann"
+	default y
+	help
+	  Include opencv_flann module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_GPU
+	bool "gpu"
+	help
+	  Include opencv_gpu module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	bool "highgui"
+	default y
+	help
+	  Include opencv_highgui module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	bool "imgproc"
+	default y
+	help
+	  Include opencv_imgproc module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_LEGACY
+	bool "legacy"
+	default y
+	help
+	  Include opencv_legacy module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_ML
+	bool "ml (machine learning)"
+	default y
+	help
+	  Include opencv_ml module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_NONFREE
+	bool "nonfree"
+	help
+	  Include opencv_nonfree module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
+	bool "objdetect"
+	default y
+	help
+	  Include opencv_objdetect module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_PHOTO
+	bool "photo"
+	default y
+	help
+	  Include opencv_photo module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_WITH_PYTHON
-	bool "python support"
-	depends on BR2_PACKAGE_PYTHON
+comment "opencv_python module requires numpy which is not yet available."
+
+config BR2_PACKAGE_OPENCV_LIB_STITCHING
+	bool "stitching"
+	default y
+	help
+	  Include opencv_stitching module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_TS
+	bool "ts (touchscreen)"
+	default y
+	help
+	  Include opencv_ts module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_VIDEO
+	bool "video"
+	default y
+	help
+	  Include opencv_video module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB
+	bool "videostab"
+	default y
+	help
+	  Include opencv_videostab module into the OpenCV build.
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
@@ -43,18 +139,17 @@ comment "ffmpeg support requires a toolchain with LARGEFILE and IPV6 support"
 
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
@@ -68,6 +163,15 @@ config BR2_PACKAGE_OPENCV_WITH_PNG
 	help
 	  Use shared libpng from the target system.
 
+config BR2_PACKAGE_OPENCV_WITH_QT
+	bool "qt backend support"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT_STL
+	default y
+	help
+	  Use Qt with STL support
+
 config BR2_PACKAGE_OPENCV_WITH_TIFF
 	bool "tiff support"
 	select BR2_PACKAGE_TIFF
@@ -84,7 +188,18 @@ config BR2_PACKAGE_OPENCV_WITH_V4L
 comment "v4l support requires a toolchain with LARGEFILE support"
 	depends on !BR2_LARGEFILE
 
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
 endif # BR2_PACKAGE_OPENCV
 
 comment "opencv requires a toolchain with C++ and WCHAR support"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+	depends on !(BR2_INSTALL_LIBSTDCPP  && BR2_USE_WCHAR)
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
index ec94715..10ed5bd 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -3,50 +3,112 @@
 # OpenCV (Open Source Computer Vision)
 #
 #############################################################
-OPENCV_VERSION = 2.3.1a
-OPENCV_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/opencvlibrary/opencv-unix/2.3.1
+OPENCV_VERSION = 2.4.2
+OPENCV_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
 OPENCV_SOURCE  = OpenCV-$(OPENCV_VERSION).tar.bz2
 OPENCV_INSTALL_STAGING = YES
 
-OPENCV_CONF_OPT = \
-	-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release) \
-	-DBUILD_DOCS=$(if $(BR2_HAVE_DOCUMENTATION),ON,OFF) \
-	-DBUILD_EXAMPLES=OFF \
-	-DBUILD_PACKAGE=OFF \
+OPENCV_CONF_OPT += \
+	-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release)   \
+	-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON)    \
+	-DBUILD_WITH_STATIC_CRT=OFF                                  \
+	-DBUILD_DOCS=$(if $(BR2_HAVE_DOCUMENTATION),ON,OFF)          \
+	-DBUILD_EXAMPLES=OFF                                         \
+	-DBUILD_PACKAGE=OFF                                          \
 	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
-	-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON) \
-	-DINSTALL_C_EXAMPLES=OFF \
-	-DINSTALL_PYTHON_EXAMPLES=OFF \
-	-DOPENCV_BUILD_3RDPARTY_LIBS=OFF \
-	-DENABLE_PROFILING=OFF \
-	-DCMAKE_SKIP_RPATH=OFF \
-	-DUSE_FAST_MATH=ON \
-	-DUSE_OMIT_FRAME_POINTER=ON \
-	-DUSE_PRECOMPILED_HEADERS=OFF \
-	-DWITH_1394=OFF \
-	-DWITH_CUDA=OFF \
-	-DWITH_EIGEN=OFF \
-	-DWITH_IPP=OFF \
-	-DWITH_JASPER=OFF \
-	-DWITH_OPENEXR=OFF \
-	-DWITH_OPENNI=OFF \
-	-DWITH_PVAPI=OFF \
-	-DWITH_TBB=OFF \
-	-DWITH_UNICAP=OFF \
+	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),ON,OFF) \
+	-DBUILD_WITH_DEBUG_INFO=OFF             \
+	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF \
+	-DCMAKE_SKIP_RPATH=OFF                  \
+	-DCMAKE_USE_RELATIVE_PATHS=OFF          \
+	-DENABLE_FAST_MATH=ON                   \
+	-DENABLE_NOISY_WARNINGS=OFF             \
+	-DENABLE_OMIT_FRAME_POINTER=ON          \
+	-DENABLE_PRECOMPILED_HEADERS=OFF        \
+	-DENABLE_PROFILING=OFF                  \
+	-DENABLE_SOLUTION_FOLDERS=OFF           \
+	-DOPENCV_CAN_BREAK_BINARY_COMPATIBILITY=ON
+
+# OpenCV module selection
+OPENCV_CONF_OPT += \
+	-DBUILD_opencv_androidcamera=OFF                                        \
+	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF)   \
+	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF)   \
+	-DBUILD_opencv_core=$(if $(BR2_PACKAGE_OPENCV_LIB_CORE),ON,OFF)         \
+	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV_LIB_FEATURES2D),ON,OFF) \
+	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_LIB_FLANN),ON,OFF)       \
+	-DBUILD_opencv_gpu=$(if $(BR2_PACKAGE_OPENCV_LIB_GPU),ON,OFF)           \
+	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),ON,OFF)   \
+	-DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGPROC),ON,OFF)   \
+	-DBUILD_opencv_java=OFF                                                 \
+	-DBUILD_opencv_legacy=$(if $(BR2_PACKAGE_OPENCV_LIB_LEGACY),ON,OFF)     \
+	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF)             \
+	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF)   \
+	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
+	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF)       \
+	-DBUILD_opencv_python=OFF                                               \
+	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
+	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF)             \
+	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF)       \
+	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
+	-DBUILD_opencv_world=OFF
+
+# Hardware support options.
+#
+# * PowerPC support is turned off since its only effect is altering CFLAGS,
+#   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
+OPENCV_CONF_OPT += \
+	-DENABLE_POWERPC=OFF \
+	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF)     \
+	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF)   \
+	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF)   \
+	-DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE41),ON,OFF) \
+	-DENABLE_SSE42=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
+	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
+
+# Software/3rd-party support options.
+OPENCV_CONF_OPT += \
+	-DBUILD_JASPER=OFF \
+	-DBUILD_JPEG=OFF   \
+	-DBUILD_PNG=OFF	   \
+	-DBUILD_TIFF=OFF   \
+	-DBUILD_ZLIB=OFF   \
+	-DBUILD_ANDROID_CAMERA_WRAPPER=OFF \
+	-DBUILD_ANDROID_EXAMPLES=OFF	   \
+	-DBUILD_FAT_JAVA_LIB=OFF           \
+	-DBUILD_JAVA_SUPPORT=OFF	   \
+	-DBUILD_NEW_PYTHON_SUPPORT=OFF \
+	-DINSTALL_ANDROID_EXAMPLES=OFF \
+	-DINSTALL_C_EXAMPLES=OFF       \
+	-DINSTALL_PYTHON_EXAMPLES=OFF  \
+	-DINSTALL_TO_MANGLED_PATHS=OFF \
+	-DWITH_1394=OFF           \
+	-DWITH_ANDROID_CAMERA=OFF \
+	-DWITH_AVFOUNDATION=OFF	  \
+	-DWITH_CARBON=OFF         \
+	-DWITH_CUBLAS=OFF         \
+	-DWITH_CUDA=OFF           \
+	-DWITH_CUFFT=OFF          \
+	-DWITH_EIGEN=OFF          \
+	-DWITH_IMAGEIO=OFF        \
+	-DWITH_IPP=OFF            \
+	-DWITH_JASPER=OFF         \
+	-DWITH_OPENEXR=OFF        \
+	-DWITH_OPENGL=OFF         \
+	-DWITH_OPENNI=OFF         \
+	-DWITH_PVAPI=OFF          \
+	-DWITH_QUICKTIME=OFF      \
+	-DWITH_TBB=OFF            \
+	-DWITH_UNICAP=OFF         \
+	-DWITH_VIDEOINPUT=OFF     \
+	-DWITH_XIMEA=OFF          \
 	-DWITH_XINE=OFF
 
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
@@ -80,7 +142,7 @@ OPENCV_CONF_OPT += -DWITH_PNG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
-OPENCV_CONF_OPT += -DWITH_QT=ON -DWITH_QT_OPENGL=OFF
+OPENCV_CONF_OPT += -DWITH_QT=ON
 OPENCV_DEPENDENCIES += qt
 else
 OPENCV_CONF_OPT += -DWITH_QT=OFF
@@ -100,25 +162,25 @@ else
 OPENCV_CONF_OPT += -DWITH_V4L=OFF
 endif
 
+# Installation hooks:
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
