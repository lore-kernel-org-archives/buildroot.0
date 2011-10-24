From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 24 Oct 2011 15:36:21 +0200
Subject: [Buildroot] [git commit] package: add opencv
Message-ID: <20111024133642.20B778EDF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ca7b726683879f93032b348aba0759f0ef8b520
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenCV is a free, open-source, cross-platform computer vision library

[Peter: fix deps, misc cleanup]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/opencv/Config.in |   85 +++++++++++++++++++++++++++++++
 package/opencv/opencv.mk |  125 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 211 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3b2769d..c6ca350 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -297,6 +297,7 @@ source "package/libraw/Config.in"
 source "package/librsvg/Config.in"
 source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
+source "package/opencv/Config.in"
 source "package/pango/Config.in"
 source "package/pixman/Config.in"
 source "package/tiff/Config.in"
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
new file mode 100644
index 0000000..1f454b6
--- /dev/null
+++ b/package/opencv/Config.in
@@ -0,0 +1,85 @@
+config BR2_PACKAGE_OPENCV
+	bool "opencv"
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	help
+	  OpenCV (Open Source Computer Vision) is a library of programming
+	  functions for real time computer vision.
+
+	  http://opencv.willowgarage.com/wiki/
+
+if BR2_PACKAGE_OPENCV
+
+config BR2_PACKAGE_OPENCV_BUILD_TESTS
+	bool "build tests"
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
+comment "Build options"
+
+config BR2_PACKAGE_OPENCV_WITH_PYTHON
+	bool "python support"
+	depends on BR2_PACKAGE_PYTHON
+
+config BR2_PACKAGE_OPENCV_WITH_FFMPEG
+	bool "ffmpeg support"
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_SWSCALE
+	help
+	  Use ffmpeg from the target system.
+
+config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
+	bool "gstreamer support"
+	select BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
+
+config BR2_PACKAGE_OPENCV_WITH_GTK
+	bool "gtk support"
+	depends on BR2_PACKAGE_LIBGTK2
+
+config BR2_PACKAGE_OPENCV_WITH_QT
+	bool "qt backend support"
+	depends on BR2_PACKAGE_QT
+	default y
+
+config BR2_PACKAGE_OPENCV_WITH_JPEG
+	bool "jpeg support"
+	select BR2_PACKAGE_JPEG
+	help
+	  Use shared libjpeg from the target system.
+
+config BR2_PACKAGE_OPENCV_WITH_PNG
+	bool "png support"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  Use shared libpng from the target system.
+
+config BR2_PACKAGE_OPENCV_WITH_TIFF
+	bool "tiff support"
+	select BR2_PACKAGE_TIFF
+	help
+	  Use shared libtiff from the target system.
+
+config BR2_PACKAGE_OPENCV_WITH_V4L
+	bool "v4l support"
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBV4L
+	help
+	  Enable Video 4 Linux support.
+
+comment "v4l support requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
+
+endif # BR2_PACKAGE_OPENCV
+
+comment "opencv requires a toolchain with C++ and WCHAR support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
new file mode 100644
index 0000000..202e059
--- /dev/null
+++ b/package/opencv/opencv.mk
@@ -0,0 +1,125 @@
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
+OPENCV_CONF_OPT = \
+	-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release) \
+	-DBUILD_DOCS=$(if $(BR2_HAVE_DOCUMENTATION),ON,OFF) \
+	-DBUILD_EXAMPLES=OFF \
+	-DBUILD_PACKAGE=OFF \
+	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
+	-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON) \
+	-DINSTALL_C_EXAMPLES=OFF \
+	-DINSTALL_PYTHON_EXAMPLES=OFF \
+	-DOPENCV_BUILD_3RDPARTY_LIBS=OFF \
+	-DENABLE_PROFILING=OFF \
+	-DCMAKE_SKIP_RPATH=OFF \
+	-DUSE_FAST_MATH=ON \
+	-DUSE_OMIT_FRAME_POINTER=ON \
+	-DUSE_PRECOMPILED_HEADERS=OFF \
+	-DWITH_1394=OFF \
+	-DWITH_CUDA=OFF \
+	-DWITH_EIGEN=OFF \
+	-DWITH_IPP=OFF \
+	-DWITH_JASPER=OFF \
+	-DWITH_OPENEXR=OFF \
+	-DWITH_OPENNI=OFF \
+	-DWITH_PVAPI=OFF \
+	-DWITH_TBB=OFF \
+	-DWITH_UNICAP=OFF \
+	-DWITH_XINE=OFF
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_PYTHON),y)
+OPENCV_CONF_OPT += -DBUILD_NEW_PYTHON_SUPPORT=ON
+OPENCV_DEPENDENCIES += python
+else
+OPENCV_CONF_OPT += -DBUILD_NEW_PYTHON_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_FFMPEG),y)
+OPENCV_CONF_OPT += -DWITH_FFMPEG=ON
+OPENCV_DEPENDENCIES += ffmpeg
+else
+OPENCV_CONF_OPT += -DWITH_FFMPEG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER),y)
+OPENCV_CONF_OPT += -DWITH_GSTREAMER=ON
+OPENCV_DEPENDENCIES += gstreamer gst-plugins-base
+else
+OPENCV_CONF_OPT += -DWITH_GSTREAMER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
+OPENCV_CONF_OPT += -DWITH_GTK=ON
+OPENCV_DEPENDENCIES += libgtk2
+else
+OPENCV_CONF_OPT += -DWITH_GTK=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_JPEG),y)
+OPENCV_CONF_OPT += -DWITH_JPEG=ON
+OPENCV_DEPENDENCIES += jpeg
+else
+OPENCV_CONF_OPT += -DWITH_JPEG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_PNG),y)
+OPENCV_CONF_OPT += -DWITH_PNG=ON
+OPENCV_DEPENDENCIES += libpng
+else
+OPENCV_CONF_OPT += -DWITH_PNG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
+OPENCV_CONF_OPT += -DWITH_QT=ON -DWITH_QT_OPENGL=OFF
+OPENCV_DEPENDENCIES += qt
+else
+OPENCV_CONF_OPT += -DWITH_QT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_TIFF),y)
+OPENCV_CONF_OPT += -DWITH_TIFF=ON
+OPENCV_DEPENDENCIES += tiff
+else
+OPENCV_CONF_OPT += -DWITH_TIFF=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_V4L),y)
+OPENCV_CONF_OPT += -DWITH_V4L=ON
+OPENCV_DEPENDENCIES += libv4l
+else
+OPENCV_CONF_OPT += -DWITH_V4L=OFF
+endif
+
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+define OPENCV_CLEAN_INSTALL_DOC
+	$(RM) -fr $(TARGET_DIR)/usr/share/opencv/doc
+endef
+
+OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DOC
+endif
+
+ifneq ($(BR2_PACKAGE_CMAKE),y)
+define OPENCV_CLEAN_INSTALL_CMAKE
+	$(RM) -f $(TARGET_DIR)/usr/share/opencv/OpenCVConfig.cmake
+endef
+OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_CMAKE
+endif
+
+ifneq ($(BR2_PACKAGE_OPENCV_INSTALL_DATA),y)
+define OPENCV_CLEAN_INSTALL_DATA
+	$(RM) -fr $(TARGET_DIR)/usr/share/opencv/haarcascades \
+		$(TARGET_DIR)/usr/share/opencv/lbpcascades
+endef
+OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DATA
+endif
+
+$(eval $(call CMAKETARGETS))
