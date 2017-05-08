From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 8 May 2017 23:25:15 +0200
Subject: [Buildroot] [PATCH v2] package/efl: fix unmet dependencies
In-Reply-To: <20170508211149.1964-1-yann.morin.1998@free.fr>
References: <20170508211149.1964-1-yann.morin.1998@free.fr>
Message-ID: <bfcd0a55-957d-f5e8-922f-ede41dff9c47@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 08/05/2017 ? 23:11, Yann E. MORIN a ?crit :
> EFL's elput selects libinput but forgot to propagate its dependencies.
> Which requires they be propagated further to a second sub-option, then
> to a third one.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@openwide.fr>
> 
> ---
> Changes v1 -> v2:
>   - porpagate dependency to comments as well  (Romain)
>   - fix commit log typoes  (Romain, me)
> ---
>  package/efl/Config.in | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index 371ed3f0d4..7b29e57c0a 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -178,13 +178,15 @@ config BR2_PACKAGE_EFL_WAYLAND
>  	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # Evas DRM Engine
>  	depends on BR2_PACKAGE_EFL_EEZE # efl drm
>  	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
> +	depends on BR2_ENABLE_LOCALE # efl-drm <- efl-elput <- linput
>  	select BR2_PACKAGE_EFL_DRM
>  	select BR2_PACKAGE_WAYLAND_PROTOCOLS
>  
> -comment "Wayland support needs udev /dev management (eeze) and OpenGL ES w/ EGL, threads"
> +comment "Wayland support needs udev /dev management (eeze), OpenGL ES w/ EGL, threads, locales"
>  	depends on BR2_PACKAGE_WAYLAND
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL \
> -		|| !BR2_PACKAGE_EFL_OPENGLES || !BR2_PACKAGE_EFL_EEZE
> +		|| !BR2_PACKAGE_EFL_OPENGLES || !BR2_PACKAGE_EFL_EEZE \
> +		|| !BR2_ENABLE_LOCALE
>  
>  choice
>  	bool "OpenGL support"
> @@ -216,6 +218,7 @@ endchoice # OpenGL support
>  
>  config BR2_PACKAGE_EFL_ELPUT
>  	bool "Elput"
> +	depends on BR2_ENABLE_LOCALE # libinput
>  	depends on BR2_PACKAGE_EFL_EEZE
>  	select BR2_PACKAGE_LIBINPUT
>  	select BR2_PACKAGE_LIBXKBCOMMON
> @@ -226,23 +229,24 @@ config BR2_PACKAGE_EFL_ELPUT
>  	  libinput without having to duplicate the code in each
>  	  subsystem.
>  
> -comment "Elput support needs udev /dev management (eeze)"
> -	depends on !BR2_PACKAGE_EFL_EEZE
> +comment "Elput support needs udev /dev management (eeze), locales"
> +	depends on !BR2_PACKAGE_EFL_EEZE || !BR2_ENABLE_LOCALE
>  
>  config BR2_PACKAGE_EFL_DRM
>  	bool "Evas DRM Engine"
>  	depends on BR2_PACKAGE_EFL_EEZE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
>  	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
> +	depends on BR2_ENABLE_LOCALE # efl-elput <- libinput
>  	select BR2_PACKAGE_EFL_ELPUT
>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_LIBXKBCOMMON
>  	help
>  	  This option enable building support for the Evas DRM Engine.
>  
> -comment "Evas DRM Engine needs udev /dev management (eeze) and mesa3d w/ EGL support, threads"
> +comment "Evas DRM Engine needs udev /dev management (eeze), mesa3d w/ EGL support, threads, locales"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL \
> -		|| !BR2_PACKAGE_EFL_EEZE
> +		|| !BR2_PACKAGE_EFL_EEZE || !Br2_EMNABLE_LOCALE

meh s/Br2/BR2/

s/Br2_EMNABLE_LOCALE/BR2_ENABLE_LOCALE/

:)
Romain

>  
>  comment "libevas loaders"
>  
> 
