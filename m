From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Mar 2017 21:27:13 +0100
Subject: [Buildroot] [PATCH v2 1/3] xdriver_xf86-video-odroidc2: new
 package
In-Reply-To: <20161025175417.25901-1-daggs@gmx.com>
References: <20161025175417.25901-1-daggs@gmx.com>
Message-ID: <20170307212713.4d999fe8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Oct 2016 20:54:15 +0300, Dagg Stompler wrote:

> diff --git a/package/x11r7/xdriver_xf86-video-odroidc2/Config.in b/package/x11r7/xdriver_xf86-video-odroidc2/Config.in
> new file mode 100644
> index 0000000..31ba9df
> --- /dev/null
> +++ b/package/x11r7/xdriver_xf86-video-odroidc2/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ODROIDC2
> +	bool "xf86-video-odroidc2"
> +	depends on BR2_aarch64 # odroid-mali X11
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_LIBDRM
> +	select BR2_PACKAGE_ODROID_MALI

The odroid-mali is now marked as broken. In addition, I made some
comments on PATCH 2/2, which should be squashed into this PATCH 1/2.
You also need to add an entry in the DEVELOPERS file.

Could you fix odroid-mali, and then send an updated version of a patch
adding the xdriver_xf86-video-odroidc2 package?

> +XDRIVER_XF86_VIDEO_ODROIDC2_VERSION = 2d8e1595da7231f152b78ef8a9b9583fb585883a
> +XDRIVER_XF86_VIDEO_ODROIDC2_SITE = $(call github,mdrjr,c2_mali_ddx,$(XDRIVER_XF86_VIDEO_ODROIDC2_VERSION))
> +XDRIVER_XF86_VIDEO_ODROIDC2_LICENSE = MIT
> +XDRIVER_XF86_VIDEO_ODROIDC2_LICENSE_FILES = README.txt 
> +XDRIVER_XF86_VIDEO_ODROIDC2_DEPENDENCIES = \
> +	libdrm \
> +	odroid-mali \
> +	xserver_xorg-server \
> +	xproto_dri2proto
> +
> +define XDRIVER_XF86_VIDEO_ODROIDC2_INSTALL_CONF_FILE
> +        $(INSTALL) -m 0644 -D $(@D)/src/xorg.conf $(TARGET_DIR)/usr/share/X11/xorg.conf.odroidc2
> +endef

Instead of this, what about installing a fragment of xorg.conf file,
like package/amd-catalyst/20-fglrx.conf ? See amd-catalyst.mk for
details.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
