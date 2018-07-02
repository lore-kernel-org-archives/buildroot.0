From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Jul 2018 23:30:01 +0200
Subject: [Buildroot] [PATCH v3 06/22] package/mesa3d: switch to xorgproto
In-Reply-To: <20180630110853.29339-7-bernd.kuhls@t-online.de>
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
 <20180630110853.29339-7-bernd.kuhls@t-online.de>
Message-ID: <20180702213001.GK2604@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2018-06-30 13:08 +0200, Bernd Kuhls spake thusly:
> The new package xorgproto will combine and replace all current xproto_*
> packages. For details read
> https://lists.x.org/archives/xorg-announce/2018-February/002835.html
> 
> Removed dri3 handling because xorgproto always installs dri3proto.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d/Config.in | 18 ++++--------------
>  package/mesa3d/mesa3d.mk |  8 +++-----
>  2 files changed, 7 insertions(+), 19 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 8c1877fbc1..dd36a5e0fd 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -8,9 +8,7 @@ menuconfig BR2_PACKAGE_MESA3D
>  	select BR2_PACKAGE_EXPAT
>  	select BR2_PACKAGE_HAS_LIBGL if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
> -	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_XORG7
> -	select BR2_PACKAGE_XPROTO_GLPROTO if BR2_PACKAGE_XORG7
> -	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XORGPROTO if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
> @@ -59,15 +57,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  config BR2_PACKAGE_MESA3D_DRI_DRIVER
>  	bool
>  	select BR2_PACKAGE_MESA3D_DRIVER
> -	# xlib-libxshmfence needs sync_4, so we cannot select it if
> -	# BR2_TOOLCHAIN_HAS_SYNC_4 is false. xproto-presentproto
> -	# doesn't need sync_4, but it is only needed in conjunction
> -	# with xlib-libxshmfence and dri3proto to provide dri3
> -	# support, so we also only select it if sync_4 is available.
> -	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
> -		(BR2_PACKAGE_XPROTO_DRI3PROTO && BR2_TOOLCHAIN_HAS_SYNC_4)
> -	select BR2_PACKAGE_XPROTO_PRESENTPROTO if \
> -		(BR2_PACKAGE_XPROTO_DRI3PROTO && BR2_TOOLCHAIN_HAS_SYNC_4)
> +	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_TOOLCHAIN_HAS_SYNC_4
>  
>  config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
>  	bool
> @@ -221,9 +211,9 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
>  	depends on BR2_i386 || BR2_x86_64
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # memfd.h
>  	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
> -	depends on BR2_PACKAGE_XORG7 # xproto_dri3proto
> +	depends on BR2_PACKAGE_XORG7 # xorgproto
>  	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
> -	select BR2_PACKAGE_XPROTO_DRI3PROTO
> +	select BR2_PACKAGE_XORGPROTO
>  	help
>  	  Vulkan driver for Intel hardware from Ivy Bridge onward.
>  
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 6e1e27f62f..cafc41f97d 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -57,13 +57,11 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_XORG7),y)
>  MESA3D_DEPENDENCIES += \
> -	xproto_xf86driproto \
> -	xproto_dri2proto \
> -	xproto_glproto \
>  	xlib_libX11 \
>  	xlib_libXext \
>  	xlib_libXdamage \
>  	xlib_libXfixes \
> +	xorgproto \
>  	libxcb
>  MESA3D_CONF_OPTS += --enable-glx --disable-mangling
>  # quote from mesa3d configure "Building xa requires at least one non swrast gallium driver."
> @@ -113,8 +111,8 @@ ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
>  MESA3D_CONF_OPTS += \
>  	--without-dri-drivers --disable-dri3
>  else
> -ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE)$(BR2_PACKAGE_XPROTO_DRI3PROTO),yy)
> -MESA3D_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto xproto_presentproto
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
> +MESA3D_DEPENDENCIES += xlib_libxshmfence
>  MESA3D_CONF_OPTS += --enable-dri3
>  else
>  MESA3D_CONF_OPTS += --disable-dri3
> -- 
> 2.17.1
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
