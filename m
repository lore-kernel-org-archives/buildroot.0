From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jul 2015 10:35:32 +0200
Subject: [Buildroot] [PATCH v7 1/7] package/opencv: add a choice for
 selecting gstreamer support
In-Reply-To: <1436036821-10073-2-git-send-email-s.martin49@gmail.com>
References: <1436036821-10073-1-git-send-email-s.martin49@gmail.com>
 <1436036821-10073-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20150705083532.GA3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-07-04 21:06 +0200, Samuel Martin spake thusly:
> OpenCV 3.0 support both gstreamer-0.10 and gstreamer-1.x, but only one
> is used at the time.
> 
> This patch turns the gstreamer support into a choice, in order to prepare
> adding the support for gstreamer-1 in a following patch.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v6->v7:
> - move gstreamer comment inside the choice (Yann)
> 
> changes v5->v6:
> - new patch
> ---
>  package/opencv/Config.in | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index 576f667..c3b7535 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -173,19 +173,29 @@ config BR2_PACKAGE_OPENCV_WITH_FFMPEG
>  	help
>  	  Use ffmpeg from the target system.
>  
> +choice
> +	prompt "gstreamer support"
> +	help
> +	  OpenCV prefers gstreamer-1 over gstreamer-0.10.

This comment does not belong in this commit, but should have been part
of the following commit, where you effectively add support for gst-1.

> +config BR2_PACKAGE_OPENCV_WITHOUT_GSTREAMER
> +	bool "none"
> +
>  config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
> -	bool "gstreamer support"
> -	depends on BR2_USE_MMU # gstreamer -> libglib2
> -	depends on BR2_USE_WCHAR # gstreamer -> libglib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer -> libglib2
> +	bool "gstreamer-0.10"
> +	depends on BR2_USE_MMU # libglib2
> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2

I would have changed the comment about the dependencies, and if so, I
would have kept the gst part, not the glib part (because we're not
selecting glib, so it is not so obvious why we need those deps).

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_GSTREAMER
>  	select BR2_PACKAGE_GST_PLUGINS_BASE
>  	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
>  
> -comment "gstreamer support needs a toolchain w/ wchar, threads"
> +comment "gstreamer-0.10 support needs a toolchain w/ wchar, threads"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>  
> +endchoice
> +
>  config BR2_PACKAGE_OPENCV_WITH_GTK
>  	bool "gtk support"
>  	depends on BR2_PACKAGE_XORG7
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
