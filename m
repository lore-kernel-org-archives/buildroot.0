From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 12:51:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/weston: replace autotools with
 meson
In-Reply-To: <20190623002301.89028-1-james.hilliard1@gmail.com>
References: <20190623002301.89028-1-james.hilliard1@gmail.com>
Message-ID: <20190623125149.22f8e9b1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

On Sat, 22 Jun 2019 18:23:01 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> The autotools build system is in the process of being deprecated and
> replaced with meson for weston.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks for this work. However, the conversion is not a 1:1 process, and
the different aspects that are not immediately clear should have been
explained in the commit log.

> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index f874b0cc6a..243da7b6f3 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -100,7 +100,20 @@ comment "XWayland support needs libepoxy and X.org enabled"
>  
>  config BR2_PACKAGE_WESTON_DEMO_CLIENTS
>  	bool "demo clients"
> +	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
> +	depends on BR2_USE_WCHAR # pango
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
> +	depends on BR2_USE_MMU # pango
> +	depends on BR2_INSTALL_LIBSTDCPP # pango
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
> +	select BR2_PACKAGE_PANGO

Why has this changed ? Why would the demo clients need pango when built
with meson, but not when built with the autotools.

>  WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
> -	libxkbcommon pixman libpng jpeg udev cairo libinput libdrm \
> -	$(if $(BR2_PACKAGE_WEBP),webp)
> +	libxkbcommon pixman libpng jpeg udev cairo libinput libdrm

The drop of webp here as an optional dependency was confusing
initially, but it's re-added later.

> -# Uses VIDIOC_EXPBUF, only available from 3.8+
> -ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),)
> -WESTON_CONF_OPTS += --disable-simple-dmabuf-v4l-client
> -endif

Why is this moved inside a
$(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy
condition ?

> +	-Dbuild.pkg_config_path=$(HOST_DIR)/lib/pkgconfig \
> +	-Dremoting=false \
> +	-Dbackend-headless=false \
> +	-Dcolor-management-colord=false \
> +	-Dsimple-dmabuf-drm=auto
>  
>  ifeq ($(BR2_PACKAGE_DBUS),y)
> -WESTON_CONF_OPTS += --enable-dbus
> +WESTON_CONF_OPTS += -Dlauncher-logind=true
>  WESTON_DEPENDENCIES += dbus
>  else
> -WESTON_CONF_OPTS += --disable-dbus
> +WESTON_CONF_OPTS += -Dlauncher-logind=false
> +endif

So launcher-logind is the thing that requires dbus support ? What's non
obvious here is that we're switching for a very clear/obvious
--enable-dbus/--disable-dbus to a much less obvious dbus ->
launcher-logind.

>  ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
> -WESTON_CONF_OPTS += --enable-egl
> +WESTON_CONF_OPTS += -Drenderer-gl=true
>  WESTON_DEPENDENCIES += libegl libgles
> +# Uses VIDIOC_EXPBUF, only available from 3.8+
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),)
> +WESTON_CONF_OPTS +=	-Dsimple-clients=dmabuf-v4l
> +else
> +WESTON_CONF_OPTS +=	-Dsimple-clients=
> +endif

So yes, why is this here now ? What happens when -Dsimple-clients is
empty ?

>  ifeq ($(BR2_PACKAGE_WESTON_RDP),y)
>  WESTON_DEPENDENCIES += freerdp
> -WESTON_CONF_OPTS += --enable-rdp-compositor
> +WESTON_CONF_OPTS += -Dbackend-rdp=true
>  else
> -WESTON_CONF_OPTS += --disable-rdp-compositor
> +WESTON_CONF_OPTS += -Dbackend-rdp=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
>  WESTON_CONF_OPTS += \
> -	--enable-fbdev-compositor \
> -	WESTON_NATIVE_BACKEND=fbdev-backend.so
> +	-Dbackend-fbdev=true \
> +	-Dbackend-default=fbdev

This concept of "default backend" didn't exist before. Now with your
code we're going to potentially pass -Dbackend-default=fbdev
-Dbackend-default=drm -Dbackend-default=x11. I guess the last one wins,
but it's not very obvious.

These different aspects listed above should be explained in the commit
log.

Thanks

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
