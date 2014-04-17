From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 22:31:06 +0200
Subject: [Buildroot] [PATCH v5 3/8] [v2] libva: new package
In-Reply-To: <1396588694-6377-4-git-send-email-bernd.kuhls@t-online.de>
References: <1396588694-6377-1-git-send-email-bernd.kuhls@t-online.de>
 <1396588694-6377-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140417223106.7ea1c67e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri,  4 Apr 2014 07:18:09 +0200, Bernd Kuhls wrote:

> diff --git a/package/libva/Config.in b/package/libva/Config.in
> new file mode 100644
> index 0000000..98a5ee8
> --- /dev/null
> +++ b/package/libva/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_LIBVA
> +	bool "libva"
> +	select BR2_PACKAGE_LIBDRM
> +	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XSERVER_XORG_SERVER
> +	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XSERVER_XORG_SERVER

When BR2_PACKAGE_XSERVER_XORG_SERVER is enabled, the .mk file also
depends on xlib_libX11, so I believe you should add a:

	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XSERVER_XORG_SERVER

here.

Also, you need to propagate the BR2_LARGEFILE dependency of
BR2_PACKAGE_LIBDRM.

> diff --git a/package/libva/libva.mk b/package/libva/libva.mk
> new file mode 100644
> index 0000000..58d7b59
> --- /dev/null
> +++ b/package/libva/libva.mk
> @@ -0,0 +1,48 @@
> +################################################################################
> +#
> +# libva
> +#
> +################################################################################
> +
> +LIBVA_VERSION = 1.3.0
> +LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
> +LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
> +LIBVA_LICENSE = MIT

You can add:

LIBVA_LICENSE_FILES = COPYING

> +LIBVA_INSTALL_STAGING = YES
> +
> +LIBVA_DEPENDENCIES = host-pkgconf libdrm
> +
> +LIBVA_CONF_OPT = \
> +	--enable-drm \
> +	--disable-dummy-driver \
> +	--with-drivers-path="/usr/lib/va"
> +
> +ifeq ($(BR2_PACKAGE_MESA3D),y)
> +LIBVA_DEPENDENCIES += mesa3d
> +LIBVA_CONF_OPT += --enable-glx

Are you sure that GLX support is always available as soon as mesa3d is
enabled? I believe that GLX is the protocol used to do OpenGL under
X.org, but Mesa3d is usable outside of X.org.

> +endif
> +
> +ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
> +LIBVA_DEPENDENCIES += \
> +	xlib_libX11 \
> +	xlib_libXext \
> +	xlib_libXfixes
> +LIBVA_CONF_OPT += --enable-x11
> +else
> +LIBVA_CONF_OPT += --disable-x11
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WAYLAND),y)
> +LIBVA_DEPENDENCIES += wayland
> +LIBVA_CONF_OPT += --enable-wayland
> +else
> +LIBVA_CONF_OPT += --disable-wayland
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_OPENGL_EGL),y)
> +LIBVA_CONF_OPT += --enable-egl

This would need a:

LIBVA_DEPENDENCIES += libegl

otherwise, the egl implementation is not guaranteed to be available
before libva gets built.

> +else
> +LIBVA_CONF_OPT += --disable-egl
> +endif
> +
> +$(eval $(autotools-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
