From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 12:48:15 +0100
Subject: [Buildroot] [PATCH 08/11 v5] package/freerdp: add options to
 enable/disable server and/or client
In-Reply-To: <44fb109d81db4309f73d7f85fcd533c3f1dee6cb.1424558036.git.yann.morin.1998@free.fr>
References: <cover.1424558036.git.yann.morin.1998@free.fr>
 <44fb109d81db4309f73d7f85fcd533c3f1dee6cb.1424558036.git.yann.morin.1998@free.fr>
Message-ID: <20150222124815.0b4d9ba4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

One question, see below.

On Sat, 21 Feb 2015 23:36:21 +0100, Yann E. MORIN wrote:

> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index cf96ff4..33eacc2 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -64,13 +64,33 @@ ifeq ($(BR2_arm)$(BR2_armeb),y)
>  FREERDP_CONF_OPTS += -DARM_FP_ABI=$(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
>  endif
>  
> -ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT),y)
> -FREERDP_DEPENDENCIES += xlib_libXext
> -FREERDP_CONF_OPTS += -DWITH_X11=ON
> +#---------------------------------------
> +# Enabling server and/or client
> +
> +ifeq ($(BR2_PACKAGE_FREERDP_SERVER),y)
> +FREERDP_CONF_OPTS += -DWITH_SERVER=ON -DWITH_SERVER_INTERFACE=ON
>  else
> -FREERDP_CONF_OPTS += -DWITH_X11=OFF
> +FREERDP_CONF_OPTS += -DWITH_SERVER=OFF -DWITH_SERVER_INTERFACE=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_FREERDP_CLIENT),y)
> +FREERDP_CONF_OPTS += -DWITH_CLIENT=ON -DWITH_CLIENT_INTERFACE=ON
> +else
> +FREERDP_CONF_OPTS += -DWITH_CLIENT=OFF -DWITH_CLIENT_INTERFACE=OFF
> +endif
> +
> +#---------------------------------------
> +# X.Org libs for client and/or server
> +
> +ifneq ($(BR2_PACKAGE_FREERDP_SERVER)$(BR2_PACKAGE_FREERDP_CLIENT),)
> +
> +# Those two are mandatory for both the server and the client
> +FREERDP_DEPENDENCIES += xlib_libX11 xlib_libXext
> +FREERDP_CONF_OPTS += -DWITH_X11=ON
> +
> +# The following libs are either optional or mandatory only for either
> +# the server or the client. A mandatory library for either one is
> +# selected from Kconfig, so we can make it conditional here
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
>  FREERDP_CONF_OPTS += -DWITH_XCURSOR=ON
>  FREERDP_DEPENDENCIES += xlib_libXcursor
> @@ -78,6 +98,20 @@ else
>  FREERDP_CONF_OPTS += -DWITH_XCURSOR=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
> +FREERDP_CONF_OPTS += -DWITH_XDAMAGE=ON
> +FREERDP_DEPENDENCIES += xlib_libXdamage
> +else
> +FREERDP_CONF_OPTS += -DWITH_XDAMAGE=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
> +FREERDP_CONF_OPTS += -DWITH_XFIXES=ON
> +FREERDP_DEPENDENCIES += xlib_libXfixes
> +else
> +FREERDP_CONF_OPTS += -DWITH_XFIXES=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
>  FREERDP_CONF_OPTS += -DWITH_XI=ON
>  FREERDP_DEPENDENCIES += xlib_libXi
> @@ -99,6 +133,13 @@ else
>  FREERDP_CONF_OPTS += -DWITH_XKBFILE=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
> +FREERDP_CONF_OPTS += -DWITH_XRANDR=ON
> +FREERDP_DEPENDENCIES += xlib_libXrandr
> +else
> +FREERDP_CONF_OPTS += -DWITH_XRANDR=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
>  FREERDP_CONF_OPTS += -DWITH_XRENDER=ON
>  FREERDP_DEPENDENCIES += xlib_libXrender
> @@ -106,6 +147,13 @@ else
>  FREERDP_CONF_OPTS += -DWITH_XRENDER=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXTST),y)
> +FREERDP_CONF_OPTS += -DWITH_XTEST=ON
> +FREERDP_DEPENDENCIES += xlib_libXtst
> +else
> +FREERDP_CONF_OPTS += -DWITH_XTEST=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
>  FREERDP_CONF_OPTS += -DWITH_XV=ON
>  FREERDP_DEPENDENCIES += xlib_libXv
> @@ -113,4 +161,10 @@ else
>  FREERDP_CONF_OPTS += -DWITH_XV=OFF
>  endif
>  
> +else # ! SERVER && ! CLIENT
> +
> +FREERDP_CONF_OPTS += -DWITH_X11=OFF
> +
> +endif # ! USES_XLIBS

Is this really ! USES_XLIBS ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
