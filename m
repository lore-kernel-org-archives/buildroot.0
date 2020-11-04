From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  4 Nov 2020 08:37:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/opencv4: new package
Message-ID: <20201104073737.489906-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

opencv4 is not fully backward compatible with opencv3 as "a lot of C API
from OpenCV 1.x has been removed.": https://opencv.org/opencv-4-0.

Moreover, it should be noted that layout of include files as well as
pkg-config filename changed since
https://github.com/opencv/opencv/commit/a95673287433fc810eda2d88b94bb234298c4cd5

All these changes mean that most of buildroot packages (e.g. vlc,
ffmpeg) are not compatible with opencv4.

Here is the most important changes between opencv3 and opencv 4.5.0:
 - License is Apache-2.0 (https://opencv.org/opencv-4-5-0)
 - openjpeg is an optional dependency (enabled by default) since
   https://github.com/opencv/opencv/commit/0384eb7d8c1a31831704e31b8bdbfbc6ff854281
   jpeg2000 can be enabled through openjpeg or jasper
 - pkg-config must be enabled with OPENCV_GENERATE_PKGCONFIG since
   https://github.com/opencv/opencv/commit/e755a2a6e48ae02dd5136a628cc4148566a08225
 - cmake is not installed in /usr/share anymore so hook can be dropped

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                   |   1 +
 package/Config.in            |   1 +
 package/opencv4/Config.in    | 362 +++++++++++++++++++++++++++++++++
 package/opencv4/opencv4.hash |   3 +
 package/opencv4/opencv4.mk   | 375 +++++++++++++++++++++++++++++++++++
 5 files changed, 742 insertions(+)
 create mode 100644 package/opencv4/Config.in
 create mode 100644 package/opencv4/opencv4.hash
 create mode 100644 package/opencv4/opencv4.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 91a687b657..6899acee1e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -864,6 +864,7 @@ F:	package/motion/
 F:	package/mutt/
 F:	package/ncmpc/
 F:	package/oniguruma/
+F:	package/opencv4/
 F:	package/oprofile/
 F:	package/pcmanfm/
 F:	package/python-backcall/
diff --git a/package/Config.in b/package/Config.in
index 7228203cae..024c9b3567 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1476,6 +1476,7 @@ menu "Graphics"
 	source "package/libwpe/Config.in"
 	source "package/menu-cache/Config.in"
 	source "package/opencv3/Config.in"
+	source "package/opencv4/Config.in"
 	source "package/opengl/Config.in"
 	source "package/openjpeg/Config.in"
 	source "package/pango/Config.in"
diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
new file mode 100644
index 0000000000..361278fc45
--- /dev/null
+++ b/package/opencv4/Config.in
@@ -0,0 +1,362 @@
+menuconfig BR2_PACKAGE_OPENCV4
+	bool "opencv4"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	depends on !BR2_STATIC_LIBS # include dlfcn.h
+	depends on !BR2_PACKAGE_OPENCV3
+	select BR2_PACKAGE_ZLIB
+	help
+	  OpenCV (Open Source Computer Vision) is a library of
+	  programming functions for real time computer vision.
+
+	  Note that the opencv_core module and the opencv_hal library
+	  are always built and installed, not matter which other
+	  modules are enabled below.
+
+	  http://opencv.org/
+
+if BR2_PACKAGE_OPENCV4
+
+comment "OpenCV modules"
+
+config BR2_PACKAGE_OPENCV4_LIB_CALIB3D
+	bool "calib3d"
+	select BR2_PACKAGE_OPENCV4_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
+	help
+	  Include opencv_calib3d (camera calibration and 3d
+	  reconstruction) module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV4_LIB_FEATURES2D
+	bool "features2d"
+	select BR2_PACKAGE_OPENCV4_LIB_FLANN
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV4_LIB_ML
+	help
+	  Include opencv_features2d (2d features framework) module
+	  into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV4_LIB_FLANN
+	bool "flann"
+	# opencv_core dependency is already enabled
+	help
+	  Include opencv_flann (clustering and search in
+	  multi-dimensional spaces) module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV4_LIB_HIGHGUI
+	bool "highgui"
+	select BR2_PACKAGE_OPENCV4_LIB_IMGCODECS
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV4_LIB_VIDEOIO
+	help
+	  Include opencv_highgui (high-level gui and media i/o) module
+	  into the OpenCV build.
+
+if BR2_PACKAGE_OPENCV4_LIB_HIGHGUI
+
+choice
+	prompt "gui toolkit"
+	help
+	  GUI toolkit to be used by the opencv_highgui module.
+
+config BR2_PACKAGE_OPENCV4_GUI_NONE
+	bool "none"
+
+config BR2_PACKAGE_OPENCV4_WITH_GTK
+	bool "gtk2"
+	depends on BR2_PACKAGE_LIBGTK2
+
+comment "gtk2 support needs libgtk2"
+	depends on BR2_USE_MMU # libgtk2 -> glib2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_LIBGTK2
+
+config BR2_PACKAGE_OPENCV4_WITH_GTK3
+	bool "gtk3"
+	depends on BR2_PACKAGE_LIBGTK3
+
+comment "gtk3 support needs libgtk3"
+	depends on BR2_USE_MMU # libgtk3 -> glib2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_LIBGTK3
+
+config BR2_PACKAGE_OPENCV4_WITH_QT5
+	bool "qt5"
+	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_CONCURRENT
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	help
+	  Use Qt5 with base, concurrent, test, gui and widgets
+	  components, as GUI toolkit.
+
+comment "qt5 support needs qt5"
+	depends on !BR2_PACKAGE_QT5
+
+endchoice
+
+config BR2_PACKAGE_OPENCV4_WITH_OPENGL
+	bool "opengl support"
+	# OpenGL support done using Qt5OpenGL, so depends on WITH_QT5
+	depends on BR2_PACKAGE_OPENCV4_WITH_QT5
+	# OpenGL support requires Qt5OpenGL with GL support, not GLES
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_QT5BASE_OPENGL
+	help
+	  Enable OpenGL for UI.
+
+comment "opengl support needs an OpenGL provider"
+	depends on BR2_PACKAGE_OPENCV4_WITH_QT5
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE || \
+		!BR2_PACKAGE_HAS_LIBGL
+
+endif # BR2_PACKAGE_OPENCV4_LIB_HIGHGUI
+
+config BR2_PACKAGE_OPENCV4_LIB_IMGCODECS
+	bool "imgcodecs"
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
+	help
+	  Include opencv_imgcodecs (image codecs) module into the
+	  OpenCV build.
+
+config BR2_PACKAGE_OPENCV4_LIB_IMGPROC
+	bool "imgproc"
+	# opencv_core dependency is already enabled
+	help
+	  Include opencv_imgproc (image processing) module into the
+	  OpenCV build.
+
+config BR2_PACKAGE_OPENCV4_LIB_ML
+	bool "ml"
+	# opencv_core dependency is already enabled
+	help
+	  Include opencv_ml (machine learning) module into the OpenCV
+	  build.
+
+config BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
+	bool "objdetect"
+	# opencv_core dependency is already enabled
+	select BR2_PACKAGE_OPENCV4_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV4_LIB_ML
+	help
+	  Include opencv_objdetect (object detection) module into the
+	  OpenCV build.
+
+config BR2_PACKAGE_OPENCV4_LIB_PHOTO
+	bool "photo"
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
+	help
+	  Include opencv_photo (computational photography) module into
+	  the OpenCV build.
+
+config BR2_PACKAGE_OPENCV4_LIB_PYTHON
+	bool "python"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	select BR2_PACKAGE_PYTHON_NUMPY
+	help
+	  Include opencv_python module into the OpenCV build.  No
+	  python example is installed.
+
+comment "python support needs glibc or musl"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+
+config BR2_PACKAGE_OPENCV4_LIB_SHAPE
+	bool "shape"
+	# opencv_core dependency is already enabled
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV4_LIB_VIDEO
+	help
+	  Include opencv_shape (shape descriptors and matchers) module
+	  into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV4_LIB_STITCHING
+	bool "stitching"
+	select BR2_PACKAGE_OPENCV4_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV4_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
+	help
+	  Include opencv_stitching (images stitching) module into the
+	  OpenCV build.
+
+config BR2_PACKAGE_OPENCV4_LIB_SUPERRES
+	bool "superres"
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV4_LIB_VIDEO
+	help
+	  Include opencv_superres (super resolution) module into the
+	  OpenCV build.
+
+config BR2_PACKAGE_OPENCV4_LIB_TS
+	bool "ts"
+	# opencv_core dependency is already enabled
+	select BR2_PACKAGE_OPENCV4_LIB_HIGHGUI
+	select BR2_PACKAGE_OPENCV4_LIB_IMGCODECS
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV4_LIB_VIDEOIO
+	help
+	  Include opencv_ts (test) module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV4_LIB_VIDEOIO
+	bool "videoio"
+	select BR2_PACKAGE_OPENCV4_LIB_IMGCODECS
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
+	help
+	  Include opencv_videoio (media i/o) module into the OpenCV
+	  build.
+
+config BR2_PACKAGE_OPENCV4_LIB_VIDEO
+	bool "video"
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
+	help
+	  Include opencv_video (video analysis) module into the OpenCV
+	  build.
+
+config BR2_PACKAGE_OPENCV4_LIB_VIDEOSTAB
+	bool "videostab"
+	select BR2_PACKAGE_OPENCV4_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV4_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV4_LIB_PHOTO
+	select BR2_PACKAGE_OPENCV4_LIB_VIDEO
+	help
+	  Include opencv_videostab (video stabilization) module into
+	  the OpenCV build.
+
+comment "Test sets"
+config BR2_PACKAGE_OPENCV4_BUILD_TESTS
+	bool "build tests"
+
+config BR2_PACKAGE_OPENCV4_BUILD_PERF_TESTS
+	bool "build performance tests"
+
+comment "3rd party support"
+
+config BR2_PACKAGE_OPENCV4_WITH_FFMPEG
+	bool "ffmpeg support"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
+	select BR2_PACKAGE_FFMPEG_SWSCALE
+	help
+	  Use ffmpeg from the target system.
+
+config BR2_PACKAGE_OPENCV4_WITH_GSTREAMER1
+	bool "gstreamer-1.x"
+	depends on BR2_USE_MMU # gstreamer1 -> libglib2
+	depends on BR2_USE_WCHAR # gstreamer1 -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer1 -> libglib2
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+	help
+	  Enable gstreamer support.
+
+comment "gstreamer support needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+choice
+	prompt "jpeg2000 support"
+	help
+	  Select the desired jpeg2000 library provider.
+
+config BR2_PACKAGE_OPENCV4_JPEG2000_NONE
+	bool "none"
+
+config BR2_PACKAGE_OPENCV4_JPEG2000_WITH_JASPER
+	bool "jasper"
+	select BR2_PACKAGE_JASPER
+	help
+	  Enable jpeg2000 support through jasper.
+
+	  Note: this does not use the libjasper bundled with opencv,
+	  but uses the libjasper package installed system-wide by
+	  Buildroot.
+
+config BR2_PACKAGE_OPENCV4_JPEG2000_WITH_OPENJPEG
+	bool "openjpeg"
+	select BR2_PACKAGE_OPENJPEG
+	help
+	  Enable jpeg2000 support through openjpeg.
+
+	  Note: this does not use the openjpeg bundled with opencv,
+	  but uses the openjpeg package installed system-wide by
+	  Buildroot.
+
+endchoice
+
+config BR2_PACKAGE_OPENCV4_WITH_JPEG
+	bool "jpeg support"
+	select BR2_PACKAGE_JPEG
+	help
+	  Use shared libjpeg from the target system.
+
+config BR2_PACKAGE_OPENCV4_WITH_PNG
+	bool "png support"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  Use shared libpng from the target system.
+
+config BR2_PACKAGE_OPENCV4_WITH_PROTOBUF
+	bool "protobuf support"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	select BR2_PACKAGE_PROTOBUF
+	help
+	  Use shared protobuf from the target system.
+
+comment "protobuf support needs a toolchain w/ gcc >= 4.8"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+config BR2_PACKAGE_OPENCV4_WITH_TIFF
+	bool "tiff support"
+	select BR2_PACKAGE_TIFF
+	help
+	  Use shared libtiff from the target system.
+
+config BR2_PACKAGE_OPENCV4_WITH_V4L
+	bool "v4l support"
+	help
+	  Enable Video 4 Linux support.
+
+	  If the package libv4l is enabled, its support is
+	  automatically enabled.
+
+config BR2_PACKAGE_OPENCV4_WITH_WEBP
+	bool "webp support"
+	select BR2_PACKAGE_WEBP
+	help
+	  Enable WebP support.
+
+	  Use shared libwebp from the target system.
+
+comment "Install options"
+
+config BR2_PACKAGE_OPENCV4_INSTALL_DATA
+	bool "install extra data"
+	help
+	  Install various data that is used by cv libraries and/or
+	  demo applications, specifically for haarcascades and
+	  lbpcascades features.
+
+	  For further information: see OpenCV documentation.
+
+endif # BR2_PACKAGE_OPENCV4
+
+comment "opencv4 needs a toolchain w/ C++, NPTL, wchar, dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		BR2_STATIC_LIBS
diff --git a/package/opencv4/opencv4.hash b/package/opencv4/opencv4.hash
new file mode 100644
index 0000000000..0e904f6a0f
--- /dev/null
+++ b/package/opencv4/opencv4.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  dde4bf8d6639a5d3fe34d5515eab4a15669ded609a1d622350c7ff20dace1907  opencv4-4.5.0.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
new file mode 100644
index 0000000000..1526cc8275
--- /dev/null
+++ b/package/opencv4/opencv4.mk
@@ -0,0 +1,375 @@
+################################################################################
+#
+# opencv4
+#
+################################################################################
+
+OPENCV4_VERSION = 4.5.0
+OPENCV4_SITE = $(call github,opencv,opencv,$(OPENCV4_VERSION))
+OPENCV4_INSTALL_STAGING = YES
+OPENCV4_LICENSE = Apache-2.0
+OPENCV4_LICENSE_FILES = LICENSE
+OPENCV4_SUPPORTS_IN_SOURCE_BUILD = NO
+
+OPENCV4_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+OPENCV4_CXXFLAGS += -latomic
+endif
+
+# Fix c++11 build with missing std::exception_ptr
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_64735),y)
+OPENCV4_CXXFLAGS += -DCV__EXCEPTION_PTR=0
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+OPENCV4_CXXFLAGS += -O0
+endif
+
+# OpenCV component options
+OPENCV4_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="$(OPENCV4_CXXFLAGS)" \
+	-DBUILD_DOCS=OFF \
+	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV4_BUILD_PERF_TESTS),ON,OFF) \
+	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV4_BUILD_TESTS),ON,OFF) \
+	-DBUILD_WITH_DEBUG_INFO=OFF \
+	-DDOWNLOAD_EXTERNAL_TEST_DATA=OFF \
+	-DOPENCV_GENERATE_PKGCONFIG=ON \
+	-DOPENCV_ENABLE_PKG_CONFIG=ON
+
+ifeq ($(BR2_PACKAGE_OPENCV4_BUILD_TESTS)$(BR2_PACKAGE_OPENCV4_BUILD_PERF_TESTS),)
+OPENCV4_CONF_OPTS += -DINSTALL_TEST=OFF
+else
+OPENCV4_CONF_OPTS += -DINSTALL_TEST=ON
+endif
+
+# OpenCV build options
+OPENCV4_CONF_OPTS += \
+	-DBUILD_WITH_STATIC_CRT=OFF \
+	-DENABLE_COVERAGE=OFF \
+	-DENABLE_FAST_MATH=ON \
+	-DENABLE_IMPL_COLLECTION=OFF \
+	-DENABLE_NOISY_WARNINGS=OFF \
+	-DENABLE_OMIT_FRAME_POINTER=ON \
+	-DENABLE_PRECOMPILED_HEADERS=OFF \
+	-DENABLE_PROFILING=OFF \
+	-DOPENCV_WARNINGS_ARE_ERRORS=OFF
+
+# OpenCV link options
+OPENCV4_CONF_OPTS += \
+	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF \
+	-DCMAKE_SKIP_RPATH=OFF \
+	-DCMAKE_USE_RELATIVE_PATHS=OFF
+
+# OpenCV packaging options:
+OPENCV4_CONF_OPTS += \
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
+#   - OPENCV_EXTRA_MODULES_PATH is not set.
+#
+# [1] https://github.com/Itseez/opencv_contrib
+OPENCV4_CONF_OPTS += \
+	-DBUILD_opencv_androidcamera=OFF \
+	-DBUILD_opencv_apps=OFF \
+	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV4_LIB_CALIB3D),ON,OFF) \
+	-DBUILD_opencv_core=ON \
+	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV4_LIB_FEATURES2D),ON,OFF) \
+	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV4_LIB_FLANN),ON,OFF) \
+	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV4_LIB_HIGHGUI),ON,OFF) \
+	-DBUILD_opencv_imgcodecs=$(if $(BR2_PACKAGE_OPENCV4_LIB_IMGCODECS),ON,OFF) \
+	-DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV4_LIB_IMGPROC),ON,OFF) \
+	-DBUILD_opencv_java=OFF \
+	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV4_LIB_ML),ON,OFF) \
+	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV4_LIB_OBJDETECT),ON,OFF) \
+	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV4_LIB_PHOTO),ON,OFF) \
+	-DBUILD_opencv_shape=$(if $(BR2_PACKAGE_OPENCV4_LIB_SHAPE),ON,OFF) \
+	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV4_LIB_STITCHING),ON,OFF) \
+	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV4_LIB_SUPERRES),ON,OFF) \
+	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV4_LIB_TS),ON,OFF) \
+	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV4_LIB_VIDEO),ON,OFF) \
+	-DBUILD_opencv_videoio=$(if $(BR2_PACKAGE_OPENCV4_LIB_VIDEOIO),ON,OFF) \
+	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV4_LIB_VIDEOSTAB),ON,OFF) \
+	-DBUILD_opencv_viz=OFF \
+	-DBUILD_opencv_world=OFF
+
+# Hardware support options.
+#
+# * PowerPC and VFPv3 support are turned off since their only effects
+#   are altering CFLAGS, adding '-mcpu=G3 -mtune=G5' or '-mfpu=vfpv3'
+#   to them, which is already handled by Buildroot.
+# * NEON logic is needed as it is not only used to add CFLAGS, but
+#   also to enable additional NEON code.
+OPENCV4_CONF_OPTS += \
+	-DENABLE_POWERPC=OFF \
+	-DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF) \
+	-DENABLE_VFPV3=OFF
+
+# Cuda stuff
+OPENCV4_CONF_OPTS += \
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
+OPENCV4_CONF_OPTS += -DWITH_NVCUVID=OFF
+
+# AMD stuff
+OPENCV4_CONF_OPTS += \
+	-DWITH_OPENCLAMDBLAS=OFF \
+	-DWITH_OPENCLAMDFFT=OFF
+
+# Intel stuff
+OPENCV4_CONF_OPTS += \
+	-DBUILD_WITH_DYNAMIC_IPP=OFF \
+	-DWITH_INTELPERC=OFF \
+	-DWITH_IPP=OFF \
+	-DWITH_IPP_A=OFF \
+	-DWITH_TBB=OFF
+
+# Smartek stuff
+OPENCV4_CONF_OPTS += -DWITH_GIGEAPI=OFF
+
+# Prosilica stuff
+OPENCV4_CONF_OPTS += -DWITH_PVAPI=OFF
+
+# Ximea stuff
+OPENCV4_CONF_OPTS += -DWITH_XIMEA=OFF
+
+# Non-Linux support (Android options) must remain OFF:
+OPENCV4_CONF_OPTS += \
+	-DANDROID=OFF \
+	-DBUILD_ANDROID_CAMERA_WRAPPER=OFF \
+	-DBUILD_ANDROID_EXAMPLES=OFF \
+	-DBUILD_ANDROID_SERVICE=OFF \
+	-DBUILD_FAT_JAVA_LIB=OFF \
+	-DINSTALL_ANDROID_EXAMPLES=OFF \
+	-DWITH_ANDROID_CAMERA=OFF
+
+# Non-Linux support (Mac OSX options) must remain OFF:
+OPENCV4_CONF_OPTS += \
+	-DWITH_AVFOUNDATION=OFF \
+	-DWITH_CARBON=OFF \
+	-DWITH_QUICKTIME=OFF
+
+# Non-Linux support (Windows options) must remain OFF:
+OPENCV4_CONF_OPTS += \
+	-DWITH_CSTRIPES=OFF \
+	-DWITH_DSHOW=OFF \
+	-DWITH_MSMF=OFF \
+	-DWITH_VFW=OFF \
+	-DWITH_VIDEOINPUT=OFF \
+	-DWITH_WIN32UI=OFF
+
+# Software/3rd-party support options:
+# - disable all examples
+OPENCV4_CONF_OPTS += \
+	-DBUILD_EXAMPLES=OFF \
+	-DBUILD_JASPER=OFF \
+	-DBUILD_JPEG=OFF \
+	-DBUILD_OPENEXR=OFF \
+	-DBUILD_OPENJPEG=OFF \
+	-DBUILD_PNG=OFF \
+	-DBUILD_PROTOBUF=OFF \
+	-DBUILD_TIFF=OFF \
+	-DBUILD_ZLIB=OFF \
+	-DINSTALL_C_EXAMPLES=OFF \
+	-DINSTALL_PYTHON_EXAMPLES=OFF \
+	-DINSTALL_TO_MANGLED_PATHS=OFF
+
+# Disabled features (mostly because they are not available in Buildroot), but
+# - eigen: OpenCV does not use it, not take any benefit from it.
+OPENCV4_CONF_OPTS += \
+	-DWITH_1394=OFF \
+	-DWITH_CLP=OFF \
+	-DWITH_EIGEN=OFF \
+	-DWITH_GDAL=OFF \
+	-DWITH_GPHOTO2=OFF \
+	-DWITH_GSTREAMER_0_10=OFF \
+	-DWITH_LAPACK=OFF \
+	-DWITH_MATLAB=OFF \
+	-DWITH_OPENCL=OFF \
+	-DWITH_OPENCL_SVM=OFF \
+	-DWITH_OPENEXR=OFF \
+	-DWITH_OPENNI2=OFF \
+	-DWITH_OPENNI=OFF \
+	-DWITH_UNICAP=OFF \
+	-DWITH_VA=OFF \
+	-DWITH_VA_INTEL=OFF \
+	-DWITH_VTK=OFF \
+	-DWITH_XINE=OFF
+
+OPENCV4_DEPENDENCIES += host-pkgconf zlib
+
+ifeq ($(BR2_PACKAGE_OPENCV4_JPEG2000_WITH_JASPER),y)
+OPENCV4_CONF_OPTS += -DWITH_JASPER=ON
+OPENCV4_DEPENDENCIES += jasper
+else
+OPENCV4_CONF_OPTS += -DWITH_JASPER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV4_JPEG2000_WITH_OPENJPEG),y)
+OPENCV4_CONF_OPTS += -DWITH_OPENJPEG=ON
+OPENCV4_DEPENDENCIES += openjpeg
+else
+OPENCV4_CONF_OPTS += -DWITH_OPENJPEG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV4_WITH_FFMPEG),y)
+OPENCV4_CONF_OPTS += -DWITH_FFMPEG=ON
+OPENCV4_DEPENDENCIES += ffmpeg bzip2
+else
+OPENCV4_CONF_OPTS += -DWITH_FFMPEG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV4_WITH_GSTREAMER1),y)
+OPENCV4_CONF_OPTS += -DWITH_GSTREAMER=ON
+OPENCV4_DEPENDENCIES += gstreamer1 gst1-plugins-base
+else
+OPENCV4_CONF_OPTS += -DWITH_GSTREAMER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV4_WITH_GTK)$(BR2_PACKAGE_OPENCV4_WITH_GTK3),)
+OPENCV4_CONF_OPTS += -DWITH_GTK=OFF -DWITH_GTK_2_X=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV4_WITH_GTK),y)
+OPENCV4_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
+OPENCV4_DEPENDENCIES += libgtk2
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV4_WITH_GTK3),y)
+OPENCV4_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=OFF
+OPENCV4_DEPENDENCIES += libgtk3
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV4_WITH_JPEG),y)
+OPENCV4_CONF_OPTS += -DWITH_JPEG=ON
+OPENCV4_DEPENDENCIES += jpeg
+else
+OPENCV4_CONF_OPTS += -DWITH_JPEG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV4_WITH_OPENGL),y)
+OPENCV4_CONF_OPTS += -DWITH_OPENGL=ON
+OPENCV4_DEPENDENCIES += libgl
+else
+OPENCV4_CONF_OPTS += -DWITH_OPENGL=OFF
+endif
+
+OPENCV4_CONF_OPTS += -DWITH_OPENMP=$(if $(BR2_TOOLCHAIN_HAS_OPENMP),ON,OFF)
+
+ifeq ($(BR2_PACKAGE_OPENCV4_WITH_PNG),y)
+OPENCV4_CONF_OPTS += -DWITH_PNG=ON
+OPENCV4_DEPENDENCIES += libpng
+else
+OPENCV4_CONF_OPTS += -DWITH_PNG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV4_WITH_PROTOBUF),y)
+OPENCV4_CONF_OPTS += \
+	-DPROTOBUF_UPDATE_FILES=ON \
+	-DWITH_PROTOBUF=ON
+OPENCV4_DEPENDENCIES += protobuf
+else
+OPENCV4_CONF_OPTS += -DWITH_PROTOBUF=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV4_WITH_QT5),y)
+OPENCV4_CONF_OPTS += -DWITH_QT=5
+OPENCV4_DEPENDENCIES += qt5base
+else
+OPENCV4_CONF_OPTS += -DWITH_QT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV4_WITH_TIFF),y)
+OPENCV4_CONF_OPTS += -DWITH_TIFF=ON
+OPENCV4_DEPENDENCIES += tiff
+else
+OPENCV4_CONF_OPTS += -DWITH_TIFF=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV4_WITH_V4L),y)
+OPENCV4_CONF_OPTS += \
+	-DWITH_LIBV4L=$(if $(BR2_PACKAGE_LIBV4L),ON,OFF) \
+	-DWITH_V4L=ON
+OPENCV4_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBV4L),libv4l)
+else
+OPENCV4_CONF_OPTS += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV4_WITH_WEBP),y)
+OPENCV4_CONF_OPTS += -DWITH_WEBP=ON
+OPENCV4_DEPENDENCIES += webp
+else
+OPENCV4_CONF_OPTS += -DWITH_WEBP=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV4_LIB_PYTHON),y)
+OPENCV4_CONF_OPTS += \
+	-DBUILD_opencv_python2=OFF \
+	-DBUILD_opencv_python3=ON \
+	-DPYTHON3_EXECUTABLE=$(HOST_DIR)/bin/python3 \
+	-DPYTHON3_INCLUDE_PATH=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
+	-DPYTHON3_LIBRARIES=$(STAGING_DIR)/usr/lib/libpython$(PYTHON3_VERSION_MAJOR).so \
+	-DPYTHON3_NUMPY_INCLUDE_DIRS=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/core/include \
+	-DPYTHON3_PACKAGES_PATH=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	-DPYTHON3_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
+OPENCV4_DEPENDENCIES += python3
+OPENCV4_KEEP_PY_FILES += usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/cv2/config*.py
+OPENCV4_CONF_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
+OPENCV4_DEPENDENCIES += python-numpy
+else
+OPENCV4_CONF_OPTS += \
+	-DBUILD_opencv_python2=OFF \
+	-DBUILD_opencv_python3=OFF
+endif
+
+# Installation hooks:
+define OPENCV4_CLEAN_INSTALL_LICENSE
+	$(RM) -fr $(TARGET_DIR)/usr/share/licenses/opencv4
+endef
+OPENCV4_POST_INSTALL_TARGET_HOOKS += OPENCV4_CLEAN_INSTALL_LICENSE
+
+define OPENCV4_CLEAN_INSTALL_VALGRIND
+	$(RM) -f $(TARGET_DIR)/usr/share/opencv4/valgrind*
+endef
+OPENCV4_POST_INSTALL_TARGET_HOOKS += OPENCV4_CLEAN_INSTALL_VALGRIND
+
+ifneq ($(BR2_PACKAGE_OPENCV4_INSTALL_DATA),y)
+define OPENCV4_CLEAN_INSTALL_DATA
+	$(RM) -fr $(TARGET_DIR)/usr/share/opencv4/haarcascades \
+		$(TARGET_DIR)/usr/share/opencv4/lbpcascades
+endef
+OPENCV4_POST_INSTALL_TARGET_HOOKS += OPENCV4_CLEAN_INSTALL_DATA
+endif
+
+$(eval $(cmake-package))
-- 
2.28.0
