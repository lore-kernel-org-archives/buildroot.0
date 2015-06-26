From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Jun 2015 20:12:57 +0200
Subject: [Buildroot] [PATCH v6 10/16] package/opencv: add gstreamer-1.x
	support
In-Reply-To: <1435262397-888-11-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
 <1435262397-888-11-git-send-email-s.martin49@gmail.com>
Message-ID: <20150626181257.GD12470@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015-06-25 21:59 +0200, Samuel Martin spake thusly:
> Starting with the 2.4.10 release, OpenCV supports both Gstreamer-0.10
> and Gstreamer-1, but only one can be enabled at the same time (OpenCV
> chooses Gstreamer-1 over Gstreamer-0.10 when both are available).
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> changes v5->v6:
> - rebase
> - use a choice
> 
> changes v4->v5:
> - rebase
> - update a/r/t tags
> - rework gst-X backend selection (use similar structure for qt)
> - remove patch merged upstream
> 
> changes v3->v4:
> - new patch
> ---
>  package/opencv/Config.in |  7 +++++++
>  package/opencv/opencv.mk | 15 ++++++++++++---
>  2 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index 4b571e0..f89e62d 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -186,6 +186,8 @@ choice
>  	depends on BR2_USE_MMU # libglib2
>  	depends on BR2_USE_WCHAR # libglib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	help
> +	  OpenCV prefers gstreamer-1 over gstreamer-0.10.
>  
>  config BR2_PACKAGE_OPENCV_WITHOUT_GSTREAMER
>  	bool "none"
> @@ -196,6 +198,11 @@ config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
>  	select BR2_PACKAGE_GST_PLUGINS_BASE
>  	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
>  
> +config BR2_PACKAGE_OPENCV_WITH_GSTREAMER1
> +	bool "gstreamer-1.x"
> +	select BR2_PACKAGE_GSTREAMER1
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP

And then, of course, update the comment from the previous patch, to
encompass both gstreamer versions.

Regards,
Yann E. MORIN.

>  endchoice
>  
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
>  
>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
> -- 
> 2.4.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
