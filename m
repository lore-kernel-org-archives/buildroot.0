From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 21:56:44 +0100
Subject: [Buildroot] [PATCH 3/4] kernel-module-imx-gpu-viv: add new
 package
In-Reply-To: <1454319423-13913-4-git-send-email-gary.bisson@boundarydevices.com>
References: <1454319423-13913-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454319423-13913-4-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160201215644.1e3d3713@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Mon,  1 Feb 2016 10:37:02 +0100, Gary Bisson wrote:

> +config BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV
> +	bool "kernel-module-imx-gpu-viv"
> +	depends on BR2_LINUX_KERNEL
> +	help
> +	  Kernel loadable module for Vivante GPU.
> +
> +	  This package uses an exact copy of the GPU kernel driver source code
> +	  of the same version as base and include fixes and improvements
> +	  developed by FSL Community

Upstream URL missing here. Also please include a hash file.

> diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
> new file mode 100644
> index 0000000..9c45f23
> --- /dev/null
> +++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# kernel-module-imx-gpu-viv
> +#
> +################################################################################
> +
> +KERNEL_MODULE_IMX_GPU_VIV_VERSION = eeeb23c0fb1cee01318088d417025263479c44ac
> +KERNEL_MODULE_IMX_GPU_VIV_SITE = \
> +	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
> +KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPLv2
> +KERNEL_MODULE_IMX_GPU_VIV_LICENSE_FILES = COPYING
> +
> +KERNEL_MODULE_IMX_GPU_VIV_MODULE_MAKE_OPTS = \
> +	AQROOT=$(@D)/kernel-module-imx-gpu-viv-src \
> +	KERNEL_DIR=$(LINUX_DIR)
> +
> +KERNEL_MODULE_IMX_GPU_VIV_MODULE_SUBDIRS = kernel-module-imx-gpu-viv-src
> +
> +# Modify Linux configuration in case it includes a built-in version of
> +# the Vivante driver.
> +define LINUX_CONFIGURATION_FIXUP
> +	sed -i "/CONFIG_MXC_GPU_VIV[ =]/d" $(LINUX_DIR)/.config
> +	echo "# CONFIG_MXC_GPU_VIV is not set" >> $(LINUX_DIR)/.config
> +endef
> +LINUX_POST_CONFIGURE_HOOKS += LINUX_CONFIGURATION_FIXUP

I really don't like spreading hooks for package A in the code of
package B. I think here it's better to change linux.mk with:

        $(if $(BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV),
                $(call KCONFIG_DISABLE_OPT,CONFIG_MXC_GPU_VIV,$(@D)/.config))

In LINUX_KCONFIG_FIXUP_CMDS.

Peter, Arnout, Yann, what do you think ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
