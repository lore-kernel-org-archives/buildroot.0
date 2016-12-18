From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 15:05:07 +0100
Subject: [Buildroot] [PATCH v2 3/3] odroid-mali: add support for x11 egl
 implementation
In-Reply-To: <20161025175417.25901-3-daggs@gmx.com>
References: <20161025175417.25901-1-daggs@gmx.com>
 <20161025175417.25901-3-daggs@gmx.com>
Message-ID: <20161218150507.6ead75d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Oct 2016 20:54:17 +0300, Dagg Stompler wrote:
> allow installation of the x11 egl support required for the X11 ddx
> driver.
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>

I've applied, but after doing a number of changes, see below.

> diff --git a/package/odroid-mali/Config.in b/package/odroid-mali/Config.in
> index 2cd8e0d..ee33286 100644
> --- a/package/odroid-mali/Config.in
> +++ b/package/odroid-mali/Config.in
> @@ -5,6 +5,11 @@ config BR2_PACKAGE_ODROID_MALI
>  	select BR2_PACKAGE_ODROID_SCRIPTS # runtime
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	depends on BR2_aarch64 || BR2_ARM_EABIHF
> +	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_ODROID_MALI_X11
> +	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_ODROID_MALI_X11
> +	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_ODROID_MALI_X11
> +	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_ODROID_MALI_X11
> +	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_ODROID_MALI_X11

All those select can be simplified, i.e the "if
BR2_PACKAGE_ODROID_MALI_X11" can be removed, if they are placed under
the BR2_PACKAGE_ODROID_MALI_X11 option, so I've done that.

> diff --git a/package/odroid-mali/odroid-mali.mk b/package/odroid-mali/odroid-mali.mk
> index 7b8e511..ae87f92 100644
> --- a/package/odroid-mali/odroid-mali.mk
> +++ b/package/odroid-mali/odroid-mali.mk
> @@ -11,22 +11,32 @@ ODROID_MALI_LICENSE_FILES = README.md
>  
>  ODROID_MALI_INSTALL_STAGING = YES
>  ODROID_MALI_PROVIDES = libegl libgles
> +ODROID_MALI_SRC_ARCH = mali_libs

This whole SRC_ARCH / SRC_FOLDER thing was a bit confusing, so I've
replaced it with ODROID_MALI_LIBS_SUBDIR and
ODROID_MALI_HEADERS_SUBDIR, which is much clearer.

> -ifeq ($(BR2_aarch64),y)
> -ODROID_MALI_INSTALL_ARCH = mali_libs
> +ifeq ($(BR2_PACKAGE_ODROID_MALI_X11),y)
> +ODROID_MALI_SRC_FOLDER = x11
> +# The X11 version of the headers include X11/Xlib.h and X11/Xutil.h

It's not only the headers, but also the fact that the Mali pre-built
libraries are linked against X11 libraries and libdrm.

> +ODROID_MALI_DEPENDENCIES += libdrm
> +ODROID_MALI_DEPENDENCIES += xlib_libX11
> +ODROID_MALI_DEPENDENCIES += xlib_libXdamage
> +ODROID_MALI_DEPENDENCIES += xlib_libXext
> +ODROID_MALI_DEPENDENCIES += xlib_libXfixes

Only one assignment to ODROID_MALI_DEPENDENCIES is needed.

See
https://git.buildroot.org/buildroot/commit/?id=e1bf130ca8a52ea4d1ee39fa06abba6fa970b889
for the final commit. If you could double check that it continues to
work for you, it would be nice, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
