From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 Mar 2014 00:04:10 +0100
Subject: [Buildroot] [PATCH 09/11] opencv: add python/numpy support
In-Reply-To: <1392588004-13317-10-git-send-email-s.martin49@gmail.com>
References: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
 <1392588004-13317-10-git-send-email-s.martin49@gmail.com>
Message-ID: <20140306230410.GJ3625@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-02-16 23:00 +0100, Samuel Martin spake thusly:
> opencv_python module needs python-numpy because it uses some numpy
> headers in this wrapper.
> 
> A patch in the OpenCV's build-system is also needed to prevent it from
> trying to run python for numpy detection. This patch has already been
> integrated upstream.
[--SNIP--]
> diff --git a/package/opencv/opencv-0001-cmake-do-not-run-python-for-numpy-detection-when-cro.patch b/package/opencv/opencv-0001-cmake-do-not-run-python-for-numpy-detection-when-cro.patch
> new file mode 100644
> index 0000000..bff14eb
> --- /dev/null
> +++ b/package/opencv/opencv-0001-cmake-do-not-run-python-for-numpy-detection-when-cro.patch
> @@ -0,0 +1,77 @@
> +From 2ab6c54a6c466c3cb577cacbbace659fe55c2a4f Mon Sep 17 00:00:00 2001
> +From: Samuel Martin <s.martin49@gmail.com>
> +Date: Fri, 10 Jan 2014 23:39:59 +0100
> +Subject: [PATCH] cmake: do not run python for numpy detection when
> + cross-compiling

It would be nice if you were using exactly the same patch as upstream:
    6cb90c0e976ff24af85167e71d88c9d9b2ed06c7 fix cross-compilation issue with Numpy

Yours is slightly different.

Using the same patch as upstream would help spot it in a later bump.

> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index 51255aa..52a2b42 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
[--SNIP--]
> @@ -226,6 +225,19 @@ OPENCV_CONF_OPT += \
>  	-DWITH_LIBV4L=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENCV_LIB_PYTHON),y)
> +OPENCV_CONF_OPT += \
> +	-DBUILD_NEW_PYTHON_SUPPORT=ON \
> +	-DPYTHON_EXECUTABLE=$(HOST_DIR)/usr/bin/python2                               \

I hope this is only needed at build time, not at runtime?

Also, you specifically use 'python2', above. what about Python 2 vs.
Python 3 ? Care to shed some light on this, to the non-pythonist I am?
;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
