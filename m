From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 21:30:40 +0200
Subject: [Buildroot] [PATCH 1/8] package/mesa3d: introduce new Kconfig
 option to indicate full OpenGL support
In-Reply-To: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160427213040.327325f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Apr 2016 14:20:15 +0200, Bernd Kuhls wrote:

> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 45ca69c..2235f6c 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -29,6 +29,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  config BR2_PACKAGE_MESA3D_DRI_DRIVER
>  	select BR2_PACKAGE_MESA3D_DRIVER
>  	select BR2_PACKAGE_HAS_LIBGL if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_MESA3D_OPENGL_GL if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XPROTO_DRI3PROTO
>  	select BR2_PACKAGE_XPROTO_PRESENTPROTO if BR2_PACKAGE_XPROTO_DRI3PROTO
>  	bool
> @@ -145,7 +146,33 @@ config BR2_PACKAGE_MESA3D_OSMESA
>  
>  if BR2_PACKAGE_MESA3D_DRIVER
>  
> -comment "Additional API Support"
> +comment "API Support"
> +
> +if BR2_PACKAGE_MESA3D_DRI_DRIVER
> +if BR2_PACKAGE_XORG7
> +
> +config BR2_PACKAGE_MESA3D_OPENGL_GL
> +	bool "OpenGL"
> +	help
> +	  This helper option is only visible when enabled and indicates
> +	  that Mesa3D contains full OpenGL support.
> +
> +endif
> +endif
> +
> +comment "full OpenGL support needs a DRI driver"
> +	depends on !BR2_PACKAGE_MESA3D_OPENGL_GL
> +	depends on BR2_PACKAGE_XORG7
> +
> +comment "full OpenGL support needs X.org"
> +	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
> +	depends on !BR2_PACKAGE_MESA3D_OPENGL_GL
> +	depends on !BR2_PACKAGE_XORG7
> +
> +comment "full OpenGL support needs a DRI driver and X.org"
> +	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER
> +	depends on !BR2_PACKAGE_MESA3D_OPENGL_GL
> +	depends on !BR2_PACKAGE_XORG7

Unless I'm missing something, I believe this is much more complicated
than it needs to be. Can't you just remove all this, and replace it
with:

config BR2_PACKAGE_MESA3D_OPENGL_GL
	bool
	default y
	depends on BR2_PACKAGE_XORG7
	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER

This way, BR2_PACKAGE_MESA3D_OPENGL_GL is a blind option, that
indicates to mesa3d.mk whether full OpenGL support is enabled or not.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
