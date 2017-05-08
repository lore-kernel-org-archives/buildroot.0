From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 8 May 2017 22:53:56 +0200
Subject: [Buildroot] [PATCH] package/efl: fix unmet dependencies
In-Reply-To: <20170508203030.8852-1-yann.morin.1998@free.fr>
References: <20170508203030.8852-1-yann.morin.1998@free.fr>
Message-ID: <2fbc4004-7d63-f1ec-eac2-39f16f9d427a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 08/05/2017 ? 22:30, Yann E. MORIN a ?crit :
> EFL's elput selects libinput but forgot to propagate its dependencies.
> Which reauires they be propagated fruther to a seonc sub-option, and
> then to a third one.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/efl/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index 371ed3f0d4..e5b5643c79 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -178,6 +178,7 @@ config BR2_PACKAGE_EFL_WAYLAND
>  	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # Evas DRM Engine
>  	depends on BR2_PACKAGE_EFL_EEZE # efl drm
>  	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
> +	depends on BR2_ENABLE_LOCALE # efl-drm <- efl-elput <- linput
>  	select BR2_PACKAGE_EFL_DRM
>  	select BR2_PACKAGE_WAYLAND_PROTOCOLS

Update the comment bellow

comment "Wayland support needs udev /dev management (eeze) and OpenGL ES w/ EGL,
threads, locale"

but it start to be very long :p

>  
> @@ -216,6 +217,7 @@ endchoice # OpenGL support
>  
>  config BR2_PACKAGE_EFL_ELPUT
>  	bool "Elput"
> +	depends on BR2_ENABLE_LOCALE # libinput
>  	depends on BR2_PACKAGE_EFL_EEZE
>  	select BR2_PACKAGE_LIBINPUT
>  	select BR2_PACKAGE_LIBXKBCOMMON

Same for Elput comment

> @@ -234,6 +236,7 @@ config BR2_PACKAGE_EFL_DRM
>  	depends on BR2_PACKAGE_EFL_EEZE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
>  	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
> +	depends on BR2_ENABLE_LOCALE # efl-elput <- libinput
>  	select BR2_PACKAGE_EFL_ELPUT
>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_LIBXKBCOMMON

and for efl_drm comment

Best regards,
Romain

> 
