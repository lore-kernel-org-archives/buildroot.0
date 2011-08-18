From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 18 Aug 2011 07:30:37 +0200
Subject: [Buildroot] [PATCH 1/1] package: add opencv
In-Reply-To: <20110817125505.4ea30245@skate>
References: <1312740581-28489-1-git-send-email-s.martin49@gmail.com>
 <20110817125505.4ea30245@skate>
Message-ID: <CAHXCMML-00WRi6GxAsKrTKR7=7vXUO=iNJv3YxsZs4bzZ0GBHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/8/17 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Le Sun, ?7 Aug 2011 20:09:41 +0200,
> Samuel Martin <s.martin49@gmail.com> a ?crit :
>
>> OpenCV is a free, open-source, cross-platform computer vision library
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> Good to see a package for OpenCV!

thanks for the review.

>
>> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
>> new file mode 100644
>> index 0000000..4007847
>> --- /dev/null
>> +++ b/package/opencv/Config.in
>> @@ -0,0 +1,242 @@
>> +menuconfig BR2_PACKAGE_OPENCV
>> + ? ? bool "opencv"
>> + ? ? select BR2_PACKAGE_ZLIB
>> + ? ? help
>> + ? ? ? OpenCV (Open Source Computer Vision) is a library of programming
>> + ? ? ? functions for real time computer vision.
>> +
>> + ? ? ? http://opencv.willowgarage.com/wiki/
>> +
>> +if BR2_PACKAGE_OPENCV
>> +
>> +choice
>> + ? ? prompt "Build type"
>
> Do we really need this selection ?
>
> I think selecting the release build by default is fine, and select the
> debug build if BR2_ENABLE_DEBUG is enabled. This should be sufficient.
>
>> +comment "Built targets"
>> +
>> +config BR2_PACKAGE_OPENCV_BUILD_DOCS
>> + ? ? bool "OpenCV Documentation"
>> + ? ? depends on SUPPORTED
>
> What is this "SUPPORTED" dependency ? If something is not supported,
> please do not include any Kconfig option for it.
>
>> + ? ? default n
>
> All the "default n" are useless, this is the default.
>
>> +config BR2_PACKAGE_OPENCV_BUILD_PACKAGE
>> + ? ? bool "Enables 'make package_source' command"
>
> Hum ? What does that mean ?
>
>> +config BR2_PACKAGE_OPENCV_BUILD_WITH_DEBUG_INFO
>> + ? ? bool "Include debug info into debug libs"
>> + ? ? default n
>
> What's the difference with the debug build above ?
I don't remember exactly what OpenCV guys do, but it seems they play
with some strip options to extract debug info into new "libs" (or kind
of), then the libs with no debug info can provide debug support (so
link  against) only when these debug "libs" are installed

