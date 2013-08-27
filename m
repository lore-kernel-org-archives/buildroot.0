From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 09:38:33 +0200
Subject: [Buildroot] [PATCH 1/6] libdrm: bump and add experimental ARM
 framebuffer support
In-Reply-To: <1377373321-29732-2-git-send-email-spenser@gillilanding.com>
References: <1377373321-29732-1-git-send-email-spenser@gillilanding.com>
 <1377373321-29732-2-git-send-email-spenser@gillilanding.com>
Message-ID: <20130827093833.603e00a5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Sat, 24 Aug 2013 14:41:56 -0500, Spenser Gilliland wrote:
> The newer versions of libdrm have substantially fewer dependencies as drm is
> moving to be a subsystem for both wayland and Xorg.
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/libdrm/Config.in | 14 +++-----------
>  package/libdrm/libdrm.mk | 24 +++++++++---------------
>  2 files changed, 12 insertions(+), 26 deletions(-)
> 
> diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
> index 8bf676b..f976ef1 100644
> --- a/package/libdrm/Config.in
> +++ b/package/libdrm/Config.in
> @@ -1,18 +1,10 @@
>  config BR2_PACKAGE_LIBDRM
>  	bool "libdrm"
> +	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
> +	select BR2_PACKAGE_LIBATOMIC_OPS

libatomic_ops is not available on all architectures. In the prevous
libdrm code, it was only selected on i386 and x86-64, so it was ok, but
if libatomic_ops is now needed in all cases for libdrm, then you need
to propagate the libatomic_ops dependencies into libdrm, i.e:

	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_sparc || BR2_powerpc || BR2_x86_64

> +	select BR2_PACKAGE_XLIB_LIBPCIACCESS if BR2_i386 || BR2_x86_64
>  	depends on BR2_PACKAGE_XORG7

If libdrm is needed by Wayland, then it sounds strange to require
enabling BR2_PACKAGE_XORG7. When I did the Wayland packaging, there are
a few X.org packages that I moved out of the BR2_PACKAGE_XORG7
condition, maybe we should do the same for libpciaccess and
libpthread-stubs. But ok, this is probably something we can tackle at a
later point, I don't want to require you to solve all problems right
now :)

>  	depends on BR2_LARGEFILE
> -	select BR2_PACKAGE_XPROTO_GLPROTO
> -	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
> -	select BR2_PACKAGE_XLIB_LIBXXF86VM
> -	select BR2_PACKAGE_XLIB_LIBXMU
> -	select BR2_PACKAGE_XLIB_LIBPCIACCESS
> -	select BR2_PACKAGE_XPROTO_DRI2PROTO
> -	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
> -	# libatomic_ops is only available on a subset of the supported
> -	# architectures, and we make the assumption that the intel
> -	# driver can only be used on x86 and x86_64 machines.
> -	select BR2_PACKAGE_LIBATOMIC_OPS if (BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL && (BR2_i386 || BR2_x86_64))
>  	help
>  	  Direct Rendering Manager
>  
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index d3d2b2d..8388e68 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBDRM_VERSION = 2.4.38
> +LIBDRM_VERSION = 2.4.46
>  LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
>  LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
>  LIBDRM_LICENSE = MIT
> @@ -12,24 +12,18 @@ LIBDRM_LICENSE = MIT
>  LIBDRM_INSTALL_STAGING = YES
>  
>  LIBDRM_DEPENDENCIES = \
> -	xproto_glproto \
> -	xproto_xf86vidmodeproto \
> -	xlib_libXxf86vm \
> -	xlib_libXmu \
> -	xlib_libpciaccess \
> -	xproto_dri2proto \
>  	xlib_libpthread-stubs \
>  	host-pkgconf
>  
> -ifeq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL),y)
> -LIBDRM_CONF_OPT += --enable-intel
> -LIBDRM_DEPENDENCIES += libatomic_ops
> -else
> -LIBDRM_CONF_OPT += --disable-intel
> -endif
> +LIBDRM_CONF_OPT = \
> +	--disable-cairo-tests \
> +	--disable-manpages
>  
> -ifneq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI),y)
> -LIBDRM_CONF_OPT += --disable-radeon

So those --enable-intel / --disable-radeon things are no longer needed?

> +ifeq ($(BR2_arm),y)
> +LIBDRM_CONF_OPT += \
> +	--enable-omap-experimental-api \
> +	--enable-exynos-experimental-api \
> +	--enable-freedreno-experimental-api
>  endif

It seems strange to me to enable those options as soon as we're on ARM.
I think we probably need Config.in sub-options for these.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
