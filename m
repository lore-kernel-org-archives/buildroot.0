Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B05C52D7D
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 08:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 569F660A69;
	Thu, 15 Aug 2024 08:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VE55ugNs7cAT; Thu, 15 Aug 2024 08:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C54E60A66
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C54E60A66;
	Thu, 15 Aug 2024 08:56:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A834A1BF2B6
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 08:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9163F40A3B
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 08:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XG6ZcDJnUoCD for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 08:56:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CCB7340485
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCB7340485
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCB7340485
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 08:56:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1FC1E0002;
 Thu, 15 Aug 2024 08:56:04 +0000 (UTC)
Date: Thu, 15 Aug 2024 10:56:03 +0200
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Message-ID: <20240815105603.1a752184@windsurf>
In-Reply-To: <20240814-master-v1-2-7834f3deddcb@gmail.com>
References: <20240814-master-v1-0-7834f3deddcb@gmail.com>
 <20240814-master-v1-2-7834f3deddcb@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723712165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bvxeKu2lg47AWey/UxcsPPPw+QcNriCX1N/2z7DVlQk=;
 b=W+cFieiOOKYhkWFqAXXpxuG17Nr7dPV3mJmZiX+HRVyPrrTk5X6WpKxMSkNAxS3K72o6Gy
 UbDqL7b6G4pvQ4jDWowM0wAkLEs9pkF3586RQ7eUEuH/U1F+OxuuSYOBnHl5vKWXhJ+BSn
 FbmTy1WYyfPB/JerN/fnn4WE3XKTMkW5n7YwuUPZZT+F5FDJoIMvJryBIQ+Yn+mcteKRou
 tXLsM5r6zxrTGhGcEBsi6sM/4dAvbr73UpbZhNa9ABbHYCtLsGavJ/eUcoe/o6RRcWSbSL
 E2Vm6CjpllEwi/QFiydwV/C/oEUmUgCqngVoBnF6GpIlOUcqf1hEgUOmZAljIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W+cFieiO
Subject: Re: [Buildroot] [PATCH RESEND 2/2] configs/stm32mp135f-dk: new
 defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Raphael,

On Wed, 14 Aug 2024 20:37:03 +0200
Raphael Gallais-Pou <rgallaispou@gmail.com> wrote:

> Add new defconfig for STMicroelectronics board STM32MP135F-DK.
> 
> STM32MP135F-DK features can be found here:
>   https://www.st.com/en/evaluation-tools/stm32mp135f-dk.html
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Thanks for the resend, but there was no need to resend: your previous
patch was still in our queue of patches to review/merge. I have a
number of comments below.

> ---
>  .../overlay/boot/extlinux/extlinux.conf            |  4 ++
>  board/stmicroelectronics/stm32mp135f-dk/readme.txt | 38 ++++++++++++++
>  configs/stm32mp135f_dk_defconfig                   | 59 ++++++++++++++++++++++
>  3 files changed, 101 insertions(+)

First of all, you need to enable BR2_DOWNLOAD_FORCE_CHECK_HASHES=y,
which requires adding:

BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp135f-dk/patches/"

and then run ./utils/add-custom-hashes, which will automatically
populate this folder.


> diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
> new file mode 100644
> index 0000000000..cc01a2bd40
> --- /dev/null
> +++ b/configs/stm32mp135f_dk_defconfig
> @@ -0,0 +1,59 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a7=y
> +
> +# Linux headers same as kernel, a 6.9 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
> +
> +# System configuration
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp135f-dk/overlay"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9.8"
> +BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"

I see on STM32MP157, we're using some custom kernel configuration
files, with presumably a more "optimized" configuration than multi_v7.
Should we do the same here?

Or maybe we should even have a single common kernel config file for all
STM32MP1 platforms?

> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp135f-dk"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +
> +# Filesystem
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

Please group this with the Linux kernel options above, this is not
"filesystem related".

> +BR2_PACKAGE_OPTEE_CLIENT=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +
> +# Bootloaders
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 DTB_FILE_NAME=stm32mp135f-dk.dtb E=0 BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
> +BR2_TARGET_OPTEE_OS=y

Please use the "custom" version mechanism to specify the exact version
of OP-TEE to be used, like you did for TF-A, Linux and U-Boot.

> +BR2_TARGET_OPTEE_OS_PLATFORM="stm32mp1"
> +BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="135F_DK"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp13"
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin u-boot.dtb"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp135f-dk"
> +
> +# Additional tools
> +BR2_PACKAGE_HOST_BMAP_TOOLS=y

Please drop, we don't enable bmap-tools in our defconfigs, we leave
that choice up to the user.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
