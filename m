From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 23:38:04 +0100
Subject: [Buildroot] [PATCH 02/11] opencv: rework V4L/libv4l support
In-Reply-To: <1392588004-13317-3-git-send-email-s.martin49@gmail.com>
References: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
 <1392588004-13317-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20140303233804.72c3beae@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Can you have a look at the below dependency tricks, and tell me your
opinion about how they are expressed in terms of comments and al. ?

Thanks,

Thomas

On Sun, 16 Feb 2014 22:59:55 +0100, Samuel Martin wrote:
> Starting with the 2.4.7 release, for V4L support, OpenCV does not
> requires a libv4l dependency for its V4L support.
> 
> So, it now provides 2 distincts knobs for this: WITH_V4L and a new
> one: WITH_LIBV4L.
> 
> This patch takes advantage of this new knob and libv4l support is
> now automatically enabled if only the libv4l package is enabled.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/opencv/Config.in | 11 ++++++-----
>  package/opencv/opencv.mk | 10 +++++++---
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index c3273fd..2acbe19 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -189,14 +189,15 @@ config BR2_PACKAGE_OPENCV_WITH_TIFF
>  
>  config BR2_PACKAGE_OPENCV_WITH_V4L
>  	bool "v4l support"
> -	depends on BR2_LARGEFILE
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	select BR2_PACKAGE_LIBV4L
>  	help
>  	  Enable Video 4 Linux support.
>  
> -comment "v4l support needs a toolchain w/ largefile, threads"
> -	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
> +	  If the package libv4l is enabled, its support is automatically enabled.
> +
> +if BR2_PACKAGE_OPENCV_WITH_V4L && !(BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_THREADS)
> +comment "libv4l support will be disabled."
> +comment "libv4l support needs a toolchain w/ largefile, threads"
> +endif
>  
>  comment "Install options"
>  
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index 43aef62..fb56769 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -210,10 +210,14 @@ OPENCV_CONF_OPT += -DWITH_TIFF=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_V4L),y)
> -OPENCV_CONF_OPT += -DWITH_V4L=ON -DWITH_LIBV4L=ON
> -OPENCV_DEPENDENCIES += libv4l
> +OPENCV_CONF_OPT += \
> +	-DWITH_V4L=ON \
> +	-DWITH_LIBV4L=$(if $(BR2_PACKAGE_LIBV4L),ON,OFF)
> +OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBV4L),libv4l)
>  else
> -OPENCV_CONF_OPT += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
> +OPENCV_CONF_OPT += \
> +	-DWITH_V4L=OFF \
> +	-DWITH_LIBV4L=OFF
>  endif
>  
>  # Installation hooks:



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
