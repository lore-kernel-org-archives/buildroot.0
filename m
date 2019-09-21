From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 17:15:01 +0200
Subject: [Buildroot] [PATCH v13 05/13] package/mesa3d: add xvmc option
In-Reply-To: <20190920163849.8124-6-bernd.kuhls@t-online.de>
References: <20190920163849.8124-1-bernd.kuhls@t-online.de>
 <20190920163849.8124-6-bernd.kuhls@t-online.de>
Message-ID: <17504d85-87a2-bd71-3686-bf5424413cd9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/09/2019 18:38, Bernd Kuhls wrote:
> From: Romain Naour <romain.naour@smile.fr>
> 
> "XVMC state tracker requires at least one of the following gallium drivers: r600, nouveau."
> 
> https://cgit.freedesktop.org/mesa/mesa/commit/?id=22a817af8a89eb3c762fc3e07b443a3ce37d7416
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/Config.in | 14 ++++++++++++++
>  package/mesa3d/mesa3d.mk |  2 +-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 1f5f221337..7cec73ab5b 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -312,6 +312,20 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
>  config BR2_PACKAGE_PROVIDES_LIBOPENCL
>  	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENCL
>  
> +config BR2_PACKAGE_MESA3D_XVMC
> +	bool "XvMC state tracker"

 This will appear in the "Additional API support" menu, is that intentional?

> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
> +		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
> +	select BR2_PACKAGE_XLIB_LIBXVMC
> +	help
> +	  XVMC state tracker (needs r600 or nouveau gallium drivers).
> +
> +comment "XvMC depends on X.org and needs gallium drivers: r600, nouveau"
> +	depends on !BR2_PACKAGE_XORG7
> +	depends on !BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
> +		|| !BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600

 These conditions are incorrect, it should be:

	depends on !BR2_PACKAGE_XORG7 || \
		!(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
		  || BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)

 In addition, it makes no sense to show this comment if the drivers can't be
selected, so also add a

	depends on i386 || x86_64


 This was a bit too much for me to fix up while applying, so I did *not* apply
this patch to master yet.

 Regards,
 Arnout

> +
>  endif # BR2_PACKAGE_MESA3D
>  
>  comment "mesa3d needs a toolchain w/ C++, NPTL, dynamic library"
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 81736c83d3..5fb6c5aee9 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -220,7 +220,7 @@ else
>  MESA3D_CONF_OPTS += --disable-gles1 --disable-gles2
>  endif
>  
> -ifeq ($(BR2_PACKAGE_XLIB_LIBXVMC),y)
> +ifeq ($(BR2_PACKAGE_MESA3D_XVMC),y)
>  MESA3D_DEPENDENCIES += xlib_libXvMC
>  MESA3D_CONF_OPTS += --enable-xvmc
>  else
> 
