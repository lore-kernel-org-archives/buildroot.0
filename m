From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  7 Aug 2011 20:09:41 +0200
Subject: [Buildroot] [PATCH 1/1] package: add opencv
Message-ID: <1312740581-28489-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenCV is a free, open-source, cross-platform computer vision library

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/Config.in        |    1 +
 package/opencv/Config.in |  242 ++++++++++++++++++++++++++++++++++++++
 package/opencv/opencv.mk |  287 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 530 insertions(+), 0 deletions(-)
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
index 0000000..4007847
--- /dev/null
+++ b/package/opencv/Config.in
@@ -0,0 +1,242 @@
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
+choice
+	prompt "Build type"
+	default BR2_PACKAGE_OPENCV_BUILD_TYPE_RELEASE
+config BR2_PACKAGE_OPENCV_BUILD_TYPE_NONE
+	bool "None"
+config BR2_PACKAGE_OPENCV_BUILD_TYPE_RELEASE
+	bool "Release"
+config BR2_PACKAGE_OPENCV_BUILD_TYPE_DEBUG
+	bool "Debug"
+config BR2_PACKAGE_OPENCV_BUILD_TYPE_RELWITHDEBINFO
+	bool "Release with debug info"
+	depends on SUPPORTED
+config BR2_PACKAGE_OPENCV_BUILD_TYPE_MINSIZEREL
+	bool "Minimal Size Release"
+	depends on SUPPORTED
+endchoice
+
+
+comment "Built targets"
+
+config BR2_PACKAGE_OPENCV_BUILD_DOCS
+	bool "OpenCV Documentation"
+	depends on SUPPORTED
+	default n
+
+config BR2_PACKAGE_OPENCV_BUILD_EXAMPLES
+	bool "All examples"
+	default n
+
+config BR2_PACKAGE_OPENCV_BUILD_NEW_PYTHON_SUPPORT
+	bool "Python support"
+	select BR2_PACKAGE_PYTHON
+	default n
+
+config BR2_PACKAGE_OPENCV_BUILD_PACKAGE
+	bool "Enables 'make package_source' command"
+	depends on SUPPORTED
+	default n
+
+config BR2_PACKAGE_OPENCV_BUILD_TESTS
+	bool "Tests"
+	default n
+
+config BR2_PACKAGE_OPENCV_BUILD_WITH_DEBUG_INFO
+	bool "Include debug info into debug libs"
+	default n
+
+config BR2_PACKAGE_OPENCV_OPENCV_BUILD_3RDPARTY_LIBS
+	bool "3rd party libraries"
+	default n
+	help
+	  If set, allow to build and use the 3rd party libraries *only* if
+	  they are not already provided by/in the target system.
+
+	  Packages provided as 3rd party are:
+	    libjpeg, libpng, libtiff, zlib ,jasper-1.900.1 (aka. jpeg2k),
+	    openexr-1.4.0, ffmpeg-0.6.0, videoInput-0.1995
+
+comment "Build options"
+
+config BR2_PACKAGE_OPENCV_ENABLE_PROFILING
+	bool "Enable profiling in the GCC compiler (Add flags: -g -pg)"
+	default n
+
+config BR2_PACKAGE_OPENCV_CMAKE_SKIP_RPATH
+	bool "Skip rpath"
+	default n
+	help
+	  If set, runtime paths are not added when using shared libraries.
+
+config BR2_PACKAGE_OPENCV_USE_FAST_MATH
+	bool "Enable -ffast-math"
+	default y
+
+config BR2_PACKAGE_OPENCV_USE_OMIT_FRAME_POINTER
+	bool "Enable -fomit-frame-pointer for GCC"
+	default y
+
+config BR2_PACKAGE_OPENCV_USE_PRECOMPILED_HEADERS
+	bool "Use precompiled headers"
+	default y
+
+config BR2_PACKAGE_OPENCV_WITH_1394
+	bool "IEEE1394 support"
+	depends on SUPPORTED
+	default n
+
+menuconfig BR2_PACKAGE_OPENCV_WITH_CUDA
+	bool "Include NVidia Cuda Runtime support"
+	depends on SUPPORTED
+	default n
+
+if BR2_PACKAGE_OPENCV_WITH_CUDA
+
+config BR2_PACKAGE_OPENCV_CUDA_64_BIT_DEVICE_CODE
+	bool "Compile device code in 64 bit mode"
+	default n
+
+config BR2_PACKAGE_OPENCV_CUDA_ATTACH_VS_BUILD_RULE_TO_CUDA_FILE
+	bool "Attach the build rule to the CUDA source file"
+	default n
+	help
+	  Enable only when the CUDA source file is added to at most one target.
+
+config BR2_PACKAGE_OPENCV_CUDA_BUILD_CUBIN
+	bool "Generate and parse .cubin files in Device mode"
+	default n
+
+config BR2_PACKAGE_OPENCV_CUDA_BUILD_EMULATION
+	bool "Build in Emulation mode"
+	default n
+
+config BR2_PACKAGE_OPENCV_CUDA_HOST_COMPILATION_CPP
+	bool "Generated file extension"
+	default n
+
+config BR2_PACKAGE_OPENCV_CUDA_PROPAGATE_HOST_FLAGS
+	bool "Propage C/CXX_FLAGS and friends to the host compiler via -Xcompile"
+	default n
+
+endif
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
+	default y
+
+config BR2_PACKAGE_OPENCV_WITH_GTK
+	bool "GTK support"
+	depends on BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_LIBGLIB2
+	default n
+
+comment "GTK support not available (requires libgtk2 and libglib2)"
+	depends on ! ( BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_LIBGLIB2 )
+
+config BR2_PACKAGE_OPENCV_WITH_IPP
+	bool "Intel IPP support"
+	depends on SUPPORTED
+	default n
+
+config BR2_PACKAGE_OPENCV_WITH_JASPER
+	bool  "JASPER (JPEG2K) support"
+	depends on BR2_PACKAGE_OPENCV_OPENCV_BUILD_3RDPARTY_LIBS
+	help
+	  Build jasper provided within OpenCV.
+
+config BR2_PACKAGE_OPENCV_WITH_JPEG
+	bool "JPEG support"
+	select BR2_PACKAGE_JPEG
+	help
+	  Use shared libjpeg from the target system.
+
+config BR2_PACKAGE_OPENCV_WITH_OPENEXR
+	bool "ILM support via OpenEXR"
+	depends on BR2_PACKAGE_OPENCV_OPENCV_BUILD_3RDPARTY_LIBS
+	help
+	  Build openexr provided within OpenCV.
+
+config BR2_PACKAGE_OPENCV_WITH_OPENNI
+	bool "OpenNI support"
+	depends on SUPPORTED
+	default n
+
+config BR2_PACKAGE_OPENCV_WITH_PNG
+	bool "PNG support"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  Use shared libpng from the target system.
+
+config BR2_PACKAGE_OPENCV_WITH_PVAPI
+	bool "Prosilica GigE support"
+	depends on SUPPORTED
+	default n
+
+config BR2_PACKAGE_OPENCV_WITH_QT
+	bool "Qt Backend support"
+	select BR2_PACKAGE_QT
+	default n
+
+config BR2_PACKAGE_OPENCV_WITH_QT_OPENGL
+	bool "Add OpenGL extension to Qt"
+	depends on BR2_PACKAGE_OPENCV_WITH_QT && SUPPORTED
+	default n
+
+config BR2_PACKAGE_OPENCV_WITH_TBB
+	bool "Intel TBB support"
+	depends on SUPPORTED
+	default n
+
+config BR2_PACKAGE_OPENCV_WITH_TIFF
+	bool "TIFF support"
+	select BR2_PACKAGE_TIFF
+	help
+	  Use shared libtiff from the target system.
+
+config BR2_PACKAGE_OPENCV_WITH_UNICAP
+	bool "Unicap support (GPL)"
+	depends on SUPPORTED
+	default n
+
+config BR2_PACKAGE_OPENCV_WITH_V4L
+	bool "Video 4 Linux support"
+	select BR2_PACKAGE_LIBV4L
+	default y
+
+config BR2_PACKAGE_OPENCV_WITH_XINE
+	bool "Xine support (GPL)"
+	depends on SUPPORTED
+	default n
+
+comment "Install options"
+
+config BR2_PACKAGE_OPENCV_INSTALL_C_EXAMPLES
+	bool "C examples"
+	default n
+
+config BR2_PACKAGE_OPENCV_INSTALL_PYTHON_EXAMPLES
+	bool "Python examples"
+	default n
+	depends on BR2_PACKAGE_OPENCV_BUILD_NEW_PYTHON_SUPPORT
+
+endif
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
new file mode 100644
index 0000000..9923059
--- /dev/null
+++ b/package/opencv/opencv.mk
@@ -0,0 +1,287 @@
+#############################################################
+#
+# OpenCV (Open Source Computer Vision)
+#
+#############################################################
+OPENCV_SERIES  = 2.3
+OPENCV_VERSION = $(OPENCV_SERIES).0
+OPENCV_SITE    = http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/$(OPENCV_SERIES)
+OPENCV_SOURCE  = OpenCV-$(OPENCV_VERSION).tar.bz2
+
+OPENCV_INSTALL_STAGING   = YES
+
+OPENCV_CONF_OPT          =
+
+OPENCV_DEPENDENCIES      =
+HOST_OPENCV_DEPENDENCIES =
+
+# Build type
+ifeq ($(BR2_PACKAGE_OPENCV_BUILD_TYPE_RELEASE),y)
+OPENCV_CONF_OPT += -DBUILD_TYPE_RELEASE=Release
+else ifeq ($(BR2_PACKAGE_OPENCV_BUILD_TYPE_DEBUG),y)
+OPENCV_CONF_OPT += -DBUILD_TYPE_DEBUG=Debug
+else ifeq ($(BR2_PACKAGE_OPENCV_BUILD_TYPE_RELWITHDEBINFO),y)
+OPENCV_CONF_OPT += -DBUILD_TYPE_RELWITHDEBINFO=RelWithDebInfo
+else ifeq ($(BR2_PACKAGE_OPENCV_BUILD_TYPE_MINSIZEREL),y)
+OPENCV_CONF_OPT += -DBUILD_TYPE_MINSIZEREL=MinSizeRel
+endif
+
+# Built targets
+ifeq ($(BR2_PACKAGE_OPENCV_BUILD_DOCS),y)
+OPENCV_CONF_OPT += -DBUILD_DOCS=ON
+else
+OPENCV_CONF_OPT += -DBUILD_DOCS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_BUILD_EXAMPLES),y)
+OPENCV_CONF_OPT += -DBUILD_EXAMPLES=ON
+else
+OPENCV_CONF_OPT += -DBUILD_EXAMPLES=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_BUILD_NEW_PYTHON_SUPPORT),y)
+OPENCV_CONF_OPT          += -DBUILD_NEW_PYTHON_SUPPORT=ON
+OPENCV_DEPENDENCIES      += python
+HOST_OPENCV_DEPENDENCIES += host-python
+else
+OPENCV_CONF_OPT          += -DBUILD_NEW_PYTHON_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_BUILD_PACKAGE),y)
+OPENCV_CONF_OPT += -DBUILD_PACKAGE=ON
+else
+OPENCV_CONF_OPT += -DBUILD_PACKAGE=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_BUILD_TESTS),y)
+OPENCV_CONF_OPT += -DBUILD_TESTS=ON
+else
+OPENCV_CONF_OPT += -DBUILD_TESTS=OFF
+endif
+
+
+# Build options
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+OPENCV_CONF_OPT += -DBUILD_SHARED_LIBS=OFF
+else
+OPENCV_CONF_OPT += -DBUILD_SHARED_LIBS=ON
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_BUILD_WITH_DEBUG_INFO),y)
+OPENCV_CONF_OPT += -DBUILD_WITH_DEBUG_INFO=ON
+else
+OPENCV_CONF_OPT += -DBUILD_WITH_DEBUG_INFO=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_OPENCV_BUILD_3RDPARTY_LIBS),y)
+OPENCV_CONF_OPT += -DOPENCV_BUILD_3RDPARTY_LIBS=ON
+else
+OPENCV_CONF_OPT += -DOPENCV_BUILD_3RDPARTY_LIBS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_ENABLE_PROFILING),y)
+OPENCV_CONF_OPT += -DENABLE_PROFILING=ON
+else
+OPENCV_CONF_OPT += -DENABLE_PROFILING=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_CMAKE_SKIP_RPATH),y)
+OPENCV_CONF_OPT += -DCMAKE_SKIP_RPATH=ON
+else
+OPENCV_CONF_OPT += -DCMAKE_SKIP_RPATH=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_USE_FAST_MATH),y)
+OPENCV_CONF_OPT += -DUSE_FAST_MATH=ON
+else
+OPENCV_CONF_OPT += -DUSE_FAST_MATH=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_USE_OMIT_FRAME_POINTER),y)
+OPENCV_CONF_OPT += -DUSE_OMIT_FRAME_POINTER=ON
+else
+OPENCV_CONF_OPT += -DUSE_OMIT_FRAME_POINTER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_USE_PRECOMPILED_HEADERS),y)
+OPENCV_CONF_OPT += -DUSE_PRECOMPILED_HEADERS=ON
+else
+OPENCV_CONF_OPT += -DUSE_PRECOMPILED_HEADERS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_1394),y)
+OPENCV_CONF_OPT += -DWITH_1394=ON
+else
+OPENCV_CONF_OPT += -DWITH_1394=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_CUDA),y)
+OPENCV_CONF_OPT += -DWITH_CUDA=ON
+# Cuda options
+ifeq ($(BR2_PACKAGE_OPENCV_CUDA_64_BIT_DEVICE_CODE),y)
+OPENCV_CONF_OPT += -DCUDA_64_BIT_DEVICE_CODE=ON
+else
+OPENCV_CONF_OPT += -DCUDA_64_BIT_DEVICE_CODE=OFF
+endif
+ifeq ($(BR2_PACKAGE_OPENCV_CUDA_ATTACH_VS_BUILD_RULE_TO_CUDA_FILE),y)
+OPENCV_CONF_OPT += -DCUDA_ATTACH_VS_BUILD_RULE_TO_CUDA_FILE=ON
+else
+OPENCV_CONF_OPT += -DCUDA_ATTACH_VS_BUILD_RULE_TO_CUDA_FILE=OFF
+endif
+ifeq ($(BR2_PACKAGE_OPENCV_CUDA_BUILD_CUBIN),y)
+OPENCV_CONF_OPT += -DCUDA_BUILD_CUBIN=ON
+else
+OPENCV_CONF_OPT += -DCUDA_BUILD_CUBIN=OFF
+endif
+ifeq ($(BR2_PACKAGE_OPENCV_CUDA_BUILD_EMULATION),y)
+OPENCV_CONF_OPT += -DCUDA_BUILD_EMULATION=ON
+else
+OPENCV_CONF_OPT += -DCUDA_BUILD_EMULATION=OFF
+endif
+ifeq ($(BR2_PACKAGE_OPENCV_CUDA_HOST_COMPILATION_CPP),y)
+OPENCV_CONF_OPT += -DCUDA_HOST_COMPILATION_CPP=ON
+else
+OPENCV_CONF_OPT += -DCUDA_HOST_COMPILATION_CPP=OFF
+endif
+ifeq ($(BR2_PACKAGE_OPENCV_CUDA_PROPAGATE_HOST_FLAGS),y)
+OPENCV_CONF_OPT += -DCUDA_PROPAGATE_HOST_FLAGS=ON
+else
+OPENCV_CONF_OPT += -DCUDA_PROPAGATE_HOST_FLAGS=OFF
+endif
+else
+OPENCV_CONF_OPT += -DWITH_CUDA=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_EIGEN),y)
+OPENCV_CONF_OPT     += -DWITH_EIGEN=ON
+OPENCV_DEPENDENCIES += eigen
+else
+OPENCV_CONF_OPT     += -DWITH_EIGEN=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_FFMPEG),y)
+OPENCV_CONF_OPT     += -DWITH_FFMPEG=ON
+OPENCV_DEPENDENCIES += ffmpeg
+else
+OPENCV_CONF_OPT     += -DWITH_FFMPEG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER),y)
+OPENCV_CONF_OPT     += -DWITH_GSTREAMER=ON
+OPENCV_DEPENDENCIES += gstreamer gst-plugins-base
+else
+OPENCV_CONF_OPT     += -DWITH_GSTREAMER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
+OPENCV_CONF_OPT     += -DWITH_GTK=ON
+OPENCV_DEPENDENCIES += libgtk2 libglib2
+else
+OPENCV_CONF_OPT     += -DWITH_GTK=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_IPP),y)
+OPENCV_CONF_OPT += -DWITH_IPP=ON
+else
+OPENCV_CONF_OPT += -DWITH_IPP=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_JASPER),y)
+OPENCV_CONF_OPT += -DWITH_JASPER=ON
+else
+OPENCV_CONF_OPT += -DWITH_JASPER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_JPEG),y)
+OPENCV_CONF_OPT     += -DWITH_JPEG=ON
+OPENCV_DEPENDENCIES += jpeg
+else
+OPENCV_CONF_OPT     += -DWITH_JPEG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_OPENEXR),y)
+OPENCV_CONF_OPT += -DWITH_OPENEXR=ON
+else
+OPENCV_CONF_OPT += -DWITH_OPENEXR=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_OPENNI),y)
+OPENCV_CONF_OPT += -DWITH_OPENNI=ON
+else
+OPENCV_CONF_OPT += -DWITH_OPENNI=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_PNG),y)
+OPENCV_CONF_OPT     += -DWITH_PNG=ON
+OPENCV_DEPENDENCIES += libpng
+else
+OPENCV_CONF_OPT += -DWITH_PNG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_PVAPI),y)
+OPENCV_CONF_OPT += -DWITH_PVAPI=ON
+else
+OPENCV_CONF_OPT += -DWITH_PVAPI=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
+OPENCV_CONF_OPT     += -DWITH_QT=ON
+OPENCV_DEPENDENCIES += qt
+else
+OPENCV_CONF_OPT     += -DWITH_QT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT_OPENGL),y)
+OPENCV_CONF_OPT += -DWITH_QT_OPENGL=ON
+else
+OPENCV_CONF_OPT += -DWITH_QT_OPENGL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_TBB),y)
+OPENCV_CONF_OPT += -DWITH_TBB=ON
+else
+OPENCV_CONF_OPT += -DWITH_TBB=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_TIFF),y)
+OPENCV_CONF_OPT     += -DWITH_TIFF=ON
+OPENCV_DEPENDENCIES += tiff
+else
+OPENCV_CONF_OPT     += -DWITH_TIFF=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_UNICAP),y)
+OPENCV_CONF_OPT += -DWITH_UNICAP=ON
+else
+OPENCV_CONF_OPT += -DWITH_UNICAP=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_V4L),y)
+OPENCV_CONF_OPT     += -DWITH_V4L=ON
+OPENCV_DEPENDENCIES += libv4l
+else
+OPENCV_CONF_OPT     += -DWITH_V4L=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_XINE),y)
+OPENCV_CONF_OPT += -DWITH_XINE=ON
+else
+OPENCV_CONF_OPT += -DWITH_XINE=OFF
+endif
+
+# Install options
+ifeq ($(BR2_PACKAGE_OPENCV_INSTALL_C_EXAMPLES),y)
+OPENCV_CONF_OPT += -DINSTALL_C_EXAMPLES=ON
+else
+OPENCV_CONF_OPT += -DINSTALL_C_EXAMPLES=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_INSTALL_PYTHON_EXAMPLES),y)
+OPENCV_CONF_OPT += -DINSTALL_PYTHON_EXAMPLES=ON
+else
+OPENCV_CONF_OPT += -DINSTALL_PYTHON_EXAMPLES=OFF
+endif
+
+
+$(eval $(call CMAKETARGETS,package,opencv))
+$(eval $(call CMAKETARGETS,package,opencv,host))
-- 
1.7.0.4
