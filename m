From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 May 2015 21:39:41 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/x11r7/libepoxy: Fix OpenGL /
 EGL dependencies
In-Reply-To: <1430586108-23704-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430586108-23704-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150506213941.633333c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  2 May 2015 19:01:48 +0200, Bernd Kuhls wrote:

> + egl_has_extension_nocontext_LDADD = $(EPOXY) libegl_common.la $(X11_LIBS)
> diff --git a/package/x11r7/libepoxy/Config.in b/package/x11r7/libepoxy/Config.in
> index c4f5794..875ccc5 100644
> --- a/package/x11r7/libepoxy/Config.in
> +++ b/package/x11r7/libepoxy/Config.in
> @@ -1,7 +1,11 @@
>  config BR2_PACKAGE_LIBEPOXY
>  	bool "epoxy"
> -	depends on BR2_PACKAGE_MESA3D
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
> index d908893..001d05d 100644
> --- a/package/x11r7/libepoxy/libepoxy.mk
> +++ b/package/x11r7/libepoxy/libepoxy.mk
> @@ -8,7 +8,9 @@ LIBEPOXY_VERSION = v1.2
>  LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
>  LIBEPOXY_INSTALL_STAGING = YES
>  LIBEPOXY_AUTORECONF = YES
> -LIBEPOXY_DEPENDENCIES = mesa3d
> +LIBEPOXY_DEPENDENCIES = xlib_libX11 xutil_util-macros \

So you need to select xlib_libX11 and xutil_util-macros in the
Config.in file.

Can you respin to fix this?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
