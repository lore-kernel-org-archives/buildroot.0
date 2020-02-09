From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Feb 2020 17:15:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add support for dri
 r200 driver
In-Reply-To: <20200209153053.128369-1-james.hilliard1@gmail.com>
References: <20200209153053.128369-1-james.hilliard1@gmail.com>
Message-ID: <20200209161521.GQ23769@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-02-09 08:30 -0700, James Hilliard spake thusly:
> Renamed r100 driver to be consistent with r200 driver.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/mesa3d/Config.in | 11 +++++++++--
>  package/mesa3d/mesa3d.mk |  3 ++-
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 9965b0e972..882ae8d1d3 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -343,13 +343,20 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
>  	help
>  	  Support for Nvidia-based GPUs.
>  
> -config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
> -	bool "DRI radeon driver"
> +config BR2_PACKAGE_MESA3D_DRI_DRIVER_R100

You forgot to handle the legacy option (in top-level Config.in.legacy).

However, I wonder how important that rename is; I believe we can keep
the existing option as-is, and just adjust the prompt to make it
explicit this is about r100.

Besides, a siple config doesn ot build:

    BR2_x86_64=y
    BR2_x86_steamroller=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_INIT_NONE=y
    BR2_SYSTEM_BIN_SH_NONE=y
    # BR2_PACKAGE_BUSYBOX is not set
    BR2_PACKAGE_MESA3D=y
    BR2_PACKAGE_MESA3D_DRI_DRIVER_R200=y

which fails with:

    meson.build:449:4: ERROR: Problem encountered: building dri drivers
    require at least one windowing system or classic osmesa

Care to have a look and respin, please?

Regards,
Yann E. MORIN.

> +	bool "DRI radeon r100 driver"
>  	select BR2_PACKAGE_MESA3D_DRI_DRIVER
>  	select BR2_PACKAGE_LIBDRM_RADEON
>  	help
>  	  Legacy Radeon driver for R100 series GPUs.
>  
> +config BR2_PACKAGE_MESA3D_DRI_DRIVER_R200
> +	bool "DRI radeon r200 driver"
> +	select BR2_PACKAGE_MESA3D_DRI_DRIVER
> +	select BR2_PACKAGE_LIBDRM_RADEON
> +	help
> +	  Legacy Radeon driver for R200 series GPUs.
> +
>  comment "Vulkan drivers"
>  
>  config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 7fb07ae05c..fb178e0622 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -93,7 +93,8 @@ MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST) += swrast
>  MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I915)   += i915
>  MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
>  MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU) += nouveau
> -MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += r100
> +MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_R100)   += r100
> +MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_R200)   += r200
>  # Vulkan Drivers
>  MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
>  
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
