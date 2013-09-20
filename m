From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Sep 2013 10:41:26 +0200
Subject: [Buildroot] [PATCH v2 1/7] libdrm: bump and add experimental
	ARM framebuffer support
In-Reply-To: <1378441521-10050-2-git-send-email-spenser@gillilanding.com>
 (Spenser Gilliland's message of "Thu, 5 Sep 2013 23:25:15 -0500")
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
 <1378441521-10050-2-git-send-email-spenser@gillilanding.com>
Message-ID: <87a9j7evgp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser@gillilanding.com> writes:

 Spenser> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
 Spenser> ---
 Spenser>  package/libdrm/Config.in | 68 ++++++++++++++++++++++++++++++++++++++++--------
 Spenser>  package/libdrm/libdrm.mk | 53 ++++++++++++++++++++++++++++++-------
 Spenser>  2 files changed, 100 insertions(+), 21 deletions(-)

 Spenser> diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
 Spenser> index 8bf676b..533e985 100644
 Spenser> --- a/package/libdrm/Config.in
 Spenser> +++ b/package/libdrm/Config.in
 Spenser> @@ -1,22 +1,68 @@
 Spenser>  config BR2_PACKAGE_LIBDRM
 Spenser>  	bool "libdrm"
 Spenser> +	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
 Spenser>  	depends on BR2_PACKAGE_XORG7
 Spenser>  	depends on BR2_LARGEFILE
 Spenser> -	select BR2_PACKAGE_XPROTO_GLPROTO
 Spenser> -	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 Spenser> -	select BR2_PACKAGE_XLIB_LIBXXF86VM
 Spenser> -	select BR2_PACKAGE_XLIB_LIBXMU
 Spenser> -	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 Spenser> -	select BR2_PACKAGE_XPROTO_DRI2PROTO
 Spenser> -	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
 Spenser> -	# libatomic_ops is only available on a subset of the supported
 Spenser> -	# architectures, and we make the assumption that the intel
 Spenser> -	# driver can only be used on x86 and x86_64 machines.
 Spenser> -	select BR2_PACKAGE_LIBATOMIC_OPS if (BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL && (BR2_i386 || BR2_x86_64))
 Spenser>  	help
 Spenser>  	  Direct Rendering Manager
 
 Spenser>  	  http://dri.freedesktop.org/libdrm/
 
 Spenser> +if BR2_PACKAGE_LIBDRM
 Spenser> +
 Spenser> +menu "DRM Drivers"
 Spenser> +
 Spenser> +config BR2_PACKAGE_LIBDRM_INTEL
 Spenser> +	bool "intel"
 Spenser> +	select BR2_PACKAGE_LIBATOMIC_OPS
 Spenser> +	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 Spenser> +	depends on BR2_i386 || BR2_x86_64
 Spenser> +	help
 Spenser> +	  installs intel graphics driver
 Spenser> +
 Spenser> +config BR2_PACKAGE_LIBDRM_RADEON
 Spenser> +	bool "radeon"
 Spenser> +	select BR2_PACKAGE_LIBATOMIC_OPS
 Spenser> +	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 Spenser> +	depends on BR2_i386 || BR2_x86_64
 Spenser> +	help
 Spenser> +	  install AMD/ATI graphics driver
 Spenser> +
 Spenser> +config BR2_PACKAGE_LIBDRM_NOUVEAU
 Spenser> +	bool "nouveau"
 Spenser> +	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 Spenser> +	depends on BR2_i386 || BR2_x86_64
 Spenser> +	help
 Spenser> +	  install Nvidia graphics driver
 Spenser> +
 Spenser> +config BR2_PACKAGE_LIBDRM_VMWGFX
 Spenser> +	bool "vmwgfx"
 Spenser> +	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 Spenser> +	depends on BR2_i386 || BR2_x86_64
 Spenser> +	help
 Spenser> +	  installs Vmware graphics driver
 Spenser> +
 Spenser> +config BR2_PACKAGE_LIBDRM_OMAP
 Spenser> +	bool "omap (experimental)"
 Spenser> +	depends on BR2_arm
 Spenser> +	help
 Spenser> +	  install the TI OMAP driver using an experimental API.
 Spenser> +
 Spenser> +config BR2_PACKAGE_LIBDRM_EXYNOS
 Spenser> +	bool "exynos (experimental)"
 Spenser> +	depends on BR2_arm
 Spenser> +	help
 Spenser> +	  installs Samsung Exynos driver using an experimental API.
 Spenser> +
 Spenser> +config BR2_PACKAGE_LIBDRM_FREEDRENO
 Spenser> +	bool "freedreno (experimental)"
 Spenser> +	depends on BR2_arm
 Spenser> +	help
 Spenser> +	  install Qualcomm Snapdragon driver using an experimental API.
 Spenser> +
 Spenser> +endmenu
 Spenser> +
 Spenser> +endif
 Spenser> +
 Spenser>  comment "libdrm requires a toolchain with LARGEFILE support"
 Spenser>  	depends on BR2_PACKAGE_XORG7 && !BR2_LARGEFILE
 Spenser> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
 Spenser> index d3d2b2d..697cd2f 100644
 Spenser> --- a/package/libdrm/libdrm.mk
 Spenser> +++ b/package/libdrm/libdrm.mk
 Spenser> @@ -4,7 +4,7 @@
 Spenser>  #
 Spenser>  ################################################################################
 
 Spenser> -LIBDRM_VERSION = 2.4.38
 Spenser> +LIBDRM_VERSION = 2.4.46
 Spenser>  LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 Spenser>  LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
 Spenser>  LIBDRM_LICENSE = MIT
 Spenser> @@ -12,26 +12,59 @@ LIBDRM_LICENSE = MIT
 Spenser>  LIBDRM_INSTALL_STAGING = YES
 
 Spenser>  LIBDRM_DEPENDENCIES = \
 Spenser> -	xproto_glproto \
 Spenser> -	xproto_xf86vidmodeproto \
 Spenser> -	xlib_libXxf86vm \
 Spenser> -	xlib_libXmu \
 Spenser> -	xlib_libpciaccess \
 Spenser> -	xproto_dri2proto \
 Spenser>  	xlib_libpthread-stubs \
 Spenser>  	host-pkgconf
 
 Spenser> -ifeq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL),y)
 Spenser> +LIBDRM_CONF_OPT = \
 Spenser> +	--disable-cairo-tests \
 Spenser> +	--disable-manpages
 Spenser> +
 Spenser> +ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)

