From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Aug 2015 18:14:54 +0200
Subject: [Buildroot] [PATCH 1/4 v2] package: rename opencv -> opencv3
In-Reply-To: <cover.1439136753.git.yann.morin.1998@free.fr>
References: <cover.1439136753.git.yann.morin.1998@free.fr>
Message-ID: <26925737a86eb07d02563f6d4fe7fcae6b416210.1439136753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

Since there is a couple of API breaks between OpenCV 2.4 and 3.0, two
distinct packages mutually exclusive will be integrated in the package
tree.

So, this change prepares the re-introduction of the OpenCV-2.4 package
by renaming the current opencv package (which provides OpenCV-3.0) to
opencv3

It also does:
- rename symbols in reverse deps (vlc)
- remove entries from Config.in.legacy

Cc: Jonathan Ben Avraham <yba@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[yann.morin.1998 at free.fr: fix missed usage in vlc.mk; don't remove
 legacy OpenCV symbols]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                                  |   2 +-
 ...pthread-based-parallel_for-with-gcc-4.4.3.patch |   0
 ...002-fix-support-for-pthreads-parallel_for.patch |   0
 package/{opencv => opencv3}/Config.in              | 150 +++++++-------
 package/{opencv/opencv.mk => opencv3/opencv3.mk}   | 230 ++++++++++-----------
 package/vlc/Config.in                              |   4 +-
 package/vlc/vlc.mk                                 |   4 +-
 7 files changed, 195 insertions(+), 195 deletions(-)
 rename package/{opencv => opencv3}/0001-Fixed-compilation-of-pthread-based-parallel_for-with-gcc-4.4.3.patch (100%)
 rename package/{opencv => opencv3}/0002-fix-support-for-pthreads-parallel_for.patch (100%)
 rename package/{opencv => opencv3}/Config.in (70%)
 rename package/{opencv/opencv.mk => opencv3/opencv3.mk} (55%)

diff --git a/package/Config.in b/package/Config.in
index 47d14d7..9986eb5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -825,7 +825,7 @@ menu "Graphics"
 	source "package/libva-intel-driver/Config.in"
 	source "package/libvips/Config.in"
 	source "package/menu-cache/Config.in"
-	source "package/opencv/Config.in"
+	source "package/opencv3/Config.in"
 	source "package/opengl/Config.in"
 	source "package/openjpeg/Config.in"
 	source "package/pango/Config.in"
diff --git a/package/opencv/0001-Fixed-compilation-of-pthread-based-parallel_for-with-gcc-4.4.3.patch b/package/opencv3/0001-Fixed-compilation-of-pthread-based-parallel_for-with-gcc-4.4.3.patch
similarity index 100%
rename from package/opencv/0001-Fixed-compilation-of-pthread-based-parallel_for-with-gcc-4.4.3.patch
rename to package/opencv3/0001-Fixed-compilation-of-pthread-based-parallel_for-with-gcc-4.4.3.patch
diff --git a/package/opencv/0002-fix-support-for-pthreads-parallel_for.patch b/package/opencv3/0002-fix-support-for-pthreads-parallel_for.patch
similarity index 100%
rename from package/opencv/0002-fix-support-for-pthreads-parallel_for.patch
rename to package/opencv3/0002-fix-support-for-pthreads-parallel_for.patch
diff --git a/package/opencv/Config.in b/package/opencv3/Config.in
similarity index 70%
rename from package/opencv/Config.in
rename to package/opencv3/Config.in
index a52092d..c63b474 100644
--- a/package/opencv/Config.in
+++ b/package/opencv3/Config.in
@@ -1,5 +1,5 @@
-menuconfig BR2_PACKAGE_OPENCV
-	bool "opencv"
+menuconfig BR2_PACKAGE_OPENCV3
+	bool "opencv3"
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -17,54 +17,54 @@ menuconfig BR2_PACKAGE_OPENCV
 
 	  http://opencv.org/
 
-if BR2_PACKAGE_OPENCV
+if BR2_PACKAGE_OPENCV3
 
 comment "OpenCV modules"
 
-config BR2_PACKAGE_OPENCV_LIB_CALIB3D
+config BR2_PACKAGE_OPENCV3_LIB_CALIB3D
 	bool "calib3d"
-	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
-	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV3_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
 	help
 	  Include opencv_calib3d (camera calibration and 3d reconstruction) module
 	  into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+config BR2_PACKAGE_OPENCV3_LIB_FEATURES2D
 	bool "features2d"
-	select BR2_PACKAGE_OPENCV_LIB_FLANN
-	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV_LIB_ML
+	select BR2_PACKAGE_OPENCV3_LIB_FLANN
+	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV3_LIB_ML
 	help
 	  Include opencv_features2d (2d features framework) module into the OpenCV
 	  build.
 
