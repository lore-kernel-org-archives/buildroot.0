From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Feb 2020 11:06:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add support for gallium
 i915 driver
In-Reply-To: <20200208074250.38952-1-james.hilliard1@gmail.com>
References: <20200208074250.38952-1-james.hilliard1@gmail.com>
Message-ID: <20200209100655.GJ23769@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-02-08 00:42 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/mesa3d/Config.in | 12 ++++++++++++
>  package/mesa3d/mesa3d.mk |  1 +
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 94e3f2cb9e..3da5fd3737 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -113,6 +113,18 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
>  	help
>  	  Mesa driver for Freedreno GPUs.
>  
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
> +	bool "Gallium i915 driver"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_LIBDRM_INTEL
> +	help
> +	  Support for i915-based Intel GPUs.
> +
> +comment "Gallium i915: Only one i915 provider can be built"
> +	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER_I915

We also want to hide the comment when the architecture is not x86, so I
added the missign  dependency on x86.

Applied to master with that fixed, thanks.

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
>  	bool "Gallium iris driver"
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 1a18cf3c58..7fb07ae05c 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -74,6 +74,7 @@ endif
>  #Gallium Drivers
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO) += freedreno
> +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915)     += i915
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS)     += iris
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO)    += kmsro
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     += lima
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
