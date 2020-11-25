From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Wed, 25 Nov 2020 09:15:08 +0000
Subject: [Buildroot] [PATCH v3 1/8] package/freescale-imx/firmware-imx:
 Add option to install all ddr fw files
In-Reply-To: <20201109142309.1135596-2-xroumegue@gmail.com>
References: <20201107135909.1265116-1-xroumegue@gmail.com>,
 <20201109142309.1135596-2-xroumegue@gmail.com>
Message-ID: <AM0PR04MB4529E1F5E11523925C1A6E34A7FA0@AM0PR04MB4529.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Xavier,

>________________________________________
>From: buildroot <buildroot-bounces@busybox.net> on behalf of Xavier Roumegue <xroumegue@gmail.com>
>Sent: Monday, November 9, 2020 2:23 PM
>To: buildroot at buildroot.org; Thomas Petazzoni
>Cc: Gary Bisson; Xavier Roumegue; Fabio Estevam; Gilles Talis; Refik Tuzakli; Julien Olivain
>Subject: [Buildroot] [PATCH v3 1/8] package/freescale-imx/firmware-imx: Add option to install all ddr fw files
>
>Selecting this option will copy all ([lp]ddr4.bin) DDR training files to
>BINARIES_DIR.
>
>Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>
>---
> package/freescale-imx/firmware-imx/Config.in       |  3 +++
> package/freescale-imx/firmware-imx/firmware-imx.mk | 12 ++++++++++++
> 2 files changed, 15 insertions(+)
>
>diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
>index 587f402426..2ed6d4254d 100644
>--- a/package/freescale-imx/firmware-imx/Config.in
>+++ b/package/freescale-imx/firmware-imx/Config.in
>@@ -81,6 +81,9 @@ config BR2_PACKAGE_FIRMWARE_IMX_DMEM_LEN
>        help
>          The DMEM firmware will be padded to this length
>
>+config BR2_PACKAGE_FIRMWARE_IMX_DDR_FW_MULTIPLE
>+    bool

Can you please fix the 'make check-package' error?
The same applies to a few of your other patches from the series.

>+
> endif # BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
>
> endif # BR2_PACKAGE_FIRMWARE_IMX
>diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
>index fb3cfe640b..c5ae4fad25 100644
>--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
>+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
>@@ -36,6 +36,16 @@ define FIRMWARE_IMX_PREPARE_DDR_FW
>                $(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(3)).bin
> endef
>
>+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_DDR_FW_MULTIPLE),y)
>+define FIRMWARE_IMX_COPY_DDR_FW
>+       cp $(1) $(BINARIES_DIR)/
>+endef
>+else
>+define FIRMWARE_IMX_COPY_DDR_FW
>+       true
>+endef
>+endif
>+
> ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),y)
> FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
>
>@@ -51,6 +61,7 @@ define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
>                $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_2d_fw.bin > \
>                $(BINARIES_DIR)/lpddr4_pmu_train_fw.bin
>        ln -sf $(BINARIES_DIR)/lpddr4_pmu_train_fw.bin $(BINARIES_DIR)/ddr_fw.bin
>+       $(call FIRMWARE_IMX_COPY_DDR_FW, $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4*.bin)
> endef
> endif
>
>@@ -69,6 +80,7 @@ define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
>                $(FIRMWARE_IMX_DDRFW_DIR)/ddr4_2d_201810_fw.bin > \
>                $(BINARIES_DIR)/ddr4_201810_fw.bin
>        ln -sf $(BINARIES_DIR)/ddr4_201810_fw.bin $(BINARIES_DIR)/ddr_fw.bin
>+       $(call FIRMWARE_IMX_COPY_DDR_FW, $(FIRMWARE_IMX_DDRFW_DIR)/ddr4*.bin)
> endef
> endif
>
>--
>2.28.0
>
>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot
>
