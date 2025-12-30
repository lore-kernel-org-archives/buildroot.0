Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24978EE4988
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 16:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C40928080B;
	Tue, 30 Dec 2025 16:14:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PquCX2xDp-5c; Tue, 30 Dec 2025 16:14:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D598981222
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767111248;
	bh=aK5a6TewaJ3dARj70bHEYK8HZr0sVBYJbcD6XQQkkvw=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eRfHkqlbruY+MSDHulPHoO2kz5osmpNae8GFC91E73cYdcZeUsphhofuZOVm4mENI
	 /kjzjFdPRHDYZ5FUxIHqyaFsSQuleWIRfEm65o7Y0ZyI/9ycouO7t/MXcJVnISjwgV
	 dM4X32pEHbatmiusc9UFlIiMjiqVN6SkMW+lSWnH00ftx8fXX5ZbqeSqw5g4dTDJnI
	 AH+1Jmz5HrsHz8JSCSwOSknMms41MyMF/e7+Z99j4N5SMCucSY3ZzuqSNoCWX/WW4R
	 uM+poWG/iVvfMpcd0Y9cAq9qOaxb5ptBBgPRkJAp3Osmk9irj1c/Z/RFRYRA0OBemt
	 7fJAEeNYfajKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D598981222;
	Tue, 30 Dec 2025 16:14:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E659177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B7334003A
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uhmBOSn7pixA for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 16:14:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 10FF94033D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10FF94033D
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10FF94033D
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:14:05 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id acMFvTYB2P2aDacMFvOCJt; Tue, 30 Dec 2025 17:14:03 +0100
Message-ID: <0852bcdb-6a55-4275-be44-2ab7cf4474c1@benettiengineering.com>
Date: Tue, 30 Dec 2025 17:14:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nigel Wang <asd617140123@gmail.com>, buildroot@buildroot.org
Cc: thomas.petazzoni@free-electrons.com
References: <20240328074752.148829-1-asd617140123@gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240328074752.148829-1-asd617140123@gmail.com>
X-CMAE-Envelope: MS4xfIcChZ1U+GvLVMhEENot3MAAGnim4EVYmT3fnCBsFT5uTQMmHc+cpz65p1c7ab+29596h3i746DtwuNJe7RA1YiPFKIhF/bU0y6+kIOzN+uLctM+GBmD
 mggVslLi7qmqdrvhjndt0FW07zw3l6PNUmhEjh8ZZDRW6ectrOgb7N55H9d2mXBNi58DxLblN2bQui6224a9EA2UXv+aUx4bSUuBG2Z8IttE0qV1HYdlPPGs
 gcv9huxQH1PqyEamXATRy+qf+FFixUN/c62c2kmBmumEacnSeu349u5mvWhkf2Uq5sFLMQmzEC1rb4UKOj/Q8Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767111243; bh=Q/x3sNVrYrlgZgG9v+iA8G+flxOJPQBSoEbAtrtdY2s=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=iVKiCH141bqD3hatQjvQXr7QM05+aoHptLErboJxSJuzOyTyh2coxLt5iS5zuKb9N
 LmayOk0aP9T06pvwlHSK+P1aFY3lySSwS3xVq/4FpvizuuFP/gK8H9fiBLzq+7Zoyt
 /XCS0pLZybPOCRbVVcOZI7tj39CWyV1c/mDXXd5kkKVFo5XuaZ+R4n981efQfVl7T7
 bYyiSKmd6+kIdVLeS4076a/UsZj0lGFMZggS327ZCA0NojOVuBT1b8QCyihDRjAhqJ
 KCcYxo7a9YPhNHRq1iYJenGjoETd95dGm1+BWpIXTH0+89Crok5LERCh5pW96jLiln
 TPi0W+RIyW3Ug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=iVKiCH14
Subject: Re: [Buildroot] [PATCH v3 1/1] board/cubietech/cubieboard4 : Add
 config file for cubieboard4.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Nigel, All,

9 months passed and this patch is still in backlog.
I ask you if you can bump Linux and Uboot versions and send V4.
I also ask you if you're still interested in mantaining it.

I ask Maintainers: after doing so it's possible to commit this patch?

Thanks in advance
Best regards
Giulio

