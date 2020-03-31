From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 1 Apr 2020 00:57:28 +0300
Subject: [Buildroot] [PATCH v3 1/1] package/cog: add option for platform
 DRM.
In-Reply-To: <20200312194700.2836-1-cturner@igalia.com>
References: <20200311103044.11422-1-cturner@igalia.com>
 <20200312194700.2836-1-cturner@igalia.com>
Message-ID: <20200401005728.GB394692@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Charlie,

There was earlier a patch to update to Cog 0.6; I think it should not have
conflicts with this one, but you may want to keep an eye on it:

    https://patchwork.ozlabs.org/patch/1264879/


On Thu, 12 Mar 2020 19:47:00 +0000, Charlie Turner <cturner@igalia.com> wrote:

> Now that there's two platforms, the default-on behaviour for FDO has
> been made configurable, so that you can choose DRM only platform for FDO
> platform. Don't be confused that in both cases the *wpebackend-fdo*
> package is required. This is an unfortunate naming issue.

Whoops! You just made me realize that the naming of WPEBackend-fdo is
not great. Unfortunately, it's a bit late to change it at this point O:-)

> Signed-off-by: Charlie Turner <cturner@igalia.com>
> ---
>  package/cog/Config.in | 27 +++++++++++++++++++++++++++
>  package/cog/cog.mk    | 18 +++++++++++++++---
>  2 files changed, 42 insertions(+), 3 deletions(-)
> 
> diff --git a/package/cog/Config.in b/package/cog/Config.in
> index b25991d4ae..664e055104 100644
> --- a/package/cog/Config.in
> +++ b/package/cog/Config.in
> @@ -7,7 +7,11 @@ config BR2_PACKAGE_COG
>  	depends on BR2_PACKAGE_WPEWEBKIT
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
>  	depends on BR2_USE_MMU # dbus
> +	# For egl across all platforms, and gbm in the DRM platform.
> +	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL

Cog's FDO plug-in works with drivers other than Mesa (for example the
Vivante proprietary driver on i.MX hardware). This dependency should
be under BR2_PACKAGE_COG_PLATFORM_DRM instead.

> +
>  	select BR2_PACKAGE_DBUS
> +
>  	help
>  	  Single "window" launcher for the WebKit WPE port, and
>  	  helper library for implementing WPE launcher. It does
> @@ -26,4 +30,27 @@ config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
>  	  string is used, there is no default and the URI to open
>  	  must be always specified in the command line.
>  
> +config BR2_PACKAGE_COG_PLATFORM_FDO
> +	bool "FreeDesktop.org backend"
> +
> +	select BR2_PACKAGE_LIBXKBCOMMON
> +
> +	help
> +	  Enable the FreeDesktop.org backend.

I would add in the help text that it uses Wayland and needs a compositor.

> +
> +config BR2_PACKAGE_COG_PLATFORM_DRM
> +	bool "DRM backend"
> +
> +	depends on BR2_PACKAGE_HAS_UDEV # libinput
> +
> +	select BR2_PACKAGE_LIBDRM
> +	select BR2_PACKAGE_LIBINPUT
> +
> +	help
> +	  Enable the DRM platform backend. This allows Cog to run
> +	  without a compositor like Weston.

Instead of telling what it does not need to run, wouldn't it be better to
write here that it runs directly on video drivers which support kernel mode
setting (KMS) and Direct Rendering Manager?

> +
> +comment "DRM platform needs mesa3d w/ EGL driver and GBM"
> +	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
                                              || !BR2_PACKAGE_HAS_UDEV

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
>  COG_LICENSE = MIT
>  COG_LICENSE_FILES = COPYING
>  COG_CONF_OPTS = \
>  	-DCOG_BUILD_PROGRAMS=ON \
> -	-DCOG_PLATFORM_FDO=ON \
> -	-DCOG_PLATFORM_DRM=OFF \
>  	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
>  
> +ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
> +COG_CONF_OPTS += -DCOG_PLATFORM_FDO=ON
> +COG_DEPENDENCIES += libxkbcommon
> +else
> +COG_CONF_OPTS += -DCOG_PLATFORM_FDO=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
> +COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
> +COG_DEPENDENCIES += libdrm libinput
> +else
> +COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
> +endif
> +
>  $(eval $(cmake-package))
> -- 
> 2.20.1
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200401/1277f9d3/attachment.asc>
