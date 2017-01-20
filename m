From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 20 Jan 2017 22:54:04 +0100
Subject: [Buildroot] [PATCH 2/2] efl: do not force dependency on libudev
 by making eeze a config option.
In-Reply-To: <20170103212932.9254-3-barbieri@profusion.mobi>
References: <20170103212932.9254-1-barbieri@profusion.mobi>
 <20170103212932.9254-3-barbieri@profusion.mobi>
Message-ID: <c6a3f0ba-96f5-aff9-4b2f-097080ece177@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

Le 03/01/2017 ? 22:29, Gustavo Sverzut Barbieri a ?crit :
> Although highly recommended to be enabled, EFL's eeze can be disabled
> and thus no dependency on libudev or dynamic device management.
> 
> Since 'BR2_PACKAGE_HAS_UDEV' has two ways to be satisfied (eudev or
> systemd) we can't automatically select it, instead show a comment and
> use 'depends on'.
> 
> Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
> ---
>  package/efl/Config.in | 25 ++++++++++++++++++++++---
>  package/efl/efl.mk    |  9 ++++++++-
>  2 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index 542c354a8..f4cbc2806 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -4,7 +4,6 @@ config BR2_PACKAGE_EFL
>  	depends on BR2_HOST_GCC_AT_LEAST_4_7
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_PACKAGE_HAS_UDEV # libudev
>  	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS # luajit
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
>  	depends on BR2_USE_MMU
> @@ -37,6 +36,19 @@ config BR2_PACKAGE_EFL_BULLET
>  	  simply not tested so you are on your own in terms of
>  	  ensuring everything works if you do this.
>  
> +config BR2_PACKAGE_EFL_EEZE
> +	bool "Enable eeze (udev) support (recommended)"
> +	depends on BR2_PACKAGE_HAS_UDEV # libudev
> +	default y
> +	help
> +	  Eeze is EFL's hardware abstraction layer on top of udev.
> +	  Having it off will disable some hardware detetion, such as
> +	  'drm' graphics engine or 'elput', as well as mounting
> +	  removable media.

Rethinking about this patch...
Since eeze is now optional, don't forget to propagate this new dependency on
packages using efl AND requiring eeze (i.e enlightenment)

Enlightenment check for eeze, so it must depend on it ;-)

Best regards,
Romain

> +
> +comment "eeze needs udev /dev management (eudev or systemd)"
> +	depends on !BR2_PACKAGE_HAS_UDEV
> +
>  config BR2_PACKAGE_EFL_FONTCONFIG
>  	bool "Enable fontconfig support (recommended)"
>  	select BR2_PACKAGE_FONTCONFIG
> @@ -98,6 +110,7 @@ config BR2_PACKAGE_EFL_PULSEAUDIO
>  
>  config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
>  	bool "Enable libmount support (recommended)"
> +	depends on BR2_PACKAGE_EFL_EEZE
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
>  	# libblkid is part of required tools, see EFL's README.
> @@ -108,9 +121,13 @@ config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
>  	  devices etc... and disabling this will hurt support for
>  	  Enlightenment and its filemanager.
>  
> +comment "efl's libmount support needs eeze"
> +	depends on !BR2_PACKAGE_EFL_EEZE
> +
>  config BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG
>  	bool
>  	default y if BR2_PACKAGE_EFL_BULLET && \
> +		BR2_PACKAGE_EFL_EEZE && \
>  		BR2_PACKAGE_EFL_FONTCONFIG && \
>  		BR2_PACKAGE_EFL_GSTREAMER1 && \
>  		BR2_PACKAGE_EFL_LIBFRIBIDI && \
> @@ -197,6 +214,7 @@ endchoice # OpenGL support
>  
>  config BR2_PACKAGE_EFL_ELPUT
>  	bool "Elput"
> +	depends on BR2_PACKAGE_EFL_EEZE
>  	select BR2_PACKAGE_LIBINPUT
>  	select BR2_PACKAGE_LIBXKBCOMMON
>  	help
> @@ -207,6 +225,7 @@ config BR2_PACKAGE_EFL_ELPUT
>  
>  config BR2_PACKAGE_EFL_DRM
>  	bool "Evas DRM Engine"
> +	depends on BR2_PACKAGE_EFL_EEZE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
>  	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
>  	select BR2_PACKAGE_EFL_ELPUT
> @@ -278,8 +297,8 @@ config BR2_PACKAGE_EFL_SVG
>  
>  endif # BR2_PACKAGE_EFL
>  
> -comment "efl needs udev /dev management and a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar"
> -	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
> +comment "efl needs a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar"
> +	depends on !BR2_INSTALL_LIBSTDCPP \
>  		|| !BR2_HOST_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
>  		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
>  	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> diff --git a/package/efl/efl.mk b/package/efl/efl.mk
> index ab08946c4..1e54f7281 100644
> --- a/package/efl/efl.mk
> +++ b/package/efl/efl.mk
> @@ -20,7 +20,7 @@ EFL_LICENSE_FILES = \
>  EFL_INSTALL_STAGING = YES
>  
>  EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
> -	jpeg luajit lz4 udev zlib
> +	jpeg luajit lz4 zlib
>  
>  # Configure options:
>  # --disable-lua-old: build elua for the target.
> @@ -59,6 +59,13 @@ else
>  EFL_CONF_OPTS += --disable-cxx-bindings
>  endif
>  
> +ifeq ($(BR2_PACKAGE_EFL_EEZE),y)
> +EFL_DEPENDENCIES += udev
> +EFL_CONF_OPTS += --enable-libeeze
> +else
> +EFL_CONF_OPTS += --disable-libeeze
> +endif
> +
>  ifeq ($(BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT),y)
>  EFL_DEPENDENCIES += util-linux
>  EFL_CONF_OPTS += --enable-libmount
> 
