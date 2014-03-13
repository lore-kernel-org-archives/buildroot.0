From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Thu, 13 Mar 2014 15:30:37 -0400
Subject: [Buildroot] [PATCH v6 2/5] mesa3d: modularize and bump to
 version 10.0.4
In-Reply-To: <BLU0-SMTP225D817D6365614C1517D91D9760@phx.gbl>
References: <1394653353-10904-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP225D817D6365614C1517D91D9760@phx.gbl>
Message-ID: <5322075D.20206@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi bernd,

Just some typo to fix,
but ok for me.
Tested on an intel graphic card, with X using GLX and without X using EGL.

On 03/12/2014 03:42 PM, Bernd Kuhls wrote:
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 0ce168e..30e8feb 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -1,14 +1,118 @@
>  config BR2_PACKAGE_MESA3D
>  	bool "Mesa 3D Graphics Library"
> -	select BR2_PACKAGE_XPROTO_GLPROTO
> -	select BR2_PACKAGE_XLIB_LIBXXF86VM
> -	select BR2_PACKAGE_XLIB_LIBXDAMAGE
> -	select BR2_PACKAGE_XLIB_LIBXFIXES
> -	select BR2_PACKAGE_XPROTO_DRI2PROTO
>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_EXPAT
>  	select BR2_PACKAGE_HOST_LIBXML2_PYTHON
> -	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
> +	select BR2_PACKAGE_XPROTO_DRI2_PROTO if BR2_PACKAGE_XSERVER_XORG_SERVER
Typo here, must be : BR2_PACKAGE_XPROTO_DRI2PROTO

> +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
> +# egl depends on gbm, gbm depends on udev
> +MESA3D_DEPENDENCIES += udev
> +MESA3D_EGL_PLATFORMS = drm
> +ifeq ($(BR2_PACKAGE_WAYLAND),y)
> +MESA3D_DEPENDENCIES += wayland
> +MESA3D_EGL_PLATFORMS += wayland
> +endif
> +ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
> +MESA3D_EGL_PLATFORMS += x11
> +endif
> +MESA3D_CONF_OPT += \
> +	--enable-gbm \
> +	--enable-egl \
> +	--with-egl-platforms=$(foreach subst $(space),$(comma),$(MESA3D_EGL_PLATFORMS))
need quotes around the foreach for multiple selection ( example:
--with-egl-platform='drm x11')

Reviewed-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>

Regards,
Sebastien.
