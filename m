From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jul 2015 11:39:14 +0200
Subject: [Buildroot] [PATCH v7 7/7] package/vlc: add opencv support
In-Reply-To: <1436036821-10073-8-git-send-email-s.martin49@gmail.com>
References: <1436036821-10073-1-git-send-email-s.martin49@gmail.com>
 <1436036821-10073-8-git-send-email-s.martin49@gmail.com>
Message-ID: <20150705093914.GG3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, all,

On 2015-07-04 21:07 +0200, Samuel Martin spake thusly:
> This change adds 2 patches (backported from upstream) to vlc fixing the
> build against opencv2 APIs.
> This allows to select the minimal set of opencv modules when opencv
> support is enabled.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

This reviewd tag stands, still I have a question:

> diff --git a/package/vlc/Config.in b/package/vlc/Config.in
> index b030a56..471f4a7 100644
> --- a/package/vlc/Config.in
> +++ b/package/vlc/Config.in
> @@ -11,6 +11,8 @@ config BR2_PACKAGE_VLC
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
>  	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
> +	select BR2_PACKAGE_OPENCV_LIB_IMGPROC if BR2_PACKAGE_OPENCV
> +	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT if BR2_PACKAGE_OPENCV

objdetect already selects imgproc. So, does vlc w/ opencv really need
imgproc by itself? If so, the select is OK, otherwise, it is
superfluous.

Regards,
Yann E. MORIN.

>  	help
>  	  VLC is a free and open source cross-platform multimedia player
>  	  and framework that plays most multimedia files as well as DVD,
> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
> index 4ef69aa..a553648 100644
> --- a/package/vlc/vlc.mk
> +++ b/package/vlc/vlc.mk
> @@ -44,7 +44,6 @@ VLC_CONF_OPTS += \
>  	--disable-projectm \
>  	--disable-vsxu \
>  	--disable-mtp \
> -	--disable-opencv \
>  	--disable-mmal-codec \
>  	--disable-mmal-vout \
>  	--disable-dvdnav \
> @@ -148,6 +147,13 @@ else
>  VLC_CONF_OPTS += --disable-gles2
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENCV),y)
> +VLC_CONF_OPTS += --enable-opencv
> +VLC_DEPENDENCIES += opencv
> +else
> +VLC_CONF_OPTS += --disable-opencv
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPUS),y)
>  VLC_CONF_OPTS += --enable-opus
>  VLC_DEPENDENCIES += libvorbis opus
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
