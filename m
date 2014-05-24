From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 May 2014 20:28:04 +0200
Subject: [Buildroot] [PATCH v9 08/29] libva: new package
In-Reply-To: <1400618488-6995-9-git-send-email-bernd.kuhls@t-online.de>
References: <1400618488-6995-1-git-send-email-bernd.kuhls@t-online.de>
 <1400618488-6995-9-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140524182804.GD3491@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-20 22:41 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[--SNIP--]
> diff --git a/package/libva/libva.mk b/package/libva/libva.mk
> new file mode 100644
> index 0000000..550fa3f
> --- /dev/null
> +++ b/package/libva/libva.mk
> @@ -0,0 +1,57 @@
> +################################################################################
> +#
> +# libva
> +#
> +################################################################################
> +
> +LIBVA_VERSION = 1.3.1
> +LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
> +LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
> +LIBVA_LICENSE = MIT
> +LIBVA_LICENSE_FILES = COPYING
> +LIBVA_AUTORECONF = YES
> +LIBVA_INSTALL_STAGING = YES
> +LIBVA_DEPENDENCIES = host-pkgconf libdrm
> +
> +# libdrm is a hard-dependency
> +LIBVA_CONF_OPT = \
> +	--enable-drm \
> +	--disable-dummy-driver \
> +	--with-drivers-path="/usr/lib/va"
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
> +LIBVA_DEPENDENCIES += mesa3d
> +LIBVA_CONF_OPT += --enable-glx
> +else
> +LIBVA_CONF_OPT += --disable-glx
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XORG7),y)
> +LIBVA_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
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
> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
> +LIBVA_DEPENDENCIES += libegl
> +LIBVA_CONF_OPT += --enable-egl
> +else
> +LIBVA_CONF_OPT += --disable-egl
> +endif
> +
> +# Autoreconf requires an m4 directory to exist
> +define LIBVA_PATCH_M4
> +	mkdir -p $(@D)/m4
> +endef
> +
> +LIBVA_POST_PATCH_HOOKS += LIBVA_PATCH_M4

No empty line between the definition of the hook, and the assignment.

Otherwise, looks good. I reserve my review for after I have tested it.

Regards,
Yann E. MORIN.

> +
> +$(eval $(autotools-package))
> -- 
> 1.7.10.4
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