-config BR2_PACKAGE_OPENCV_LIB_FLANN
+config BR2_PACKAGE_OPENCV3_LIB_FLANN
 	bool "flann"
 	# opencv_core dependency is already enabled
 	help
 	  Include opencv_flann (clustering and search in multi-dimensional spaces)
 	  module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+config BR2_PACKAGE_OPENCV3_LIB_HIGHGUI
 	bool "highgui"
-	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
-	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV_LIB_VIDEOIO
+	select BR2_PACKAGE_OPENCV3_LIB_IMGCODECS
+	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV3_LIB_VIDEOIO
 	help
 	  Include opencv_highgui (high-level gui and media i/o) module into the
 	  OpenCV build.
 
-if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+if BR2_PACKAGE_OPENCV3_LIB_HIGHGUI
 
 choice
 	prompt "gui toolkit"
 	help
 	  GUI toolkit to be used by the opencv_highgui module.
 
-config BR2_PACKAGE_OPENCV_GUI_NONE
+config BR2_PACKAGE_OPENCV3_GUI_NONE
 	bool "none"
 
-config BR2_PACKAGE_OPENCV_WITH_GTK
+config BR2_PACKAGE_OPENCV3_WITH_GTK
 	bool "gtk2"
 	depends on BR2_PACKAGE_LIBGTK2
 
@@ -73,7 +73,7 @@ comment "gtk2 support needs libgtk2"
 	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
 	depends on !BR2_PACKAGE_LIBGTK2
 
-config BR2_PACKAGE_OPENCV_WITH_GTK3
+config BR2_PACKAGE_OPENCV3_WITH_GTK3
 	bool "gtk3"
 	depends on BR2_PACKAGE_LIBGTK3
 
@@ -82,7 +82,7 @@ comment "gtk3 support needs libgtk3"
 	depends on BR2_ARCH_HAS_ATOMICS # libgtk3 -> cairo
 	depends on !BR2_PACKAGE_LIBGTK3
 
-config BR2_PACKAGE_OPENCV_WITH_QT
+config BR2_PACKAGE_OPENCV3_WITH_QT
 	bool "qt4"
 	depends on BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_STL
@@ -95,7 +95,7 @@ comment "qt4 support needs qt"
 	depends on BR2_USE_MMU # qt
 	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
 
-config BR2_PACKAGE_OPENCV_WITH_QT5
+config BR2_PACKAGE_OPENCV3_WITH_QT5
 	bool "qt5"
 	depends on BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE
@@ -111,10 +111,10 @@ comment "qt5 support needs qt5"
 
 endchoice
 
-config BR2_PACKAGE_OPENCV_WITH_OPENGL
+config BR2_PACKAGE_OPENCV3_WITH_OPENGL
 	bool "opengl support"
 	# OpenGL support done using Qt5OpenGL, so depends on WITH_QT5
-	depends on BR2_PACKAGE_OPENCV_WITH_QT5
+	depends on BR2_PACKAGE_OPENCV3_WITH_QT5
 	# OpenGL support requires Qt5OpenGL with GL support, not GLES
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
 	depends on BR2_PACKAGE_HAS_LIBGL
@@ -123,47 +123,47 @@ config BR2_PACKAGE_OPENCV_WITH_OPENGL
 	  Enable OpenGL for UI.
 
 comment "opengl support needs an OpenGL provider"
-	depends on BR2_PACKAGE_OPENCV_WITH_QT5
+	depends on BR2_PACKAGE_OPENCV3_WITH_QT5
 	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE || \
 		!BR2_PACKAGE_HAS_LIBGL
 
-endif # BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+endif # BR2_PACKAGE_OPENCV3_LIB_HIGHGUI
 
 
-config BR2_PACKAGE_OPENCV_LIB_IMGCODECS
+config BR2_PACKAGE_OPENCV3_LIB_IMGCODECS
 	bool "imgcodecs"
-	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
 	help
 	  Include opencv_imgcodecs (image codecs) module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_IMGPROC
+config BR2_PACKAGE_OPENCV3_LIB_IMGPROC
 	bool "imgproc"
 	# opencv_core dependency is already enabled
 	help
 	  Include opencv_imgproc (image processing) module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_ML
+config BR2_PACKAGE_OPENCV3_LIB_ML
 	bool "ml"
 	# opencv_core dependency is already enabled
 	help
 	  Include opencv_ml (machine learning) module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
+config BR2_PACKAGE_OPENCV3_LIB_OBJDETECT
 	bool "objdetect"
 	# opencv_core dependency is already enabled
-	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV_LIB_ML
+	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV3_LIB_ML
 	help
 	  Include opencv_objdetect (object detection) module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_PHOTO
