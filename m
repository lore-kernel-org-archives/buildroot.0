From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Jun 2015 22:01:01 +0200
Subject: [Buildroot] [PATCH v6 10/16] package/opencv: add gstreamer-1.x
	support
In-Reply-To: <1435262397-888-11-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
 <1435262397-888-11-git-send-email-s.martin49@gmail.com>
Message-ID: <20150626200101.GE12470@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-25 21:59 +0200, Samuel Martin spake thusly:
> Starting with the 2.4.10 release, OpenCV supports both Gstreamer-0.10
> and Gstreamer-1, but only one can be enabled at the same time (OpenCV
> chooses Gstreamer-1 over Gstreamer-0.10 when both are available).
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
[--SNIP--]
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index a43de0c..d249400 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -222,11 +222,20 @@ else
>  OPENCV_CONF_OPTS += -DWITH_FFMPEG=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER)$(BR2_PACKAGE_OPENCV_WITH_GSTREAMER1),)
> +OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF -DWITH_GSTREAMER_0_10=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER),y)
> -OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON -DWITH_GSTREAMER_0_10=ON
> +OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF -DWITH_GSTREAMER_0_10=ON
>  OPENCV_DEPENDENCIES += gstreamer gst-plugins-base
> -else
> -OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF -DWITH_GSTREAMER_0_10=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER1),y)
> +OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON -DWITH_GSTREAMER_0_10=OFF
> +OPENCV_DEPENDENCIES += gstreamer1 gst1-plugins-base
> +endif
> +
>  endif

Bug...

    $ make -C /home/ymorin/dev/buildroot/buildroot O=/home/ymorin/dev/buildroot/O/. distclean
    package/opencv/opencv.mk:239: *** extraneous `endif'.  Stop.
    make: *** [_all] Error 2

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
