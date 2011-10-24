From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Oct 2011 15:35:32 +0200
Subject: [Buildroot] [PATCH v5] package: add opencv
In-Reply-To: <1319396325-9720-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 23 Oct 2011 20:58:45 +0200")
References: <1319396325-9720-1-git-send-email-s.martin49@gmail.com>
Message-ID: <878voazf4r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> OpenCV is a free, open-source, cross-platform computer vision library
 Samuel> Changelog:
 Samuel>  v1: initial submission
 Samuel>  v2: changes according to Thomas Petazonni's review:
 Samuel>      - remove obvious unneeded options
 Samuel>      - typo and style fixes
 Samuel>      - do not use 3RDPARTY_LIBS
 Samuel>  v3: changes according to Thomas Petazonni's review:
 Samuel>      - typo and style fixes
 Samuel>      - remove host package (not needed)
 Samuel>  v4: update CMAKETARGET call to follow the infra.
 Samuel>  v5: - add post install hooks (following Mike Davies' remarks):
 Samuel>        - do not install doc
 Samuel>        - do not install OpenCVConfig.cmake in the target
 Samuel>      - optionally install data in the target
 Samuel>      - remove the 'Build examples' option (only install source files)
 Samuel>      - disable precompiled header usage (automacally disabled when
 Samuel>        compiler size optimization is set)

Thanks, committed with some changes (see below)

 Samuel> +menuconfig BR2_PACKAGE_OPENCV

I prefer config rather than yet another submenu.

 Samuel> +	bool "opencv"
 Samuel> +	select BR2_PACKAGE_ZLIB

opencv uses C++ and needs wchar, so you need to depend on
BR2_INSTALL_LIBSTDCPP / show a comment when they aren't available in the
toolchain.

 Samuel> +	help
 Samuel> +	  OpenCV (Open Source Computer Vision) is a library of programming
 Samuel> +	  functions for real time computer vision.
 Samuel> +
 Samuel> +	  http://opencv.willowgarage.com/wiki/
 Samuel> +
 Samuel> +if BR2_PACKAGE_OPENCV
 Samuel> +
 Samuel> +comment "Built targets"
 Samuel> +
 Samuel> +config BR2_PACKAGE_OPENCV_BUILD_NEW_PYTHON_SUPPORT
 Samuel> +	bool "Python support"
 Samuel> +	select BR2_PACKAGE_PYTHON

This should only be shown if python is enabled already, similar to the
gtk/qt options. It imho also belongs down there.

 Samuel> +
 Samuel> +config BR2_PACKAGE_OPENCV_BUILD_TESTS
 Samuel> +	bool "Tests"

config descriptions are normally in lower case.

 Samuel> +
 Samuel> +comment "Install options"
 Samuel> +
 Samuel> +config BR2_PACKAGE_OPENCV_INSTALL_DATA
 Samuel> +	bool "Install data"

I made this "install extra data" to make it clear that this isn't
necessarily needed.

 Samuel> +	help
 Samuel> +	  Install various data that is used by cv libraries and/or demo
 Samuel> +	  applications, specifically for haarcascades and lbpcascades features.
 Samuel> +
 Samuel> +	  For further information: see OpenCV documentation.
 Samuel> +
 Samuel> +comment "Build options"
 Samuel> +
 Samuel> +config BR2_PACKAGE_OPENCV_WITH_FFMPEG
 Samuel> +	bool "FFMPEG support"
 Samuel> +	select BR2_PACKAGE_FFMPEG
 Samuel> +	select BR2_PACKAGE_FFMPEG_SWSCALE
 Samuel> +	help
 Samuel> +	  Use ffmpeg from the target system.
 Samuel> +
 Samuel> +config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
 Samuel> +	bool "Gstreamer support"
 Samuel> +	select BR2_PACKAGE_GSTREAMER
 Samuel> +	select BR2_PACKAGE_GST_PLUGINS_BASE
 Samuel> +	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
 Samuel> +
 Samuel> +config BR2_PACKAGE_OPENCV_WITH_GTK
 Samuel> +	bool "GTK support"
 Samuel> +	depends on BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_LIBGLIB2
 Samuel> +
 Samuel> +config BR2_PACKAGE_OPENCV_WITH_JPEG
 Samuel> +	bool "JPEG support"
 Samuel> +	select BR2_PACKAGE_JPEG
 Samuel> +	help
 Samuel> +	  Use shared libjpeg from the target system.
 Samuel> +
 Samuel> +config BR2_PACKAGE_OPENCV_WITH_PNG
 Samuel> +	bool "PNG support"
 Samuel> +	select BR2_PACKAGE_LIBPNG
 Samuel> +	help
 Samuel> +	  Use shared libpng from the target system.
 Samuel> +
 Samuel> +config BR2_PACKAGE_OPENCV_WITH_QT
 Samuel> +	bool "Qt Backend support"
 Samuel> +	select BR2_PACKAGE_QT

I moved this up under gtk.

 Samuel> +
 Samuel> +config BR2_PACKAGE_OPENCV_WITH_TIFF
 Samuel> +	bool "TIFF support"
 Samuel> +	select BR2_PACKAGE_TIFF
 Samuel> +	help
 Samuel> +	  Use shared libtiff from the target system.
 Samuel> +
 Samuel> +config BR2_PACKAGE_OPENCV_WITH_V4L
 Samuel> +	bool "Video 4 Linux support"
 Samuel> +	select BR2_PACKAGE_LIBV4L

libv4l needs largefile support, so you need to depend on that / show a
comment if not available.

 Samuel> +	default y
 Samuel> +
 Samuel> +endif
 Samuel> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
 Samuel> new file mode 100644
 Samuel> index 0000000..48add1e
 Samuel> --- /dev/null
 Samuel> +++ b/package/opencv/opencv.mk
 Samuel> @@ -0,0 +1,80 @@
 Samuel> +#############################################################
 Samuel> +#
 Samuel> +# OpenCV (Open Source Computer Vision)
 Samuel> +#
 Samuel> +#############################################################
 Samuel> +OPENCV_SERIES  = 2.3
 Samuel> +OPENCV_VERSION = $(OPENCV_SERIES).0
 Samuel> +OPENCV_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_SERIES)
 Samuel> +OPENCV_SOURCE  = OpenCV-$(OPENCV_VERSION).tar.bz2
 Samuel> +OPENCV_INSTALL_STAGING = YES
 Samuel> +
 Samuel> +# Build type
 Samuel> +OPENCV_CONF_OPT += -DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release)

