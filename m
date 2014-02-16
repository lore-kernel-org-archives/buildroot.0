From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Feb 2014 22:59:54 +0100
Subject: [Buildroot] [PATCH 01/11] opencv: bump to version 2.4.8
In-Reply-To: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
References: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1392588004-13317-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps OpenCV version and does a number of cleanup in the
opencv.mk files:
- add an extract command because the source archive is only available
  under zip format since this 2.4.8 release. Since there is no default
  extract command for zip archive, we have to define it;
- add license details;
- add new modules options and update existing ones;
- update SSE support;
- sort and reorder the configure options (to make easier future package
  update);
- clean redundant C++ dependency (in the Qt knob).

However, it does not add any new 3rd-party support for the followings:
- jasper support;
- python/numpy support;
- Qt4 and Qt5 support (since the 2.4.6 release), so only Qt4 support is
  supported in this patch;
- optional libv4l dependency (since 2.4.7 release).
These will be addressed in followup patches.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/opencv/Config.in |  12 +++--
 package/opencv/opencv.mk | 120 ++++++++++++++++++++++++++++++++++-------------
 2 files changed, 97 insertions(+), 35 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index ffb0916..c3273fd 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -8,7 +8,7 @@ menuconfig BR2_PACKAGE_OPENCV
 	  OpenCV (Open Source Computer Vision) is a library of programming
 	  functions for real time computer vision.
 
-	  http://opencv.willowgarage.com/wiki/
+	  http://opencv.org/
 
 if BR2_PACKAGE_OPENCV
 
@@ -92,6 +92,13 @@ config BR2_PACKAGE_OPENCV_LIB_STITCHING
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
@@ -164,8 +171,7 @@ config BR2_PACKAGE_OPENCV_WITH_PNG
 	  Use shared libpng from the target system.
 
 config BR2_PACKAGE_OPENCV_WITH_QT
-	bool "qt backend support"
-	depends on BR2_INSTALL_LIBSTDCPP
+	bool "qt4 backend support"
 	depends on !BR2_avr32 # qt
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_STL
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 42f9b0a..43aef62 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -4,23 +4,34 @@
 #
 ################################################################################
 
-OPENCV_VERSION = 2.4.2
-OPENCV_SITE    = http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
-OPENCV_SOURCE  = OpenCV-$(OPENCV_VERSION).tar.bz2
+OPENCV_VERSION = 2.4.8
+OPENCV_SOURCE = opencv-$(OPENCV_VERSION).zip
+OPENCV_SITE = http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
 OPENCV_INSTALL_STAGING = YES
+OPENCV_LICENSE = BSD-3c
+OPENCV_LICENSE_FILES = doc/license.txt
+
+define OPENCV_EXTRACT_CMDS
+    unzip -d $(BUILD_DIR) $(DL_DIR)/$(OPENCV_SOURCE)
+endef
 
 OPENCV_CONF_OPT += \
 	-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release)   \
-	-DBUILD_WITH_STATIC_CRT=OFF                                  \
+	-DBUILD_WITH_DEBUG_INFO=OFF                                  \
+	\
 	-DBUILD_DOCS=OFF                                             \
 	-DBUILD_EXAMPLES=OFF                                         \
-	-DBUILD_PACKAGE=OFF                                          \
-	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
 	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),ON,OFF) \
-	-DBUILD_WITH_DEBUG_INFO=OFF             \
+	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
+	-DBUILD_WITH_STATIC_CRT=OFF                                  \
+	\
+	-DBUILD_PACKAGE=OFF                     \
+	-DINSTALL_CREATE_DISTRIB=OFF            \
+	\
 	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF \
 	-DCMAKE_SKIP_RPATH=OFF                  \
 	-DCMAKE_USE_RELATIVE_PATHS=OFF          \
+	\
 	-DENABLE_FAST_MATH=ON                   \
 	-DENABLE_NOISY_WARNINGS=OFF             \
 	-DENABLE_OMIT_FRAME_POINTER=ON          \
@@ -32,9 +43,11 @@ OPENCV_CONF_OPT += \
 # OpenCV module selection
 OPENCV_CONF_OPT += \
 	-DBUILD_opencv_androidcamera=OFF                                        \
+	-DBUILD_opencv_apps=OFF                                                 \
 	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF)   \
 	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF)   \
 	-DBUILD_opencv_core=ON                                                  \
+	-DBUILD_opencv_dynamicuda=OFF                                           \
 	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV_LIB_FEATURES2D),ON,OFF) \
 	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_LIB_FLANN),ON,OFF)       \
 	-DBUILD_opencv_gpu=$(if $(BR2_PACKAGE_OPENCV_LIB_GPU),ON,OFF)           \
@@ -45,9 +58,11 @@ OPENCV_CONF_OPT += \
 	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF)             \
 	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF)   \
 	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
+	-DBUILD_opencv_ocl=OFF                                                  \
 	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF)       \
 	-DBUILD_opencv_python=OFF                                               \
 	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
+	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
 	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF)             \
 	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF)       \
 	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
@@ -62,45 +77,86 @@ OPENCV_CONF_OPT += \
 	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF)     \
 	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF)   \
 	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF)   \
+	-DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF)  \
+	-DENABLE_SSE42=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
 	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
 
