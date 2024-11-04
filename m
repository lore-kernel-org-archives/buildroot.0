Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E845D1CA04
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 22:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04B48607AD;
	Mon,  4 Nov 2024 22:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9qeGW5hOe7Q; Mon,  4 Nov 2024 22:12:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A510A607A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A510A607A1;
	Mon,  4 Nov 2024 22:12:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A56C0B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93908403CA
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nn4CT4q6rv00 for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 22:12:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0396403C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0396403C4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0396403C4
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:12:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 58E955FFAA;
 Mon,  4 Nov 2024 23:12:08 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60036])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 04 Nov 2024 23:12:08 +0100
MIME-Version: 1.0
Date: Mon, 04 Nov 2024 23:12:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: Roberto Medina <robertoxmed@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241025093248.2015508-2-robertoxmed@gmail.com>
References: <20241025093248.2015508-1-robertoxmed@gmail.com>
 <20241025093248.2015508-2-robertoxmed@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <731b15883d2b251dcf59924f7541fc69@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730758329;
 bh=NdFGb3O9//cRiMyl1TKyTQjGubq3/JoWi02D3CK5ISQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C+yJDel7rDRUCmLp8Xo5RycKhPhsnP3OhLrFa5uDztq6dCFn2FJzaEm0BlTWHbvG2
 OoH7fqVRpSPfCRIAVwPK1I7TySGID2UW6h6Ig8VS1MfX4NNsCEzIgtjuQQnUI5iPak
 VlnzSKd3ubmWYm2PChbSxymB8BwBkjKBly+BUvtZmY8N2i2kI4M9ri8IOS+M5GaL2S
 S1rDIavZeAPVPWGTx5i/9bYepEYqfY/XFeZXv/qvHPvusdv+KtGVcESK+l2pD0uEQb
 wWdPXfQ+KhCLDLIUsUoa/EbuvEr7rMpEg3bdiTqRbSqwB74nb1XV8uxlFsoRACkbn5
 AcJokKvUCCZ5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=C+yJDel7
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/roc_pc_rk3399: Bump Linux,
 U-Boot, TF-A
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

Hi Roberto,

Thanks for the update.

On 25/10/2024 11:32, Roberto Medina wrote:
> - Bump Linux to 6.6.56 (LTS).
> - Bump U-Boot to 2024.07, so it contains commit ebb0ad4eef0a ("arch: 
> arm:
> mach-rockchip: Kconfig: Enable BOOTSTD_FULL for RK3399 and RK3588").
> - Bump TF-A to 2.11.
> - Enable hash checking: BR2_DOWNLOAD_FORCE_CHECK_HASHES.
> - Add relevant hashes in the patches folder for the board.
> - Use uClibc for toolchain instead of Glibc.
> 
> Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
> ---
>  .../arm-trusted-firmware/arm-trusted-firmware.hash    |  2 ++
>  .../patches/linux-headers/linux-headers.hash          |  1 +
>  board/firefly/roc-rk3399-pc/patches/linux/linux.hash  |  2 ++
>  board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash  |  2 ++
>  configs/roc_pc_rk3399_defconfig                       | 11 +++++++----
>  5 files changed, 14 insertions(+), 4 deletions(-)
>  create mode 100644 
> board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
>  create mode 120000 
> board/firefly/roc-rk3399-pc/patches/linux-headers/linux-headers.hash
>  create mode 100644 
> board/firefly/roc-rk3399-pc/patches/linux/linux.hash
>  create mode 100644 
> board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash
> 
> diff --git 
> a/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash 
> b/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> new file mode 100644
> index 0000000000..8b77e1f165
> --- /dev/null
> +++ 
> b/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  
> c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  
> arm-trusted-firmware-v2.11-git4.tar.gz
> diff --git 
> a/board/firefly/roc-rk3399-pc/patches/linux-headers/linux-headers.hash 
> b/board/firefly/roc-rk3399-pc/patches/linux-headers/linux-headers.hash
> new file mode 120000
> index 0000000000..5808d92afe
> --- /dev/null
> +++ 
> b/board/firefly/roc-rk3399-pc/patches/linux-headers/linux-headers.hash
> @@ -0,0 +1 @@
> +../linux/linux.hash
> \ No newline at end of file
> diff --git a/board/firefly/roc-rk3399-pc/patches/linux/linux.hash 
> b/board/firefly/roc-rk3399-pc/patches/linux/linux.hash
> new file mode 100644
> index 0000000000..98edd13a58
> --- /dev/null
> +++ b/board/firefly/roc-rk3399-pc/patches/linux/linux.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  
> f74812f78e88992c416434cb107639e13a551dbaff36bb90d6346ab16ab71a95  
> linux-6.6.56.tar.xz
> diff --git a/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash 
> b/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash
> new file mode 100644
> index 0000000000..fe9b4f53dc
> --- /dev/null
> +++ b/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  
> f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  
> u-boot-2024.07.tar.bz2
> diff --git a/configs/roc_pc_rk3399_defconfig 
> b/configs/roc_pc_rk3399_defconfig
> index 1323752683..920354ba81 100644
> --- a/configs/roc_pc_rk3399_defconfig
> +++ b/configs/roc_pc_rk3399_defconfig
> @@ -1,6 +1,9 @@
>  BR2_aarch64=y
>  BR2_cortex_a72_a53=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y

Buildroot board defconfigs should have limited customization.

Is there a specific reason (other than having a smaller footprint) for
which you switched to UCLIBC?

If not, could you please send an updated version without it?

Apart from that, the rest of the patch looks fine.

> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +BR2_GLOBAL_PATCH_DIR="board/firefly/roc-rk3399-pc/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_TARGET_GENERIC_HOSTNAME="roc-rk3399-pc"
>  BR2_TARGET_GENERIC_ISSUE="Welcome to ROC-RK3399-PC!"
>  
> BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/roc-rk3399-pc/post-build.sh"
> @@ -8,7 +11,7 @@ 
> BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c 
> board/firefly/roc-rk3399-pc/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.61"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.56"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-roc-pc"
> @@ -21,14 +24,14 @@ BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O 64bit"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
>  
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.9"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.11"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="roc-pc-rk3399"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> --
> 2.47.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
