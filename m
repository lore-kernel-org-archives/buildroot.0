From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jul 2015 11:27:19 +0200
Subject: [Buildroot] [PATCH v7 6/7] package/opencv: add opengl support
In-Reply-To: <1436036821-10073-7-git-send-email-s.martin49@gmail.com>
References: <1436036821-10073-1-git-send-email-s.martin49@gmail.com>
 <1436036821-10073-7-git-send-email-s.martin49@gmail.com>
Message-ID: <20150705092718.GF3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-07-04 21:07 +0200, Samuel Martin spake thusly:
> In OpenCV, OpenGL is only used by highgui module.
> 
> OpenGL support is done using extensions from 3rd party framework: either
> Qt5OpenGL with Qt5 (with GL support only, not GLES); or gtkglext (which
> is not available in Buildroot) with gtk2
> 
> So, make OpenGL knob a sub-option of the Qt5 support option.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[--SNIP--]
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

No need for qt5base here, since gl is already conditional to Qt5.

With that fixed:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +else
> +OPENCV_CONF_OPTS += -DWITH_OPENGL=OFF
> +endif
> +
>  OPENCV_CONF_OPTS += -DWITH_OPENMP=$(if $(BR2_GCC_ENABLE_OPENMP),ON,OFF)
>  
>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_PNG),y)
> -- 
> 2.4.5
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
