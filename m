Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C463C4332F
	for <buildroot@archiver.kernel.org>; Thu, 15 Dec 2022 02:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80F8260672;
	Thu, 15 Dec 2022 02:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80F8260672
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j229d2M3E8C3; Thu, 15 Dec 2022 02:35:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 765A960760;
	Thu, 15 Dec 2022 02:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 765A960760
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 83C901BF39F
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 02:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AD9C40233
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 02:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AD9C40233
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UcxPpB-32zIB for <buildroot@lists.busybox.net>;
 Thu, 15 Dec 2022 02:35:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B228E402B9
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B228E402B9
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 02:35:07 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id fu10so4232720qtb.0
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 18:35:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mz1FarVYKDKk2uMnZb4wqrtmaBQim77vrJZHyHE7rTk=;
 b=E+3jR/0ZXeGZDRZ/FAqPcSeWdOWQmQi7ts15+4rEV5gWSJln/dsRCsKWZ77tA6sPvc
 TySikkmS2ldmxrwa13PbxW1kW2SKUjVfcAmrr5StgVfalBwmF2llRJudqg0L78Me43ZS
 R984DPQkv8MtH4KTqatOi3T/T3fnnWuEFczgg/jpI/m1fvxWdpGRsb/7Die9x8GuDoLo
 oYkHJV8QBMM5gl8EF4QmyPuhIbD6YqncmPbaZx2kpL2tVqRWb9h5OKK0A7qJWJtijZ2V
 79JzaL9ONqPt0MxZVqSv66Z27xW6Z+Ui2zFDiA/tC2/H6oHJkedIQKcdaIOGM/HYnpn4
 W/6g==
X-Gm-Message-State: ANoB5pnQcwvzNzBFGoTq+w3TwOhRA9L4q0LzKn0yvhXVqkPXRIG1BksA
 UsN4u47iOI3iqjHGrgC6iNR9t777pKM=
X-Google-Smtp-Source: AA0mqf6ChSccm4gjUl3W4uS12uF13Isrs2uCsNYG/KxymKsi1ziKKrRan9Eyr988PPKjPYlgYbMgMw==
X-Received: by 2002:ac8:464d:0:b0:3a7:f91d:917c with SMTP id
 f13-20020ac8464d000000b003a7f91d917cmr40255141qto.31.1671071706246; 
 Wed, 14 Dec 2022 18:35:06 -0800 (PST)
