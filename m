Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62066D591B6
	for <buildroot@archiver.kernel.org>; Mon, 18 Nov 2024 20:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3BB940220;
	Mon, 18 Nov 2024 20:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fM-uB0_2cUp; Mon, 18 Nov 2024 20:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B05540223
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B05540223;
	Mon, 18 Nov 2024 20:55:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0DF2DB3
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 20:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBDF681329
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 20:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DuzddZC2IR9J for <buildroot@buildroot.org>;
 Mon, 18 Nov 2024 20:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69D9D81325
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69D9D81325
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69D9D81325
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 20:55:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D6FAEB0053E;
 Mon, 18 Nov 2024 21:54:58 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50208])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 18 Nov 2024 21:54:58 +0100
MIME-Version: 1.0
Date: Mon, 18 Nov 2024 21:54:58 +0100
From: Julien Olivain <ju.o@free.fr>
To: Roberto Medina <robertoxmed@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241117220500.584642-2-robertoxmed@gmail.com>
References: <20241117220500.584642-1-robertoxmed@gmail.com>
 <20241117220500.584642-2-robertoxmed@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <8ad05d9774584d398fab6e43dc1bd3ca@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731963300;
 bh=p4qiEZisghYzJUagcMX+2qu29abOBB0pZy2mT72+Fvw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WTnDzpZppKiud4n1xzkr7Fz+tLqqE7/jcN3Wn38+53ivid0IrzUmiWHdYMbo3j1k8
 TpYmF1Emxt+qX1S9ttULcHGShk53FPXWPEpd0xNX2PZCJvksntHHDJyjo8BpwTHlSC
 JnjNXpUGhEOOci96uv8Hywb1LPBDKqhrTc8Gv76WhJLr7SIL80Ehe4mgP80oYmypto
 cG4sGqv2TR15ktlu+fulXFsywsUzhnjPVk2RsB/Drg4PsSs0z1m9NADorSVIcMfc0h
 yUXSYSfsXnNKKJ+s559V9JxW0Zl/Uks40enKZnP1ryxDk/EkPKKgh3HHRaxqkDOcu2
 KgSf1c1D8b54g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WTnDzpZp
Subject: Re: [Buildroot] [PATCH v3 1/1] configs/roc_pc_rk3399: Bump Linux,
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

On 17/11/2024 23:05, Roberto Medina wrote:
> - Bump Linux to 6.6.56 (LTS).
> - Bump U-Boot to 2024.07, so it contains commit ebb0ad4eef0a ("arch: 
> arm:
> mach-rockchip: Kconfig: Enable BOOTSTD_FULL for RK3399 and RK3588").
> - Bump TF-A to 2.11.
> - Enable hash checking: BR2_DOWNLOAD_FORCE_CHECK_HASHES.
> - Add relevant hashes in the patches folder for the board.
> 
> Signed-off-by: Roberto Medina <robertoxmed@gmail.com>

Applied to next, thanks.

Side note: I updated .checkpackageignore, due to a
"make check-package" error.

Also, another comment, see below.

> ---
>  .../arm-trusted-firmware/arm-trusted-firmware.hash     |  2 ++
>  .../patches/linux-headers/linux-headers.hash           |  1 +
>  board/firefly/roc-rk3399-pc/patches/linux/linux.hash   |  2 ++
>  board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash   |  2 ++
>  configs/roc_pc_rk3399_defconfig                        | 10 ++++++----
>  5 files changed, 13 insertions(+), 4 deletions(-)
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
> index 1323752683..145e155fac 100644
> --- a/configs/roc_pc_rk3399_defconfig
> +++ b/configs/roc_pc_rk3399_defconfig
> @@ -1,6 +1,8 @@
>  BR2_aarch64=y
>  BR2_cortex_a72_a53=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +BR2_GLOBAL_PATCH_DIR="board/firefly/roc-rk3399-pc/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_TARGET_GENERIC_HOSTNAME="roc-rk3399-pc"
>  BR2_TARGET_GENERIC_ISSUE="Welcome to ROC-RK3399-PC!"
>  
> BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/roc-rk3399-pc/post-build.sh"
> @@ -8,7 +10,7 @@ 
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
> @@ -21,14 +23,14 @@ BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O 64bit"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
>  
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"

The default TF-A repo url was updated in commit:
https://gitlab.com/buildroot.org/buildroot/-/commit/e1aacc3049e03bd788fc58b9233bf5a93f2613a1

So those _CUSTOM_GIT and _CUSTOM_REPO_URL configs are no longer
needed.

> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.9"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.11"

Also this _CUSTOM_REPO_VERSION can be replaced with
_CUSTOM_VERSION=y _CUSTOM_VERSION_VALUE="...".

Could you do those change in a future update please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
