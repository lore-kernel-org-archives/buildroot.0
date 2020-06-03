From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Wed, 3 Jun 2020 19:23:44 +0000
Subject: [Buildroot] [PATCH v4 1/5] package/freescale-imx: Add option
 for DDR FW need
In-Reply-To: <20200602200347.GJ8737@scaer>
References: <1590556068-7043-1-git-send-email-stephane.viau@oss.nxp.com>
 <1590556068-7043-2-git-send-email-stephane.viau@oss.nxp.com>
 <20200529214638.GT8737@scaer>
 <DB8PR04MB575538B11EC2AEC5D10413F5A78B0@DB8PR04MB5755.eurprd04.prod.outlook.com>,
 <20200602200347.GJ8737@scaer>
Message-ID: <DB8PR04MB5755D5B817C4912C1EB3EEF6A7880@DB8PR04MB5755.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>Stephane, All,

Hi Yann,

>
>On 2020-06-02 07:32 +0000, Stephane Viau (OSS) spake thusly:
>> >On 2020-05-27 07:07 +0200, Stephane Viau spake thusly:
>> >> Only some i.MX8 needs a DDR training firmware (8M, 8MM, 8MN). Some other
>> >> i.MX8 (QuadMax, QuadXPlus) rely on system controller for that task.
>[--SNIP--]
>> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
>> >>       bool "imx8m"
>> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
>> >>
>> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
>> >>       bool "imx8mm"
>> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
>> >>
>> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
>> >>       bool "imx8mn"
>> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
>> >>
>> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
>> >>       bool "imx8x"
>> >> @@ -96,6 +99,9 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
>> >>               BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
>> >>               BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
>> >>
>> >> +config BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
>> >> +     bool
>> >
>> >Now that this variable exists, I've made use of it to drive the actual
>> >insrallation of the DDR trainging files, instead of the concatenation
>> >of the corresponding platforms.
>> Quite tempting, indeed.
>> I have actually proposed this in my v2 series, in which Gary made these comments:
>> [1]:
>>       "
>>       And here is why I'm worried the name of the previous variable might be
>>       misleading. You don't only copy the DDR FW training under that
>>       BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4 macro, you also copy the HDMI FW.
>>       Note that the DP FW should be added as well.
>
>The macro copying the HDMI FW can indeed be moved out of the conditional
>block, indeed. But this commit 6bb7f3b8109 I amended when applying does
>not change the behaviour at all.

Agreed ; the behavior is the same.

>
>> and [2]:
>>       "
>>       I would still keep the 'if IMX8M' around the whole block that is only
>>       for iMX8M.
>>       "
>> ... which I did agree with and reverted back to using the whole SoC list instead.
>
>Ah, but that's not what I discussed with Gary on IRC the other day when
>he asked for my input. I suggested exactly to switch to using the new
>variable.
>
>> Also, the _ifeq_ part of this _if_ statement mentions another SoC
>> (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X): it makes thus more sense to
>> use the i.MX 8M SoC list in the former part, doesn't it?
>
>Oh, I see what you mean. I also had a mixed feelings about it, but this
>is not so much an issue. Semantically, that is OK (IMHO) to have
>succeeding conditionals that test various things...

It sure works semantically but (IMO), if there are ways to avoid it, I'd rather
avoid comparing apples and oranges ;-)

>
>But looking at the big picture again, I see potential for a further
>simple (semantic) cleanup:

True. I see these major steps:

1.1) define FIRMWARE_IMX_PREPARE_HDMI_FW     (+ set FIRMWARE_IMX_INSTALL_IMAGES = YES)
1.2) define FIRMWARE_IMX_PREPARE_DDR_FW      (+ set FIRMWARE_IMX_INSTALL_IMAGES = YES)
1.3) define FIRMWARE_IMX_INSTALL_IMAGES_CMDS (based on the above FIRMWARE_IMX_PREPARE_xxx)


