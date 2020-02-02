From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Feb 2020 11:52:11 +0100
Subject: [Buildroot] [PATCH v9 3/3] package/weston: bump to version 8.0.0
In-Reply-To: <20200202071646.4744-3-james.hilliard1@gmail.com>
References: <20200202071646.4744-1-james.hilliard1@gmail.com>
 <20200202071646.4744-3-james.hilliard1@gmail.com>
Message-ID: <20200202105211.GC4107@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-02-02 00:16 -0700, James Hilliard spake thusly:
> The autotools build system is deprecated and replaced with meson for weston.
> 
> We need to enable pango when building demo clients since it is required
> by meson.
> 
> The dbus option in autotools is replaced with launcher-logind in meson.

... "which is only ever used with systemd, so add it to the condition."

> We need to explicitly set the image-webp option to avoid failures when
> building without webp.

There's no need for this kind of detail in the commit log.

> Replaced WESTON_NATIVE_BACKEND with backend-default in meson.

This should be a preparatory patch, because it also makes sense with the
current situation.

However, if only the RDP backend isenabled, there is then no default.
That's not good.

Furthermore, the choise of a default is before the actual selection, so
it means the user as to back and forth to change the default.

I would alternatively suggest that the choice indeed stays first, but
that dthe dependency is incerted: the choice seelcts the defautl
backend:

    choice
        bool "default compositor"

        config BR2_PKG_WESON_DEFAULT_FB
            bool "fb"
            select BR2_PKG_WESTON_FB

        config BR2_PKG_WESTON_DEFAULT_DRM
            bool "drm"
            depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
            select BR2_PKG_WESTON_DRM

        comment ""drm backend needs mesa3d w/ EGL driver"
            depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL

        [...x11, rdp...]

    endchoice

    config BR2_PKG_WESTON_DEFAULT_COMPOSITOR
        string
        default "fbdev" if BR2_PKG_WESON_DEFAULT_FB
        default "drm"   if BR2_PKG_WESON_DEFAULT_DRM
        [...]

    config BR2_PKG_WESTON_FB
        bool "fb compositor"

    config BR2_PKG_WESTON_DRM
        bool "drm compositor"
        depends on BR2_PACKAGE_MESA3D_OPENGL_EGL

    [...]

> Added optional pipewire dependency.

This should be done in a follow up patch.

> Added patch fixing missing include in os-compatibility.c.

Such details are not needed in the commit log, as long as the patch
description is good enough (which it should be). Otherwise, you'd also
have to explain the second patch too...

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[--SNIP--]
> @@ -102,7 +122,22 @@ comment "XWayland support needs libepoxy and X.org enabled"
>  
>  config BR2_PACKAGE_WESTON_DEMO_CLIENTS
>  	bool "demo clients"
> +	depends on BR2_PACKAGE_HAS_LIBGLES
> +	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	depends on BR2_USE_WCHAR # pango
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
> +	depends on BR2_USE_MMU # pango
> +	depends on BR2_INSTALL_LIBSTDCPP # pango
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango

Please keep the dependency in the order described in the manual:
  - qrchitecture dependencies, e.g. MMU...
  - toolchain dependencies, e.g. sync-4, stdc++ threads, wchar...
  - system depependencies, e.g. init system...
  - negative package dependencies, e.g. !foo, !bar_opt
  - positive package dependencies, e.g. foo, bar_opt

[--SNIP--]
> -# Uses VIDIOC_EXPBUF, only available from 3.8+
> -ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),)
> -WESTON_CONF_OPTS += --disable-simple-dmabuf-v4l-client
> +	-Dbuild.pkg_config_path=$(HOST_DIR)/lib/pkgconfig \
> +	-Dremoting=false \
> +	-Dbackend-headless=false \
> +	-Dcolor-management-colord=false

You're moving conditions around (the vidioc one was later), so it makes
reviewing even more complicated...

> +ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_SYSTEMD),yy)

This new systemd dependency should be explained in the commit log (see
my proposal blurb above).

>  ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
> -WESTON_CONF_OPTS += \
> -	--enable-fbdev-compositor \
> -	WESTON_NATIVE_BACKEND=fbdev-backend.so
> +WESTON_CONF_OPTS += -Dbackend-fbdev=true
> +ifeq ($(BR2_PACKAGE_WESTON_DEFAULT_BACKEND_FBDEV),y)
> +WESTON_CONF_OPTS += -Dbackend-default=fbdev
> +endif

This (and the following cases) should be replaced by a single line,
outside of any condition:

    WESTON_CONF_OPTS += -Dbackend-default=$(call qstrip,$(BR2_PKG_WESTON_DEFAULT_COMPOSITOR))

Care to fix and respin, please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
