From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Mon, 25 May 2020 16:17:37 +0000
Subject: [Buildroot] [PATCH v2 2/5] package/freescale-imx/firmware-imx:
 add choice for DDR training binaries
In-Reply-To: <20200520081529.GC1349614@p1g2>
References: <1588151545-9346-1-git-send-email-stephane.viau@oss.nxp.com>
 <1588151545-9346-3-git-send-email-stephane.viau@oss.nxp.com>,
 <20200520081529.GC1349614@p1g2>
Message-ID: <DB8PR04MB57556BC95FBD433E27CBA1E3A7B30@DB8PR04MB5755.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>Hi Stephane,

Hi Gary,

>> Several i.MX8 (e.g.: 8M, 8MM, 8MN) support many DDR types (LPDDR4, DDR4,
>> etc.), for which the DDR training is performed in the bootloader.
>> Some boards have LPDDR4 (e.g.: nitrogen8mn) and some others have the DDR4
>> (e.g.: NXP's reference board EVK). This patch allows the selection of either
>> of the binaries used to train the DDR.
>> 
>> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
>> Reviewed-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
>> Reviewed-by: Julien Olivain <julien.olivain@oss.nxp.com>
>> ---
>> v2:
>>   - use BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW to extend the DDR
>>     firmware selection for 8M, 8MM and 8MN (suggested by Gary)
>> 
>> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
>> ---
>>  package/freescale-imx/firmware-imx/Config.in       | 24 ++++++++++++++++++
>>  package/freescale-imx/firmware-imx/firmware-imx.mk | 29 +++++++++++++++++++++-
>>  2 files changed, 52 insertions(+), 1 deletion(-)
>> 
>> diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
>> index 56d5b80..4962992 100644
>> --- a/package/freescale-imx/firmware-imx/Config.in
>> +++ b/package/freescale-imx/firmware-imx/Config.in
>> @@ -8,3 +8,27 @@ config BR2_PACKAGE_FIRMWARE_IMX
>>  
>>          This library is provided by Freescale as-is and doesn't have
>>          an upstream.
>> +
>> +if BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
>
>Here is the only place where the previous variable is used, not sure it
>brings a lot of value.

I believe BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW is still required here in
order to avoid seeing the below DDR FW options when they are not required
(e.g. i.MX 8 family). We want this choice to pop up only for i.MX 8M SoCs.

>
>> +choice
>> +     bool "DDR training binaries"
>> +     default BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4
>> +     help
>> +       Choose the DDR training binaries to be used depending on the
>> +       kind of memory that is available on the target board (DDR4,
>> +       LPDDR4, etc...).
>> +
>> +config BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4
>> +     bool "lpddr4"
>> +     help
>> +       Use LPDDR4 binaries (i.e.: lpddr4_pmu_train_*.bin)
>> +
>> +config BR2_PACKAGE_FIRMWARE_DDRFW_DDR4
>> +     bool "DDR4"
>> +     help
>> +       Use DDR4 binaries (i.e.: ddr4_*_201810.bin).
>> +
>> +endchoice # DDR training FW
>> +
>> +endif
>> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
>> index cd0dafb..fc2f69a 100644
>> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
>> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
>> @@ -18,7 +18,7 @@ define FIRMWARE_IMX_EXTRACT_CMDS
>>        $(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
>>  endef
>>  
>> -ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN),y)
>> +ifeq ($(BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4),y)
>>  FIRMWARE_IMX_INSTALL_IMAGES = YES
>>  FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
>>  define FIRMWARE_IMX_PREPARE_LPDDR4_FW
>> @@ -42,9 +42,36 @@ define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
>>        cat $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_1d_fw.bin \
>>                $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_2d_fw.bin > \
>>                $(BINARIES_DIR)/lpddr4_pmu_train_fw.bin
>> +     ln -sf $(BINARIES_DIR)/lpddr4_pmu_train_fw.bin $(BINARIES_DIR)/ddr_fw.bin
>>        cp $(@D)/firmware/hdmi/cadence/signed_hdmi_imx8m.bin \
>>                $(BINARIES_DIR)/signed_hdmi_imx8m.bin
>
>And here is why I'm worried the name of the previous variable might be
>misleading. You don't only copy the DDR FW training under that
>BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4 macro, you also copy the HDMI FW.
>Note that the DP FW should be added as well.
>
>The way I see it, it'd be best to have a common
>FIRMWARE_IMX_INSTALL_IMAGES_CMDS for all i.MX8M platforms (hence not
>necessarily using a macro for it).
>Then this CMD could have FIRMWARE_IMX_PREPARE_DDR_FW which would be
>different depending on the choice made before (DDR4 vs. LPDDR4) and then
>also something like FIRMWARE_IMX_PREPARE_HDMI_FW which would only be
>populated for IMX8M and empty for the others.
>
>Does it make sense?

Agreed. please check the v3 patch series:
https://patchwork.ozlabs.org/project/buildroot/list/?series=179135

Regards, 
Stephane.

>
>>  endef
>> +else ifeq ($(BR2_PACKAGE_FIRMWARE_DDRFW_DDR4),y)
>> +FIRMWARE_IMX_INSTALL_IMAGES = YES
>> +FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
>> +define FIRMWARE_IMX_PREPARE_DDR4_FW
>> +     $(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 \
>> +             $(FIRMWARE_IMX_DDRFW_DIR)/ddr4_imem_$(1)_201810.bin \
>> +             $(FIRMWARE_IMX_DDRFW_DIR)/ddr4_imem_$(1)_201810_pad.bin
>> +     $(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x4000 --gap-fill=0x0 \
>> +             $(FIRMWARE_IMX_DDRFW_DIR)/ddr4_dmem_$(1)_201810.bin \
>> +             $(FIRMWARE_IMX_DDRFW_DIR)/ddr4_dmem_$(1)_201810_pad.bin
>> +     cat $(FIRMWARE_IMX_DDRFW_DIR)/ddr4_imem_$(1)_201810_pad.bin \
>> +             $(FIRMWARE_IMX_DDRFW_DIR)/ddr4_dmem_$(1)_201810_pad.bin > \
>> +             $(FIRMWARE_IMX_DDRFW_DIR)/ddr4_$(1)_201810_fw.bin
>> +endef
>> +
>> +define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
>> +     # Create padded versions of ddr4_* and generate ddr4_fw.bin.
>> +     # ddr4_fw.bin is needed when generating imx8-boot-sd.bin
>> +     # which is done in post-image script.
>> +     $(call FIRMWARE_IMX_PREPARE_DDR4_FW,1d)
>> +     $(call FIRMWARE_IMX_PREPARE_DDR4_FW,2d)
>> +     cat $(FIRMWARE_IMX_DDRFW_DIR)/ddr4_1d_201810_fw.bin \
>> +             $(FIRMWARE_IMX_DDRFW_DIR)/ddr4_2d_201810_fw.bin > \
>> +             $(BINARIES_DIR)/ddr4_201810_fw.bin
>> +     ln -sf $(BINARIES_DIR)/ddr4_201810_fw.bin $(BINARIES_DIR)/ddr_fw.bin
>> +endef
>
>The approach above would also fix this case:
>- What about i.MX8MQ with DDR4? HDMI FW is missing from this code.
>
>Let me know if you have any questions.
>
>Regards,
>Gary