+config BR2_PACKAGE_OPENCV3_LIB_PHOTO
 	bool "photo"
-	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
 	help
 	  Include opencv_photo (computational photography) module into the OpenCV
 	  build.
 
-config BR2_PACKAGE_OPENCV_LIB_PYTHON
+config BR2_PACKAGE_OPENCV3_LIB_PYTHON
 	bool "python"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
@@ -175,75 +175,75 @@ config BR2_PACKAGE_OPENCV_LIB_PYTHON
 	  Include opencv_python module into the OpenCV build.
 	  No python example is installed.
 
-config BR2_PACKAGE_OPENCV_LIB_SHAPE
+config BR2_PACKAGE_OPENCV3_LIB_SHAPE
 	bool "shape"
 	# opencv_core dependency is already enabled
-	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV_LIB_VIDEO
+	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV3_LIB_VIDEO
 	help
 	  Include opencv_shape (shape descriptors and matchers) module into the
 	  OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_STITCHING
+config BR2_PACKAGE_OPENCV3_LIB_STITCHING
 	bool "stitching"
-	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
-	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
-	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
+	select BR2_PACKAGE_OPENCV3_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV3_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT
 	help
 	  Include opencv_stitching (images stitching) module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_SUPERRES
+config BR2_PACKAGE_OPENCV3_LIB_SUPERRES
 	bool "superres"
-	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV_LIB_VIDEO
+	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV3_LIB_VIDEO
 	help
 	  Include opencv_superres (super resolution) module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_TS
+config BR2_PACKAGE_OPENCV3_LIB_TS
 	bool "ts"
 	# opencv_core dependency is already enabled
-	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
-	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
-	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV_LIB_VIDEOIO
+	select BR2_PACKAGE_OPENCV3_LIB_HIGHGUI
+	select BR2_PACKAGE_OPENCV3_LIB_IMGCODECS
+	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV3_LIB_VIDEOIO
 	help
 	  Include opencv_ts (test) module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_VIDEOIO
+config BR2_PACKAGE_OPENCV3_LIB_VIDEOIO
 	bool "videoio"
-	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
-	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV3_LIB_IMGCODECS
+	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
 	help
 	  Include opencv_videoio (media i/o) module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_VIDEO
+config BR2_PACKAGE_OPENCV3_LIB_VIDEO
 	bool "video"
-	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
 	help
 	  Include opencv_video (video analysis) module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB
+config BR2_PACKAGE_OPENCV3_LIB_VIDEOSTAB
 	bool "videostab"
-	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
-	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
-	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV_LIB_PHOTO
-	select BR2_PACKAGE_OPENCV_LIB_VIDEO
+	select BR2_PACKAGE_OPENCV3_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV3_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV3_LIB_PHOTO
+	select BR2_PACKAGE_OPENCV3_LIB_VIDEO
 	help
 	  Include opencv_videostab (video stabilization) module into the OpenCV
 	  build.
 
 comment "Test sets"
-config BR2_PACKAGE_OPENCV_BUILD_TESTS
+config BR2_PACKAGE_OPENCV3_BUILD_TESTS
 	bool "build tests"
 
-config BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS
+config BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS
 	bool "build performance tests"
 
 comment "3rd party support"
 
-config BR2_PACKAGE_OPENCV_WITH_FFMPEG
+config BR2_PACKAGE_OPENCV3_WITH_FFMPEG
 	bool "ffmpeg support"
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_FFMPEG
@@ -256,10 +256,10 @@ choice
 	help
 	  OpenCV prefers gstreamer-1 over gstreamer-0.10.
 
-config BR2_PACKAGE_OPENCV_WITHOUT_GSTREAMER
+config BR2_PACKAGE_OPENCV3_WITHOUT_GSTREAMER
 	bool "none"
 
-config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
+config BR2_PACKAGE_OPENCV3_WITH_GSTREAMER
 	bool "gstreamer-0.10"
 	depends on BR2_USE_MMU # gstreamer -> libglib2
 	depends on BR2_USE_WCHAR # gstreamer -> libglib2
@@ -272,7 +272,7 @@ comment "gstreamer-0.10 support needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_OPENCV_WITH_GSTREAMER1
+config BR2_PACKAGE_OPENCV3_WITH_GSTREAMER1
 	bool "gstreamer-1.x"
 	depends on BR2_USE_MMU # gstreamer1 -> libglib2
 	depends on BR2_USE_WCHAR # gstreamer1 -> libglib2
@@ -287,7 +287,7 @@ comment "gstreamer-1.x support needs a toolchain w/ wchar, threads"
 
 endchoice
 