2.1) define FIRMWARE_IMX_INSTALL_TARGET_CMDS_IMX8X        (+ set FIRMWARE_IMX_INSTALL_TARGET = YES)
2.2) define FIRMWARE_IMX_INSTALL_TARGET_CMDS_GENERIC      (+ set FIRMWARE_IMX_INSTALL_TARGET = YES)
2.3) define FIRMWARE_IMX_INSTALL_TARGET_CMDS (based on the above FIRMWARE_IMX_INSTALL_TARGET_CMDS_xxx)


>
>    diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
>    index 9fd1c54b48..3239e432da 100644
>    --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
>    +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
>    @@ -18,7 +18,16 @@ define FIRMWARE_IMX_EXTRACT_CMDS
>        $(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
>     endef
>
>    +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)

looks like we need a new "BR2_PACKAGE_FREESCALE_IMX_NEED_HDMI_FW" symbol here.

>    +FIRMWARE_IMX_INSTALL_IMAGES = YES
>    +define FIRMWARE_IMX_PREPARE_HDMI_FW
>    +   cp $(@D)/firmware/hdmi/cadence/signed_hdmi_imx8m.bin \
>    +           $(BINARIES_DIR)/signed_hdmi_imx8m.bin
>    +endef
>    +endif # PLATFORM_IMX8M

That is "1.1) define FIRMWARE_IMX_PREPARE_HDMI_FW     (+ set FIRMWARE_IMX_INSTALL_IMAGES = YES)"


>    +
>     ifeq ($(BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW),y)
>    +FIRMWARE_IMX_INSTALL_TARGET = NO
>     FIRMWARE_IMX_INSTALL_IMAGES = YES
>
>     ifeq ($(BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4),y)
>    @@ -46,6 +55,8 @@ define FIRMWARE_IMX_PREPARE_DDR_FW
>                $(BINARIES_DIR)/lpddr4_pmu_train_fw.bin
>        ln -sf $(BINARIES_DIR)/lpddr4_pmu_train_fw.bin $(BINARIES_DIR)/ddr_fw.bin
>     endef
>    +
>    +# else DRFW_LPDDR4
>     else ifeq ($(BR2_PACKAGE_FIRMWARE_DDRFW_DDR4),y)
>     FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
>     define FIRMWARE_IMX_PREPARE_DDR4_FW
>    @@ -71,28 +82,19 @@ define FIRMWARE_IMX_PREPARE_DDR_FW
>                $(BINARIES_DIR)/ddr4_201810_fw.bin
>        ln -sf $(BINARIES_DIR)/ddr4_201810_fw.bin $(BINARIES_DIR)/ddr_fw.bin
>     endef
>    -endif
>    +endif # DDRFW_LPDDR4 || DDRFW_DDR4

That is "1.2) define FIRMWARE_IMX_PREPARE_DDR_FW      (+ set FIRMWARE_IMX_INSTALL_IMAGES = YES)"

