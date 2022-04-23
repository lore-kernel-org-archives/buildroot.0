Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31827C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1EEF83E42;
	Sat, 23 Apr 2022 15:27:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 67LqXz7yijLA; Sat, 23 Apr 2022 15:27:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9254B83E09;
	Sat, 23 Apr 2022 15:27:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6B151BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A400C60EE4
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:27:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gjlD-s3E1Z85 for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:27:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47ADC60BF7
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:27:17 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g20so13741731edw.6
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 08:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AUSP0rJFKbsMTa5AYx05isicEMJqfsT/IWyc2okcepY=;
 b=aaTfgcTQW5vR0aZZcuKGkboKtU50Wq1+xmJToUoQORyXi/k6y6mtanKs7tdo45EcPr
 xuW88iog4RfmTU4PEobH4Hpowf66zVJpLwCCiF7XinhmNFcXD+es0lorLrlykwuZgWpS
 f6kIborMU4T7GO9zEClPzgBHU9NmMec1YooAQlo7iOhka5gCgBZhXwuAjM5Ta3WgDEdB
 S/GysbKMw+F0gVmNvO6cOYL8FuKl/+Vo5Z7urW+KBQZqlJA1GJLeCchzrOom30aIdCeR
 StvyoPHC+sQXTVBrv5ismBGJx5S64KDDK84bJpMXrkUyMWfgcdDZ7+HHvPniGmXF14lQ
 CTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AUSP0rJFKbsMTa5AYx05isicEMJqfsT/IWyc2okcepY=;
 b=XB5ycceC/9+mkRB+vIdhPHYDo6ElOaFg8qsrvZKkjqk62tZJOTRptQf4nu+GD7UgH7
 IGZwIKN1Wph8HjXCT9v0j2FHWod9bKzQx67q64+0cOLOfR/Fe9A3BG8L/jH9vf1Yyt+f
 DsSNzQptXFIEY75BU30/tW0AuiEFu7QKI3Tb8CKWki0SjKkDWH/LFATizNdxumTasMgI
 80P2JH0Vk5LNUs3+WK7ipZFuLuQorlwhL7W6g23LvYnYgcrr9UfNNBLK5pshaDf0SzrK
 CfXPmJbZBknVxXvcyJz/mC/GHltx2a5PtmKbgjCd9M8DDmScTKTPhsdJnxVQuSOSH8ch
 xIkg==
X-Gm-Message-State: AOAM532bLB5CVmUt8lyhbWEYl9Q14SlWfIg2ETK9EYreBACF9Oqzed/1
 wBHmx0K8EO8FuyFMy0CCR3Xtkg==
X-Google-Smtp-Source: ABdhPJxZ6VgcogmYgJoRgyoZ7UiEU/852ZUSoLOP4JH9ACFEVmDEONh6F17spbhyQugBRGmS1n+SeA==
X-Received: by 2002:a05:6402:50cb:b0:423:d7a8:719e with SMTP id
 h11-20020a05640250cb00b00423d7a8719emr10445841edb.37.1650727635512; 
 Sat, 23 Apr 2022 08:27:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a170906540700b006d5eca5c9cfsm1766033ejo.191.2022.04.23.08.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:27:15 -0700 (PDT)
Message-ID: <8e04a9c8-5a88-1ebd-4d24-579afb07fbcf@mind.be>
Date: Sat, 23 Apr 2022 17:27:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Heiko Thiery <heiko.thiery@gmail.com>, Fabio Estevam <festevam@gmail.com>
References: <20220421215611.1362150-1-festevam@gmail.com>
 <CAEyMn7b3NObc3KLLGAJtrSnG2iThYQMj2voNFQEQK5mbgjmDbg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAEyMn7b3NObc3KLLGAJtrSnG2iThYQMj2voNFQEQK5mbgjmDbg@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: Bump
 U-Boot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: frieder.schrempf@kontron.de, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Heiko,

On 22/04/2022 08:02, Heiko Thiery wrote:
> Hi Fabio,
> 
> Am Do., 21. Apr. 2022 um 23:56 Uhr schrieb Fabio Estevam <festevam@gmail.com>:
>>
>> Bump U-Boot to version 2022.04 and remove the two patches
>> that have already been upstreamed.
>>
>> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> 
> Thanks for doing this.
> 
> Acked-By: Heiko Thiery <heiko.thiery@gmail.com>

  Did you also test it? We don't really want to change board configs in 
non-trivial ways without testing that they still boot.

  Regards,
  Arnout

