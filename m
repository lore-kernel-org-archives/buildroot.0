From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Mon, 10 Mar 2014 15:15:04 -0400
Subject: [Buildroot] [PATCH v4 2/5] mesa3d: modularize and bump to
 version 10.0.3
In-Reply-To: <BLU0-SMTP3984B0DC7878232A1681D9AD9750@phx.gbl>
References: <1394391692-13583-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP3984B0DC7878232A1681D9AD9750@phx.gbl>
Message-ID: <531E0F38.8050105@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi bernd,

On 03/09/2014 03:01 PM, Bernd Kuhls wrote:
> +config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
> +	bool "DRI i965 driver"
> +	depends on BR2_PACKAGE_XORG7
I don't think the dependance on XORG7 is required, see below.

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
> +	--enable-dri \
> +	--enable-shared-glapi \
> +	--enable-xa
> +else
> +MESA3D_CONF_OPT += \
> +	--disable-dri \
> +	--disable-shared-glapi \
> +	--disable-xa
> +endif
> +
I don't think you have to --disable-dri here, DRI is not only used by
the xorg server packages, if you want to do hardware GL rendering
without X on an intel graphic card, you still need to use the intel dri
driver (i dont know about the others).

> +# at least one API is required, for buildroot enable OpenGL API by default
> +# other APIs (EGL, EGL_ES) are optional
> +ifeq ($(MESA3D_GALLIUM_DRIVERS-y)$(MESA3D_DRI_DRIVERS-y),)
> +MESA3D_CONF_OPT += \
> +	--disable-opengl \
> +	--disable-glx
> +else
> +MESA3D_CONF_OPT += \
> +	--enable-opengl \
> +	--enable-glx
> +endif
> +
Enabling GLX is only required if you use the Xorg server.
Perhaps it should be set in "ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)".

> +ifeq ($(MESA3D_DRI_DRIVERS-y),)
> +MESA3D_CONF_OPT += \
> +	--without-dri-drivers
> +else
> +MESA3D_CONF_OPT += \
> +	--with-dri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
> +endif
> +
There is a problem here, you can have the option --with-dri-drivers and
--disable-dri at the same time.
Perhaps the option "--enable-dri" should be set here.

For example i can used the tool https://github.com/robclark/kmscube
without any X dependancies, by using mesa with the minimal configure
options set like this :
./configure --disable-static --enable-dri --with-dri-drivers="i915"
--without-gallium-drivers --disable-glx --enable-gles1 --enable-gles2
--with-egl-platforms=drm --enable-gbm


Regards,
Sebastien.
