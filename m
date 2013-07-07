From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jul 2013 21:28:36 +0200
Subject: [Buildroot] [PATCH 3/3] opencv: bump version to 2.4.6
In-Reply-To: <1373222695-9148-3-git-send-email-s.martin49@gmail.com>
References: <1373222695-9148-1-git-send-email-s.martin49@gmail.com>
 <1373222695-9148-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20130707212836.16957ea2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  7 Jul 2013 20:44:55 +0200, Samuel Martin wrote:
> Also:
> - add license details;
> - add new modules option;
> - explicitly disable python support to avoid being confuse by the one from the
>   host;
> - update qt support (now handle qt4/qt5)

It would probably be good if some of those changes were split in
separate patches. The license, bump, python stuff are fairly
uncontroversial, so they could get merged quickly. I believe the Qt
part will most likely require more work.

> +if BR2_INSTALL_LIBSTDCPP && (!BR2_avr32 || (BR2_USE_WCHAR && BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS)) # qt{4,5} dependencies
> +
> +if !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
> +comment "Qt support not available."
> +comment "Enable one of the Qt libraries before enabling Qt support in OpenCV"
> +endif
> +
>  config BR2_PACKAGE_OPENCV_WITH_QT
> -	bool "qt backend support"
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on !BR2_avr32 # qt
> -	select BR2_PACKAGE_QT
> -	select BR2_PACKAGE_QT_STL
> -	default y
> -	help
> -	  Use Qt with STL support
> +	bool "Qt support"
> +	#prompt "Qt4 support" if BR2_PACKAGE_QT
> +	#prompt "Qt5 support" if BR2_PACKAGE_QT5

Hum?

> +	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5

Since you're using "depends on" for Qt, why do you need the complicated
BR2_INSTALL_LIBSTDCPP ... condition above?

> +	select BR2_PACKAGE_QT_STL             if BR2_PACKAGE_QT
> +	select BR2_PACKAGE_QT5BASE            if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE_TEST       if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE_GUI        if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE_WIDGETS    if BR2_PACKAGE_QT5
> +
> +endif # qt{4,5} dependencies

> -OPENCV_VERSION = 2.4.2
> +OPENCV_VERSION = 2.4.6
>  OPENCV_SITE    = http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
> -OPENCV_SOURCE  = OpenCV-$(OPENCV_VERSION).tar.bz2
>  OPENCV_INSTALL_STAGING = YES
> +OPENCV_LICENSE = BSD-3c
> +OPENCV_LICENSE_FILES = doc/license.txt
>  
> +OPENCV_CONF_ENV = PATH="$(TARGET_PATH)"

Maybe this should be part of the CMake package infrastructure? It kind
of makes sense to execute cmake with PATH="$(TARGET_PATH)", in order to
allow cmake to pick up any host tool we might have built and installed
in $(HOST_DIR).

>  OPENCV_CONF_OPT += \
>  	-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release)   \
>  	-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON)    \
> @@ -47,13 +49,19 @@ OPENCV_CONF_OPT += \
>  	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF)   \
>  	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
>  	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF)       \
> -	-DBUILD_opencv_python=OFF                                               \
>  	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
> +	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
>  	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF)             \
>  	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF)       \
>  	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
>  	-DBUILD_opencv_world=OFF
>  
> +# Explicitly disable python to avoid confusing OpenCV, which comes with its
> +# own implementation of the Python detection CMake module.
> +OPENCV_CONF_OPT += \
> +	-DBUILD_opencv_python=OFF \
> +	-DPYTHON_EXECUTABLE=OFF

Why not part of the OPENCV_CONF_OPT assignment above? For the comment?

> +
>  # Hardware support options.
>  #
>  # * PowerPC support is turned off since its only effect is altering CFLAGS,
> @@ -141,8 +149,8 @@ OPENCV_CONF_OPT += -DWITH_PNG=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
> -OPENCV_CONF_OPT += -DWITH_QT=ON
> -OPENCV_DEPENDENCIES += qt
> +OPENCV_CONF_OPT += -DWITH_QT=$(if $(BR2_PACKAGE_QT),4,5)
> +OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_QT),qt,qt5base)
>  else
>  OPENCV_CONF_OPT += -DWITH_QT=OFF
>  endif

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
