From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 21:44:37 +0100
Subject: [Buildroot] [PATCH 10/10] gst1-imx: bump to version 0.12.0
In-Reply-To: <1454154357-31625-11-git-send-email-gary.bisson@boundarydevices.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454154357-31625-11-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160201214437.66ddff9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Sat, 30 Jan 2016 12:45:57 +0100, Gary Bisson wrote:

> -config BR2_PACKAGE_GST1_IMX
> +menuconfig BR2_PACKAGE_GST1_IMX
>  	bool "gst1-imx"
>  	depends on BR2_LINUX_KERNEL
>  	depends on BR2_arm # Only relevant for i.MX
> -	depends on BR2_TOOLCHAIN_USES_GLIBC # imx-gpu-viv
> -	depends on BR2_PACKAGE_IMX_GPU_VIV

So it no longer depends on the GPU stuff ?

> -	depends on BR2_PACKAGE_LIBFSLVPUWRAP
>  	select BR2_PACKAGE_GST1_PLUGINS_BASE
> +	select BR2_PACKAGE_GST1_IMX_IPU_PLUGIN
> +	select BR2_PACKAGE_GST1_IMX_PXP_PLUGIN

This is weird. If you "select" these options here, it means that there
is no way to disable those options. So why are they options in the
first place ?

>  	help
>  	  This is a set of GStreamer 1.0 plugins for plugins for Freescale's
>  	  i.MX6 platforms, with emphasis on video en/decoding using the VPU
> @@ -25,3 +19,49 @@ config BR2_PACKAGE_GST1_IMX
>  	  The software as a whole is currently in beta stage.
>  
>  	  https://github.com/Freescale/gstreamer-imx
> +
> +if BR2_PACKAGE_GST1_IMX
> +
> +config BR2_PACKAGE_GST1_IMX_IPU_PLUGIN
> +	bool "IPU plugin"
> +	help
> +	  IPU plugin library

This one.

> +
> +config BR2_PACKAGE_GST1_IMX_PXP_PLUGIN
> +	bool "PXP plugin"
> +	help
> +	  PXP plugin library

And this one.

> +# Required by imx-gpu-viv
> +comment "GPU sinks need an (e)glibc toolchain"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC

Ah ok, here is the GPU dependency.

> diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
> index 8ede8ad..f3eac0a 100644
> --- a/package/gstreamer1/gst1-imx/gst1-imx.mk
> +++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GST1_IMX_VERSION = 0.11.1
> +GST1_IMX_VERSION = 0.12.0
>  GST1_IMX_SITE = $(call github,Freescale,gstreamer-imx,$(GST1_IMX_VERSION))
>  
>  GST1_IMX_LICENSE = LGPLv2+
> @@ -13,13 +13,23 @@ GST1_IMX_LICENSE_FILES = LICENSE
>  GST1_IMX_INSTALL_STAGING = YES
>  
>  GST1_IMX_DEPENDENCIES += host-pkgconf host-python \
> -	imx-gpu-viv gstreamer1 gst1-plugins-base libfslvpuwrap
> +	gstreamer1 gst1-plugins-base
>  
>  # needs access to imx-specific kernel headers
>  GST1_IMX_DEPENDENCIES += linux
>  GST1_IMX_CONF_OPTS += --prefix="/usr" \
>  	--kernel-headers="$(LINUX_DIR)/include"
>  
> +ifeq ($(BR2_PACKAGE_GST1_IMX_V4L2_PLUGIN),y)
> +GST1_IMX_DEPENDENCIES += gst1-plugins-bad
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GST1_IMX_VPU_PLUGIN),y)
> +GST1_IMX_DEPENDENCIES += libimxvpuapi
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GST1_IMX_EGL_PLUGIN),y)
> +GST1_IMX_DEPENDENCIES += imx-gpu-viv
>  ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
>  GST1_IMX_DEPENDENCIES += xlib_libX11
>  GST1_IMX_CONF_OPTS += --egl-platform=x11
> @@ -31,6 +41,7 @@ else
>  GST1_IMX_CONF_OPTS += --egl-platform=fb
>  endif
>  endif
> +endif
>  
>  define GST1_IMX_CONFIGURE_CMDS
>  	cd $(@D); \

Also, please add a hash file. The rest looks good. Can you fix and
resend ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
