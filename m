From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Aug 2015 21:48:33 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/x11r7/libepoxy: bump version
 to 1.3.1, fix OpenGL / EGL dependencies
In-Reply-To: <1438445235-4662-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438445235-4662-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150802194833.GH3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-08-01 18:07 +0200, Bernd Kuhls spake thusly:
> libepoxy depends on egl, opengl is an optional dependency
> 
> Fixes
> http://autobuild.buildroot.net/results/f7e/f7e6a42f53cb4ca523d2eeefde85c44770f6011e
> http://autobuild.buildroot.net/results/025/025a3d3b4d3dd4f496dcbf09f2dd279116250207
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I was not able to test this, because there is a build failure earlier in
the stack.

Given this defconfig:
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_MESA3D=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU=y
    BR2_PACKAGE_MESA3D_OPENGL_EGL=y
    BR2_PACKAGE_MESA3D_OPENGL_ES=y
    BR2_PACKAGE_XORG7=y
    BR2_PACKAGE_LIBEPOXY=y  

And running:
    make libepoxy-depends

I get the following build failure:
    configure: WARNING: Neither DRI nor Xlib-GLX enabled, disabling GLX
    checking for LIBDRM... yes
    checking for LIBUDEV... no
    configure: error: gbm requires --enable-dri

I'm not very at ease with the Xorg/GL stacks... Care to have a look,
please?

Regards,
Yann E. MORIN.

> ---
> v3: bumped to v1.3.1, switched to pkgconf for rpi support
> v2: Add missing select lines to Config.in (Thomas)
> 
>  package/x11r7/libepoxy/Config.in   | 10 ++++++++--
>  package/x11r7/libepoxy/libepoxy.mk |  8 ++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x11r7/libepoxy/Config.in b/package/x11r7/libepoxy/Config.in
> index c4f5794..5628bf7 100644
> --- a/package/x11r7/libepoxy/Config.in
> +++ b/package/x11r7/libepoxy/Config.in
> @@ -1,7 +1,13 @@
>  config BR2_PACKAGE_LIBEPOXY
>  	bool "epoxy"
> -	depends on BR2_PACKAGE_MESA3D
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_XUTIL_UTIL_MACROS
> +	depends on BR2_PACKAGE_HAS_LIBEGL
>  	help
> -	  Epoxy is a library for handling OpenGL function pointer management for you.
> +	  Epoxy is a library for handling OpenGL function pointer
> +	  management for you.
>  
>  	  https://github.com/anholt/libepoxy
> +
> +comment "epoxy needs an OpenGL EGL backend"
> +	depends on !BR2_PACKAGE_HAS_LIBEGL
> diff --git a/package/x11r7/libepoxy/libepoxy.mk b/package/x11r7/libepoxy/libepoxy.mk
> index d908893..26d90f3 100644
> --- a/package/x11r7/libepoxy/libepoxy.mk
> +++ b/package/x11r7/libepoxy/libepoxy.mk
> @@ -4,12 +4,16 @@
>  #
>  ################################################################################
>  
> -LIBEPOXY_VERSION = v1.2
> +LIBEPOXY_VERSION = v1.3.1
>  LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
>  LIBEPOXY_INSTALL_STAGING = YES
>  LIBEPOXY_AUTORECONF = YES
> -LIBEPOXY_DEPENDENCIES = mesa3d
> +LIBEPOXY_DEPENDENCIES = xlib_libX11 xutil_util-macros libegl \
> +	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl)
>  LIBEPOXY_LICENSE = MIT
>  LIBEPOXY_LICENSE_FILES = COPYING
>  
> +# needed for rpi-userland
> +LIBEPOXY_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags egl`
> +
>  $(eval $(autotools-package))
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
