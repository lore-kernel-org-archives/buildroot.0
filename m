Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9556ECA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 15:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E0B3408C5;
	Mon,  2 Sep 2024 15:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMaIKeTXI8Cv; Mon,  2 Sep 2024 15:32:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2FFA405A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2FFA405A9;
	Mon,  2 Sep 2024 15:32:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D03111BF292
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBDA3405A9
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U5otRvLJ38rk for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 15:32:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EAC434000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAC434000B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAC434000B
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 15:32:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 920CD13FA34;
 Mon,  2 Sep 2024 17:32:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:32:41 +0200
Date: Mon, 2 Sep 2024 17:32:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZtXambp2sr75g3Zl@landeda>
References: <20240902094405.506338-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240902094405.506338-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725291163;
 bh=S01W17qOcNNElWOqUJ/WIKyR69Eea2o2JnPOcSZGL9M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=onExmtWYRDR1ksIBYJO8cC/H9cdl9r79lonIhYmlOLKXuVJpLPLMwz3GsM2Ihjjgx
 DcALSzUvfeghClwgxLAyGMPL/ples+hZFmjolBnl272Ln42wUDAPwQDkvwKLueh8u7
 05tY94m6IM2VPNzTOP6iYCBNWUR0A7AmrDD83dpMwpB9p1pr5RfeTqZ3TRs+OI8Uq8
 sVEWVnTI3+wX+wUCewqxlSHTpqX3Np1DJudMS6yMyl+aaooOdW7E2JUIoZbBg6Bj7f
 zZtkYs36dVrySzAUqZcLyoaZqUsP6499MUNbh5E+sS0YYQc8jOtrgxMhCrsOgifblk
 OEvRWbKUvUfrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=onExmtWY