On 28/03/2024 08:47, Nigel Wang wrote:
> From: nigel_wang <asd617140123@gmail.com>
> 
> add Cubieboard4 board support.
> 
> - SOC: Allwinner A80.
> - DRAM: 2GiB DDR3 @ 672MHZ.
> - NAND: 8GBeMMC
> - Power: DC 5V.
> - Wifi: 80211 b/g/n. (module is AP6330)
> Reference: https://hirokun.jp/AP6330.pdf
> - Ethernet: RTL8211E
> 
> The detail of board: https://linux-sunxi.org/Cubietech_Cubieboard4
> 
> Board support package includes the following components:
> - mainline Linux Kernel 6.6.8
> - mainline U-boot 2021.10.
> 
> Signed-off-by: Nigel Wang <asd617140123@gmail.com>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> [Build Tested]
> Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> v2 -> v3
> * Added my name in DEVELOPERS.
> * Added BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y in cubieboard4_defconfig.
> v1 -> v2
> * Add BR2_cortex_a15_a7=y in buildroot defconfig.
> * Bump linux version to 6.6.8
> * Using sunxi_defconfig in kernel.
> * Using "make savedefconfig" to save defconfig.
> * Remove boot.cmd.
> ---
>   DEVELOPERS                                |  4 +++
>   board/cubietech/cubieboard4/extlinux.conf |  5 +++
>   board/cubietech/cubieboard4/genimage.cfg  | 38 +++++++++++++++++++++
>   board/cubietech/cubieboard4/post-image.sh | 18 ++++++++++
>   configs/cubieboard4_defconfig             | 41 +++++++++++++++++++++++
>   5 files changed, 106 insertions(+)
>   create mode 100644 board/cubietech/cubieboard4/extlinux.conf
>   create mode 100644 board/cubietech/cubieboard4/genimage.cfg
>   create mode 100755 board/cubietech/cubieboard4/post-image.sh
>   create mode 100644 configs/cubieboard4_defconfig
> 
> --
> 2.34.1
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 313fc16b9d..c70707c8ec 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3362,3 +3362,7 @@ F:	package/quazip/
>   F:	package/shapelib/
>   F:	package/simple-mail/
>   F:	package/tinc/
> +
> +N:	Maintainer Nigel Wang <asd617140123@gmail.com>
> +F:	board/cubietech/cubieboard4/
> +F:	configs/cubieboard4_defconfig
> diff --git a/board/cubietech/cubieboard4/extlinux.conf b/board/cubietech/cubieboard4/extlinux.conf
> new file mode 100644
> index 0000000000..a003337d36
> --- /dev/null
> +++ b/board/cubietech/cubieboard4/extlinux.conf
> @@ -0,0 +1,5 @@
> +label linux
> +    kernel /zImage
> +    devicetree /sun9i-a80-cubieboard4.dtb
> +    append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
> +
> diff --git a/board/cubietech/cubieboard4/genimage.cfg b/board/cubietech/cubieboard4/genimage.cfg
> new file mode 100644
> index 0000000000..f1dee13923
> --- /dev/null
> +++ b/board/cubietech/cubieboard4/genimage.cfg
> @@ -0,0 +1,38 @@
> +# Minimal SD card image for the Cubieboard2
> +# Based in the Orange Pi genimage.cfg
> +
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"zImage",
> +			"sun9i-a80-cubieboard4.dtb",
> +			"extlinux"
> +		}
> +	}
> +
> +	size = 8M
> +}
> +
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition u-boot {
> +		in-partition-table = "no"
> +		image = "u-boot-sunxi-with-spl.bin"
> +		offset = 8K
> +		size = 1016K # 1MB - 8KB
> +	}
> +
> +	partition boot {
> +		partition-type = 0xC
> +		bootable = "true"
> +		image = "boot.vfat"
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +		size = 512M
> +	}
> +}
> diff --git a/board/cubietech/cubieboard4/post-image.sh b/board/cubietech/cubieboard4/post-image.sh
> new file mode 100755
> index 0000000000..e37b960a4d
> --- /dev/null
> +++ b/board/cubietech/cubieboard4/post-image.sh
> @@ -0,0 +1,18 @@
> +#!/bin/sh
> +
> +BOARD_DIR="$(dirname "$0")"
> +install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
> +
> +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +rm -rf "${GENIMAGE_TMP}"
> +
> +genimage                           \
> +	--rootpath "${TARGET_DIR}"     \
> +	--tmppath "${GENIMAGE_TMP}"    \
> +	--inputpath "${BINARIES_DIR}"  \
> +	--outputpath "${BINARIES_DIR}" \
> +	--config "${GENIMAGE_CFG}"
> +
> +exit $?
> diff --git a/configs/cubieboard4_defconfig b/configs/cubieboard4_defconfig
> new file mode 100644
> index 0000000000..e3df5025c8
> --- /dev/null
> +++ b/configs/cubieboard4_defconfig
> @@ -0,0 +1,41 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a15_a7=y
> +BR2_ARM_FPU_NEON_VFPV4=y
> +
> +# System
> +BR2_TARGET_GENERIC_HOSTNAME="Cubieboard4"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard4!"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard4/post-image.sh"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.8"
> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun9i-a80-cubieboard4"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +
> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard4"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +# Linux headers same as kernel, a 6.6 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
