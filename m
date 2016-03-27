From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 27 Mar 2016 15:05:42 +0200
Subject: [Buildroot] [PATCH v2 06/18] package/opencv3: bump version to
	3.1.0
In-Reply-To: <1459070223-5901-7-git-send-email-bernd.kuhls@t-online.de>
References: <1459070223-5901-1-git-send-email-bernd.kuhls@t-online.de>
 <1459070223-5901-7-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <CAHXCMMLcd313SJ-JMVRoS4UOhH_FG79g5yv463Y6r4EwgKfrMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, Mar 27, 2016 at 11:16 AM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
[...]
> diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
> index 3ce78b5..db37e7c 100644
> --- a/package/opencv3/opencv3.mk
> +++ b/package/opencv3/opencv3.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -OPENCV3_VERSION = 3.0.0
> +OPENCV3_VERSION = 3.1.0
>  OPENCV3_SITE = $(call github,itseez,opencv,$(OPENCV3_VERSION))
>  OPENCV3_INSTALL_STAGING = YES
>  OPENCV3_LICENSE = BSD-3c
> @@ -15,7 +15,8 @@ OPENCV3_CONF_OPTS += \
>         -DBUILD_DOCS=OFF \
>         -DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS),ON,OFF) \
>         -DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV3_BUILD_TESTS),ON,OFF) \
> -       -DBUILD_WITH_DEBUG_INFO=OFF
> +       -DBUILD_WITH_DEBUG_INFO=OFF \
> +       -DDOWNLOAD_EXTERNAL_TEST_DATA=OFF
>
>  ifeq ($(BR2_PACKAGE_OPENCV3_BUILD_TESTS)$(BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS),)
>  OPENCV3_CONF_OPTS += -DINSTALL_TEST=OFF
> @@ -70,7 +71,6 @@ OPENCV3_CONF_OPTS += \
>         -DBUILD_opencv_core=ON \
>         -DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV3_LIB_FEATURES2D),ON,OFF) \
>         -DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV3_LIB_FLANN),ON,OFF) \
> -       -DBUILD_opencv_hal=ON \
>         -DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI),ON,OFF) \
>         -DBUILD_opencv_imgcodecs=$(if $(BR2_PACKAGE_OPENCV3_LIB_IMGCODECS),ON,OFF) \
>         -DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV3_LIB_IMGPROC),ON,OFF) \
> @@ -142,7 +142,9 @@ OPENCV3_CONF_OPTS += \
>         -DWITH_INTELPERC=OFF \
>         -DWITH_IPP=OFF \
>         -DWITH_IPP_A=OFF \
> -       -DWITH_TBB=OFF
> +       -DWITH_TBB=OFF \
> +       -DWITH_VA=OFF \
> +       -DWITH_VA_INTEL=OFF
VA-API [1] is not Intel specific.
Here, VA Intel just refers to the driver (back-end) implementation
library allowing to use VA-API capable HW.
I would move at least the WITH_VA option somewhere else (in the
"Software/3rd-party support options" section), or add its support
since Buildroot already integrates the libva and libva-intel-driver
packages.

>
>  # Smartek stuff
>  OPENCV3_CONF_OPTS += -DWITH_GIGEAPI=OFF
> @@ -201,11 +203,10 @@ OPENCV3_CONF_OPTS += \
>         -DWITH_EIGEN=OFF \
>         -DWITH_GDAL=OFF \
>         -DWITH_GPHOTO2=OFF \
> +       -DWITH_MATLAB=OFF \
>         -DWITH_OPENCL=OFF \
>         -DWITH_OPENCL_SVM=OFF \
>         -DWITH_OPENEXR=OFF \
> -       -DWITH_OPENGL=OFF \
> -       -DWITH_OPENMP=OFF \
AFAICS, these 2 options still exist (see [2,3]).
Note that removing the OpenMP option will certainly change the result
of the builds since it would let CMake decide whether OpenMP support
should be enable or not, depending on the toolchains.
Some toolchains (internal or external) include OpenMP support, some
others do not, but external toolchains do not install libgomp (yet) in
the target filesystem.
For further details about external toolchains options, check [4].

>         -DWITH_OPENNI2=OFF \
>         -DWITH_OPENNI=OFF \
>         -DWITH_UNICAP=OFF \
> --
> 2.8.0.rc3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

[1] https://www.freedesktop.org/wiki/Software/vaapi/
[2] https://github.com/Itseez/opencv/blob/master/CMakeLists.txt#L190
[3] https://github.com/Itseez/opencv/blob/master/CMakeLists.txt#L200
[4] https://github.com/tSed/buildroot/commits/sma/ext-toolchain-options

Regards,

-- 
Samuel
