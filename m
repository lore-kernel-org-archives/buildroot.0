From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Feb 2020 21:55:16 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/mesa3d: add v3d driver
 support
In-Reply-To: <20200204144412.6666-2-ps.report@gmx.net>
References: <20200204144412.6666-1-ps.report@gmx.net>
 <20200204144412.6666-2-ps.report@gmx.net>
Message-ID: <20200204205516.GB6335@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-02-04 15:44 +0100, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks. I did a few tweaks to the help text,though,
see below...

> ---
>  package/mesa3d/Config.in | 12 ++++++++++++
>  package/mesa3d/mesa3d.mk |  3 +++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 5929e15442..1351d1cd97 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -224,6 +224,18 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA
>  	help
>  	  Adds support for Nvidia Tegra GPUs, requires nouveau.
>  
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
> +	bool "Gallium v3d driver"
> +	depends on BR2_arm || BR2_aarch64
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
> +	select BR2_PACKAGE_LIBDRM_VC4
> +	select BR2_PACKAGE_MESA3D_OPENGL_EGL
> +	help
> +	  Driver for Broadcom VC6 (rpi4) GPUs (needs kmsro and vc4).

I don't understand why you added that '(needs kmsro and vc4)': the
corresponding config entries are properly selected above, and thus
this part of the help text is of no use for the user, and tend to in
fact be very confusing. But since this is the same mess with the other
options around, I left it. It would be nice to clean them away, though.

> +	  It requires a recent enough mainline/raspberrypi kernel with
> +	  drm v3d (CONFIG_DRM_V3D, CONFIG_DRM_VC4) support enabled.

"recent enough" is of no use to the user: some woudl consider 4.0 to be
recent, some would consider 5.0 to be old. Sol I replaced that with the
exact version v3d was merged in mainline linux, that is 4.18.

Regards,
Yann E. MORIN.

> +
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
>  	bool "Gallium vc4 driver"
>  	depends on BR2_arm || BR2_aarch64
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index c7e5be55a0..1a18cf3c58 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -84,6 +84,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA)    += tegra
> +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D)      += v3d
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
>  # DRI Drivers
> @@ -162,6 +163,8 @@ endif
>  MESA3D_PLATFORMS = surfaceless
>  ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
>  MESA3D_PLATFORMS += drm
> +else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D),y)
> +MESA3D_PLATFORMS += drm
>  else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4),y)
>  MESA3D_PLATFORMS += drm
>  else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
> -- 
> 2.25.0
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