You need to select LIBDRM_INTEL from XDRIVER_XF86_VIDEO_INTEL then to
ensure it is enabled.

 Spenser>  LIBDRM_CONF_OPT += --enable-intel
 Spenser> -LIBDRM_DEPENDENCIES += libatomic_ops
 Spenser> +LIBDRM_DEPENDENCIES += libatomic_ops xlib_libpciaccess
 Spenser>  else
 Spenser>  LIBDRM_CONF_OPT += --disable-intel
 Spenser>  endif
 
 Spenser> -ifneq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI),y)
 Spenser> +ifeq ($(BR2_PACKAGE_LIBDRM_RADEON),y)

Same here for ATI.

 Spenser> +LIBDRM_CONF_OPT += --enable-radeon
 Spenser> +LIBDRM_DEPENDENCIES += xlib_libpciaccess
 Spenser> +else
 Spenser>  LIBDRM_CONF_OPT += --disable-radeon
 Spenser>  endif
 
 Spenser> +ifeq ($(BR2_PACKAGE_LIBDRM_NOUVEAU),y)
 Spenser> +LIBDRM_CONF_OPT += --enable-nouveau
 Spenser> +LIBDRM_DEPENDENCIES += xlib_libpciaccess
 Spenser> +else
 Spenser> +LIBDRM_CONF_OPT += --disable-nouveau
 Spenser> +endif
 Spenser> +
 Spenser> +ifeq ($(BR2_PACKAGE_LIBDRM_VMWGFX),y)
 Spenser> +LIBDRM_CONF_OPT += --enable-vmwgfx
 Spenser> +LIBDRM_DEPENDENCIES += xlib_libpciaccess
 Spenser> +else
 Spenser> +LIBDRM_CONF_OPT += --enable-vmwgfx
 Spenser> +endif

Conceptually we should also select this from the vmware driver, but it
apparently only use it if mesa-xatracker is enabled (which we don't
have).

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