Subject: Re: [Buildroot] [PATCH] configs/pandaboard_defconfig: drop defconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-09-02 11:44 +0200, Peter Korsgaard spake thusly:
> The defconfig has failed to build since May with the change to GCC 13.x,
> E.G.:
> 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597768
> 
> I no longer have access to a pandaboard.  Pandaboard/omap4 support has
> recently been dropped from u-boot:
> https://lists.denx.de/pipermail/u-boot/2024-July/558846.html
> 
> And (part of) the kernel support is also getting removed:
> https://patchwork.kernel.org/project/linux-media/patch/815a789d-85a5-44a1-8b9c-429ac0101e3f@xs4all.nl/
> 
> So drop the defconfig here as well.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore           |  1 -
>  DEVELOPERS                    |  2 --
>  board/pandaboard/genimage.cfg | 27 --------------------
>  board/pandaboard/readme.txt   | 46 ---------------------------------
>  configs/pandaboard_defconfig  | 48 -----------------------------------
>  5 files changed, 124 deletions(-)
>  delete mode 100644 board/pandaboard/genimage.cfg
>  delete mode 100644 board/pandaboard/readme.txt
>  delete mode 100644 configs/pandaboard_defconfig
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 4cfc202153..96358d0d6c 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -221,7 +221,6 @@ configs/orangepi_zero3_defconfig lib_defconfig.ForceCheckHash
>  configs/orangepi_zero_defconfig lib_defconfig.ForceCheckHash
>  configs/orangepi_zero_plus2_defconfig lib_defconfig.ForceCheckHash
>  configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
> -configs/pandaboard_defconfig lib_defconfig.ForceCheckHash
>  configs/pc_x86_64_bios_defconfig lib_defconfig.ForceCheckHash
>  configs/pc_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
>  configs/pcengines_apu2_defconfig lib_defconfig.ForceCheckHash
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 0b590f0ec2..59f3b03202 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2553,7 +2553,6 @@ F:	board/librecomputer/lafrite/
>  F:	board/nexbox/a95x/
>  F:	board/openblocks/a6/
>  F:	board/orangepi/
> -F:	board/pandaboard/
>  F:	board/roseapplepi/
>  F:	board/visionfive/
>  F:	boot/shim/
> @@ -2566,7 +2565,6 @@ F:	configs/nezha_defconfig
>  F:	configs/openblocks_a6_defconfig
>  F:	configs/orangepi_pc_defconfig
>  F:	configs/orangepi_r1_defconfig
> -F:	configs/pandaboard_defconfig
>  F:	configs/roseapplepi_defconfig
>  F:	configs/sheevaplug_defconfig
>  F:	configs/visionfive_defconfig
> diff --git a/board/pandaboard/genimage.cfg b/board/pandaboard/genimage.cfg
> deleted file mode 100644
> index dfe388227e..0000000000
> --- a/board/pandaboard/genimage.cfg
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -image boot.vfat {
> -	vfat {
> -		files = {
> -			"MLO",
> -			"u-boot.img"
> -		}
> -	}
> -
> -	size = 8M
> -}
> -
> -image sdcard.img {
> -	hdimage {
> -	}
> -
> -	partition boot {
> -		partition-type = 0xC
> -		bootable = "true"
> -		image = "boot.vfat"
> -	}
> -
> -	partition rootfs {
> -		partition-type = 0x83
> -		image = "rootfs.ext4"
> -		size = 512M
> -	}
> -}
> diff --git a/board/pandaboard/readme.txt b/board/pandaboard/readme.txt
> deleted file mode 100644
> index 80a20c2743..0000000000
> --- a/board/pandaboard/readme.txt
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -Pandaboard
> -==========
> -
> -This file documents the Buildroot support for the Pandaboard, a
> -low-power, low-cost single-board computer development platform based
> -on the Texas Instruments OMAP4 system on a chip (SoC).
> -
> -Configuring and building Buildroot
> -----------------------------------
> -
> -Start from the defconfig:
> -
> -  $ make pandaboard_defconfig
> -
> -You can edit build options the usual way:
> -
> -  $ make menuconfig
> -
> -When you are happy with the setup, run:
> -
> -  $ make
> -
> -The result of the build with the default settings should be these files:
> -
> -  output/images
> -  +-- MLO
> -  +-- omap4-panda-a4.dtb
> -  +-- omap4-panda.dtb
> -  +-- omap4-panda-es.dtb
> -  +-- rootfs.ext4
> -  +-- sdcard.img
> -  +-- u-boot.img
> -  +-- zImage
> -
> -How to write the SD card
> -------------------------
> -
> -Once the build process is finished you will have an image called "sdcard.img"
> -in the output/images/ directory.
> -
> -Copy the bootable "sdcard.img" onto an SD card with "dd":
> -
> -  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
> -
> -Where /dev/sdX is the device node of your SD card (may be /dev/mmcblkX
> -instead depending on setup).
> diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
> deleted file mode 100644
> index 376ecfe504..0000000000
> --- a/configs/pandaboard_defconfig
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -# Architecture
> -BR2_arm=y
> -BR2_cortex_a9=y
> -BR2_ARM_ENABLE_NEON=y
> -BR2_ARM_ENABLE_VFP=y
> -BR2_ARM_FPU_VFPV3=y
> -
> -# Linux headers same as kernel, a 5.12 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
> -
> -# System
> -BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> -BR2_TARGET_GENERIC_GETTY_PORT="ttyS2"
> -BR2_SYSTEM_DHCP="eth0"
> -
> -# Image
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pandaboard/genimage.cfg"
> -
> -# Kernel
> -BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
> -BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
> -BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap4-panda-es omap4-panda omap4-panda-a4"
> -BR2_LINUX_KERNEL_INSTALL_TARGET=y
> -BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> -
> -# Filesystem
> -BR2_TARGET_ROOTFS_EXT2=y
> -BR2_TARGET_ROOTFS_EXT2_4=y
> -# BR2_TARGET_ROOTFS_TAR is not set
> -
> -# Bootloader
> -BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="omap4_panda"
> -BR2_TARGET_UBOOT_FORMAT_IMG=y
> -BR2_TARGET_UBOOT_SPL=y
> -BR2_TARGET_UBOOT_SPL_NAME="MLO"
> -
> -# Required tools to create the SD card image
> -BR2_PACKAGE_HOST_DOSFSTOOLS=y
> -BR2_PACKAGE_HOST_GENIMAGE=y
> -BR2_PACKAGE_HOST_MTOOLS=y
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
