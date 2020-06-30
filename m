From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 30 Jun 2020 13:59:10 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/freescale-imx/firmware-imx:
 Clean up the image/target semantic
In-Reply-To: <1593419148-26821-4-git-send-email-stephane.viau@oss.nxp.com>
References: <1593419148-26821-1-git-send-email-stephane.viau@oss.nxp.com>
 <1593419148-26821-4-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200630115910.GB791671@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

On Mon, Jun 29, 2020 at 10:25:47AM +0200, Stephane Viau wrote:
> The newly introduced BR2_PACKAGE_FIRMWARE_IMX_xxx symbols shall be
> used in lieue of the SoC type when installing images or binaries on
> target.
> 
> These new symbols let us define FIRMWARE_IMX_INSTALL_IMAGES_CMDS and
> FIRMWARE_IMX_INSTALL_TARGET_CMDS based on platform needs rather than
> SoC type.
> 
> Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> ---
> v2:
> - Name VPU FW after IP name (Fabio)
> - Rename symbols using the "_NEED_" in their name (Thomas)
> - Remove unnecessary comments & move INSTALL_IMAGES down (Thomas)
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> ---
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 63 ++++++++++++++++------
>  1 file changed, 46 insertions(+), 17 deletions(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index 55ca6fc..d227eb2 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -12,8 +12,6 @@ FIRMWARE_IMX_LICENSE = NXP Semiconductor Software License Agreement
>  FIRMWARE_IMX_LICENSE_FILES = EULA COPYING
>  FIRMWARE_IMX_REDISTRIBUTE = NO
>  
> -FIRMWARE_IMX_BLOBS = sdma vpu
> -
>  define FIRMWARE_IMX_EXTRACT_CMDS
>  	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
>  endef
> @@ -72,35 +70,66 @@ define FIRMWARE_IMX_PREPARE_DDR_FW
>  	ln -sf $(BINARIES_DIR)/ddr4_201810_fw.bin $(BINARIES_DIR)/ddr_fw.bin
>  endef
>  endif
> +endif # IMX_NEEDS_DDR_FW
> +
> +ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_HDMI),y)
> +FIRMWARE_IMX_INSTALL_IMAGES = YES
>  
> -ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
>  define FIRMWARE_IMX_PREPARE_HDMI_FW
>  	cp $(@D)/firmware/hdmi/cadence/signed_hdmi_imx8m.bin \
>  		$(BINARIES_DIR)/signed_hdmi_imx8m.bin
>  endef
>  endif
>  
> -define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
> -	$(FIRMWARE_IMX_PREPARE_DDR_FW)
> -	$(FIRMWARE_IMX_PREPARE_HDMI_FW)
> +ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_EPDC),y)
> +FIRMWARE_IMX_INSTALL_TARGET = YES
> +
> +define FIRMWARE_IMX_INSTALL_TARGET_EPDC_FW
> +	mkdir -p $(TARGET_DIR)/lib/firmware/imx
> +	cp -r $(@D)/firmware/epdc $(TARGET_DIR)/lib/firmware/imx
> +	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
> +		$(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
>  endef
> -else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
> -define FIRMWARE_IMX_INSTALL_TARGET_CMDS
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_SDMA),y)
> +FIRMWARE_IMX_INSTALL_TARGET = YES
> +
> +define FIRMWARE_IMX_INSTALL_TARGET_SDMA_FW
> +	mkdir -p $(TARGET_DIR)/lib/firmware/imx
> +	cp -r $(@D)/firmware/vpu $(TARGET_DIR)/lib/firmware
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_VPU_CODA),y)
> +FIRMWARE_IMX_INSTALL_TARGET = YES
> +
> +define FIRMWARE_IMX_INSTALL_TARGET_VPU_FW
> +	mkdir -p $(TARGET_DIR)/lib/firmware/imx
> +	cp -r $(@D)/firmware/vpu $(TARGET_DIR)/lib/firmware
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_VPU_MALONE),y)
> +FIRMWARE_IMX_INSTALL_TARGET = YES

Instead of setting FIRMWARE_IMX_INSTALL_TARGET at multiple places,
wouldn't it be ok to have it set to YES at the beginning, and worst case
scenario none of the macros are defined and it does nothing?

Just trying to simplify the package even more. Same goes for
FIRMWARE_IMX_INSTALL_IMAGES_CMDS.

Regards,
Gary
