From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Feb 2020 17:30:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add support for gallium
 r300 driver
In-Reply-To: <20200209151202.51777-1-james.hilliard1@gmail.com>
References: <20200209151202.51777-1-james.hilliard1@gmail.com>
Message-ID: <20200209163028.GS23769@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-02-09 08:12 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/mesa3d/Config.in | 16 +++++++++++++---
>  package/mesa3d/mesa3d.mk |  1 +
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 9965b0e972..f5d04b8e2b 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -166,6 +166,14 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
>  	help
>  	  Mesa driver for ARM Mali Midgard and Bifrost GPUs.
>  
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300
> +	bool "Gallium Radeon R300 driver"
> +	depends on BR2_i386 || BR2_x86_64
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_LIBDRM_RADEON

You also forgot to propagate the dependency for BR2_PACKAGE_LIBDRM_RADEON.

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

> +	help
> +	  Driver for ATI/AMD Radeon R300/R400/R500 GPUs.
> +
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
>  	bool "Gallium Radeon R600 driver"
>  	depends on BR2_i386 || BR2_x86_64
> @@ -275,17 +283,19 @@ config BR2_PACKAGE_MESA3D_VDPAU
>  	bool "Gallium VDPAU state tracker"
>  	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
> +		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300 \
>  		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 \
>  		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
>  	select BR2_PACKAGE_MESA3D_NEEDS_X11
>  	select BR2_PACKAGE_LIBVDPAU
>  	help
> -	  VDPAU state tracker (needs r600, radeonsi or nouveau gallium
> -	  drivers).
> +	  VDPAU state tracker (needs r300, r600, radeonsi or nouveau
> +	  gallium drivers).
>  
> -comment "Gallium VDPAU state tracker needs X.org and gallium drivers r600, radeonsi or nouveau"
> +comment "Gallium VDPAU state tracker needs X.org and gallium drivers r300, r600, radeonsi or nouveau"
>  	depends on !BR2_PACKAGE_XORG7 || \
>  		!(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
> +		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300 \
>  		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 \
>  		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI)
>  
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 7fb07ae05c..c14716bf15 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -80,6 +80,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO)    += kmsro
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     += lima
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST) += panfrost
> +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300)     += r300
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