-config BR2_PACKAGE_OPENCV_WITH_JASPER
+config BR2_PACKAGE_OPENCV3_WITH_JASPER
 	bool "jpeg2000 support"
 	select BR2_PACKAGE_JASPER
 	help
@@ -297,25 +297,25 @@ config BR2_PACKAGE_OPENCV_WITH_JASPER
 	  but uses the libjasper package installed system-wide by
 	  Buildroot.
 
-config BR2_PACKAGE_OPENCV_WITH_JPEG
+config BR2_PACKAGE_OPENCV3_WITH_JPEG
 	bool "jpeg support"
 	select BR2_PACKAGE_JPEG
 	help
 	  Use shared libjpeg from the target system.
 
-config BR2_PACKAGE_OPENCV_WITH_PNG
+config BR2_PACKAGE_OPENCV3_WITH_PNG
 	bool "png support"
 	select BR2_PACKAGE_LIBPNG
 	help
 	  Use shared libpng from the target system.
 
-config BR2_PACKAGE_OPENCV_WITH_TIFF
+config BR2_PACKAGE_OPENCV3_WITH_TIFF
 	bool "tiff support"
 	select BR2_PACKAGE_TIFF
 	help
 	  Use shared libtiff from the target system.
 
-config BR2_PACKAGE_OPENCV_WITH_V4L
+config BR2_PACKAGE_OPENCV3_WITH_V4L
 	bool "v4l support"
 	help
 	  Enable Video 4 Linux support.
@@ -324,7 +324,7 @@ config BR2_PACKAGE_OPENCV_WITH_V4L
 
 comment "Install options"
 
-config BR2_PACKAGE_OPENCV_INSTALL_DATA
+config BR2_PACKAGE_OPENCV3_INSTALL_DATA
 	bool "install extra data"
 	help
 	  Install various data that is used by cv libraries and/or demo
@@ -335,7 +335,7 @@ config BR2_PACKAGE_OPENCV_INSTALL_DATA
 
 endif # BR2_PACKAGE_OPENCV
 
-comment "opencv needs a toolchain w/ C++, NPTL, wchar, dynamic library"
+comment "opencv3 needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on !BR2_xtensa
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || \
diff --git a/package/opencv/opencv.mk b/package/opencv3/opencv3.mk
similarity index 55%
rename from package/opencv/opencv.mk
rename to package/opencv3/opencv3.mk
index bb1bcd8..3ce78b5 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv3/opencv3.mk
@@ -1,30 +1,30 @@
 ################################################################################
 #
-# opencv
+# opencv3
 #
 ################################################################################
 
-OPENCV_VERSION = 3.0.0
-OPENCV_SITE = $(call github,itseez,opencv,$(OPENCV_VERSION))
-OPENCV_INSTALL_STAGING = YES
-OPENCV_LICENSE = BSD-3c
-OPENCV_LICENSE_FILES = LICENSE
+OPENCV3_VERSION = 3.0.0
+OPENCV3_SITE = $(call github,itseez,opencv,$(OPENCV3_VERSION))
+OPENCV3_INSTALL_STAGING = YES
+OPENCV3_LICENSE = BSD-3c
+OPENCV3_LICENSE_FILES = LICENSE
 
 # OpenCV component options
-OPENCV_CONF_OPTS += \
+OPENCV3_CONF_OPTS += \
 	-DBUILD_DOCS=OFF \
-	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),ON,OFF) \
-	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
+	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS),ON,OFF) \
+	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV3_BUILD_TESTS),ON,OFF) \
 	-DBUILD_WITH_DEBUG_INFO=OFF
 
-ifeq ($(BR2_PACKAGE_OPENCV_BUILD_TESTS)$(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),)
-OPENCV_CONF_OPTS += -DINSTALL_TEST=OFF
+ifeq ($(BR2_PACKAGE_OPENCV3_BUILD_TESTS)$(BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS),)
+OPENCV3_CONF_OPTS += -DINSTALL_TEST=OFF
 else
-OPENCV_CONF_OPTS += -DINSTALL_TEST=ON
+OPENCV3_CONF_OPTS += -DINSTALL_TEST=ON
 endif
 
 # OpenCV build options
-OPENCV_CONF_OPTS += \
+OPENCV3_CONF_OPTS += \
 	-DBUILD_WITH_STATIC_CRT=OFF \
 	-DENABLE_COVERAGE=OFF \
 	-DENABLE_FAST_MATH=ON \
@@ -33,16 +33,16 @@ OPENCV_CONF_OPTS += \
 	-DENABLE_OMIT_FRAME_POINTER=ON \
 	-DENABLE_PRECOMPILED_HEADERS=OFF \
 	-DENABLE_PROFILING=OFF \