I would rather _endif_ here in order to separate the whole NEED_DDR_FW stuff from
the INSTALL_TARGET stuff ; even though if, today, NEED_DDR_FW is tightly coupled with the i.MX8M
family (but probably shouldn't).

>
>    -ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
>    -define FIRMWARE_IMX_PREPARE_HDMI_FW
>    -   cp $(@D)/firmware/hdmi/cadence/signed_hdmi_imx8m.bin \
>    -           $(BINARIES_DIR)/signed_hdmi_imx8m.bin
>    -endef
>    -endif
>    -
>    -define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
>    -   $(FIRMWARE_IMX_PREPARE_DDR_FW)
>    -   $(FIRMWARE_IMX_PREPARE_HDMI_FW)
>    -endef
>    +# else NEED_DDR_FW
>     else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
>    -define FIRMWARE_IMX_INSTALL_TARGET_CMDS
>    +define FIRMWARE_IMX_INSTALL_TARGET_CMDS_IMX8X
>        $(INSTALL) -D -m 0644 $(@D)/firmware/vpu/vpu_fw_imx8_dec.bin \
>                $(TARGET_DIR)/lib/firmware/vpu/vpu_fw_imx8_dec.bin
>        $(INSTALL) -D -m 0644 $(@D)/firmware/vpu/vpu_fw_imx8_enc.bin \
>                $(TARGET_DIR)/lib/firmware/vpu/vpu_fw_imx8_enc.bin
>     endef

That is "2.1) define FIRMWARE_IMX_INSTALL_TARGET_CMDS_IMX8X"    
(we should also set FIRMWARE_IMX_INSTALL_TARGET = YES)

>    -else
>    -define FIRMWARE_IMX_INSTALL_TARGET_CMDS
>    +
>    +else # NEED_DDR_FW || PLATFORM_IMX8X
>    +define FIRMWARE_IMX_INSTALL_TARGET_CMDS_GENERIC
>        mkdir -p $(TARGET_DIR)/lib/firmware/imx
>        for blobdir in $(FIRMWARE_IMX_BLOBS); do \
>                cp -r $(@D)/firmware/$${blobdir} $(TARGET_DIR)/lib/firmware; \
>    @@ -101,6 +103,16 @@ define FIRMWARE_IMX_INSTALL_TARGET_CMDS
>        mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
>                $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
>     endef

That is "2.2) define FIRMWARE_IMX_INSTALL_TARGET_CMDS_GENERIC"
(we should also set FIRMWARE_IMX_INSTALL_TARGET = YES)

>    -endif
>    +endif # NEED_DDR_FW || PLATFORM_IMX8X || the rest
>    +
>    +define FIRMWARE_IMX_INSTALL_TARGET_CMDS
>    +   $(FIRMWARE_IMX_INSTALL_TARGET_CMDS_IMX8X)
>    +   $(FIRMWARE_IMX_INSTALL_TARGET_CMDS_GENERIC)
>    +endef

Good idea, indeed.
That is "2.3) define FIRMWARE_IMX_INSTALL_TARGET_CMDS (based on the above FIRMWARE_IMX_INSTALL_TARGET_CMDS_xxx)"

>    +
>    +define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
>    +   $(FIRMWARE_IMX_PREPARE_HDMI_FW)
>    +   $(FIRMWARE_IMX_PREPARE_DDR_FW)
>    +endef

That is "1.3) define FIRMWARE_IMX_INSTALL_IMAGES_CMDS (based on the above FIRMWARE_IMX_PREPARE_xxx)"

>
>     $(eval $(generic-package))
>
>Care to look at that?

Will do (and propose a patch for review soon).

BR,
Stephane.

>
>Regards,
>Yann E. MORIN.
>
>> [1] http://lists.busybox.net/pipermail/buildroot/2020-May/283181.html
>> [2] http://lists.busybox.net/pipermail/buildroot/2020-May/283442.html
>>
>> Thanks,
>> Stephane.
>>
>> >Pelase review the commit to check I haven't totally borked the thing:
>> >
>> >    https://git.buildroot.org/buildroot/commit/?id=6bb7f3b81092e7005470c7d689a566dbc1d059c6
>> >
>> >Thanks.
>> >
>> >>  source "package/freescale-imx/imx-alsa-plugins/Config.in"
>> >>  source "package/freescale-imx/imx-codec/Config.in"
>> >>  source "package/freescale-imx/imx-kobs/Config.in"
>> >> --
>> >> 2.7.4
>> >>
>> >> _______________________________________________
>> >> buildroot mailing list
>> >> buildroot at busybox.net
>> >> http://lists.busybox.net/mailman/listinfo/buildroot
>> >
>> >--
>> >.-----------------.--------------------.------------------.--------------------.
>> >|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>> >| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>> >| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>> >| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>> >'------------------------------^-------^------------------^--------------------'
>> >
>
>--
>.-----------------.--------------------.------------------.--------------------.
>|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>'------------------------------^-------^------------------^--------------------'
>
>
