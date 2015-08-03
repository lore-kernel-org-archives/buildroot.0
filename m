From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Mon,  3 Aug 2015 18:28:25 +0300
Subject: [Buildroot] [RFC/PATCH 1/1] opencv2p4: new (old) compatibility
	package
Message-ID: <1438615705-16870-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

opencv2p4 provides an OpenCV version 2.4.x library for applications that
the API changes of OpenCV 3.x break. This package and opencv (3.x) are mutually
exclusive.

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/Config.in              |    1 +
 package/opencv/Config.in       |    3 +
 package/opencv2p4/Config.in    |  347 ++++++++++++++++++++++++++++++++++++++
 package/opencv2p4/opencv2p4.mk |  363 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 714 insertions(+)
 create mode 100644 package/opencv2p4/Config.in
 create mode 100644 package/opencv2p4/opencv2p4.mk

diff --git a/package/Config.in b/package/Config.in
index 1e39c74..5766d96 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -825,6 +825,7 @@ menu "Graphics"
 	source "package/libvips/Config.in"
 	source "package/menu-cache/Config.in"
 	source "package/opencv/Config.in"
+	source "package/opencv2p4/Config.in"
 	source "package/opengl/Config.in"
 	source "package/openjpeg/Config.in"
 	source "package/pango/Config.in"
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 0b5d1ac..8f49f00 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -338,3 +338,6 @@ comment "opencv needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 		!BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_STATIC_LIBS
+
+comment "opencv and opencv2p4 are mutually exclusive"
+	depends on BR2_PACKAGE_OPENCV2P4
diff --git a/package/opencv2p4/Config.in b/package/opencv2p4/Config.in
new file mode 100644
index 0000000..066e742
--- /dev/null
+++ b/package/opencv2p4/Config.in
@@ -0,0 +1,347 @@
+menuconfig BR2_PACKAGE_OPENCV2P4
+	bool "opencv2p4"
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	depends on !BR2_PACKAGE_OPENCV
+	depends on !BR2_STATIC_LIBS # include dlfcn.h
+	help
+	  OpenCV (2.4.x) (Open Source Computer Vision) is a library of
+	  programming functions for real time computer vision.
+
+	  This package is for for legacy applications that OpenCV 3.x breaks.
+
+	  Note that the opencv_core module and the opencv_hal library
+	  are always built and installed, not matter which other
+	  modules are enabled below.
+
+	  http://opencv.org/
+
+if BR2_PACKAGE_OPENCV2P4
+
+comment "OpenCV modules"
+
+config BR2_PACKAGE_OPENCV2P4_LIB_CALIB3D
+	bool "calib3d"
+	select BR2_PACKAGE_OPENCV2P4_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV2P4_LIB_IMGPROC
+	help
+	  Include opencv_calib3d (camera calibration and 3d reconstruction) module
+	  into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV2P4_LIB_FEATURES2D
+	bool "features2d"
+	select BR2_PACKAGE_OPENCV2P4_LIB_FLANN
+	select BR2_PACKAGE_OPENCV2P4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV2P4_LIB_ML
+	help
+	  Include opencv_features2d (2d features framework) module into the OpenCV
+	  build.
+
+config BR2_PACKAGE_OPENCV2P4_LIB_FLANN
+	bool "flann"
+	# opencv_core dependency is already enabled
+	help
+	  Include opencv_flann (clustering and search in multi-dimensional spaces)
+	  module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV2P4_LIB_HIGHGUI
+	bool "highgui"
+	select BR2_PACKAGE_OPENCV2P4_LIB_IMGCODECS
+	select BR2_PACKAGE_OPENCV2P4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV2P4_LIB_VIDEOIO
+	help
+	  Include opencv_highgui (high-level gui and media i/o) module into the
+	  OpenCV build.
+
+if BR2_PACKAGE_OPENCV2P4_LIB_HIGHGUI
+
+choice
+	prompt "gui toolkit"
+	help
+	  GUI toolkit to be used by the opencv_highgui module.
+
+config BR2_PACKAGE_OPENCV2P4_GUI_NONE
+	bool "none"
+
+config BR2_PACKAGE_OPENCV2P4_WITH_GTK
+	bool "gtk2"
+	depends on BR2_PACKAGE_LIBGTK2
+
+comment "gtk2 support needs libgtk2"
+	depends on BR2_USE_MMU # libgtk2 -> glib2
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
+	depends on !BR2_PACKAGE_LIBGTK2
+
+config BR2_PACKAGE_OPENCV2P4_WITH_GTK3
+	bool "gtk3"
+	depends on BR2_PACKAGE_LIBGTK3
+
+comment "gtk3 support needs libgtk3"
+	depends on BR2_USE_MMU # libgtk3 -> glib2
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk3 -> cairo
+	depends on !BR2_PACKAGE_LIBGTK3
+
+config BR2_PACKAGE_OPENCV2P4_WITH_QT
+	bool "qt4"
+	depends on BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT_STL
+	select BR2_PACKAGE_QT_GUI_MODULE
+	select BR2_PACKAGE_QT_TEST
+	help
+	  Use Qt4 with QtTest and QtGui modules and STL support, as GUI toolkit.
+
+comment "qt4 support needs qt"
+	depends on BR2_USE_MMU # qt
+	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
+
+config BR2_PACKAGE_OPENCV2P4_WITH_QT5
+	bool "qt5"
+	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_CONCURRENT
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	help
+	  Use Qt5 with base, concurrent, test, gui and widgets components, as GUI
+	  toolkit.
+
+comment "qt5 support needs qt5"
+	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
+
+endchoice
+
+config BR2_PACKAGE_OPENCV2P4_WITH_OPENGL
+	bool "opengl support"
+	# OpenGL support done using Qt5OpenGL, so depends on WITH_QT5
+	depends on BR2_PACKAGE_OPENCV2P4_WITH_QT5
+	# OpenGL support requires Qt5OpenGL with GL support, not GLES
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_QT5BASE_OPENGL
+	help
+	  Enable OpenGL for UI.
+
+comment "opengl support needs an OpenGL provider"
+	depends on BR2_PACKAGE_OPENCV2P4_WITH_QT5
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE || \
+		!BR2_PACKAGE_HAS_LIBGL
+
+endif # BR2_PACKAGE_OPENCV2P4_LIB_HIGHGUI
+
+
+config BR2_PACKAGE_OPENCV2P4_LIB_IMGCODECS
+	bool "imgcodecs"
+	select BR2_PACKAGE_OPENCV2P4_LIB_IMGPROC
+	help
+	  Include opencv_imgcodecs (image codecs) module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV2P4_LIB_IMGPROC
+	bool "imgproc"
+	# opencv_core dependency is already enabled
+	help
+	  Include opencv_imgproc (image processing) module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV2P4_LIB_ML
+	bool "ml"
+	# opencv_core dependency is already enabled
+	help
+	  Include opencv_ml (machine learning) module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV2P4_LIB_OBJDETECT
+	bool "objdetect"
+	# opencv_core dependency is already enabled
+	select BR2_PACKAGE_OPENCV2P4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV2P4_LIB_ML
+	help
+	  Include opencv_objdetect (object detection) module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV2P4_LIB_PHOTO
+	bool "photo"
+	select BR2_PACKAGE_OPENCV2P4_LIB_IMGPROC
+	help
+	  Include opencv_photo (computational photography) module into the OpenCV
+	  build.
+
+config BR2_PACKAGE_OPENCV2P4_LIB_PYTHON
+	bool "python"
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
+		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
+		|| BR2_sh || BR2_x86_64 # python-numpy
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_i386 || BR2_x86_64 # python-numpy
+	select BR2_PACKAGE_PYTHON_NUMPY
+	help
+	  Include opencv_python module into the OpenCV build.
+	  No python example is installed.
+
+config BR2_PACKAGE_OPENCV2P4_LIB_SHAPE
+	bool "shape"
+	# opencv_core dependency is already enabled
+	select BR2_PACKAGE_OPENCV2P4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV2P4_LIB_VIDEO
+	help
+	  Include opencv_shape (shape descriptors and matchers) module into the
+	  OpenCV build.
+
+config BR2_PACKAGE_OPENCV2P4_LIB_STITCHING
+	bool "stitching"
+	select BR2_PACKAGE_OPENCV2P4_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV2P4_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV2P4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV2P4_LIB_OBJDETECT
+	help
+	  Include opencv_stitching (images stitching) module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV2P4_LIB_SUPERRES
+	bool "superres"
+	select BR2_PACKAGE_OPENCV2P4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV2P4_LIB_VIDEO
+	help
+	  Include opencv_superres (super resolution) module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV2P4_LIB_TS
+	bool "ts"
+	# opencv_core dependency is already enabled
+	select BR2_PACKAGE_OPENCV2P4_LIB_HIGHGUI
+	select BR2_PACKAGE_OPENCV2P4_LIB_IMGCODECS
+	select BR2_PACKAGE_OPENCV2P4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV2P4_LIB_VIDEOIO
+	help
+	  Include opencv_ts (test) module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV2P4_LIB_VIDEOIO
+	bool "videoio"
+	select BR2_PACKAGE_OPENCV2P4_LIB_IMGCODECS
+	select BR2_PACKAGE_OPENCV2P4_LIB_IMGPROC
+	help
+	  Include opencv_videoio (media i/o) module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV2P4_LIB_VIDEO
+	bool "video"
+	select BR2_PACKAGE_OPENCV2P4_LIB_IMGPROC
+	help
+	  Include opencv_video (video analysis) module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV2P4_LIB_VIDEOSTAB
+	bool "videostab"
+	select BR2_PACKAGE_OPENCV2P4_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV2P4_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV2P4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV2P4_LIB_PHOTO
+	select BR2_PACKAGE_OPENCV2P4_LIB_VIDEO
+	help
+	  Include opencv_videostab (video stabilization) module into the OpenCV
+	  build.
+
+comment "Test sets"
+config BR2_PACKAGE_OPENCV2P4_BUILD_TESTS
+	bool "build tests"
+
+config BR2_PACKAGE_OPENCV2P4_BUILD_PERF_TESTS
+	bool "build performance tests"
+
+comment "3rd party support"
+
+config BR2_PACKAGE_OPENCV2P4_WITH_FFMPEG
+	bool "ffmpeg support"
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_SWSCALE
+	help
+	  Use ffmpeg from the target system.
+
+choice
+	prompt "gstreamer support"
+	help
+	  OpenCV prefers gstreamer-1 over gstreamer-0.10.
+
+config BR2_PACKAGE_OPENCV2P4_WITHOUT_GSTREAMER
+	bool "none"
+
+config BR2_PACKAGE_OPENCV2P4_WITH_GSTREAMER
+	bool "gstreamer-0.10"
+	depends on BR2_USE_MMU # gstreamer -> libglib2
+	depends on BR2_USE_WCHAR # gstreamer -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer -> libglib2
+	select BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
+
+comment "gstreamer-0.10 support needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_OPENCV2P4_WITH_GSTREAMER1
+	bool "gstreamer-1.x"
+	depends on BR2_USE_MMU # gstreamer1 -> libglib2
+	depends on BR2_USE_WCHAR # gstreamer1 -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer1 -> libglib2
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+
+comment "gstreamer-1.x support needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+endchoice
+
+config BR2_PACKAGE_OPENCV2P4_WITH_JASPER
+	bool "jpeg2000 support"
+	select BR2_PACKAGE_JASPER
+	help
+	  Enable jpeg2000 support.
+
+	  Note: this does not use the libjasper bundled with opencv,
+	  but uses the libjasper package installed system-wide by
+	  Buildroot.
+
+config BR2_PACKAGE_OPENCV2P4_WITH_JPEG
+	bool "jpeg support"
+	select BR2_PACKAGE_JPEG
+	help
+	  Use shared libjpeg from the target system.
+
+config BR2_PACKAGE_OPENCV2P4_WITH_PNG
+	bool "png support"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  Use shared libpng from the target system.
+
+config BR2_PACKAGE_OPENCV2P4_WITH_TIFF
+	bool "tiff support"
+	select BR2_PACKAGE_TIFF
+	help
+	  Use shared libtiff from the target system.
+
+config BR2_PACKAGE_OPENCV2P4_WITH_V4L
+	bool "v4l support"
+	help
+	  Enable Video 4 Linux support.
+
+	  If the package libv4l is enabled, its support is automatically enabled.
+
+comment "Install options"
+
+config BR2_PACKAGE_OPENCV2P4_INSTALL_DATA
+	bool "install extra data"
+	help
+	  Install various data that is used by cv libraries and/or demo
+	  applications, specifically for haarcascades and lbpcascades
+	  features.
+
+	  For further information: see OpenCV documentation.
+
+endif # BR2_PACKAGE_OPENCV
+
+comment "opencv2p4 needs a toolchain w/ C++, NPTL, wchar, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		BR2_STATIC_LIBS
+
+comment "opencv2p4 and opencv are mutually exclusive"
+	depends on BR2_PACKAGE_OPENCV
+
diff --git a/package/opencv2p4/opencv2p4.mk b/package/opencv2p4/opencv2p4.mk
new file mode 100644
index 0000000..e2b7c90
--- /dev/null
+++ b/package/opencv2p4/opencv2p4.mk
@@ -0,0 +1,363 @@
+################################################################################
+#
+# opencv2p4
+#
+################################################################################
+
+OPENCV2P4_VERSION = 2.4.12
+OPENCV2P4_SITE = $(call github,itseez,opencv,$(OPENCV2P4_VERSION))
+OPENCV2P4_INSTALL_STAGING = YES
+OPENCV2P4_LICENSE = BSD-3c
+OPENCV2P4_LICENSE_FILES = LICENSE
+
+# OpenCV component options
+OPENCV2P4_CONF_OPTS += \
+	-DBUILD_DOCS=OFF \
+	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV2P4_BUILD_PERF_TESTS),ON,OFF) \
+	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV2P4_BUILD_TESTS),ON,OFF) \
+	-DBUILD_WITH_DEBUG_INFO=OFF
+
+ifeq ($(BR2_PACKAGE_OPENCV2P4_BUILD_TESTS)$(BR2_PACKAGE_OPENCV2P4_BUILD_PERF_TESTS),)
+OPENCV2P4_CONF_OPTS += -DINSTALL_TEST=OFF
+else
+OPENCV2P4_CONF_OPTS += -DINSTALL_TEST=ON
+endif
+
+# OpenCV build options
+OPENCV2P4_CONF_OPTS += \
+	-DBUILD_WITH_STATIC_CRT=OFF \
+	-DENABLE_COVERAGE=OFF \
+	-DENABLE_FAST_MATH=ON \
+	-DENABLE_IMPL_COLLECTION=OFF \
+	-DENABLE_NOISY_WARNINGS=OFF \
+	-DENABLE_OMIT_FRAME_POINTER=ON \
+	-DENABLE_PRECOMPILED_HEADERS=OFF \
+	-DENABLE_PROFILING=OFF \
+	-DOPENCV2P4_WARNINGS_ARE_ERRORS=OFF
+
+# OpenCV link options
+OPENCV2P4_CONF_OPTS += \
+	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF \
+	-DCMAKE_SKIP_RPATH=OFF \
+	-DCMAKE_USE_RELATIVE_PATHS=OFF
+
+# OpenCV packaging options:
+OPENCV2P4_CONF_OPTS += \
+	-DBUILD_PACKAGE=OFF \
+	-DENABLE_SOLUTION_FOLDERS=OFF \
+	-DINSTALL_CREATE_DISTRIB=OFF
+
+# OpenCV module selection
+# * Modules on:
+#   - core: if not set, opencv does not build anything
+#   - hal: core's dependency
+# * Modules off:
+#   - android*: android stuff
+#   - apps: programs for training classifiers
+#   - java: java bindings
+#   - viz: missing VTK dependency
+#   - world: all-in-one module
+#
+# * Contrib modules from [1] are disabled:
+#   - opencv_contrib package is not available in Buildroot;
+#   - OPENCV2P4_EXTRA_MODULES_PATH is not set.
+#
+# [1] https://github.com/Itseez/opencv_contrib
+OPENCV2P4_CONF_OPTS += \
+	-DBUILD_opencv_androidcamera=OFF \
+	-DBUILD_opencv_apps=OFF \
+	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV2P4_LIB_CALIB3D),ON,OFF) \
+	-DBUILD_opencv_core=ON \
+	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV2P4_LIB_FEATURES2D),ON,OFF) \
+	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV2P4_LIB_FLANN),ON,OFF) \
+	-DBUILD_opencv_hal=ON \
+	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV2P4_LIB_HIGHGUI),ON,OFF) \
+	-DBUILD_opencv_imgcodecs=$(if $(BR2_PACKAGE_OPENCV2P4_LIB_IMGCODECS),ON,OFF) \
+	-DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV2P4_LIB_IMGPROC),ON,OFF) \
+	-DBUILD_opencv_java=OFF \
+	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV2P4_LIB_ML),ON,OFF) \
+	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV2P4_LIB_OBJDETECT),ON,OFF) \
+	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV2P4_LIB_PHOTO),ON,OFF) \
+	-DBUILD_opencv_shape=$(if $(BR2_PACKAGE_OPENCV2P4_LIB_SHAPE),ON,OFF) \
+	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV2P4_LIB_STITCHING),ON,OFF) \
+	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV2P4_LIB_SUPERRES),ON,OFF) \
+	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV2P4_LIB_TS),ON,OFF) \
+	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV2P4_LIB_VIDEO),ON,OFF) \
+	-DBUILD_opencv_videoio=$(if $(BR2_PACKAGE_OPENCV2P4_LIB_VIDEOIO),ON,OFF) \
+	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV2P4_LIB_VIDEOSTAB),ON,OFF) \
+	-DBUILD_opencv_viz=OFF \
+	-DBUILD_opencv_world=OFF
+
+# Hardware support options.
+#
+# * PowerPC support is turned off since its only effect is altering CFLAGS,
+#   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
+# * fma3 and popcnt support is disabled because according to gcc manual [2], it
+#   is only available on x86_64 haswell, broadwell and knl architecture.
+#
+# [2] https://gcc.gnu.org/onlinedocs/gcc-5.1.0/gcc/x86-Options.html#x86-Options
+OPENCV2P4_CONF_OPTS += \
+	-DENABLE_AVX=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
+	-DENABLE_AVX2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
+	-DENABLE_FMA3=OFF \
+	-DENABLE_POPCNT=OFF \
+	-DENABLE_POWERPC=OFF \
+	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF) \
+	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF) \
+	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF) \
+	-DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF) \
+	-DENABLE_SSE42=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
+	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
+
+# Cuda stuff
+OPENCV2P4_CONF_OPTS += \
+	-DBUILD_CUDA_STUBS=OFF \
+	-DBUILD_opencv_cudaarithm=OFF \
+	-DBUILD_opencv_cudabgsegm=OFF \
+	-DBUILD_opencv_cudacodec=OFF \
+	-DBUILD_opencv_cudafeatures2d=OFF \
+	-DBUILD_opencv_cudafilters=OFF \
+	-DBUILD_opencv_cudaimgproc=OFF \
+	-DBUILD_opencv_cudalegacy=OFF \
+	-DBUILD_opencv_cudaobjdetect=OFF \
+	-DBUILD_opencv_cudaoptflow=OFF \
+	-DBUILD_opencv_cudastereo=OFF \
+	-DBUILD_opencv_cudawarping=OFF \
+	-DBUILD_opencv_cudev=OFF \
+	-DWITH_CUBLAS=OFF \
+	-DWITH_CUDA=OFF \
+	-DWITH_CUFFT=OFF
+
+# NVidia stuff
+OPENCV2P4_CONF_OPTS += -DWITH_NVCUVID=OFF
+
+# AMD stuff
+OPENCV2P4_CONF_OPTS += \
+	-DWITH_OPENCLAMDBLAS=OFF \
+	-DWITH_OPENCLAMDFFT=OFF
+
+# Intel stuff
+OPENCV2P4_CONF_OPTS += \
+	-DBUILD_WITH_DYNAMIC_IPP=OFF \
+	-DWITH_INTELPERC=OFF \
+	-DWITH_IPP=OFF \
+	-DWITH_IPP_A=OFF \
+	-DWITH_TBB=OFF
+
+# Smartek stuff
+OPENCV2P4_CONF_OPTS += -DWITH_GIGEAPI=OFF
+
+# Prosilica stuff
+OPENCV2P4_CONF_OPTS += -DWITH_PVAPI=OFF
+
+# Ximea stuff
+OPENCV2P4_CONF_OPTS += -DWITH_XIMEA=OFF
+
+# Non-Linux support (Android options) must remain OFF:
+OPENCV2P4_CONF_OPTS += \
+	-DANDROID=OFF \
+	-DBUILD_ANDROID_CAMERA_WRAPPER=OFF \
+	-DBUILD_ANDROID_EXAMPLES=OFF \
+	-DBUILD_ANDROID_SERVICE=OFF \
+	-DBUILD_FAT_JAVA_LIB=OFF \
+	-DINSTALL_ANDROID_EXAMPLES=OFF \
+	-DWITH_ANDROID_CAMERA=OFF
+
+# Non-Linux support (Mac OSX options) must remain OFF:
+OPENCV2P4_CONF_OPTS += \
+	-DWITH_AVFOUNDATION=OFF \
+	-DWITH_CARBON=OFF \
+	-DWITH_QUICKTIME=OFF
+
+# Non-Linux support (Windows options) must remain OFF:
+OPENCV2P4_CONF_OPTS += \
+	-DWITH_CSTRIPES=OFF \
+	-DWITH_DSHOW=OFF \
+	-DWITH_MSMF=OFF \
+	-DWITH_PTHREADS_PF=OFF \
+	-DWITH_VFW=OFF \
+	-DWITH_VIDEOINPUT=OFF \
+	-DWITH_WIN32UI=OFF
+
+# Software/3rd-party support options:
+# - disable all examples
+OPENCV2P4_CONF_OPTS += \
+	-DBUILD_EXAMPLES=OFF \
+	-DBUILD_JASPER=OFF \
+	-DBUILD_JPEG=OFF \
+	-DBUILD_OPENEXR=OFF \
+	-DBUILD_PNG=OFF \
+	-DBUILD_TIFF=OFF \
+	-DBUILD_ZLIB=OFF \
+	-DINSTALL_C_EXAMPLES=OFF \
+	-DINSTALL_PYTHON_EXAMPLES=OFF \
+	-DINSTALL_TO_MANGLED_PATHS=OFF
+
+# Disabled features (mostly because they are not available in Buildroot), but
+# - eigen: OpenCV does not use it, not take any benefit from it.
+OPENCV2P4_CONF_OPTS += \
+	-DWITH_1394=OFF \
+	-DWITH_CLP=OFF \
+	-DWITH_EIGEN=OFF \
+	-DWITH_GDAL=OFF \
+	-DWITH_GPHOTO2=OFF \
+	-DWITH_OPENCL=OFF \
+	-DWITH_OPENCL_SVM=OFF \
+	-DWITH_OPENEXR=OFF \
+	-DWITH_OPENGL=OFF \
+	-DWITH_OPENMP=OFF \
+	-DWITH_OPENNI2=OFF \
+	-DWITH_OPENNI=OFF \
+	-DWITH_UNICAP=OFF \
+	-DWITH_VTK=OFF \
+	-DWITH_WEBP=OFF \
+	-DWITH_XINE=OFF
+
+OPENCV2P4_DEPENDENCIES += zlib
+
+ifeq ($(BR2_PACKAGE_OPENCV2P4_WITH_FFMPEG),y)
+OPENCV2P4_CONF_OPTS += -DWITH_FFMPEG=ON
+OPENCV2P4_DEPENDENCIES += ffmpeg bzip2
+else
+OPENCV2P4_CONF_OPTS += -DWITH_FFMPEG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV2P4_WITH_GSTREAMER),y)
+OPENCV2P4_CONF_OPTS += -DWITH_GSTREAMER_0_10=ON
+OPENCV2P4_DEPENDENCIES += gstreamer gst-plugins-base
+else
+OPENCV2P4_CONF_OPTS += -DWITH_GSTREAMER_0_10=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV2P4_WITH_GSTREAMER1),y)
+OPENCV2P4_CONF_OPTS += -DWITH_GSTREAMER=ON
+OPENCV2P4_DEPENDENCIES += gstreamer1 gst1-plugins-base
+else
+OPENCV2P4_CONF_OPTS += -DWITH_GSTREAMER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV2P4_WITH_GTK)$(BR2_PACKAGE_OPENCV2P4_WITH_GTK3),)
+OPENCV2P4_CONF_OPTS += -DWITH_GTK=OFF -DWITH_GTK_2_X=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV2P4_WITH_GTK),y)
+OPENCV2P4_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
+OPENCV2P4_DEPENDENCIES += libgtk2
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV2P4_WITH_GTK3),y)
+OPENCV2P4_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=OFF
+OPENCV2P4_DEPENDENCIES += libgtk3
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV2P4_WITH_JASPER),y)
+OPENCV2P4_CONF_OPTS += -DWITH_JASPER=ON
+OPENCV2P4_DEPENDENCIES += jasper
+else
+OPENCV2P4_CONF_OPTS += -DWITH_JASPER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV2P4_WITH_JPEG),y)
+OPENCV2P4_CONF_OPTS += -DWITH_JPEG=ON
+OPENCV2P4_DEPENDENCIES += jpeg
+else
+OPENCV2P4_CONF_OPTS += -DWITH_JPEG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV2P4_WITH_OPENGL),y)
+OPENCV2P4_CONF_OPTS += -DWITH_OPENGL=ON
+OPENCV2P4_DEPENDENCIES += libgl
+else
+OPENCV2P4_CONF_OPTS += -DWITH_OPENGL=OFF
+endif
+
+OPENCV2P4_CONF_OPTS += -DWITH_OPENMP=$(if $(BR2_GCC_ENABLE_OPENMP),ON,OFF)
+
+ifeq ($(BR2_PACKAGE_OPENCV2P4_WITH_PNG),y)
+OPENCV2P4_CONF_OPTS += -DWITH_PNG=ON
+OPENCV2P4_DEPENDENCIES += libpng
+else
+OPENCV2P4_CONF_OPTS += -DWITH_PNG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV2P4_WITH_QT)$(BR2_PACKAGE_OPENCV2P4_WITH_QT5),)
+OPENCV2P4_CONF_OPTS += -DWITH_QT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV2P4_WITH_QT),y)
+OPENCV2P4_CONF_OPTS += -DWITH_QT=4
+OPENCV2P4_DEPENDENCIES += qt
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV2P4_WITH_QT5),y)
+OPENCV2P4_CONF_OPTS += -DWITH_QT=5
+OPENCV2P4_DEPENDENCIES += qt5base
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV2P4_WITH_TIFF),y)
+OPENCV2P4_CONF_OPTS += -DWITH_TIFF=ON
+OPENCV2P4_DEPENDENCIES += tiff
+else
+OPENCV2P4_CONF_OPTS += -DWITH_TIFF=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV2P4_WITH_V4L),y)
+OPENCV2P4_CONF_OPTS += \
+	-DWITH_LIBV4L=$(if $(BR2_PACKAGE_LIBV4L),ON,OFF) \
+	-DWITH_V4L=ON
+OPENCV2P4_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBV4L),libv4l)
+else
+OPENCV2P4_CONF_OPTS += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV2P4_LIB_PYTHON),y)
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+OPENCV2P4_CONF_OPTS += \
+	-DBUILD_opencv_python2=ON \
+	-DBUILD_opencv_python3=OFF \
+	-DPYTHON2_EXECUTABLE=$(HOST_DIR)/usr/bin/python2 \
+	-DPYTHON2_INCLUDE_PATH=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
+	-DPYTHON2_LIBRARIES=$(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so \
+	-DPYTHON2_NUMPY_INCLUDE_DIRS=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/numpy/core/include \
+	-DPYTHON2_PACKAGES_PATH=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	-DPYTHON2_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
+OPENCV2P4_DEPENDENCIES += python
+else
+OPENCV2P4_CONF_OPTS += \
+	-DBUILD_opencv_python2=OFF \
+	-DBUILD_opencv_python3=ON \
+	-DPYTHON3_EXECUTABLE=$(HOST_DIR)/usr/bin/python3 \
+	-DPYTHON3_INCLUDE_PATH=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m \
+	-DPYTHON3_LIBRARIES=$(STAGING_DIR)/usr/lib/libpython$(PYTHON3_VERSION_MAJOR)m.so \
+	-DPYTHON3_NUMPY_INCLUDE_DIRS=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/core/include \
+	-DPYTHON3_PACKAGES_PATH=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	-DPYTHON3_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
+OPENCV2P4_DEPENDENCIES += python3
+endif
+OPENCV2P4_DEPENDENCIES += python-numpy
+else
+OPENCV2P4_CONF_OPTS += \
+	-DBUILD_opencv_python2=OFF \
+	-DBUILD_opencv_python3=OFF
+endif
+
+# Installation hooks:
+define OPENCV2P4_CLEAN_INSTALL_DOC
+	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/doc
+endef
+OPENCV2P4_POST_INSTALL_TARGET_HOOKS += OPENCV2P4_CLEAN_INSTALL_DOC
+
+define OPENCV2P4_CLEAN_INSTALL_CMAKE
+	$(RM) -f $(TARGET_DIR)/usr/share/OpenCV/OpenCVConfig*.cmake
+endef
+OPENCV2P4_POST_INSTALL_TARGET_HOOKS += OPENCV2P4_CLEAN_INSTALL_CMAKE
+
+ifneq ($(BR2_PACKAGE_OPENCV2P4_INSTALL_DATA),y)
+define OPENCV2P4_CLEAN_INSTALL_DATA
+	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/haarcascades \
+		$(TARGET_DIR)/usr/share/OpenCV/lbpcascades
+endef
+OPENCV2P4_POST_INSTALL_TARGET_HOOKS += OPENCV2P4_CLEAN_INSTALL_DATA
+endif
+
+$(eval $(cmake-package))
-- 
1.7.9.5
