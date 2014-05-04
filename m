From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 May 2014 12:00:04 +0200
Subject: [Buildroot] [PATCH v2 20/24] opencv: add python/numpy support
In-Reply-To: <1398208556-4195-21-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-21-git-send-email-s.martin49@gmail.com>
Message-ID: <20140504100004.GG3211@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-04-23 01:15 +0200, Samuel Martin spake thusly:
> opencv_python module needs python-numpy because it uses some numpy
> headers in this wrapper.
> 
> A patch in the OpenCV's build-system is also needed to prevent it from
> trying to run python for numpy detection. This patch has already been
> integrated upstream.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[--SNIP--]
> diff --git a/package/opencv/opencv-0001-fix-cross-compilation-issue-with-Numpy.patch b/package/opencv/opencv-0001-fix-cross-compilation-issue-with-Numpy.patch
> new file mode 100644
> index 0000000..aff1872
> --- /dev/null
> +++ b/package/opencv/opencv-0001-fix-cross-compilation-issue-with-Numpy.patch
> @@ -0,0 +1,71 @@
> +From 6cb90c0e976ff24af85167e71d88c9d9b2ed06c7 Mon Sep 17 00:00:00 2001
> +From: Vincent Rabaud <vrabaud@aldebaran-robotics.com>
> +Date: Mon, 20 Jan 2014 10:23:46 +0100
> +Subject: [PATCH] fix cross-compilation issue with Numpy

Could you please add a pointer to upstream's patch:
    https://github.com/Itseez/opencv/commit/6cb90c0e976ff24af85167e71d88c9d9b2ed06c7

[--SNIP--]
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index 58bc5c0..5f28448 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -61,7 +61,7 @@ OPENCV_CONF_OPT += \
>  	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
>  	-DBUILD_opencv_ocl=OFF                                                  \
>  	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF)       \
> -	-DBUILD_opencv_python=OFF                                               \
> +	-DBUILD_opencv_python=$(if $(BR2_PACKAGE_OPENCV_LIB_PYTHON),ON,OFF)     \

Since you are adding a multi-line below, this should in there...

>  	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
>  	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
>  	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF)             \
> @@ -143,7 +143,6 @@ OPENCV_CONF_OPT += \
>  	-DBUILD_PNG=OFF	    \
>  	-DBUILD_TIFF=OFF    \
>  	-DBUILD_ZLIB=OFF    \
> -	-DBUILD_NEW_PYTHON_SUPPORT=OFF \
>  	-DINSTALL_C_EXAMPLES=OFF       \
>  	-DINSTALL_PYTHON_EXAMPLES=OFF  \
>  	-DINSTALL_TO_MANGLED_PATHS=OFF
> @@ -231,6 +230,19 @@ OPENCV_CONF_OPT += \
>  	-DWITH_LIBV4L=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENCV_LIB_PYTHON),y)
> +OPENCV_CONF_OPT += \

...here:
        -DBUILD_opencv_python=ON

> +	-DBUILD_NEW_PYTHON_SUPPORT=ON \
> +	-DPYTHON_EXECUTABLE=$(HOST_DIR)/usr/bin/python2                               \
> +	-DPYTHON_INCLUDE_DIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
> +	-DPYTHON_LIBRARY=$(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so   \
> +	-DPYTHON_NUMPY_INCLUDE_DIR=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/numpy/core/include \
> +	-DPYTHON_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
> +OPENCV_DEPENDENCIES += python python-numpy
> +else
> +OPENCV_CONF_OPT += -DBUILD_NEW_PYTHON_SUPPORT=OFF

...and here:
        -DBUILD_opencv_python=OFF

Regards,
Yann E. MORIN.

> +endif
> +
>  # Installation hooks:
>  define OPENCV_CLEAN_INSTALL_DOC
>  	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/doc
> -- 
> 1.9.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
