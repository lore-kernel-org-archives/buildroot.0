From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Dec 2015 22:48:27 +0100
Subject: [Buildroot] [PATCH 03/12] package/mesa3d: add support for new
 virgl Gallium driver
In-Reply-To: <1450522892-14611-3-git-send-email-bernd.kuhls@t-online.de>
References: <1450522892-14611-1-git-send-email-bernd.kuhls@t-online.de>
 <1450522892-14611-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151219214827.GD3394@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, Al,

On 2015-12-19 12:01 +0100, Bernd Kuhls spake thusly:
> http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=11.1&id=a8987b88ff1db4ac00720a9b56c4bc3aeb666537
> "virgl is the 3D acceleration backend for the virtio-gpu shipping with
>  qemu. The 3D acceleration is designed around gallium and TGSI as the
>  virtualisation layer. The backend renderer translates the virgl
>  interface into OpenGL currently."

This is causing some build failures, like:

    http://autobuild.buildroot.org/results/399/399cca80ada5798decc87bff69a3acc432e8f3d0/
    http://autobuild.buildroot.org/results/60f/60f63958b2310e00937c498ddf2a0295ff77683a/

with errors like:

    configure: error: --with-egl-platforms=drm is required to build the
    virgl driver.

Care to have a look, please?

Regards,
Yann E. MORIN.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/Config.in | 7 +++++++
>  package/mesa3d/mesa3d.mk | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index fdeb599..8560794 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -77,6 +77,13 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
>  	  This is a software opengl implementation using the Gallium3D
>  	  infrastructure.
>  
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
> +	bool "Gallium virgl driver"
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	help
> +	  virgl is the 3D acceleration backend for the virtio-gpu
> +	  shipping with qemu.
> +
>  comment "DRI drivers need X.Org"
>  	depends on !BR2_PACKAGE_XORG7
>  
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 4c8a151..40e53cc 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -65,6 +65,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
> +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
>  # DRI Drivers
>  MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST) += swrast
>  MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I915)   += i915
> -- 
> 2.6.4
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