> 
>> ---
>> Hi Heiko,
>>
>> This is not tested.
>>
>> Did it by inspection.
>>
>>   ...m-kontron-n801x-s-convert-options-to.patch |  31 --
>>   ...m-kontron-n801x-s-add-common-board-u.patch | 305 ------------------
>>   configs/kontron_bl_imx8mm_defconfig           |   4 +-
>>   3 files changed, 1 insertion(+), 339 deletions(-)
>>   delete mode 100644 board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch
>>   delete mode 100644 board/kontron/bl-imx8mm/patches/uboot/0002-imx-imx8mm-imx8mm-kontron-n801x-s-add-common-board-u.patch
>>
>> diff --git a/board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch b/board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch
>> deleted file mode 100644
>> index 6d76282defb2..000000000000
>> --- a/board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -From 95a311af81cd47c44d3d6e3f717f06a06d8f3dfd Mon Sep 17 00:00:00 2001
>> -From: Heiko Thiery <heiko.thiery@gmail.com>
>> -Date: Mon, 10 Jan 2022 14:13:02 +0100
>> -Subject: [PATCH 1/2] imx: imx8mm: imx8mm-kontron-n801x-s: convert options to Kconfig
>> -
>> -CONFIG_SPL_MMC and CONFIG_SPL_SERIAL
>> -
>> -Patch submitted upstream:
>> -https://patchwork.ozlabs.org/project/uboot/patch/20220112085755.7396-1-heiko.thiery@gmail.com/
>> -
>> -Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>> ----
>> - configs/kontron-sl-mx8mm_defconfig | 2 ++
>> - 1 file changed, 2 insertions(+)
>> -
>> -diff --git a/configs/kontron-sl-mx8mm_defconfig b/configs/kontron-sl-mx8mm_defconfig
>> -index 35d12fca32..940bf07a92 100644
>> ---- a/configs/kontron-sl-mx8mm_defconfig
>> -+++ b/configs/kontron-sl-mx8mm_defconfig
>> -@@ -15,6 +15,8 @@ CONFIG_SPL_DM_SPI=y
>> - CONFIG_DEFAULT_DEVICE_TREE="imx8mm-kontron-n801x-s"
>> - CONFIG_SPL_TEXT_BASE=0x7E1000
>> - CONFIG_TARGET_KONTRON_MX8MM=y
>> -+CONFIG_SPL_MMC=y
>> -+CONFIG_SPL_SERIAL=y
>> - CONFIG_BOOTCOUNT_BOOTLIMIT=3
>> - CONFIG_SPL=y
>> - CONFIG_DISTRO_DEFAULTS=y
>> ---
>> -2.30.2
>> -
>> diff --git a/board/kontron/bl-imx8mm/patches/uboot/0002-imx-imx8mm-imx8mm-kontron-n801x-s-add-common-board-u.patch b/board/kontron/bl-imx8mm/patches/uboot/0002-imx-imx8mm-imx8mm-kontron-n801x-s-add-common-board-u.patch
>> deleted file mode 100644
>> index a88d7aba870b..000000000000
>> --- a/board/kontron/bl-imx8mm/patches/uboot/0002-imx-imx8mm-imx8mm-kontron-n801x-s-add-common-board-u.patch
>> +++ /dev/null
>> @@ -1,305 +0,0 @@
>> -From ef694c19c074333fd16589ec6ffef3e7ca895186 Mon Sep 17 00:00:00 2001
>> -From: Heiko Thiery <heiko.thiery@gmail.com>
>> -Date: Wed, 12 Jan 2022 08:44:36 +0100
>> -Subject: [PATCH 2/2] imx: imx8mm: imx8mm-kontron-n801x-s: add common board
>> - u-boot.dtsi
>> -
>> -When using a board variant that selects the lvds specific dtb the
>> -*.u-boot.dtsi file will not be included. To have a lvds dtb specific
>> -u-boot.dtsi file move this part to a common board u-boot.dtsi file and
>> -include this in the board base u-boot.dtsi and create an additional one
>> -for the lvds variant.
>> -
>> -Patch submitted upstream:
>> -https://patchwork.ozlabs.org/project/uboot/patch/20220112085755.7396-2-heiko.thiery@gmail.com/
>> -
>> -Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>> ----
>> - .../imx8mm-kontron-n801x-s-lvds-u-boot.dtsi   |   6 +
>> - .../dts/imx8mm-kontron-n801x-s-u-boot.dtsi    | 124 +----------------
>> - arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi | 128 ++++++++++++++++++
>> - 3 files changed, 135 insertions(+), 123 deletions(-)
>> - create mode 100644 arch/arm/dts/imx8mm-kontron-n801x-s-lvds-u-boot.dtsi
>> - create mode 100644 arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi
>> -
>> -diff --git a/arch/arm/dts/imx8mm-kontron-n801x-s-lvds-u-boot.dtsi b/arch/arm/dts/imx8mm-kontron-n801x-s-lvds-u-boot.dtsi
>> -new file mode 100644
>> -index 0000000000..4bf75722bf
>> ---- /dev/null
>> -+++ b/arch/arm/dts/imx8mm-kontron-n801x-s-lvds-u-boot.dtsi
>> -@@ -0,0 +1,6 @@
>> -+// SPDX-License-Identifier: GPL-2.0+
>> -+/*
>> -+ * Copyright (C) 2019 Kontron Electronics GmbH
>> -+ */
>> -+
>> -+#include "imx8mm-kontron-n801x-u-boot.dtsi"
>> -diff --git a/arch/arm/dts/imx8mm-kontron-n801x-s-u-boot.dtsi b/arch/arm/dts/imx8mm-kontron-n801x-s-u-boot.dtsi
>> -index 22d18e6f1c..4bf75722bf 100644
>> ---- a/arch/arm/dts/imx8mm-kontron-n801x-s-u-boot.dtsi
>> -+++ b/arch/arm/dts/imx8mm-kontron-n801x-s-u-boot.dtsi
>> -@@ -3,126 +3,4 @@
>> -  * Copyright (C) 2019 Kontron Electronics GmbH
>> -  */
>> -
>> --#include "imx8mm-u-boot.dtsi"
>> --
>> --/ {
>> --      aliases {
>> --              usb0 = &usbotg1;
>> --              usb1 = &usbotg2;
>> --      };
>> --
>> --      wdt-reboot {
>> --              compatible = "wdt-reboot";
>> --              wdt = <&wdog1>;
>> --              u-boot,dm-spl;
>> --      };
>> --
>> --      firmware {
>> --              optee {
>> --                      compatible = "linaro,optee-tz";
>> --                      method = "smc";
>> --              };
>> --      };
>> --};
>> --
>> --&fec1 {
>> --      phy-mode = "rgmii-rxid";
>> --};
>> --
>> --&i2c1 {
>> --      u-boot,dm-spl;
>> --      u-boot,dm-pre-reloc;
>> --};
>> --
>> --&i2c2 {
>> --      status = "okay";
>> --      u-boot,dm-spl;
>> --      u-boot,dm-pre-reloc;
>> --};
>> --
>> --&pinctrl_ecspi1 {
>> --      u-boot,dm-spl;
>> --};
>> --
>> --&pinctrl_i2c1 {
>> --      u-boot,dm-spl;
>> --};
>> --
>> --&pinctrl_pmic {
>> --      u-boot,dm-spl;
>> --      fsl,pins = <
>> --              MX8MM_IOMUXC_GPIO1_IO00_GPIO1_IO0               0x141
>> --              /* Disable Pullup for SD_VSEL */
>> --              MX8MM_IOMUXC_GPIO1_IO04_GPIO1_IO4               0x41
>> --      >;
>> --};
>> --
>> --&pinctrl_uart3 {
>> --      u-boot,dm-spl;
>> --      u-boot,dm-pre-reloc;
>> --};
>> --
>> --&pinctrl_usdhc1 {
>> --      u-boot,dm-spl;
>> --};
>> --
>> --&pinctrl_usdhc1_100mhz {
>> --      u-boot,dm-spl;
>> --};
>> --
>> --&pinctrl_usdhc1_200mhz {
>> --      u-boot,dm-spl;
>> --};
>> --
>> --&pinctrl_usdhc2 {
>> --      u-boot,dm-spl;
>> --};
>> --
>> --&pca9450 {
>> --      u-boot,dm-spl;
>> --};
>> --
>> --&{/soc@0/bus@30800000/i2c@30a20000/pmic@25/regulators} {
>> --      u-boot,dm-spl;
>> --};
>> --
>> --&ecspi1 {
>> --      u-boot,dm-spl;
>> --};
>> --
>> --&gpio1 {
>> --      u-boot,dm-spl;
>> --};
>> --
>> --&gpio2 {
>> --      u-boot,dm-spl;
>> --};
>> --
>> --&gpio3 {
>> --      u-boot,dm-spl;
>> --};
>> --
>> --&gpio4 {
>> --      u-boot,dm-spl;
>> --};
>> --
>> --&gpio5 {
>> --      u-boot,dm-spl;
>> --};
>> --
>> --&uart3 {
>> --      u-boot,dm-spl;
>> --      u-boot,dm-pre-reloc;
>> --};
>> --
>> --&usdhc1 {
>> --      u-boot,dm-spl;
>> --};
>> --
>> --&usdhc2 {
>> --      u-boot,dm-spl;
>> --};
>> --
>> --&wdog1 {
>> --      u-boot,dm-spl;
>> --};
>> -+#include "imx8mm-kontron-n801x-u-boot.dtsi"
>> -diff --git a/arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi b/arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi
>> -new file mode 100644
>> -index 0000000000..22d18e6f1c
>> ---- /dev/null
>> -+++ b/arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi
>> -@@ -0,0 +1,128 @@
>> -+// SPDX-License-Identifier: GPL-2.0+
>> -+/*
>> -+ * Copyright (C) 2019 Kontron Electronics GmbH
>> -+ */
>> -+
>> -+#include "imx8mm-u-boot.dtsi"
>> -+
>> -+/ {
>> -+      aliases {
>> -+              usb0 = &usbotg1;
>> -+              usb1 = &usbotg2;
>> -+      };
>> -+
>> -+      wdt-reboot {
>> -+              compatible = "wdt-reboot";
>> -+              wdt = <&wdog1>;
>> -+              u-boot,dm-spl;
>> -+      };
>> -+
>> -+      firmware {
>> -+              optee {
>> -+                      compatible = "linaro,optee-tz";
>> -+                      method = "smc";
>> -+              };
>> -+      };
>> -+};
>> -+
>> -+&fec1 {
>> -+      phy-mode = "rgmii-rxid";
>> -+};
>> -+
>> -+&i2c1 {
>> -+      u-boot,dm-spl;
>> -+      u-boot,dm-pre-reloc;
>> -+};
>> -+
>> -+&i2c2 {
>> -+      status = "okay";
>> -+      u-boot,dm-spl;
>> -+      u-boot,dm-pre-reloc;
>> -+};
>> -+
>> -+&pinctrl_ecspi1 {
>> -+      u-boot,dm-spl;
>> -+};
>> -+
>> -+&pinctrl_i2c1 {
>> -+      u-boot,dm-spl;
>> -+};
>> -+
>> -+&pinctrl_pmic {
>> -+      u-boot,dm-spl;
>> -+      fsl,pins = <
>> -+              MX8MM_IOMUXC_GPIO1_IO00_GPIO1_IO0               0x141
>> -+              /* Disable Pullup for SD_VSEL */
>> -+              MX8MM_IOMUXC_GPIO1_IO04_GPIO1_IO4               0x41
>> -+      >;
>> -+};
>> -+
>> -+&pinctrl_uart3 {
>> -+      u-boot,dm-spl;
>> -+      u-boot,dm-pre-reloc;
>> -+};
>> -+
>> -+&pinctrl_usdhc1 {
>> -+      u-boot,dm-spl;
>> -+};
>> -+
>> -+&pinctrl_usdhc1_100mhz {
>> -+      u-boot,dm-spl;
>> -+};
>> -+
>> -+&pinctrl_usdhc1_200mhz {
>> -+      u-boot,dm-spl;
>> -+};
>> -+
>> -+&pinctrl_usdhc2 {
>> -+      u-boot,dm-spl;
>> -+};
>> -+
>> -+&pca9450 {
>> -+      u-boot,dm-spl;
>> -+};
>> -+
>> -+&{/soc@0/bus@30800000/i2c@30a20000/pmic@25/regulators} {
>> -+      u-boot,dm-spl;
>> -+};
>> -+
>> -+&ecspi1 {
>> -+      u-boot,dm-spl;
>> -+};
>> -+
>> -+&gpio1 {
>> -+      u-boot,dm-spl;
>> -+};
>> -+
>> -+&gpio2 {
>> -+      u-boot,dm-spl;
>> -+};
>> -+
>> -+&gpio3 {
>> -+      u-boot,dm-spl;
>> -+};
>> -+
>> -+&gpio4 {
>> -+      u-boot,dm-spl;
>> -+};
>> -+
>> -+&gpio5 {
>> -+      u-boot,dm-spl;
>> -+};
>> -+
>> -+&uart3 {
>> -+      u-boot,dm-spl;
>> -+      u-boot,dm-pre-reloc;
>> -+};
>> -+
>> -+&usdhc1 {
>> -+      u-boot,dm-spl;
>> -+};
>> -+
>> -+&usdhc2 {
>> -+      u-boot,dm-spl;
>> -+};
>> -+
>> -+&wdog1 {
>> -+      u-boot,dm-spl;
>> -+};
>> ---
>> -2.30.2
>> -
>> diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
>> index 2b7e121e252e..705222df2833 100644
>> --- a/configs/kontron_bl_imx8mm_defconfig
>> +++ b/configs/kontron_bl_imx8mm_defconfig
>> @@ -3,8 +3,6 @@ BR2_aarch64=y
>>   BR2_cortex_a53=y
>>   BR2_ARM_FPU_VFPV3=y
>>
>> -BR2_GLOBAL_PATCH_DIR="board/kontron/bl-imx8mm/patches"
>> -
>>   # System
>>   BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
>>
>> @@ -40,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30880
>>   BR2_TARGET_UBOOT=y
>>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
>> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
>>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron-sl-mx8mm"
>>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>>   BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>> --
>> 2.25.1
>>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