-# Software/3rd-party support options.
+# Cuda stuff
+OPENCV_CONF_OPT += \
+	-DWITH_CUBLAS=OFF         \
+	-DWITH_CUDA=OFF           \
+	-DWITH_CUFFT=OFF
+
+# NVidia stuff
+OPENCV_CONF_OPT += 	-DWITH_NVCUVID=OFF
+
+# AMD stuff
+OPENCV_CONF_OPT += \
+	-DWITH_OPENCLAMDFFT=OFF   \
+	-DWITH_OPENCLAMDBLAS=OFF
+
+# Intel stuff
+OPENCV_CONF_OPT += \
+	-DWITH_INTELPERC=OFF      \
+	-DWITH_IPP=OFF            \
+	-DWITH_TBB=OFF
+
+# Smartek stuff
+OPENCV_CONF_OPT += -DWITH_GIGEAPI=OFF
+
+# Prosilica stuff
+OPENCV_CONF_OPT += -DWITH_PVAPI=OFF
+
+# Ximea stuff
+OPENCV_CONF_OPT += -DWITH_XIMEA=OFF
+
+# Non-Linux support (must remain OFF)
 OPENCV_CONF_OPT += \
-	-DBUILD_JASPER=OFF \
-	-DBUILD_JPEG=OFF   \
-	-DBUILD_PNG=OFF	   \
-	-DBUILD_TIFF=OFF   \
-	-DBUILD_ZLIB=OFF   \
+	-DWITH_ANDROID_CAMERA=OFF          \
 	-DBUILD_ANDROID_CAMERA_WRAPPER=OFF \
 	-DBUILD_ANDROID_EXAMPLES=OFF	   \
+	-DINSTALL_ANDROID_EXAMPLES=OFF     \
 	-DBUILD_FAT_JAVA_LIB=OFF           \
-	-DBUILD_JAVA_SUPPORT=OFF	   \
+	-DBUILD_JAVA_SUPPORT=OFF	       \
+	\
+	-DWITH_AVFOUNDATION=OFF	  \
+	-DWITH_CARBON=OFF         \
+	-DWITH_QUICKTIME=OFF      \
+	\
+	-DWITH_VFW=OFF            \
+	-DWITH_WIN32UI=OFF        \
+	-DWITH_CSTRIPES=OFF       \
+	-DWITH_DSHOW=OFF          \
+	-DWITH_MSMF=OFF
+
+# Software/3rd-party support options.
+OPENCV_CONF_OPT += \
+	-DBUILD_JASPER=OFF        \
+	-DBUILD_JPEG=OFF          \
+	-DBUILD_OPENEXR=OFF       \
+	-DBUILD_PNG=OFF	          \
+	-DBUILD_TIFF=OFF          \
+	-DBUILD_ZLIB=OFF          \
+	\
 	-DBUILD_NEW_PYTHON_SUPPORT=OFF \
-	-DINSTALL_ANDROID_EXAMPLES=OFF \
 	-DINSTALL_C_EXAMPLES=OFF       \
 	-DINSTALL_PYTHON_EXAMPLES=OFF  \
-	-DINSTALL_TO_MANGLED_PATHS=OFF \
+	-DINSTALL_TO_MANGLED_PATHS=OFF
+
+# Disabled features (mostly because they are not available in Buildroot), but
+# - eigen: OpenCV does not use it, not take any benefit from it.
+OPENCV_CONF_OPT += \
 	-DWITH_1394=OFF           \
-	-DWITH_ANDROID_CAMERA=OFF \
-	-DWITH_AVFOUNDATION=OFF	  \
-	-DWITH_CARBON=OFF         \
-	-DWITH_CUBLAS=OFF         \
-	-DWITH_CUDA=OFF           \
-	-DWITH_CUFFT=OFF          \
 	-DWITH_EIGEN=OFF          \
 	-DWITH_IMAGEIO=OFF        \
-	-DWITH_IPP=OFF            \
 	-DWITH_JASPER=OFF         \
+	-DWITH_OPENCL=OFF         \
 	-DWITH_OPENEXR=OFF        \
 	-DWITH_OPENGL=OFF         \
+	-DWITH_OPENMP=OFF         \
 	-DWITH_OPENNI=OFF         \
-	-DWITH_PVAPI=OFF          \
-	-DWITH_QUICKTIME=OFF      \
-	-DWITH_TBB=OFF            \
 	-DWITH_UNICAP=OFF         \
-	-DWITH_VIDEOINPUT=OFF     \
-	-DWITH_XIMEA=OFF          \
-	-DWITH_XINE=OFF
+	-DWITH_XINE=OFF           \
 
 OPENCV_DEPENDENCIES += zlib
 
@@ -140,7 +196,7 @@ OPENCV_CONF_OPT += -DWITH_PNG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
-OPENCV_CONF_OPT += -DWITH_QT=ON
+OPENCV_CONF_OPT += -DWITH_QT=4
 OPENCV_DEPENDENCIES += qt
 else
 OPENCV_CONF_OPT += -DWITH_QT=OFF
@@ -154,10 +210,10 @@ OPENCV_CONF_OPT += -DWITH_TIFF=OFF
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
1.8.5.4
