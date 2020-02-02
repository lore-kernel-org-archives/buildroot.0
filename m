From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Feb 2020 17:00:05 +0100
Subject: [Buildroot] [PATCH v1] package/freescale-imx/imx-dpu-g2d: new
 package
In-Reply-To: <20200202103801.16077-1-tuzakli.refik@gmail.com>
References: <20200202103801.16077-1-tuzakli.refik@gmail.com>
Message-ID: <20200202170005.0f183d26@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution!

On Sun,  2 Feb 2020 13:38:01 +0300
Refik Tuzakli <tuzakli.refik@gmail.com> wrote:

> imx-dpu-g2d package is used by i.MX 8 and i.MX 8X series instead of imx-vpu or imx-vpu-hantro.With this commit, imx-dpu-g2d is added and is enabled for i.MX 8X. imx-vpu and imx-vpu-hantro are disabled for the i.MX series that do not have vpu support.

The commit log text should be wrapped to 80 columns.

Also, your commit log says your commit does multiple things, and indeed
it does, and therefore should be split into several commits. See below.


> Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>
> ---
>  package/freescale-imx/Config.in               | 16 +++++++-
>  .../firmware-imx/firmware-imx.mk              |  4 ++
>  package/freescale-imx/imx-dpu-g2d/Config.in   | 23 ++++++++++++
>  .../imx-dpu-g2d/imx-dpu-g2d.hash              |  2 +
>  .../freescale-imx/imx-dpu-g2d/imx-dpu-g2d.mk  | 37 +++++++++++++++++++
>  5 files changed, 81 insertions(+), 1 deletion(-)

When adding a new package, please update the DEVELOPERS file with an
entry for this package.
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index f010aab87b..893079586c 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -63,6 +63,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
>  	default "IMX6UL" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
>  	default "IMX7" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
>  	default "IMX8" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
> +	default "IMX8X" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X

This should be in a separate commit from the imx-dpu-g2d package.

>  
>  config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
>  	bool
> @@ -75,13 +76,18 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
>  	bool
>  	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
>  
> +config BR2_PACKAGE_FREESCALE_IMX_HAS_DPU
> +	bool
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X

This can go in the imx-dpu-g2d package addition I'd say.

> +
>  config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
>  	bool
>  	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
>  		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S || \
>  		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
>  		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
> -		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X

This is not related to imx-dpu-g2d

>  
>  source "package/freescale-imx/imx-alsa-plugins/Config.in"
>  source "package/freescale-imx/imx-codec/Config.in"
> @@ -90,9 +96,17 @@ source "package/freescale-imx/imx-lib/Config.in"
>  source "package/freescale-imx/imx-m4fwloader/Config.in"
>  source "package/freescale-imx/imx-parser/Config.in"
>  source "package/freescale-imx/imx-uuc/Config.in"
> +if BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
>  source "package/freescale-imx/imx-vpu/Config.in"
> +source "package/freescale-imx/imx-vpuwrap/Config.in"
> +endif
> +if BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
>  source "package/freescale-imx/imx-vpu-hantro/Config.in"
>  source "package/freescale-imx/imx-vpuwrap/Config.in"
> +endif

These changes are not related to imx-dpu-g2d addition, so they should
be in a separate commit.
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index c9040e1853..6c8685e60b 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -53,6 +53,10 @@ define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
>  	cp $(@D)/firmware/seco/mx8qx-ahab-container.img \
>  		$(BINARIES_DIR)/ahab-container.img
>  endef
> +define FIRMWARE_IMX_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/lib/firmware/vpu
> +	cp -r $(@D)/firmware/vpu/vpu_fw_imx8* $(TARGET_DIR)/lib/firmware/vpu
> +endef

This should be in a separate commit.

>  else
>  define FIRMWARE_IMX_INSTALL_TARGET_CMDS
>  	mkdir -p $(TARGET_DIR)/lib/firmware/imx
> diff --git a/package/freescale-imx/imx-dpu-g2d/Config.in b/package/freescale-imx/imx-dpu-g2d/Config.in
> new file mode 100644
> index 0000000000..2675840093
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
> +	select BR2_PACKAGE_IMX_GPU_VIV
> +	help
> +	  Userspace DPU 2D libraries for Vivante GPU on i.MX platforms.
> +
> +	  This library is provided by NXP as-is and doesn't have an
> +	  upstream.
> +
> +if BR2_PACKAGE_IMX_DPU_G2D
> +
> +config BR2_PACKAGE_IMX_DPU_G2D_EXAMPLES
> +	bool "install examples"
> +	help
> +	  Copy the Vivante DPU examples to the target.
> +
> +endif
> diff --git a/package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.hash b/package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.hash
> new file mode 100644
> index 0000000000..0d1e6ca277
> --- /dev/null
> +++ b/package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.hash
> @@ -0,0 +1,2 @@
> +sha256	46c72ce9b98b7116e9f7f53a66aadc8fb66910473477c6553db77ed71e54d7ea  imx-dpu-g2d-1.8.2.bin
> +

We want hash for license files. Also there should be a comment in the
hash file that says where the hash comes from. If it has been
calculated locally, just add:

# Locally calculated

> diff --git a/package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.mk b/package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.mk
> new file mode 100644
> index 0000000000..75fb7e21f0
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
> +IMX_DPU_G2D_DEPENDENCIES = imx-gpu-viv
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
> +	cp -a $(@D)/g2d/usr/* $(STAGING_DIR)/usr
> +endef
> +
> +ifeq ($(BR2_PACKAGE_IMX_DPU_G2D_EXAMPLES),y)
> +define IMX_DPU_G2D_INSTALL_EXAMPLES
> +	mkdir -p $(TARGET_DIR)/usr/share/examples/
> +	cp -a $(@D)/gpu-demos/opt/* $(TARGET_DIR)/usr/share/examples/
> +endef
> +endif
> +
> +define IMX_DPU_G2D_INSTALL_TARGET_CMDS
> +	$(IMX_DPU_G2D_INSTALL_EXAMPLES)
> +	cp -a $(@D)/g2d/usr/lib $(TARGET_DIR)/usr
> +endef
> +
> +$(eval $(generic-package))

Could you address the above comments and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
