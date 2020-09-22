From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 22 Sep 2020 10:14:47 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/freescale-imx/imx-dpu-g2d:
 new package
In-Reply-To: <20200208134950.28582-1-tuzakli.refik@gmail.com>
References: <20200208134950.28582-1-tuzakli.refik@gmail.com>
Message-ID: <20200922081447.GA10096@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, Feb 08, 2020 at 04:49:50PM +0300, Refik Tuzakli wrote:
> imx-dpu-g2d package is used by i.MX 8 and i.MX 8X series instead
> of imx-vpu or imx-vpu-hantro. With this commit, imx-dpu-g2d is added
> and is enabled for i.MX8 and i.MX 8X.

My review on v2 [1] still applies here, this has nothing to do with VPU
operations.

> Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>
> ---
>  DEVELOPERS                                    |  1 +
>  package/freescale-imx/Config.in               |  8 ++++
>  package/freescale-imx/imx-dpu-g2d/Config.in   | 23 ++++++++++++
>  .../imx-dpu-g2d/imx-dpu-g2d.hash              |  4 ++
>  .../freescale-imx/imx-dpu-g2d/imx-dpu-g2d.mk  | 37 +++++++++++++++++++
>  5 files changed, 73 insertions(+)
>  create mode 100644 package/freescale-imx/imx-dpu-g2d/Config.in
>  create mode 100644 package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.hash
>  create mode 100644 package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3520072034..198b687d39 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2077,6 +2077,7 @@ F:	package/uhttpd/
>  F:	package/ustream-ssl/
>  
>  N:	Refik Tuzakli <tuzakli.refik@gmail.com>
> +F:	package/freescale-imx/imx-dpu-g2d
>  F:	package/paho-mqtt-cpp/
>  
>  N:	R?mi R?rolle <remi.rerolle@gmail.com>
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 711e8f72c2..2343511c28 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -79,6 +79,11 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
>  	bool
>  	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
>  
> +config BR2_PACKAGE_FREESCALE_IMX_HAS_DPU
> +	bool
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
> +
>  config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
>  	bool
>  	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
> @@ -99,6 +104,9 @@ source "package/freescale-imx/imx-uuc/Config.in"
>  source "package/freescale-imx/imx-vpu/Config.in"
>  source "package/freescale-imx/imx-vpu-hantro/Config.in"
>  source "package/freescale-imx/imx-vpuwrap/Config.in"
> +if BR2_PACKAGE_FREESCALE_IMX_HAS_DPU
> +source "package/freescale-imx/imx-dpu-g2d/Config.in"
> +endif
>  source "package/freescale-imx/firmware-imx/Config.in"
>  source "package/freescale-imx/imx-sc-firmware/Config.in"
>  if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
> diff --git a/package/freescale-imx/imx-dpu-g2d/Config.in b/package/freescale-imx/imx-dpu-g2d/Config.in
> new file mode 100644
> index 0000000000..377ad31dcb
> --- /dev/null
> +++ b/package/freescale-imx/imx-dpu-g2d/Config.in
> @@ -0,0 +1,23 @@
> +comment "imx-dpu-g2d needs a glibc toolchain"
> +	depends on BR2_aarch64
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
> +
> +config BR2_PACKAGE_IMX_DPU_G2D
> +	bool "imx-dpu-g2d"
> +	# Library binaries are linked against libc.so.6
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_LIBDRM
> +	help
> +	  Userspace DPU 2D libraries for Vivante GPU on i.MX platforms.

Also, this is not Vivante-related either.

> +	  This library is provided by NXP as-is and doesn't have an
> +	  upstream.
> +
> +if BR2_PACKAGE_IMX_DPU_G2D
> +
> +config BR2_PACKAGE_IMX_DPU_G2D_EXAMPLES
> +	bool "install examples"
> +	help
> +	  Copy the Vivante DPU examples to the target.

Ditto.

> +endif
> diff --git a/package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.hash b/package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.hash
> new file mode 100644
> index 0000000000..50eee591c3
> --- /dev/null
> +++ b/package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated
> +sha256	46c72ce9b98b7116e9f7f53a66aadc8fb66910473477c6553db77ed71e54d7ea  imx-dpu-g2d-1.8.2.bin
> +sha256  d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
> +sha256  9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
> diff --git a/package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.mk b/package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.mk
> new file mode 100644
> index 0000000000..ea5bbb9f97
> --- /dev/null
> +++ b/package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# imx-dpu-g2d
> +#
> +################################################################################
> +
> +IMX_DPU_G2D_VERSION = 1.8.2
> +IMX_DPU_G2D_SITE = $(FREESCALE_IMX_SITE)
> +IMX_DPU_G2D_SOURCE = imx-dpu-g2d-$(IMX_DPU_G2D_VERSION).bin
> +IMX_DPU_G2D_DEPENDENCIES = libdrm
> +IMX_DPU_G2D_INSTALL_STAGING = YES
> +
> +IMX_DPU_G2D_LICENSE = NXP Semiconductor Software License Agreement
> +IMX_DPU_G2D_LICENSE_FILES = EULA COPYING
> +IMX_DPU_G2D_REDISTRIBUTE = NO
> +
> +define IMX_DPU_G2D_EXTRACT_CMDS
> +	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_DPU_G2D_DL_DIR)/$(IMX_DPU_G2D_SOURCE))
> +endef
> +
> +define IMX_DPU_G2D_INSTALL_STAGING_CMDS
> +	cp -dpfr $(@D)/g2d/usr/* $(STAGING_DIR)/usr
> +endef
> +
> +ifeq ($(BR2_PACKAGE_IMX_DPU_G2D_EXAMPLES),y)
> +define IMX_DPU_G2D_INSTALL_EXAMPLES
> +	mkdir -p $(TARGET_DIR)/usr/share/examples/
> +	cp -dpfr $(@D)/gpu-demos/opt/* $(TARGET_DIR)/usr/share/examples/
> +endef
> +endif
> +
> +define IMX_DPU_G2D_INSTALL_TARGET_CMDS
> +	$(IMX_DPU_G2D_INSTALL_EXAMPLES)
> +	cp -dpfr $(@D)/g2d/usr/lib $(TARGET_DIR)/usr
> +endef
> +
> +$(eval $(generic-package))

Regards,
Gary

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20200203193155.12657-2-tuzakli.refik at gmail.com/#2359160
