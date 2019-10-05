From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 5 Oct 2019 11:26:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: implement option for
 Gallium VDPAU state tracker
In-Reply-To: <20190930060134.6503-1-bernd.kuhls@t-online.de>
References: <20190930060134.6503-1-bernd.kuhls@t-online.de>
Message-ID: <2a301fbe-8cd4-2bea-069c-01b505c568fe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 30/09/2019 ? 08:01, Bernd Kuhls a ?crit?:
> Dependencies are too complex to have them handled automatically:
> 
> - needs mesa3d platform x11:
>   https://cgit.freedesktop.org/mesa/mesa/tree/meson.build?h=19.2#n452
> - needs specific gallium drivers:
>   https://cgit.freedesktop.org/mesa/mesa/tree/meson.build?h=19.2#n459
> 
> Fixes:
> http://autobuild.buildroot.net/results/a2c/a2c120193f5bace3a8bbcfa728dae7e290e15d6c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/Config.in | 16 ++++++++++++++++
>  package/mesa3d/mesa3d.mk |  2 +-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index d9a705f991..de5ab4935a 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -222,6 +222,22 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
>  	  virgl is the 3D acceleration backend for the virtio-gpu
>  	  shipping with qemu.
>  
> +config BR2_PACKAGE_MESA3D_VDPAU
> +	bool "Gallium VDPAU state tracker"
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
> +		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 \
> +		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
> +	select BR2_PACKAGE_LIBVDPAU
> +	help
> +	  VDPAU state tracker (needs r600, radeonsi or nouveau gallium drivers).

Small coding style issue:
package/mesa3d/Config.in:235: help text: <tab><2 spaces><62 chars>
(http://nightly.buildroot.org/#writing-rules-config-in)

With that fixed:
Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> +
> +comment "Gallium VDPAU state tracker needs X.org and gallium drivers r600, radeonsi or nouveau"
> +	depends on !BR2_PACKAGE_XORG7 || \
> +		!(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
> +		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 \
> +		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI)
> +
>  config BR2_PACKAGE_MESA3D_XVMC
>  	bool "Gallium XvMC state tracker"
>  	depends on BR2_i386 || BR2_x86_64
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 35fe2bdbe5..8b0aba4556 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -230,7 +230,7 @@ else
>  MESA3D_CONF_OPTS += -Dlibunwind=false
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LIBVDPAU),y)
> +ifeq ($(BR2_PACKAGE_MESA3D_VDPAU),y)
>  MESA3D_DEPENDENCIES += libvdpau
>  MESA3D_CONF_OPTS += -Dgallium-vdpau=true
>  else
> 
