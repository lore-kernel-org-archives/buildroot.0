From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 11:47:55 +0100
Subject: [Buildroot] [PATCH v2 4/4] package/kodi: add optional support
 for gbm
In-Reply-To: <20200202173333.305860-4-bernd.kuhls@t-online.de>
References: <20200202173333.305860-1-bernd.kuhls@t-online.de>
 <20200202173333.305860-4-bernd.kuhls@t-online.de>
Message-ID: <20200203114755.607fdb4a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sun,  2 Feb 2020 18:33:33 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> For details see upstream PR 11955.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: removed dependency on BR2_ENABLE_LOCALE
> 
>  package/kodi/Config.in | 43 +++++++++++++++++++++++++++++++++++++++++-
>  package/kodi/kodi.mk   | 14 ++++++++++++++
>  2 files changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 0f2f4e2df2..f8b95c2234 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -17,6 +17,23 @@ comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, t
>  config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
>  	bool
>  
> +config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM_GL
> +	bool
> +	default y
> +	depends on BR2_PACKAGE_HAS_LIBGL
> +	depends on BR2_PACKAGE_HAS_LIBEGL
> +	depends on BR2_PACKAGE_MESA3D_GBM
> +	depends on BR2_PACKAGE_HAS_UDEV # libinput
> +	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
> +
> +config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM_GLES
> +	bool
> +	default y
> +	depends on BR2_PACKAGE_HAS_LIBGLES

Are you sure you don't need BR2_PACKAGE_HAS_LIBEGL ? In the .mk file,
you use libegl.

> +	depends on BR2_PACKAGE_MESA3D_GBM
> +	depends on BR2_PACKAGE_HAS_UDEV # libinput
> +	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
> +
>  config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
>  	bool
>  	default y
> @@ -204,6 +221,26 @@ choice
>  	prompt "platform"
>  	default BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
>  
> +config BR2_PACKAGE_KODI_PLATFORM_GBM_GL
> +	bool "gbm/OpenGL"
> +	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM_GL
> +	select BR2_PACKAGE_LIBGLU
> +	select BR2_PACKAGE_LIBINPUT
> +	select BR2_PACKAGE_LIBXKBCOMMON
> +
> +config BR2_PACKAGE_KODI_PLATFORM_GBM_GLES
> +	bool "gbm/GLES"
> +	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM_GLES
> +	select BR2_PACKAGE_LIBGLU

LIBGLU is only available when BR2_PACKAGE_HAS_LIBGL is enabled, so this
looks odd. And you don't have a dependency on libglu in the .mk file.

> +ifeq ($(BR2_PACKAGE_KODI_PLATFORM_GBM_GL),y)
> +KODI_CONF_OPTS += \
> +	-DCORE_PLATFORM_NAME=gbm \
> +	-DGBM_RENDER_SYSTEM=gl
> +KODI_DEPENDENCIES += libegl libglu libinput libxkbcommon mesa3d

You don't need libgl ?

> +ifeq ($(BR2_PACKAGE_KODI_PLATFORM_GBM_GLES),y)
> +KODI_CONF_OPTS += \
> +	-DCORE_PLATFORM_NAME=gbm \
> +	-DGBM_RENDER_SYSTEM=gles
> +KODI_DEPENDENCIES += libgles libinput libxkbcommon mesa3d

You don't need libegl here ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
