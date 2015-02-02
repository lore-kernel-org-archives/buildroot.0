From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 21:40:53 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/mesa3d: Refactor XA support
 to prepare support for ATI drivers
In-Reply-To: <1421514235-27122-1-git-send-email-bernd.kuhls@t-online.de>
References: <1421514235-27122-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150202214053.618db057@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 17 Jan 2015 18:03:54 +0100, Bernd Kuhls wrote:
> --
> v2: - rebased patch by micro1183: http://patchwork.ozlabs.org/patch/398857/

This shouldn't be part of the commit log, but should be...

> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---

... here, i.e below the "---" sign.

> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index eb977b6..6b3ccce 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -43,6 +43,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
>  	depends on BR2_i386 || BR2_x86_64
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  	select BR2_PACKAGE_LIBDRM_NOUVEAU
> +	select BR2_PACKAGE_MESA3D_NEEDS_XA
>  	help
>  	  Supports all Nvidia GPUs.
>  
> @@ -51,6 +52,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
>  	depends on BR2_i386 || BR2_x86_64
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  	select BR2_PACKAGE_LIBDRM_VMWGFX
> +	select BR2_PACKAGE_MESA3D_NEEDS_XA
>  	help
>  	  This is a virtual GPU driver for VMWare virtual machines.
>  
> @@ -61,6 +63,9 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
>  	  This is a software opengl implementation using the Gallium3D
>  	  infrastructure.
>  
> +config BR2_PACKAGE_MESA3D_NEEDS_XA
> +	bool

I've moved this new blind option next to the other existing blind
options in the package.

>  MESA3D_CONF_OPTS += --enable-glx
>  # quote from mesa3d configure "Building xa requires at least one non swrast gallium driver."
> -ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA),)
> +ifneq ($(BR2_PACKAGE_MESA3D_NEEDS_XA),)

We could now use positive logic here. I'll switch to that in a
follow-up commit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