-	-DOPENCV_WARNINGS_ARE_ERRORS=OFF
+	-DOPENCV3_WARNINGS_ARE_ERRORS=OFF
 
 # OpenCV link options
-OPENCV_CONF_OPTS += \
+OPENCV3_CONF_OPTS += \
 	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF \
 	-DCMAKE_SKIP_RPATH=OFF \
 	-DCMAKE_USE_RELATIVE_PATHS=OFF
 
 # OpenCV packaging options:
-OPENCV_CONF_OPTS += \
+OPENCV3_CONF_OPTS += \
 	-DBUILD_PACKAGE=OFF \
 	-DENABLE_SOLUTION_FOLDERS=OFF \
 	-DINSTALL_CREATE_DISTRIB=OFF
@@ -60,31 +60,31 @@ OPENCV_CONF_OPTS += \
 #
 # * Contrib modules from [1] are disabled:
 #   - opencv_contrib package is not available in Buildroot;
-#   - OPENCV_EXTRA_MODULES_PATH is not set.
+#   - OPENCV3_EXTRA_MODULES_PATH is not set.
 #
 # [1] https://github.com/Itseez/opencv_contrib
-OPENCV_CONF_OPTS += \
+OPENCV3_CONF_OPTS += \
 	-DBUILD_opencv_androidcamera=OFF \
 	-DBUILD_opencv_apps=OFF \
-	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF) \
+	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV3_LIB_CALIB3D),ON,OFF) \
 	-DBUILD_opencv_core=ON \
-	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV_LIB_FEATURES2D),ON,OFF) \
-	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_LIB_FLANN),ON,OFF) \
+	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV3_LIB_FEATURES2D),ON,OFF) \
+	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV3_LIB_FLANN),ON,OFF) \
 	-DBUILD_opencv_hal=ON \
-	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),ON,OFF) \
-	-DBUILD_opencv_imgcodecs=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGCODECS),ON,OFF) \
-	-DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGPROC),ON,OFF) \
+	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI),ON,OFF) \
+	-DBUILD_opencv_imgcodecs=$(if $(BR2_PACKAGE_OPENCV3_LIB_IMGCODECS),ON,OFF) \
+	-DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV3_LIB_IMGPROC),ON,OFF) \
 	-DBUILD_opencv_java=OFF \
-	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF) \
-	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
-	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF) \
-	-DBUILD_opencv_shape=$(if $(BR2_PACKAGE_OPENCV_LIB_SHAPE),ON,OFF) \
-	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
-	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
-	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF) \
-	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF) \
-	-DBUILD_opencv_videoio=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOIO),ON,OFF) \
-	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
+	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV3_LIB_ML),ON,OFF) \
+	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV3_LIB_OBJDETECT),ON,OFF) \
+	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV3_LIB_PHOTO),ON,OFF) \
+	-DBUILD_opencv_shape=$(if $(BR2_PACKAGE_OPENCV3_LIB_SHAPE),ON,OFF) \
+	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV3_LIB_STITCHING),ON,OFF) \
+	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV3_LIB_SUPERRES),ON,OFF) \
+	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV3_LIB_TS),ON,OFF) \
+	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV3_LIB_VIDEO),ON,OFF) \
+	-DBUILD_opencv_videoio=$(if $(BR2_PACKAGE_OPENCV3_LIB_VIDEOIO),ON,OFF) \
+	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV3_LIB_VIDEOSTAB),ON,OFF) \
 	-DBUILD_opencv_viz=OFF \
 	-DBUILD_opencv_world=OFF
 
@@ -96,7 +96,7 @@ OPENCV_CONF_OPTS += \
 #   is only available on x86_64 haswell, broadwell and knl architecture.
 #
 # [2] https://gcc.gnu.org/onlinedocs/gcc-5.1.0/gcc/x86-Options.html#x86-Options
-OPENCV_CONF_OPTS += \
+OPENCV3_CONF_OPTS += \
 	-DENABLE_AVX=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
 	-DENABLE_AVX2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
 	-DENABLE_FMA3=OFF \
@@ -110,7 +110,7 @@ OPENCV_CONF_OPTS += \
 	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
 
 # Cuda stuff
-OPENCV_CONF_OPTS += \
+OPENCV3_CONF_OPTS += \
 	-DBUILD_CUDA_STUBS=OFF \
 	-DBUILD_opencv_cudaarithm=OFF \
 	-DBUILD_opencv_cudabgsegm=OFF \
@@ -129,15 +129,15 @@ OPENCV_CONF_OPTS += \
 	-DWITH_CUFFT=OFF
 
 # NVidia stuff
-OPENCV_CONF_OPTS += -DWITH_NVCUVID=OFF
+OPENCV3_CONF_OPTS += -DWITH_NVCUVID=OFF
 
 # AMD stuff
