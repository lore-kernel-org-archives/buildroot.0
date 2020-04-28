From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 28 Apr 2020 10:21:11 +0200
Subject: [Buildroot] [PATCH 1/4] package/freescale-imx/firmware-imx: add
 choice for DDR training binaries
In-Reply-To: <1588059233-11467-2-git-send-email-stephane.viau@oss.nxp.com>
References: <1588059233-11467-1-git-send-email-stephane.viau@oss.nxp.com>
 <1588059233-11467-2-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200428082111.GA183066@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

Thanks for this patch, it would indeed be nice to support several DDR
options. However I have a few remarks, see below.

On Tue, Apr 28, 2020 at 09:33:50AM +0200, Stephane Viau wrote:
> i.MX 8M Nano support many DDR types (LPDDR4, DDR4, DDR3L). Some boards

This is not i.MX8M Nano specific, this actually applies to the whole
i.MX8M family. You can have a i.MX8MQ platform with DDR4 too.

> have LPDDR4 (e.g.: nitrogen8mn) and some others have the DDR4 (e.g.:
> NXP's reference board EVK). This patch allows the selection of either
> of the binaries used to train the DDR.
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> Reviewed-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
> Reviewed-by: Julien Olivain <julien.olivain@oss.nxp.com>
> ---
>  package/freescale-imx/firmware-imx/Config.in       | 24 ++++++++++++++++++
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 29 +++++++++++++++++++++-
>  2 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
> index 56d5b80..e6ae993 100644
> --- a/package/freescale-imx/firmware-imx/Config.in
> +++ b/package/freescale-imx/firmware-imx/Config.in
> @@ -8,3 +8,27 @@ config BR2_PACKAGE_FIRMWARE_IMX
>  
>  	  This library is provided by Freescale as-is and doesn't have
>  	  an upstream.
> +
> +if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN

Please do not limit to IMX8MN

> +choice
> +	bool "DDR training binaries"
> +	default BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4

Good that default is LPDDR4 for backward compatibility, thanks.

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

Where is the DDR3 option?

> +endchoice # DDR training FW
> +
> +endif
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index cd0dafb..33ee4bb 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -18,7 +18,7 @@ define FIRMWARE_IMX_EXTRACT_CMDS
>  	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
>  endef
>  
> -ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN),y)
> +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM)$(BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4),y)
>  FIRMWARE_IMX_INSTALL_IMAGES = YES
>  FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
>  define FIRMWARE_IMX_PREPARE_LPDDR4_FW
> @@ -42,9 +42,36 @@ define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
>  	cat $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_1d_fw.bin \
>  		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_2d_fw.bin > \
>  		$(BINARIES_DIR)/lpddr4_pmu_train_fw.bin
> +	ln -sf $(BINARIES_DIR)/lpddr4_pmu_train_fw.bin $(BINARIES_DIR)/ddr_fw.bin
>  	cp $(@D)/firmware/hdmi/cadence/signed_hdmi_imx8m.bin \
>  		$(BINARIES_DIR)/signed_hdmi_imx8m.bin
>  endef
> +else ifeq ($(BR2_PACKAGE_FIRMWARE_DDRFW_DDR4),y)
> +FIRMWARE_IMX_INSTALL_IMAGES = YES
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
> +define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
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

Can you tell me the difference between ddr4_dmem_Xd_201810.bin and ddr4_dmem_Xd.bin?

Regards,
Gary
