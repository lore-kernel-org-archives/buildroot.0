From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 23:04:42 +0200
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/firmware-imx:
 Clean up the image/target semantic
In-Reply-To: <1593012228-18959-3-git-send-email-stephane.viau@oss.nxp.com>
References: <1593012228-18959-1-git-send-email-stephane.viau@oss.nxp.com>
 <1593012228-18959-3-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200624230442.6bf515b4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Jun 2020 17:23:48 +0200
Stephane Viau <stephane.viau@oss.nxp.com> wrote:

>  package/freescale-imx/firmware-imx/firmware-imx.mk | 70 +++++++++++++++++-----
>  1 file changed, 54 insertions(+), 16 deletions(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index 6beacc0..62f97e6 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -12,12 +12,13 @@ FIRMWARE_IMX_LICENSE = NXP Semiconductor Software License Agreement
>  FIRMWARE_IMX_LICENSE_FILES = EULA COPYING
>  FIRMWARE_IMX_REDISTRIBUTE = NO
>  
> -FIRMWARE_IMX_BLOBS = sdma vpu
> -
>  define FIRMWARE_IMX_EXTRACT_CMDS
>  	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
>  endef
>  
> +# firmware-imx install images section:
> +######################################
> +

This comment is not needed.

>  ifeq ($(BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW),y)
>  FIRMWARE_IMX_INSTALL_IMAGES = YES
>  
> @@ -71,36 +72,73 @@ define FIRMWARE_IMX_PREPARE_DDR_FW
>  		$(BINARIES_DIR)/ddr4_201810_fw.bin
>  	ln -sf $(BINARIES_DIR)/ddr4_201810_fw.bin $(BINARIES_DIR)/ddr_fw.bin
>  endef
> -endif
> +endif # DDRFW_LPDDR4 || DDRFW_DDR4
> +endif # NEED_DDR_FW
> +
> +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_NEED_HDMI_FW),y)
> +FIRMWARE_IMX_INSTALL_IMAGES = YES
>  
> -ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
>  define FIRMWARE_IMX_PREPARE_HDMI_FW
>  	cp $(@D)/firmware/hdmi/cadence/signed_hdmi_imx8m.bin \
>  		$(BINARIES_DIR)/signed_hdmi_imx8m.bin
>  endef
> -endif
> +endif # NEED_HDMI_FW
>  
>  define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
>  	$(FIRMWARE_IMX_PREPARE_DDR_FW)
>  	$(FIRMWARE_IMX_PREPARE_HDMI_FW)
>  endef

I think it would be good to group that together with the
IMX_INSTALL_TARGET_CMDS definition, towards the end of the file.

> -else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
> -define FIRMWARE_IMX_INSTALL_TARGET_CMDS
> +
> +# firmware-imx install target section:
> +######################################
> +

Comment not really useful.



> +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_NEED_EPDC_FW),y)
> +FIRMWARE_IMX_INSTALL_TARGET = YES
> +
> +define FIRMWARE_IMX_INSTALL_TARGET_EPDC_FW
> +	mkdir -p $(TARGET_DIR)/lib/firmware/imx
> +	cp -r $(@D)/firmware/epdc $(TARGET_DIR)/lib/firmware/imx
> +	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
> +		$(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
> +endef
> +endif # NEED_EPDC_FW
> +
> +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW),y)
> +FIRMWARE_IMX_INSTALL_TARGET = YES
> +
> +define FIRMWARE_IMX_INSTALL_TARGET_SDMA_FW
> +	mkdir -p $(TARGET_DIR)/lib/firmware/imx
> +	cp -r $(@D)/firmware/vpu $(TARGET_DIR)/lib/firmware
> +endef
> +endif # NEED_SDMA_FW
> +
> +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW),y)

This option doesn't exist in your Config.in.

> +FIRMWARE_IMX_INSTALL_TARGET = YES
> +
> +ifeq ($(BR2_PACKAGE_FIRMWARE_VPUFW_GENERIC),y)

Are you sure this option exists ?

> +
> +define FIRMWARE_IMX_INSTALL_TARGET_VPU_FW
> +	mkdir -p $(TARGET_DIR)/lib/firmware/imx
> +	cp -r $(@D)/firmware/vpu $(TARGET_DIR)/lib/firmware
> +endef
> +
> +endif
> +ifeq ($(BR2_PACKAGE_FIRMWARE_VPUFW_IMX8),y)

And this one ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
