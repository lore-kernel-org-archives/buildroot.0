From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Tue, 11 Mar 2014 17:49:18 -0400
Subject: [Buildroot] [PATCH v5 3/6] mesa3d: modularize and bump to
 version 10.0.3
In-Reply-To: <BLU0-SMTP1419F6C427A11CAB6AF9F7ED9770@phx.gbl>
References: <1394564029-528-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP1419F6C427A11CAB6AF9F7ED9770@phx.gbl>
Message-ID: <531F84DE.5080005@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On 03/11/2014 02:53 PM, Bernd Kuhls wrote:
> +config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
> +	bool "DRI i965 driver"
> +	depends on BR2_i386 || BR2_x86_64
> +	select BR2_PACKAGE_MESA3D_DRI_DRIVER
> +	select BR2_PACKAGE_LIBDRM_INTEL
> +	help
> +	  Supports all Intel GPUs.  This version is most supported by Intel.
> +
We still need to have a dependency on BR2_PACKAGE_XORG7.
Sorry for the noise.

> +ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
> +MESA3D_DEPENDENCIES += \
> +	xproto_xf86driproto \
> +	xproto_dri2proto \
> +	xproto_glproto \
> +	xlib_libX11 \
> +	xlib_libXext \
> +	xlib_libXdamage \
> +	xlib_libXfixes \
> +	libxcb
> +MESA3D_CONF_OPT += \
> +	--enable-glx \
> +	--enable-shared-glapi \
> +	--enable-xa
> +else
> +MESA3D_CONF_OPT += \
> +	--disable-glx \
> +	--disable-shared-glapi \
I didn't catch it before, but the shared-glapi option is required by GBM
(so by EGL) when you use a DRI driver, perhaps you could add a
conditionnal statement in your "ifeq
($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)" or always enabled it when you use
a DRI driver, i don't know if it can be a trouble to let this option
enabled as default.

FYI, with your patches and that little changes, i'm able to do hardware
GL rendering with an intel graphic card and without X, so this
configuration work for me.

Regards,
Sebastien.
