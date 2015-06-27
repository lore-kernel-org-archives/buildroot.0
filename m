From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Jun 2015 09:55:32 +0200
Subject: [Buildroot] [PATCH v6 15/16] package/opencv: add opengl support
In-Reply-To: <1435262397-888-16-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
 <1435262397-888-16-git-send-email-s.martin49@gmail.com>
Message-ID: <20150627075532.GA3565@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-25 21:59 +0200, Samuel Martin spake thusly:
> In OpenCV, OpenGL support is done using extensions from 3rd party
> framework: either Qt5OpenGL with Qt5 (with GL support only, not GLES);
> or gtkglext (which is not available in Buildroot) with gtk2
> 
> So, make OpenGL knob visible when Qt5 support is selected.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v5->v6:
> - update comments (Yann)
> 
> changes v4->v5:
> - new patch
> ---
>  package/opencv/Config.in | 16 ++++++++++++++++
>  package/opencv/opencv.mk |  7 +++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index b738f71..b80c9fa 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -311,6 +311,22 @@ config BR2_PACKAGE_OPENCV_WITH_JPEG
>  	help
>  	  Use shared libjpeg from the target system.
>  
> +config BR2_PACKAGE_OPENCV_WITH_OPENGL
> +	bool "opengl support"
> +	# OpenGL support done using Qt5OpenGL, so depends on WITH_QT5
> +	depends on BR2_PACKAGE_OPENCV_WITH_QT5
> +	# OpenGL support requires Qt5OpenGL with GL support, not GLES
> +	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
> +	depends on BR2_PACKAGE_HAS_LIBGL
> +	select BR2_PACKAGE_QT5BASE_OPENGL
> +	help
> +	  Enable OpenGL for UI.
> +
> +comment "opengl support needs Qt5 and an OpenGL provider"

"But I do have Qt5 enabled and a GL provider set" would say a dumb user
like me with Qt5 enabled and mesa3d (with DRI driver), but with the
opencv toolkit set to gtk2.

What you meant was:  "opengl needs Qt5 as toolkit and an openGL proivder"
But that's not much better either.

What would really make it obvious is:

    comment "opengl support needs an OpenGL provider"
        depends on BR2_PACKAGE_OPENCV_WITH_QT5
        depends on !BR2_PACKAGE_QT5_GL_AVAILABLE \
                || !BR2_PACKAGE_HAS_LIBGL

No, I did not forget to negate BR2_PACKAGE_OPENCV_WITH_QT5, because what
I suggest is that opengl support be treated as a sub-option of Qt5, so
be the comment.

Regards,
Yann E. MORIN.

> +	depends on !BR2_PACKAGE_OPENCV_WITH_QT5 || \
> +		!BR2_PACKAGE_QT5_GL_AVAILABLE || \
> +		!BR2_PACKAGE_HAS_LIBGL
> +
>  config BR2_PACKAGE_OPENCV_WITH_PNG
>  	bool "png support"
>  	select BR2_PACKAGE_LIBPNG
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index 986e7b4..61a3ccd 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -264,6 +264,13 @@ else
>  OPENCV_CONF_OPTS += -DWITH_JPEG=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENCV_WITH_OPENGL),y)
> +OPENCV_CONF_OPTS += -DWITH_OPENGL=ON
> +OPENCV_DEPENDENCIES += libgl qt5base
> +else
> +OPENCV_CONF_OPTS += -DWITH_OPENGL=OFF
> +endif
> +
>  OPENCV_CONF_OPTS += -DWITH_OPENMP=$(if $(BR2_GCC_ENABLE_OPENMP),ON,OFF)
>  
>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_PNG),y)
> -- 
> 2.4.4
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
