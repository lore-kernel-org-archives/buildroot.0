From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 26 May 2020 14:48:04 +0200
Subject: [Buildroot] [PATCH v3 2/5] package/freescale-imx/firmware-imx:
 add choice for DDR training binaries
In-Reply-To: <1590422530-4788-3-git-send-email-stephane.viau@oss.nxp.com>
References: <1590422530-4788-1-git-send-email-stephane.viau@oss.nxp.com>
 <1590422530-4788-3-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200526124804.GB438358@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

On Mon, May 25, 2020 at 06:02:07PM +0200, Stephane Viau wrote:
> Several i.MX8 (e.g.: 8M, 8MM, 8MN) support many DDR types (LPDDR4, DDR4,
> etc.), for which the DDR training is performed in the bootloader.
> Some boards have LPDDR4 (e.g.: nitrogen8mn) and some others have the DDR4
> (e.g.: NXP's reference board EVK). This patch allows the selection of either
> of the binaries used to train the DDR.
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> Reviewed-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
> Reviewed-by: Julien Olivain <julien.olivain@oss.nxp.com>
> ---
> v3:
>   - Use common FIRMWARE_IMX_INSTALL_IMAGES_CMDS for all i.MX8M platforms
>     and let FIRMWARE_IMX_PREPARE_{DDR,HDMI}_FW be different according to
>     the type of DDR mounted (BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW choice)
>     or the eventual presence of HDMI, which is SoC dependant.     (Gary)
> v2:
>   - use BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW to extend the DDR
>     firmware selection for 8M, 8MM and 8MN (suggested by Gary)
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> ---
>  package/freescale-imx/firmware-imx/Config.in       | 24 +++++++++++
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 47 ++++++++++++++++++++--
>  2 files changed, 68 insertions(+), 3 deletions(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
> index 56d5b80..4962992 100644
> --- a/package/freescale-imx/firmware-imx/Config.in
> +++ b/package/freescale-imx/firmware-imx/Config.in
> @@ -8,3 +8,27 @@ config BR2_PACKAGE_FIRMWARE_IMX
>  
>  	  This library is provided by Freescale as-is and doesn't have
>  	  an upstream.
> +
> +if BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
> +
> +choice
> +	bool "DDR training binaries"
> +	default BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4
> +	help
> +	  Choose the DDR training binaries to be used depending on the
> +	  kind of memory that is available on the target board (DDR4,
> +	  LPDDR4, etc...).
> +
> +config BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4
> +	bool "lpddr4"
> +	help
> +	  Use LPDDR4 binaries (i.e.: lpddr4_pmu_train_*.bin)
> +
> +config BR2_PACKAGE_FIRMWARE_DDRFW_DDR4
> +	bool "DDR4"
> +	help
> +	  Use DDR4 binaries (i.e.: ddr4_*_201810.bin).
> +
> +endchoice # DDR training FW
> +
> +endif
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index cd0dafb..bd87baa 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -18,8 +18,7 @@ define FIRMWARE_IMX_EXTRACT_CMDS
>  	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
>  endef
>  
> -ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN),y)

I would still keep the 'if IMX8M' around the whole block that is only
for iMX8M.

> -FIRMWARE_IMX_INSTALL_IMAGES = YES
> +ifeq ($(BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4),y)
>  FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
>  define FIRMWARE_IMX_PREPARE_LPDDR4_FW
>  	$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 \
> @@ -33,7 +32,7 @@ define FIRMWARE_IMX_PREPARE_LPDDR4_FW
>  		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_$(1)_fw.bin
>  endef
>  
> -define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
> +define FIRMWARE_IMX_PREPARE_DDR_FW
>  	# Create padded versions of lpddr4_pmu_* and generate lpddr4_pmu_train_fw.bin.
>  	# lpddr4_pmu_train_fw.bin is needed when generating imx8-boot-sd.bin
>  	# which is done in post-image script.
> @@ -42,9 +41,51 @@ define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
>  	cat $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_1d_fw.bin \
>  		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_2d_fw.bin > \
>  		$(BINARIES_DIR)/lpddr4_pmu_train_fw.bin
> +	ln -sf $(BINARIES_DIR)/lpddr4_pmu_train_fw.bin $(BINARIES_DIR)/ddr_fw.bin
> +endef
> +else ifeq ($(BR2_PACKAGE_FIRMWARE_DDRFW_DDR4),y)
> +FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
> +define FIRMWARE_IMX_PREPARE_DDR4_FW
> +	$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 \
> +		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_imem_$(1)_201810.bin \
> +		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_imem_$(1)_201810_pad.bin
> +	$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x4000 --gap-fill=0x0 \
> +		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_dmem_$(1)_201810.bin \
> +		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_dmem_$(1)_201810_pad.bin
> +	cat $(FIRMWARE_IMX_DDRFW_DIR)/ddr4_imem_$(1)_201810_pad.bin \
> +		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_dmem_$(1)_201810_pad.bin > \
> +		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_$(1)_201810_fw.bin
> +endef
> +
> +define FIRMWARE_IMX_PREPARE_DDR_FW
> +	# Create padded versions of ddr4_* and generate ddr4_fw.bin.
> +	# ddr4_fw.bin is needed when generating imx8-boot-sd.bin
> +	# which is done in post-image script.
> +	$(call FIRMWARE_IMX_PREPARE_DDR4_FW,1d)
> +	$(call FIRMWARE_IMX_PREPARE_DDR4_FW,2d)
> +	cat $(FIRMWARE_IMX_DDRFW_DIR)/ddr4_1d_201810_fw.bin \
> +		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_2d_201810_fw.bin > \
> +		$(BINARIES_DIR)/ddr4_201810_fw.bin
> +	ln -sf $(BINARIES_DIR)/ddr4_201810_fw.bin $(BINARIES_DIR)/ddr_fw.bin
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
> +define FIRMWARE_IMX_PREPARE_HDMI_FW
>  	cp $(@D)/firmware/hdmi/cadence/signed_hdmi_imx8m.bin \
>  		$(BINARIES_DIR)/signed_hdmi_imx8m.bin
>  endef
> +else
> +define FIRMWARE_IMX_PREPARE_HDMI_FW

I don't believe this empty FIRMWARE_IMX_PREPARE_HDMI_FW declaration is
necessary, only having it define for IMX8M should be enough.

> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN),y)
> +FIRMWARE_IMX_INSTALL_IMAGES = YES
> +define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
> +	$(FIRMWARE_IMX_PREPARE_DDR_FW)
> +	$(FIRMWARE_IMX_PREPARE_HDMI_FW)
> +endef

I like the above, thanks! At least now the HDMI FW is properly copied
only for i.MX8MQ.
Which makes me thinkg you should add something in the commit log that
DDR and HDMI FW copy are now separated.

Regards,
Gary