While this works it looks quite different than other packages - We
normally do:

OPENCV_CONF_OPT += \
                blah=.. \
                blih=.. \
                bloh=..

ifeq ($(BR2_PACKAGE_BLAH))
OPENCV_CONF_OPT += BLAH=on
OPENCV_DEPENDENCIES += blah
else
OPENCV_CONF_OPT += BLAH=OFF
endif

..

I've rewritten it to use that form.

 Samuel> +define OPENCV_CLEAN_INSTALL_DOC
 Samuel> +	$(RM) -fr $(TARGET_DIR)/usr/share/opencv/doc
 Samuel> +endef

This should only be done if BR2_HAVE_DOCUMENTATION isn't enabled.

 Samuel> +
 Samuel> +define OPENCV_CLEAN_INSTALL_CMAKE
 Samuel> +	$(RM) -fr $(TARGET_DIR)/usr/share/opencv/*.cmake
 Samuel> +endef

This should only be done if cmake for the target isn't enabled.

 Samuel> +
 Samuel> +define OPENCV_CLEAN_INSTALL_DATA
 Samuel> +	$(RM) -fr $(TARGET_DIR)/usr/share/opencv/haarcascades \
 Samuel> +		$(TARGET_DIR)/usr/share/opencv/lbpcascades
 Samuel> +endef
 Samuel> +
 Samuel> +OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DOC OPENCV_CLEAN_INSTALL_CMAKE
 Samuel> +OPENCV_POST_INSTALL_TARGET_HOOKS += $(if $(BR2_PACKAGE_OPENCV_INSTALL_DATA),,OPENCV_CLEAN_INSTALL_DATA)
 Samuel> +
 Samuel> +OPENCV_POST_INSTALL_STAGING_HOOKS += OPENCV_CLEAN_INSTALL_DOC
 Samuel> +OPENCV_POST_INSTALL_STAGING_HOOKS += $(if $(BR2_PACKAGE_OPENCV_INSTALL_DATA),,OPENCV_CLEAN_INSTALL_DATA)

It doesn't make sense to run these target hooks when staging gets
installed.

-- 
Bye, Peter Korsgaard
