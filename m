From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Apr 2020 23:46:30 +0200
Subject: [Buildroot] [PATCH v4] package/cog: add option for platform DRM.
In-Reply-To: <20200402113455.4391-1-cturner@igalia.com>
References: <20200312194700.2836-1-cturner@igalia.com>
 <20200402113455.4391-1-cturner@igalia.com>
Message-ID: <20200404234630.712aca1d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Apr 2020 12:34:55 +0100
Charlie Turner <cturner@igalia.com> wrote:

> diff --git a/package/cog/Config.in b/package/cog/Config.in
> index b25991d4ae..6a7c5668a5 100644
> --- a/package/cog/Config.in
> +++ b/package/cog/Config.in
> @@ -7,7 +7,9 @@ config BR2_PACKAGE_COG
>  	depends on BR2_PACKAGE_WPEWEBKIT
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
>  	depends on BR2_USE_MMU # dbus
> +

Why this new empty line?

>  	select BR2_PACKAGE_DBUS
> +

Ditto?

>  	help
>  	  Single "window" launcher for the WebKit WPE port, and
>  	  helper library for implementing WPE launcher. It does
> @@ -26,4 +28,30 @@ config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
>  	  string is used, there is no default and the URI to open
>  	  must be always specified in the command line.
>  
> +config BR2_PACKAGE_COG_PLATFORM_FDO
> +	bool "FreeDesktop.org backend"
> +

Don't add these empty lines.

> +	select BR2_PACKAGE_LIBXKBCOMMON

Why do we have this new dependency? I thought so far the FDO backend
was the default, so I assume it was the one used until now, and it
build with libxkbcommon.

Also, if the FDO backend is currently enabled by default, and you make
it optional, you should have a "default y" on this option to keep
backward compatibility.

Another question: what happens if neither FDO nor DRM backends are
enabled?

> +

No empty line please.

> +	help
> +	  Enable the FreeDesktop.org backend. Cog will interface with
> +	  a compositor over the Wayland protocol.
> +
> +config BR2_PACKAGE_COG_PLATFORM_DRM
> +	bool "DRM backend"
> +

Not empty line please.

> +	depends on BR2_PACKAGE_HAS_UDEV # libinput
> +	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
> +

No empty line please.

> +	select BR2_PACKAGE_LIBDRM
> +	select BR2_PACKAGE_LIBINPUT
> +
> +	help
> +	  Enable the DRM platform backend. Cog will interface directly
> +	  with video drivers that support kernel mode-setting (KMS)
> +	  via the DRM user-space API.
> +
> +comment "DRM platform needs mesa3d w/ EGL driver and GBM"
> +	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
> +
>  endif
> diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> index d0e5b79c38..339187126a 100644
> --- a/package/cog/cog.mk
> +++ b/package/cog/cog.mk
> @@ -8,13 +8,25 @@ COG_VERSION = 0.4.0
>  COG_SITE = https://wpewebkit.org/releases
>  COG_SOURCE = cog-$(COG_VERSION).tar.xz
>  COG_INSTALL_STAGING = YES
> -COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo
> +COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo wayland wayland-protocols

Why are you dropping the wayland and wayland-protocols dependencies?
Overall, it makes sense because cog does not depends/select wayland or
wayland-protocols. Ditto for wpebackend-fdo.

But dropping these should be done as a separate preliminary patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