Received: from [10.4.10.38] (pool-108-26-182-112.bstnma.fios.verizon.net.
 [108.26.182.112]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac80608000000b003a50ef44a77sm2685507qth.28.2022.12.14.18.35.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 18:35:05 -0800 (PST)
Message-ID: <190765dc-41c9-7bdd-6930-147db9ab9b2f@gmail.com>
Date: Wed, 14 Dec 2022 21:35:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20221214233649.3928722-1-Mr.Bossman075@gmail.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <20221214233649.3928722-1-Mr.Bossman075@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mz1FarVYKDKk2uMnZb4wqrtmaBQim77vrJZHyHE7rTk=;
 b=V9hlRNVcORfPxPx4Tp0j1HrGUhLEcpTbh8QRQU3wayMTiATsVYyZ/39z2i6BHD/jNL
 l9sG0N/A9ekGwqQOxc2Yfk822/LV0VFM/YVQjvwjHcSOhOCZc6zoqA6c0obdUlEUjBgQ
 gJ10PL63OdhkGAAg7TNCFw5HM3xSXR88p8pln4o7fGEyxXRWRfKicd/iNNmtllDzqg4q
 1ykLyNGTLwJMWBSthz0Un32zV0S1ARSZHyKSIhzrhb+HTCSb/GE1D2mdTGVO449zSD/c
 GHGBPzwCI5qQUVQ+RuIcIPnmhIFUbSzh8JUVs3v3uVuog7V7njVlfpI9lX8Zn+I2buBg
 hRGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=V9hlRNVc
Subject: Re: [Buildroot] [PATCH v4] configs/imxrt1050-evk: New defconfig
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
Cc: maeva.manuel@oss.nxp.com, James Autry <jautry@tekvox.com>,
 festevam@gmail.com, Giulio Benetti <giulio.benetti@benettiengineering.com>,
 stephane.viau@oss.nxp.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/14/22 18:36, Jesse Taube wrote:
> Add defconfig for imxrt1050-evk is a development board from NXP.
> 
> Giulio and I worked on Linux and U-boot for this board. And now I'm
> adding support for the new board in Buildroot.
> 
> The i.MXRTxxxx family spreads from i.MXRT1020 to i.MXRT1170 with the
> first one supporting 1 USB OTG & 100M ethernet with a cortex-M7@500Mhz
> up to the latter with i.MXRT1170 with cortex-M7@1Ghz and
> cortex-M4@400Mhz, 2MB of internal SRAM, 2D GPU, 2x 1Gb and
> 1x 100Mb ENET. The i.MXRT family is NXP's answer to STM32F7xx, as it
> uses only simple SDRAM, it gives the chance of a 4 or less layer PCBs.
> Seeing that these chips are comparable to the STM32F7xxs which have
> buildroot ported to them it seems reasonable to add support for them.
> 
> https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/i-mx-rt1050-evaluation-kit:MIMXRT1050-EVK
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   DEVELOPERS                                  |  6 +++
>   board/freescale/imxrt1050evk/genimage.cfg   | 40 +++++++++++++++++++
>   board/freescale/imxrt1050evk/post-build.sh  |  3 ++
>   board/freescale/imxrt1050evk/readme.txt     | 30 ++++++++++++++
>   board/freescale/imxrt1050evk/uboot.fragment |  2 +
>   configs/imxrt1050-evk_defconfig             | 43 +++++++++++++++++++++
>   6 files changed, 124 insertions(+)
>   create mode 100644 board/freescale/imxrt1050evk/genimage.cfg
>   create mode 100755 board/freescale/imxrt1050evk/post-build.sh
>   create mode 100644 board/freescale/imxrt1050evk/readme.txt
>   create mode 100644 board/freescale/imxrt1050evk/uboot.fragment
>   create mode 100644 configs/imxrt1050-evk_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 59121c6a54..ee33c65fd4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1132,9 +1132,11 @@ F:	package/webp/
>   F:	package/xapian/
>   
>   N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
> +F:	board/freescale/imxrt1050evk/*
>   F:	board/olimex/a*
>   F:	configs/amarula_vyasa_rk3288_defconfig
>   F:	configs/asus_tinker_rk3288_defconfig
> +F:	configs/imxrt1050-evk_defconfig
>   F:	configs/olimex_a*
>   F:	package/at/
>   F:	package/binutils/
> @@ -1477,6 +1479,10 @@ F:	package/wmctrl/
>   F:	package/x11r7/xdriver_xf86-video-imx/
>   F:	package/x11r7/xdriver_xf86-video-imx-viv/
>   
> +N:	Jesse Taube <Mr.Bossman075@gmail.com>
> +F:	board/freescale/imxrt1050evk/*
> +F:	configs/imxrt1050-evk_defconfig
> +
>   N:	Jesse Van Gavere <jesseevg@gmail.com>
>   F:	package/qt6/qt6serialport/
>   
> diff --git a/board/freescale/imxrt1050evk/genimage.cfg b/board/freescale/imxrt1050evk/genimage.cfg
> new file mode 100644
> index 0000000000..7e1e932d37
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/genimage.cfg
> @@ -0,0 +1,40 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"uImage",
> +			"imxrt1050-evk.dtb",
> +		}
> +	}
> +
> +	size = 6M
> +}
> +
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition SPL {
> +		in-partition-table = "no"
> +		image = "SPL"
> +		offset = 1K
> +		size = 127K
> +	}
> +
> +	partition u-boot {
> +		in-partition-table = "no"
> +		image = "u-boot.img"
> +		offset = 128K
> +		size = 512K
> +	}
> +
> +	partition boot {
> +		partition-type = 0xc
> +		bootable = "true"
> +		image = "boot.vfat"
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +	}
> +}
> diff --git a/board/freescale/imxrt1050evk/post-build.sh b/board/freescale/imxrt1050evk/post-build.sh
> new file mode 100755
> index 0000000000..a13789f231
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/post-build.sh
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +MKIMAGE=$HOST_DIR/bin/mkimage
> +$MKIMAGE -A arm -O linux -T kernel -C none -a 0x80008000 -e 0x80008000 -n "Linux kernel" -d $BINARIES_DIR/Image $BINARIES_DIR/uImage
> diff --git a/board/freescale/imxrt1050evk/readme.txt b/board/freescale/imxrt1050evk/readme.txt
> new file mode 100644
> index 0000000000..1fc4edd88b
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/readme.txt
> @@ -0,0 +1,30 @@
> +NXP i.MXRT1050 EVK board
> +------------------------
> +
> +i.MX RT1050 are NXP's crossover MCUs. They combine the high performance and high
> +level of integration of an applications processors with the ease-of-use and
> +real-time functionality of a microcontroller. The i.MX RT1050 MCU runs on the Arm
> +Cortex-M7 core at 600 MHz.
> +https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/i-mx-rt1050-evaluation-kit:MIMXRT1050-EVK
> +
> +To build a minimal support for this board:
> +
> +$ make imxrt1050-evk_defconfig
> +$ make
> +
> +Buildroot prepares a bootable "sdcard.img" image in the output/images/
> +directory, ready to be flashed into the SD card:
> +
> +$ dd if=output/images/sdcard.img of=/dev/sdX
> +Where 'sdX' is the device node of the uSD.
> +
> +Jumper settings:
> +
> +   SW7: 1 0 1 0
> +
> +Where 0 means bottom position and 1 means top position (from the
> +switch label numbers reference).
> +
> +Connect the USB cable between the EVK and the PC for the console.
> +
> +Insert the micro SD card in the board, power it up and U-Boot messages should come up.
> diff --git a/board/freescale/imxrt1050evk/uboot.fragment b/board/freescale/imxrt1050evk/uboot.fragment
> new file mode 100644
> index 0000000000..1c5bb6af35
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/uboot.fragment
> @@ -0,0 +1,2 @@
> +CONFIG_USE_BOOTCOMMAND=y
> +CONFIG_BOOTCOMMAND="setenv bootargs console=ttyLP0 root=/dev/mmcblk0p2 rw earlycon rootwait;load mmc 0:1 0x80800000 imxrt1050-evk.dtb;load mmc 0:1 0x80000000 uImage;bootm 0x80000000 - 0x80800000"
> diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
> new file mode 100644
> index 0000000000..c9022649be
> --- /dev/null
> +++ b/configs/imxrt1050-evk_defconfig
> @@ -0,0 +1,43 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_m7=y
> +
> +# Image
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/imxrt1050evk/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1"
> +BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
> +BR2_LINUX_KERNEL_IMAGE_NAME="Image"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imxrt1050-evk"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="3M"
> +
> +
> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="imxrt1050-evk"
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.11"
should have been 2022.10 I don't know if the committer will
change this or not

Thanks,
Jesse Taube
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="SPL"
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +
> +# Required tools to create the SD card image
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MKPASSWD=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
