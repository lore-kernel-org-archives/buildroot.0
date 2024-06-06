Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C434C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 08:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 241EA8439A;
	Thu,  6 Jun 2024 08:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7S1sXHwBoJ4D; Thu,  6 Jun 2024 08:47:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A3D384360
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A3D384360;
	Thu,  6 Jun 2024 08:47:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 919C51BF599
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BB6B84358
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqYK0vg-CKsQ for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 08:47:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51D9A84329
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51D9A84329
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51D9A84329
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 08:47:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0B46B13F8B3;
 Thu,  6 Jun 2024 10:46:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 10:46:55 +0200
Date: Thu, 6 Jun 2024 10:46:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Neal Frager <neal.frager@amd.com>
Message-ID: <ZmF3f_vH8B4BEHyv@landeda>
References: <20240603120020.189821-1-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240603120020.189821-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717663623;
 bh=4KBuSfqZ6maFN6bsJpWrrdCW9uiIhtAK4wF8Kl+bXF0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RxoJjjk5Wu5fh/3V8vMPv1/9RGT1hGGUfnZjWVO1OwWNUteCpl30kHCOvKSkyjJAr
 QCqJBQv3ljwHrCfRtDAKaYivyS8CKV33ZJwGjQydcPz6xRqwziFQtUL3irNxK6Ft6q
 Ks5wES7a4SFYAaivZD7Z5MJToQi4xJf+TK6CJKrKjd2eKdaVTGWt1yH3Z3kuy4Db/B
 G2dZ7YCIicaG8Hs1RXLo1981GqgILWLDsQGOGulqBQPH3AInLxY5oQZIwdRhAMBqSO
 nqjur9hsykcGPCxmQz4IALNg7l7TQermqdjS0kASSHCbEXLPAWD/j4pGRIseO5Np/H
 xTXnkpOdX8M0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RxoJjjk5
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig:
 bump to xilinx-v2024.1
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neal, All,

On 2024-06-03 13:00 +0100, Neal Frager via buildroot spake thusly:
> This patch bumps the versal_vck190_defconfig to xilinx-v2024.1 which includes
> the following updates:
> 
> - Linux v6.6.10
> - U-Boot v2024.01
> - ATF v2.10
> - PLM xilinx-v2024.1
> - PSMFW xilinx-v2024.1
> 
> Removed ATF patches that were needed for ATF v2.8.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-build-add-support-for-new-binutils-versions.patch |  1 -
>  .../0002-build-tools-avoid-unnecessary-link.patch     |  1 -
>  configs/versal_vck190_defconfig                       | 11 +++++------
>  3 files changed, 5 insertions(+), 8 deletions(-)
>  delete mode 120000 board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
>  delete mode 120000 board/versal/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
> 
> diff --git a/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch b/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
> deleted file mode 120000
> index 8ad996914b..0000000000
> --- a/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../../../boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
> \ No newline at end of file
> diff --git a/board/versal/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch b/board/versal/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
> deleted file mode 120000
> index fecdee5449..0000000000
> --- a/board/versal/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../../../boot/arm-trusted-firmware/v2.8/0002-build-tools-avoid-unnecessary-link.patch
> \ No newline at end of file
> diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
> index 8561b6641a..ecfc10cc91 100644
> --- a/configs/versal_vck190_defconfig
> +++ b/configs/versal_vck190_defconfig
> @@ -1,12 +1,12 @@
>  BR2_aarch64=y
>  BR2_cortex_a72=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
> @@ -16,7 +16,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.2)/xlnx_rebase_v2.8_2023.2.tar.gz"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> @@ -24,7 +24,7 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
> @@ -33,10 +33,9 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
>  BR2_TARGET_UBOOT_FORMAT_DTB=y
>  BR2_PACKAGE_VERSAL_FIRMWARE=y
> -BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2023.2"
> +BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2024.1"
>  BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
>  BR2_PACKAGE_HOST_BOOTGEN=y
> -BR2_GLOBAL_PATCH_DIR="board/versal/patches"
> -- 
> 2.25.1
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
