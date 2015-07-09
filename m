From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jul 2015 22:22:06 +0200
Subject: [Buildroot] [PATCH 1/2] xdriver_xf86-video-qxl: new package
In-Reply-To: <1436403244-1367-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436403244-1367-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150709222206.7d5a8b2e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  8 Jul 2015 21:54:03 -0300, Gustavo Zacarias wrote:

> diff --git a/package/x11r7/xdriver_xf86-video-qxl/Config.in b/package/x11r7/xdriver_xf86-video-qxl/Config.in
> new file mode 100644
> index 0000000..c797dd4
> --- /dev/null
> +++ b/package/x11r7/xdriver_xf86-video-qxl/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_XDRIVER_XF86_VIDEO_QXL
> +	bool "xf86-video-qxl"
> +	depends on (BR2_i386 || BR2_x86_64)
> +	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_HAS_UDEV # for KMS
> +	select BR2_PACKAGE_LIBPCIACCESS
> +	select BR2_PACKAGE_SPICE_PROTOCOL
> +	select BR2_PACKAGE_XPROTO_FONTSPROTO
> +	select BR2_PACKAGE_XPROTO_XPROTO
> +	help
> +	  QEMU QXL paravirt video driver

The upstream URL was missing here.

> diff --git a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
> new file mode 100644
> index 0000000..74606c9
> --- /dev/null
> +++ b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# xdriver_xf86-video-qxl
> +#
> +################################################################################
> +
> +XDRIVER_XF86_VIDEO_QXL_VERSION = 0.1.4
> +XDRIVER_XF86_VIDEO_QXL_SOURCE = xf86-video-qxl-$(XDRIVER_XF86_VIDEO_QXL_VERSION).tar.bz2
> +XDRIVER_XF86_VIDEO_QXL_SITE = http://xorg.freedesktop.org/releases/individual/driver
> +XDRIVER_XF86_VIDEO_QXL_LICENSE = MIT
> +XDRIVER_XF86_VIDEO_QXL_LICENSE_FILES = COPYING
> +
> +XDRIVER_XF86_VIDEO_QXL_CONF_OPTS = \
> +	--enable-xspice=no
> +
> +# configure doesn't look for drm headers in the appropiate place, so help it
> +# libdrm is only useful with udev for KMS
> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +XDRIVER_XF86_VIDEO_QXL_CONF_ENV += REQUIRED_MODULES=libdrm
> +XDRIVER_XF86_VIDEO_QXL_DEPENDENCIES += libdrm
> +else
> +XDRIVER_XF86_VIDEO_QXL_CONF_OPTS += --disable-kms
> +endif
> +
> +XDRIVER_XF86_VIDEO_QXL_DEPENDENCIES = \
> +	libpciaccess \
> +	spice-protocol \
> +	xproto_fontsproto \
> +	xproto_xproto \
> +	xserver_xorg-server

This overwrites the += libdrm dependency above, so I've put this list
of mandatory dependency before the HAS_UDEV condition.

Applied with those issues fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
