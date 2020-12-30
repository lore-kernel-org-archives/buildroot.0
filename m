From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2020 10:07:34 +0100
Subject: [Buildroot] [RFC v1 4/6] package/mesa3d: add vulkan broadcom
 driver support
In-Reply-To: <20201223224553.8570-5-ps.report@gmx.net>
References: <20201223224553.8570-1-ps.report@gmx.net>
 <20201223224553.8570-5-ps.report@gmx.net>
Message-ID: <20201230090734.GI1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-12-23 23:45 +0100, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 45eb62b701..73e7199e8c 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -388,6 +388,14 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
>  
>  comment "Vulkan drivers"
>  
> +config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
> +	bool "Vulkan broadcom driver"
> +	depends on BR2_arm || BR2_aarch64
> +	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
> +	help
> +	  Vulkan broadcom driver.

I guess this is where we would introduce the select BR2_PACKAGE_PROVIDES_LIBVULKAN
of that other series I pointed earlier:
    https://patchwork.ozlabs.org/project/buildroot/list/?series=157522

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
>  	bool "Vulkan Intel driver"
>  	depends on BR2_i386 || BR2_x86_64
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index d754cb8796..d9ea752d3e 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -110,6 +110,7 @@ MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
>  MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU) += nouveau
>  MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += r100
>  # Vulkan Drivers
> +MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
>  MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
>  
>  ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
> @@ -143,9 +144,11 @@ ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
>  MESA3D_CONF_OPTS += \
>  	-Dvulkan-drivers=
>  else
> +ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL),y)
>  MESA3D_DEPENDENCIES += xlib_libxshmfence
> +MESA3D_CONF_OPTS += -Ddri3=enabled
> +endif
>  MESA3D_CONF_OPTS += \
> -	-Ddri3=enabled \

Meh... dri3 is already driven by BR2_PACKAGE_MESA3D_DRI_DRIVER, and this
is going to be quite another mess if we drive it in a second place (not
the fault of your patch, it's already the case before, but tstill, a bit
of cleanup is probably in order...)

Regards,
Yann E. MORIN.

>  	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
>  endif
>  
> -- 
> 2.29.2
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