-OPENCV_CONF_OPTS += \
+OPENCV3_CONF_OPTS += \
 	-DWITH_OPENCLAMDBLAS=OFF \
 	-DWITH_OPENCLAMDFFT=OFF
 
 # Intel stuff
-OPENCV_CONF_OPTS += \
+OPENCV3_CONF_OPTS += \
 	-DBUILD_WITH_DYNAMIC_IPP=OFF \
 	-DWITH_INTELPERC=OFF \
 	-DWITH_IPP=OFF \
@@ -145,16 +145,16 @@ OPENCV_CONF_OPTS += \
 	-DWITH_TBB=OFF
 
 # Smartek stuff
-OPENCV_CONF_OPTS += -DWITH_GIGEAPI=OFF
+OPENCV3_CONF_OPTS += -DWITH_GIGEAPI=OFF
 
 # Prosilica stuff
-OPENCV_CONF_OPTS += -DWITH_PVAPI=OFF
+OPENCV3_CONF_OPTS += -DWITH_PVAPI=OFF
 
 # Ximea stuff
-OPENCV_CONF_OPTS += -DWITH_XIMEA=OFF
+OPENCV3_CONF_OPTS += -DWITH_XIMEA=OFF
 
 # Non-Linux support (Android options) must remain OFF:
-OPENCV_CONF_OPTS += \
+OPENCV3_CONF_OPTS += \
 	-DANDROID=OFF \
 	-DBUILD_ANDROID_CAMERA_WRAPPER=OFF \
 	-DBUILD_ANDROID_EXAMPLES=OFF \
@@ -164,13 +164,13 @@ OPENCV_CONF_OPTS += \
 	-DWITH_ANDROID_CAMERA=OFF
 
 # Non-Linux support (Mac OSX options) must remain OFF:
-OPENCV_CONF_OPTS += \
+OPENCV3_CONF_OPTS += \
 	-DWITH_AVFOUNDATION=OFF \
 	-DWITH_CARBON=OFF \
 	-DWITH_QUICKTIME=OFF
 
 # Non-Linux support (Windows options) must remain OFF:
-OPENCV_CONF_OPTS += \
+OPENCV3_CONF_OPTS += \
 	-DWITH_CSTRIPES=OFF \
 	-DWITH_DSHOW=OFF \
 	-DWITH_MSMF=OFF \
@@ -181,7 +181,7 @@ OPENCV_CONF_OPTS += \
 
 # Software/3rd-party support options:
 # - disable all examples
-OPENCV_CONF_OPTS += \
+OPENCV3_CONF_OPTS += \
 	-DBUILD_EXAMPLES=OFF \
 	-DBUILD_JASPER=OFF \
 	-DBUILD_JPEG=OFF \
@@ -195,7 +195,7 @@ OPENCV_CONF_OPTS += \
 
 # Disabled features (mostly because they are not available in Buildroot), but
 # - eigen: OpenCV does not use it, not take any benefit from it.
-OPENCV_CONF_OPTS += \
+OPENCV3_CONF_OPTS += \
 	-DWITH_1394=OFF \
 	-DWITH_CLP=OFF \
 	-DWITH_EIGEN=OFF \
@@ -213,106 +213,106 @@ OPENCV_CONF_OPTS += \
 	-DWITH_WEBP=OFF \
 	-DWITH_XINE=OFF
 
-OPENCV_DEPENDENCIES += zlib
+OPENCV3_DEPENDENCIES += zlib
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_FFMPEG),y)
-OPENCV_CONF_OPTS += -DWITH_FFMPEG=ON
-OPENCV_DEPENDENCIES += ffmpeg bzip2
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_FFMPEG),y)
+OPENCV3_CONF_OPTS += -DWITH_FFMPEG=ON
+OPENCV3_DEPENDENCIES += ffmpeg bzip2
 else
-OPENCV_CONF_OPTS += -DWITH_FFMPEG=OFF
+OPENCV3_CONF_OPTS += -DWITH_FFMPEG=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER),y)
-OPENCV_CONF_OPTS += -DWITH_GSTREAMER_0_10=ON
-OPENCV_DEPENDENCIES += gstreamer gst-plugins-base
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GSTREAMER),y)
+OPENCV3_CONF_OPTS += -DWITH_GSTREAMER_0_10=ON
+OPENCV3_DEPENDENCIES += gstreamer gst-plugins-base
 else
-OPENCV_CONF_OPTS += -DWITH_GSTREAMER_0_10=OFF
+OPENCV3_CONF_OPTS += -DWITH_GSTREAMER_0_10=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER1),y)
-OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON
-OPENCV_DEPENDENCIES += gstreamer1 gst1-plugins-base
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GSTREAMER1),y)
+OPENCV3_CONF_OPTS += -DWITH_GSTREAMER=ON
+OPENCV3_DEPENDENCIES += gstreamer1 gst1-plugins-base
 else
-OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF
+OPENCV3_CONF_OPTS += -DWITH_GSTREAMER=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK)$(BR2_PACKAGE_OPENCV_WITH_GTK3),)
-OPENCV_CONF_OPTS += -DWITH_GTK=OFF -DWITH_GTK_2_X=OFF
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GTK)$(BR2_PACKAGE_OPENCV3_WITH_GTK3),)
+OPENCV3_CONF_OPTS += -DWITH_GTK=OFF -DWITH_GTK_2_X=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
-OPENCV_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
-OPENCV_DEPENDENCIES += libgtk2
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GTK),y)
+OPENCV3_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
+OPENCV3_DEPENDENCIES += libgtk2
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK3),y)
-OPENCV_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=OFF
-OPENCV_DEPENDENCIES += libgtk3
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GTK3),y)
+OPENCV3_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=OFF
+OPENCV3_DEPENDENCIES += libgtk3
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_JASPER),y)
-OPENCV_CONF_OPTS += -DWITH_JASPER=ON
-OPENCV_DEPENDENCIES += jasper
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_JASPER),y)
+OPENCV3_CONF_OPTS += -DWITH_JASPER=ON
+OPENCV3_DEPENDENCIES += jasper
 else
-OPENCV_CONF_OPTS += -DWITH_JASPER=OFF
+OPENCV3_CONF_OPTS += -DWITH_JASPER=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_JPEG),y)
-OPENCV_CONF_OPTS += -DWITH_JPEG=ON
-OPENCV_DEPENDENCIES += jpeg
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_JPEG),y)
+OPENCV3_CONF_OPTS += -DWITH_JPEG=ON
+OPENCV3_DEPENDENCIES += jpeg
 else
-OPENCV_CONF_OPTS += -DWITH_JPEG=OFF
+OPENCV3_CONF_OPTS += -DWITH_JPEG=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_OPENGL),y)
-OPENCV_CONF_OPTS += -DWITH_OPENGL=ON
-OPENCV_DEPENDENCIES += libgl
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_OPENGL),y)
+OPENCV3_CONF_OPTS += -DWITH_OPENGL=ON
+OPENCV3_DEPENDENCIES += libgl
 else
-OPENCV_CONF_OPTS += -DWITH_OPENGL=OFF
+OPENCV3_CONF_OPTS += -DWITH_OPENGL=OFF
 endif
 
-OPENCV_CONF_OPTS += -DWITH_OPENMP=$(if $(BR2_GCC_ENABLE_OPENMP),ON,OFF)
+OPENCV3_CONF_OPTS += -DWITH_OPENMP=$(if $(BR2_GCC_ENABLE_OPENMP),ON,OFF)
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_PNG),y)
-OPENCV_CONF_OPTS += -DWITH_PNG=ON
-OPENCV_DEPENDENCIES += libpng
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_PNG),y)
+OPENCV3_CONF_OPTS += -DWITH_PNG=ON
+OPENCV3_DEPENDENCIES += libpng
 else
-OPENCV_CONF_OPTS += -DWITH_PNG=OFF
+OPENCV3_CONF_OPTS += -DWITH_PNG=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT)$(BR2_PACKAGE_OPENCV_WITH_QT5),)
-OPENCV_CONF_OPTS += -DWITH_QT=OFF
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_QT)$(BR2_PACKAGE_OPENCV3_WITH_QT5),)
+OPENCV3_CONF_OPTS += -DWITH_QT=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
-OPENCV_CONF_OPTS += -DWITH_QT=4
-OPENCV_DEPENDENCIES += qt
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_QT),y)
+OPENCV3_CONF_OPTS += -DWITH_QT=4
+OPENCV3_DEPENDENCIES += qt
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT5),y)
-OPENCV_CONF_OPTS += -DWITH_QT=5
-OPENCV_DEPENDENCIES += qt5base
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_QT5),y)
+OPENCV3_CONF_OPTS += -DWITH_QT=5
+OPENCV3_DEPENDENCIES += qt5base
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_TIFF),y)
-OPENCV_CONF_OPTS += -DWITH_TIFF=ON
-OPENCV_DEPENDENCIES += tiff
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_TIFF),y)
+OPENCV3_CONF_OPTS += -DWITH_TIFF=ON
+OPENCV3_DEPENDENCIES += tiff
 else
