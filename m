From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:47:50 +0100
Subject: [Buildroot] [PATCH 4/4] xdriver_xf86-video-imx: new package
In-Reply-To: <1415375874-17331-5-git-send-email-jezz@sysmic.org>
References: <1415375874-17331-1-git-send-email-jezz@sysmic.org>
 <1415375874-17331-5-git-send-email-jezz@sysmic.org>
Message-ID: <20141127224750.14b1591d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Fri,  7 Nov 2014 16:57:54 +0100, J?r?me Pouiller wrote:

> diff --git a/package/x11r7/xdriver_xf86-video-imx/Config.in b/package/x11r7/xdriver_xf86-video-imx/Config.in
> new file mode 100644
> index 0000000..8b794cc
> --- /dev/null
> +++ b/package/x11r7/xdriver_xf86-video-imx/Config.in
> @@ -0,0 +1,35 @@
> +if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)

Please use 'depends on' in such situations.

> +
> +config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX
> +	bool "xf86-video-imx"
> +	depends on BR2_arm
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # gpu-amd-bin-mx51
> +	depends on BR2_INSTALL_LIBSTDCPP # gpu-amd-bin-mx51
> +	depends on BR2_PACKAGE_XORG7

Why? This package is anyway only visible if this option is enabled.

> +	depends on BR2_LINUX_KERNEL

Why? This package really needs custom kernel headers?

> +	depends on BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_X11

Well, since you have added this dependency here, the dependency above
on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 ||
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53 is useless.

> +comment "xf86-video-imx needs an (e)glibc toolchain w/ C++ gpu-amd-bin-mx51 with X11 output and a Linux kernel to be built"
> +	depends on BR2_arm
> +	depends on (!BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_LINUX_KERNEL || !BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_X11)

This is a little bit too long, maybe we should split that up a bit. One
comment for the (e)glibc toolchain w/ C++. And maybe another comment
about Linux and gpu-amd-bin-mx51.

Also, since you need (e)glibc, I assume it's because you have some
pre-compiled binaries. If it's the case, then they are either built for
EABI *or* from EABIhf. And this is something we should add to the
dependencies, to make sure there isn't a mismatch between the ABI used
by those pre-built binaries, and the real ABI being used by the rest of
the system.

> diff --git a/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk
> new file mode 100644
> index 0000000..39d5169
> --- /dev/null
> +++ b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# xdriver_xf86-video-imx
> +#
> +################################################################################
> +
> +XDRIVER_XF86_VIDEO_IMX_VERSION = 11.09.01
> +XDRIVER_XF86_VIDEO_IMX_SOURCE = xserver-xorg-video-imx-$(XDRIVER_XF86_VIDEO_IMX_VERSION).tar.gz
> +XDRIVER_XF86_VIDEO_IMX_SITE = $(FREESCALE_IMX_SITE)
> +# Test without libz160

Huh? What does this comment means?

> +XDRIVER_XF86_VIDEO_IMX_DEPENDENCIES = linux libz160 xserver_xorg-server xproto_fontsproto \
> +	xproto_randrproto xproto_renderproto xproto_videoproto                      \
> +	xproto_xf86dgaproto xproto_xproto

Maybe we want something a bit nicer for such a case, like:

XDRIVER_XF86_VIDEO_IMX_DEPENDENCIES = 	\
	linux 				\
	libz160				\
	xserver_xorg-server		\
	...

Can you look at these issues and respin the patches?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
