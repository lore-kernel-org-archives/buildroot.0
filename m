From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 29 May 2018 22:46:21 +0200
Subject: [Buildroot] [PATCH v3 4/5] uboot: zynqmp: generate SPL image
 with PMUFW binary
In-Reply-To: <20180528225334.6a2f42d6@windsurf.home>
References: <1525364617-23633-1-git-send-email-luca@lucaceresoli.net>
 <1525364617-23633-5-git-send-email-luca@lucaceresoli.net>
 <20180528225334.6a2f42d6@windsurf.home>
Message-ID: <1bf2fe55-ed5c-fd97-e203-46b913204770@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 28/05/2018 22:53, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu,  3 May 2018 18:23:36 +0200, Luca Ceresoli wrote:
>> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
>> index cbb899515181..266e42698d1b 100644
>> --- a/boot/uboot/uboot.mk
>> +++ b/boot/uboot/uboot.mk
>> @@ -276,6 +276,21 @@ endef
>>  
>>  ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
>>  
>> +UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
>> +
>> +ifneq ($(UBOOT_ZYNQMP_PMUFW),)
>> +UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
>> +BR_NO_CHECK_HASH_FOR += $(notdir $(UBOOT_ZYNQMP_PMUFW))
>> +define UBOOT_ZYNQMP_KCONFIG_FIXUP
>> +	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"board/xilinx/zynqmp/pmufw.bin",$(@D)/.config)
>> +endef
>> +define UBOOT_ZYNQMP_COPY_PMUFW
>> +	$(INSTALL) -D -m 0644 $(UBOOT_DL_DIR)/$(notdir $(UBOOT_ZYNQMP_PMUFW)) \
>> +		$(@D)/board/xilinx/zynqmp/pmufw.bin
>> +endef
> 
> I'm wondering if your solution that consists in copying the PMU
> firmware to the U-Boot source directory and then using that location in
> the U-Boot configuration is better, or if we should simply make the
> U-Boot configuration point to the location in $(UBOOT_DL_DIR), i.e:
> 
> $(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,$(UBOOT_DL_DIR)/$(notdir $(UBOOT_ZYNQMP_PMUFW)),$(@D)/.config)
> 
> I'm not saying we _must_ do this, I'm wondering if it isn't simpler.

This would definitely be better, but it wouldn't work because the U-Boot
makefile looks for $(srctree)/$(CONFIG_BOOT_INIT_FILE), not just
$(CONFIG_BOOT_INIT_FILE). So the file must be relative to
$(@D)/board/xilinx/zynqmp/, i.e. $(srctree).

Of course this could be fixed in U-Boot...

>> +define UBOOT_KCONFIG_FIXUP_CMDS
>> +	$(UBOOT_ZYNQMP_KCONFIG_FIXUP)
>> +endef
> 
> This obviously won't work with a non-kconfig capable U-Boot version,
> though admittedly ZynqMP support is sufficiently new in upstream U-Boot
> that we're pretty much guaranteed that someone trying to build for
> ZynqMP will have a kconfig-capable U-Boot.

Indeed.

> But to be sure, perhaps the
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW should have a "depends on
> BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG" ?

Ok, that can be done anyway, no problem.

-- 
Luca
