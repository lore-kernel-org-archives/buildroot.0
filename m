From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 May 2014 22:06:17 +0200
Subject: [Buildroot] [PATCH v8 14/28] xdriver_xf86-video-intel: Bump
 version to 2.99.911
In-Reply-To: <1400342276-10303-15-git-send-email-bernd.kuhls@t-online.de>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-15-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140517200617.GF3459@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-05-17 17:57 +0200, Bernd Kuhls spake thusly:
> - add necessary dependencies
> - add -D_GNU_SOURCE to avoid getline compilation error
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xdriver_xf86-video-intel/Config.in   |   11 ++++----
>  .../xdriver_xf86-video-intel.mk                    |   27 +++++++++++++++-----
>  2 files changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/package/x11r7/xdriver_xf86-video-intel/Config.in b/package/x11r7/xdriver_xf86-video-intel/Config.in
> index 69a9e78..e2708c0 100644
> --- a/package/x11r7/xdriver_xf86-video-intel/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-intel/Config.in
> @@ -2,13 +2,14 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
>  	bool "xf86-video-intel"
>  	depends on (BR2_i386 || BR2_x86_64)
>  	depends on BR2_PACKAGE_MESA3D
> -	select BR2_PACKAGE_XPROTO_FONTSPROTO
> -	select BR2_PACKAGE_XPROTO_RANDRPROTO
> -	select BR2_PACKAGE_XPROTO_RENDERPROTO
> -	select BR2_PACKAGE_XPROTO_XPROTO
> -	select BR2_PACKAGE_XLIB_LIBPCIACCESS
>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_LIBDRM_INTEL
> +	select BR2_PACKAGE_XLIB_LIBPCIACCESS
> +	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
> +	select BR2_PACKAGE_XLIB_LIBXRANDR
> +	select BR2_PACKAGE_XLIB_LIBXTST
> +	select BR2_PACKAGE_XPROTO_FONTSPROTO
> +	select BR2_PACKAGE_XPROTO_XPROTO

Please, avoid re-ordering the dependencies.

If you really think this is necessary, then by all means do it in a
separate patch, please.

Remember that the shorter the patches are, the easier they are to review.

Also, adding new dependencies and re-ordering dependencies are two
semantically unrelated changes, so should be in different patches. But I
fail to see why the reordering is needed, since all the XPROTO deps are
already cluttered together.

Regards,
Yann E. MORIN.

>  	help
>  	  Intel video driver
>  
> diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> index 332de54..52b493f 100644
> --- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> +++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> @@ -4,18 +4,18 @@
>  #
>  ################################################################################
>  
> -XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.907
> +XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.911
>  XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
>  XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
>  XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
>  XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
> -XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
> +
> +# this fixes a getline-related compilation in src/sna/kgem.c
> +XDRIVER_XF86_VIDEO_INTEL_CONF_ENV = \
> +	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
>  
>  XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = \
> -	--enable-dri \
> -	--enable-kms-only \
>  	--disable-xvmc \
> -	--disable-ums-only \
>  	--enable-sna \
>  	--disable-uxa \
>  	--disable-glamor \
> @@ -23,6 +23,21 @@ XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = \
>  	--disable-dga \
>  	--disable-async-swap
>  
> -XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto libdrm xlib_libpciaccess
> +XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = \
> +	libdrm \
> +	xlib_libXcomposite \
> +	xlib_libXrandr \
> +	xlib_libXtst \
> +	xlib_libpciaccess \
> +	xproto_fontsproto \
> +	xproto_xproto \
> +	xserver_xorg-server
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965),y)
> +XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += --enable-dri
> +XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES += mesa3d xproto_xf86driproto
> +else
> +XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += --disable-dri
> +endif
>  
>  $(eval $(autotools-package))
> -- 
> 1.7.10.4
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