-OPENCV_CONF_OPTS += -DWITH_TIFF=OFF
+OPENCV3_CONF_OPTS += -DWITH_TIFF=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_V4L),y)
-OPENCV_CONF_OPTS += \
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_V4L),y)
+OPENCV3_CONF_OPTS += \
 	-DWITH_LIBV4L=$(if $(BR2_PACKAGE_LIBV4L),ON,OFF) \
 	-DWITH_V4L=ON
-OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBV4L),libv4l)
+OPENCV3_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBV4L),libv4l)
 else
-OPENCV_CONF_OPTS += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
+OPENCV3_CONF_OPTS += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV_LIB_PYTHON),y)
+ifeq ($(BR2_PACKAGE_OPENCV3_LIB_PYTHON),y)
 ifeq ($(BR2_PACKAGE_PYTHON),y)
-OPENCV_CONF_OPTS += \
+OPENCV3_CONF_OPTS += \
 	-DBUILD_opencv_python2=ON \
 	-DBUILD_opencv_python3=OFF \
 	-DPYTHON2_EXECUTABLE=$(HOST_DIR)/usr/bin/python2 \
@@ -321,9 +321,9 @@ OPENCV_CONF_OPTS += \
 	-DPYTHON2_NUMPY_INCLUDE_DIRS=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/numpy/core/include \
 	-DPYTHON2_PACKAGES_PATH=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
 	-DPYTHON2_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
-OPENCV_DEPENDENCIES += python
+OPENCV3_DEPENDENCIES += python
 else
-OPENCV_CONF_OPTS += \
+OPENCV3_CONF_OPTS += \
 	-DBUILD_opencv_python2=OFF \
 	-DBUILD_opencv_python3=ON \
 	-DPYTHON3_EXECUTABLE=$(HOST_DIR)/usr/bin/python3 \
@@ -332,32 +332,32 @@ OPENCV_CONF_OPTS += \
 	-DPYTHON3_NUMPY_INCLUDE_DIRS=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/core/include \
 	-DPYTHON3_PACKAGES_PATH=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	-DPYTHON3_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
-OPENCV_DEPENDENCIES += python3
+OPENCV3_DEPENDENCIES += python3
 endif
-OPENCV_DEPENDENCIES += python-numpy
+OPENCV3_DEPENDENCIES += python-numpy
 else
-OPENCV_CONF_OPTS += \
+OPENCV3_CONF_OPTS += \
 	-DBUILD_opencv_python2=OFF \
 	-DBUILD_opencv_python3=OFF
 endif
 
 # Installation hooks:
-define OPENCV_CLEAN_INSTALL_DOC
+define OPENCV3_CLEAN_INSTALL_DOC
 	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/doc
 endef
-OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DOC
+OPENCV3_POST_INSTALL_TARGET_HOOKS += OPENCV3_CLEAN_INSTALL_DOC
 
-define OPENCV_CLEAN_INSTALL_CMAKE
+define OPENCV3_CLEAN_INSTALL_CMAKE
 	$(RM) -f $(TARGET_DIR)/usr/share/OpenCV/OpenCVConfig*.cmake
 endef
-OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_CMAKE
+OPENCV3_POST_INSTALL_TARGET_HOOKS += OPENCV3_CLEAN_INSTALL_CMAKE
 
-ifneq ($(BR2_PACKAGE_OPENCV_INSTALL_DATA),y)
-define OPENCV_CLEAN_INSTALL_DATA
+ifneq ($(BR2_PACKAGE_OPENCV3_INSTALL_DATA),y)
+define OPENCV3_CLEAN_INSTALL_DATA
 	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/haarcascades \
 		$(TARGET_DIR)/usr/share/OpenCV/lbpcascades
 endef
-OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DATA
+OPENCV3_POST_INSTALL_TARGET_HOOKS += OPENCV3_CLEAN_INSTALL_DATA
 endif
 
 $(eval $(cmake-package))
diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index 471f4a7..6679cc9 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -11,8 +11,8 @@ config BR2_PACKAGE_VLC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
-	select BR2_PACKAGE_OPENCV_LIB_IMGPROC if BR2_PACKAGE_OPENCV
-	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT if BR2_PACKAGE_OPENCV
+	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC if BR2_PACKAGE_OPENCV3
+	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT if BR2_PACKAGE_OPENCV3
 	help
 	  VLC is a free and open source cross-platform multimedia player
 	  and framework that plays most multimedia files as well as DVD,
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index e408635..fa74a7b 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -153,9 +153,9 @@ else
 VLC_CONF_OPTS += --disable-gles2
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV),y)
+ifeq ($(BR2_PACKAGE_OPENCV3),y)
 VLC_CONF_OPTS += --enable-opencv
-VLC_DEPENDENCIES += opencv
+VLC_DEPENDENCIES += opencv3
 else
 VLC_CONF_OPTS += --disable-opencv
 endif
-- 
1.9.1
