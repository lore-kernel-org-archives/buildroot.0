From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 15:03:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: fix static build with
 tremor and vorbis
In-Reply-To: <20190601124231.25075-1-fontaine.fabrice@gmail.com>
References: <20190601124231.25075-1-fontaine.fabrice@gmail.com>
Message-ID: <20190601150329.0147d083@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sat,  1 Jun 2019 14:42:31 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index d3844391a2..039c2402c2 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -9,7 +9,6 @@ menuconfig BR2_PACKAGE_MPD
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
>  	select BR2_PACKAGE_BOOST
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> -	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)

Why was this select here in the first place ? Does it build fine with
no sub-option enabled ?

>  	help
>  	  MPD is a flexible, powerful, server-side application
>  	  for playing music. Through plugins and libraries
> @@ -132,18 +131,20 @@ config BR2_PACKAGE_MPD_OPUS
>  	  Select this if you want to play back OPUS encoded files.
>  
>  config BR2_PACKAGE_MPD_TREMOR
> -	bool "tremor"
> +	bool "tremor" if !BR2_SOFT_FLOAT
>  	select BR2_PACKAGE_LIBOGG
>  	select BR2_PACKAGE_TREMOR
> +	default y if !BR2_SOFT_FLOAT
>  	help
>  	  Enable vorbis input support.
>  	  Select this if you want to play back OGG files on softfloat
>  	  targets.

So for soft float targets, we should use tremor, but you make it depend
on !BR2_SOFT_FLOAT.

>  config BR2_PACKAGE_MPD_VORBIS
> -	bool "vorbis"
> +	bool "vorbis" if BR2_SOFT_FLOAT
>  	select BR2_PACKAGE_LIBOGG
>  	select BR2_PACKAGE_LIBVORBIS
> +	default y if BR2_SOFT_FLOAT
>  	help
>  	  Enable vorbis input/streaming support.
>  	  Select this if you want to play back OGG files on hardfloat

And for hard float targets, we should use vorbis, but you make it
available only on soft-float targets.

This seems weird.

Also, I am not sure why you are not just adding a depends on
BR2_SOFT_FLOAT in one case, and a "depends on !BR2_SOFT_FLOAT" in the
other case.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
