From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 11:10:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/weston: add selection menu for
 default backend
In-Reply-To: <20200203015428.10435-1-james.hilliard1@gmail.com>
References: <20200203015428.10435-1-james.hilliard1@gmail.com>
Message-ID: <20200203101050.GA3299@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-02-02 18:54 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

I did write a commit log, though, because there are things to say about
this change. Please review that commit log.

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  package/weston/Config.in | 38 ++++++++++++++++++++++++++++++--------
>  package/weston/weston.mk | 11 +++++------
>  2 files changed, 35 insertions(+), 14 deletions(-)
> 
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index f874b0cc6a..265588f865 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -21,8 +21,6 @@ config BR2_PACKAGE_WESTON
>  	select BR2_PACKAGE_LIBDRM
>  	# Runtime dependency
>  	select BR2_PACKAGE_XKEYBOARD_CONFIG
> -	# Make sure at least one compositor is selected.
> -	select BR2_PACKAGE_WESTON_FBDEV if !BR2_PACKAGE_WESTON_HAS_COMPOSITOR
>  	help
>  	  Weston is the reference implementation of a Wayland
>  	  compositor, and a useful compositor in its own right.
> @@ -33,14 +31,40 @@ config BR2_PACKAGE_WESTON
>  
>  if BR2_PACKAGE_WESTON
>  
> -# Helper to make sure at least one compositor is selected.
> -config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
> -	bool
> +choice
> +	prompt "default compositor"
> +
> +config BR2_PACKAGE_WESTON_DEFAULT_BACKEND_FBDEV
> +	bool "fbdev"
> +	select BR2_PACKAGE_WESTON_FBDEV
> +
> +config BR2_PACKAGE_WESTON_DEFAULT_BACKEND_DRM
> +	bool "drm"
> +	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
> +	select BR2_PACKAGE_WESTON_DRM
> +
> +comment "drm backend needs mesa3d w/ EGL driver"
> +	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
> +
> +config BR2_PACKAGE_WESTON_DEFAULT_BACKEND_X11
> +	bool "X11"
> +	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_WESTON_X11
> +
> +comment "X11 backend needs X.org"
> +	depends on !BR2_PACKAGE_XORG7
> +
> +endchoice
> +
> +config BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR
> +	string
> +	default "fbdev" if BR2_PACKAGE_WESTON_DEFAULT_BACKEND_FBDEV
> +	default "drm"   if BR2_PACKAGE_WESTON_DEFAULT_BACKEND_DRM
> +	default "x11"   if BR2_PACKAGE_WESTON_DEFAULT_BACKEND_X11
>  
>  config BR2_PACKAGE_WESTON_DRM
>  	bool "DRM compositor"
>  	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
> -	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
>  
>  # Uses libgbm from mesa3d
>  comment "DRM compositor needs an OpenGL EGL backend provided by mesa3d"
> @@ -57,7 +81,6 @@ config BR2_PACKAGE_WESTON_RDP
>  	depends on BR2_USE_WCHAR # freerdp
>  	depends on BR2_INSTALL_LIBSTDCPP # freerdp
>  	select BR2_PACKAGE_FREERDP
> -	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
>  	help
>  	  This enables the RDP backend, which allows accessing weston
>  	  through the network with any RDP-compliant client.
> @@ -81,7 +104,6 @@ config BR2_PACKAGE_WESTON_X11
>  	depends on BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_LIBXCB
>  	select BR2_PACKAGE_XLIB_LIBX11
> -	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
>  
>  comment "X11 compositor needs X.org enabled"
>  	depends on !BR2_PACKAGE_XORG7
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index 154ae38b83..751cf21f67 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -70,29 +70,28 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
>  WESTON_CONF_OPTS += \
> -	--enable-fbdev-compositor \
> -	WESTON_NATIVE_BACKEND=fbdev-backend.so
> +	--enable-fbdev-compositor
>  else
>  WESTON_CONF_OPTS += --disable-fbdev-compositor
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WESTON_DRM),y)
>  WESTON_CONF_OPTS += \
> -	--enable-drm-compositor \
> -	WESTON_NATIVE_BACKEND=drm-backend.so
> +	--enable-drm-compositor
>  else
>  WESTON_CONF_OPTS += --disable-drm-compositor
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WESTON_X11),y)
>  WESTON_CONF_OPTS += \
> -	--enable-x11-compositor \
> -	WESTON_NATIVE_BACKEND=x11-backend.so
> +	--enable-x11-compositor
>  WESTON_DEPENDENCIES += libxcb xlib_libX11
>  else
>  WESTON_CONF_OPTS += --disable-x11-compositor
>  endif
>  
> +WESTON_CONF_OPTS += WESTON_NATIVE_BACKEND=$(call qstrip,$(BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR))
> +
>  ifeq ($(BR2_PACKAGE_WESTON_XWAYLAND),y)
>  WESTON_CONF_OPTS += --enable-xwayland
>  WESTON_DEPENDENCIES += cairo libepoxy libxcb xlib_libX11 xlib_libXcursor
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
