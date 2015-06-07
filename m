From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2015 14:34:04 +0200
Subject: [Buildroot] [PATCH v5 08/13] package/opencv: add gstreamer-1.x
	support
In-Reply-To: <1433672799-21387-9-git-send-email-s.martin49@gmail.com>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
 <1433672799-21387-9-git-send-email-s.martin49@gmail.com>
Message-ID: <20150607123404.GI3545@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-07 12:26 +0200, Samuel Martin spake thusly:
> Starting with the 2.4.10 release, OpenCV supports both Gstreamer-0.10
> and Gstreamer-1, but only one can be enabled at the same time (OpenCV
> uses Gstreamer-1 when available).
> 
> Since Buildroot allows both Gstreamer versions to co-exist, the
> configure options and dependencies are set to reflect the OpenCV
> preference.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But see a comment below...

> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index aa972dc..6162d1e 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -211,10 +211,15 @@ OPENCV_CONF_OPTS += -DWITH_FFMPEG=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER),y)
> -OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON
> +ifeq ($(BR2_PACKAGE_GSTREAMER1),y)
> +OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON -DWITH_GSTREAMER_0_10=OFF
> +OPENCV_DEPENDENCIES += gstreamer1 gst1-plugins-base
> +else
> +OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF -DWITH_GSTREAMER_0_10=ON
>  OPENCV_DEPENDENCIES += gstreamer gst-plugins-base
> +endif
>  else
> -OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF
> +OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF -DWITH_GSTREAMER_0_10=OFF

This -DWITH_GSTREAMER_0_10=OFF should be added at the time you do the
OpenCV bump, I believe.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