>
>> +config BR2_PACKAGE_OPENCV_OPENCV_BUILD_3RDPARTY_LIBS
>> + ? ? bool "3rd party libraries"
>> + ? ? default n
>> + ? ? help
>> + ? ? ? If set, allow to build and use the 3rd party libraries *only* if
>> + ? ? ? they are not already provided by/in the target system.
>> +
>> + ? ? ? Packages provided as 3rd party are:
>> + ? ? ? ? libjpeg, libpng, libtiff, zlib ,jasper-1.900.1 (aka. jpeg2k),
>> + ? ? ? ? openexr-1.4.0, ffmpeg-0.6.0, videoInput-0.1995
>
> I don't think we need this option, opencv should instead always use the
> system versions of those dependencies.
>
>> +comment "Build options"
>> +
>> +config BR2_PACKAGE_OPENCV_ENABLE_PROFILING
>> + ? ? bool "Enable profiling in the GCC compiler (Add flags: -g -pg)"
>> + ? ? default n
>
> We don't have that for any package, I don't think it's very useful to
> have such an option.
>
>> +config BR2_PACKAGE_OPENCV_CMAKE_SKIP_RPATH
>> + ? ? bool "Skip rpath"
>> + ? ? default n
>> + ? ? help
>> + ? ? ? If set, runtime paths are not added when using shared libraries.
>
> The rpath should *never* be set on libraries installed to the target.
> Please remove this option and make this the default.
>
>> +config BR2_PACKAGE_OPENCV_USE_FAST_MATH
>> + ? ? bool "Enable -ffast-math"
>> + ? ? default y
>> +
>> +config BR2_PACKAGE_OPENCV_USE_OMIT_FRAME_POINTER
>> + ? ? bool "Enable -fomit-frame-pointer for GCC"
>> + ? ? default y
>> +
>> +config BR2_PACKAGE_OPENCV_USE_PRECOMPILED_HEADERS
>> + ? ? bool "Use precompiled headers"
>> + ? ? default y
>
> For those three options, can't we find some sensible defaults, and
> hardcode them in the .mk file (and get rid of those kconfig options) ?
>
>> +config BR2_PACKAGE_OPENCV_WITH_1394
>> + ? ? bool "IEEE1394 support"
>> + ? ? depends on SUPPORTED
>> + ? ? default n
>> +
>> +menuconfig BR2_PACKAGE_OPENCV_WITH_CUDA
>> + ? ? bool "Include NVidia Cuda Runtime support"
>> + ? ? depends on SUPPORTED
>> + ? ? default n
>
> Remove all those not supported options.
>
>> +config BR2_PACKAGE_OPENCV_WITH_FFMPEG
>> + ? ? bool "FFMPEG support"
>> + ? ? select BR2_PACKAGE_FFMPEG
>> + ? ? select BR2_PACKAGE_FFMPEG_SWSCALE
>> + ? ? help
>> + ? ? ? Use ffmpeg from the target system.
>> +
>> +config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
>> + ? ? bool "Gstreamer support"
>> + ? ? select BR2_PACKAGE_GSTREAMER
>> + ? ? select BR2_PACKAGE_GST_PLUGINS_BASE
>> + ? ? select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
>> + ? ? default y
>
> Any reason to have gstreamer support enabled by default and not ffmpeg ?
>
>> +config BR2_PACKAGE_OPENCV_WITH_GTK
>> + ? ? bool "GTK support"
>> + ? ? depends on BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_LIBGLIB2
>> + ? ? default n
>> +
>> +comment "GTK support not available (requires libgtk2 and libglib2)"
>> + ? ? depends on ! ( BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_LIBGLIB2 )
>
> We typically don't put comments for dependencies, except for
> non-obvious toolchain-related dependencies.
>
>> +config BR2_PACKAGE_OPENCV_WITH_IPP
>> + ? ? bool "Intel IPP support"
>> + ? ? depends on SUPPORTED
>> + ? ? default n
>
> Remove non supported options.
>
>> +config BR2_PACKAGE_OPENCV_WITH_JASPER
>> + ? ? bool ?"JASPER (JPEG2K) support"
>> + ? ? depends on BR2_PACKAGE_OPENCV_OPENCV_BUILD_3RDPARTY_LIBS
>> + ? ? help
>> + ? ? ? Build jasper provided within OpenCV.
>
> I don't really like this 3RDPARTY_LIBS thing. Just don't include
> support for Jasper if the needed dependencies are not available in
> Buildroot (or create a package for those dependencies).
>
>> +config BR2_PACKAGE_OPENCV_WITH_JPEG
>> + ? ? bool "JPEG support"
>> + ? ? select BR2_PACKAGE_JPEG
>> + ? ? help
>> + ? ? ? Use shared libjpeg from the target system.
>> +
>> +config BR2_PACKAGE_OPENCV_WITH_OPENEXR
>> + ? ? bool "ILM support via OpenEXR"
>> + ? ? depends on BR2_PACKAGE_OPENCV_OPENCV_BUILD_3RDPARTY_LIBS
>> + ? ? help
>> + ? ? ? Build openexr provided within OpenCV.
>
> Same as JASPER.
>
>> +config BR2_PACKAGE_OPENCV_WITH_OPENNI
>> + ? ? bool "OpenNI support"
>> + ? ? depends on SUPPORTED
>> + ? ? default n
>
> Remove non-supported options.
>
>> +config BR2_PACKAGE_OPENCV_WITH_PNG
>> + ? ? bool "PNG support"
>> + ? ? select BR2_PACKAGE_LIBPNG
>> + ? ? help
>> + ? ? ? Use shared libpng from the target system.
>> +
>> +config BR2_PACKAGE_OPENCV_WITH_PVAPI
>> + ? ? bool "Prosilica GigE support"
>> + ? ? depends on SUPPORTED
>> + ? ? default n
>
> Remove non-supported options.
>
>> +config BR2_PACKAGE_OPENCV_WITH_QT
>> + ? ? bool "Qt Backend support"
>> + ? ? select BR2_PACKAGE_QT
>> + ? ? default n
>> +
>> +config BR2_PACKAGE_OPENCV_WITH_QT_OPENGL
>> + ? ? bool "Add OpenGL extension to Qt"
>> + ? ? depends on BR2_PACKAGE_OPENCV_WITH_QT && SUPPORTED
>> + ? ? default n
>
> Remove non-supported options.
>
>> +config BR2_PACKAGE_OPENCV_WITH_TBB
>> + ? ? bool "Intel TBB support"
>> + ? ? depends on SUPPORTED
>> + ? ? default n
>
> Remove non-supported options.
>
>> +config BR2_PACKAGE_OPENCV_WITH_TIFF
>> + ? ? bool "TIFF support"
>> + ? ? select BR2_PACKAGE_TIFF
>> + ? ? help
>> + ? ? ? Use shared libtiff from the target system.
>> +
>> +config BR2_PACKAGE_OPENCV_WITH_UNICAP
>> + ? ? bool "Unicap support (GPL)"
>> + ? ? depends on SUPPORTED
>> + ? ? default n
>
> Remove non-supported options.
>
>> +config BR2_PACKAGE_OPENCV_WITH_V4L
>> + ? ? bool "Video 4 Linux support"
>> + ? ? select BR2_PACKAGE_LIBV4L
>> + ? ? default y
>> +
>> +config BR2_PACKAGE_OPENCV_WITH_XINE
>> + ? ? bool "Xine support (GPL)"
>> + ? ? depends on SUPPORTED
>> + ? ? default n
>
> Remove non-supported options.
>
>> +comment "Install options"
>> +
>> +config BR2_PACKAGE_OPENCV_INSTALL_C_EXAMPLES
>> + ? ? bool "C examples"
>> + ? ? default n
>> +
>> +config BR2_PACKAGE_OPENCV_INSTALL_PYTHON_EXAMPLES
>> + ? ? bool "Python examples"
>> + ? ? default n
>> + ? ? depends on BR2_PACKAGE_OPENCV_BUILD_NEW_PYTHON_SUPPORT
>> +
>> +endif
>
> Just don't install source code examples.
>
>> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
>> new file mode 100644
>> index 0000000..9923059
>> --- /dev/null
>> +++ b/package/opencv/opencv.mk
>> @@ -0,0 +1,287 @@
>> +#############################################################
>> +#
>> +# OpenCV (Open Source Computer Vision)
>> +#
>> +#############################################################
>> +OPENCV_SERIES ?= 2.3
>> +OPENCV_VERSION = $(OPENCV_SERIES).0
>> +OPENCV_SITE ? ?= http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/$(OPENCV_SERIES)
>
> Use BR2_SOURCEFORGE_MIRROR
>
>> +OPENCV_SOURCE ?= OpenCV-$(OPENCV_VERSION).tar.bz2
>> +
>> +OPENCV_INSTALL_STAGING ? = YES
>> +
>> +OPENCV_CONF_OPT ? ? ? ? ?=
>> +
>> +OPENCV_DEPENDENCIES ? ? ?=
>> +HOST_OPENCV_DEPENDENCIES =
>
> No need to define empty variables.
>
>> +# Build type
>> +ifeq ($(BR2_PACKAGE_OPENCV_BUILD_TYPE_RELEASE),y)
>> +OPENCV_CONF_OPT += -DBUILD_TYPE_RELEASE=Release
>> +else ifeq ($(BR2_PACKAGE_OPENCV_BUILD_TYPE_DEBUG),y)
>> +OPENCV_CONF_OPT += -DBUILD_TYPE_DEBUG=Debug
>> +else ifeq ($(BR2_PACKAGE_OPENCV_BUILD_TYPE_RELWITHDEBINFO),y)
>> +OPENCV_CONF_OPT += -DBUILD_TYPE_RELWITHDEBINFO=RelWithDebInfo
>> +else ifeq ($(BR2_PACKAGE_OPENCV_BUILD_TYPE_MINSIZEREL),y)
>> +OPENCV_CONF_OPT += -DBUILD_TYPE_MINSIZEREL=MinSizeRel
>> +endif
>
> As said above, simplify this build type thing.
>
>> +# Built targets
>> +ifeq ($(BR2_PACKAGE_OPENCV_BUILD_DOCS),y)
>> +OPENCV_CONF_OPT += -DBUILD_DOCS=ON
>> +else
>> +OPENCV_CONF_OPT += -DBUILD_DOCS=OFF
>> +endif
>
> You can also write:
>
> OPENCV_CONF_OPT += -DBUILD_DOCS=$(if $(BR2_PACKAGE_OPENCV_BUILD_DOCS),ON,OFF)
>
> to do the same thing on one line.
>
> Generally speaking, it seems that you have listed all configuration
> options of OpenCV and tried to provide corresponding configuration
> options in Buildroot. We typically try not to do this, but instead only
> support the configuration options that are actually useful and the one
> that have been tested.
>
ok, v2 is on its way...

> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
