Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7090DD6C2B4
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 22:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB7EA8520F;
	Tue, 19 Nov 2024 22:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLc6fh6Bx8mL; Tue, 19 Nov 2024 22:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6928785200
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6928785200;
	Tue, 19 Nov 2024 22:32:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF206DB3
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 22:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C075E60A5D
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 22:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ebfm1A2rVt4d for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 22:32:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A6F8608EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A6F8608EF
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A6F8608EF
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 22:32:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 589D82003DD;
 Tue, 19 Nov 2024 23:32:48 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44642])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 19 Nov 2024 23:32:48 +0100
MIME-Version: 1.0
Date: Tue, 19 Nov 2024 23:32:48 +0100
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Michael Trimarchi
 <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20241119185255.487391-1-dario.binacchi@amarulasolutions.com>
References: <20241119185255.487391-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <2fb1d4f97e45eb7fbee4a818c7eff5da@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732055571;
 bh=o8t9tNJMiqYcZlIpnK/q0bqHZ3gnXhOMSY/r1Oftyd8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kaaM9JIfBs6G2A3TJVnTG1ExzLeS3yFQ0Qg5pIz7vMP7OZSuCCTwxn7iJmZ+n3/6t
 YcGkNzkLQResYAh2H4lHs+oosElq7mjh9j7vrUE36K0gb+aCLT903RdEHnjoCEgMEB
 3ZYGtGpUGOk/gpC20+YeRc2NS5h2VBi7KoOEwOGXUiVXhq9spHufS3ij0sX6C2AuV6
 7MnAaKEDloDDJ2KIXqY09sSzYdGmiqTpPZdpJ3QYUlOS4pTYR6SZwqtlrjrJxPyrAO
 wROiX5EA1r6Fktv+FumZqGQrYI0+Jbn/t6LP/Ms8zxGh+j0picbbvwsTjCaIbvzBY8
 U/ixEGqhaKAgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kaaM9JIf
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: bump
 U-Boot to 2024.10 and Linux to 6.11.8
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

Hi Dario,

On 19/11/2024 19:52, Dario Binacchi wrote:
> The patch bumps U-Boot to version 2024.10 and the Linux kernel to 
> version
> 6.11.8.
> The new version of U-Boot has added EFI Capsule support, which depends 
> on
> GnuTLS, thus requiring the activation of BR2_TARGET_UBOOT_NEEDS_GNUTLS.
> The version of TF-A remains 2.10, but the LTS version is used as 
> suggested
> by the maintainers.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to next, thanks!

I added BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y which was missing. Build
in the Docker image were failing with error:

tools/mkeficapsule.c:19:10: fatal error: uuid/uuid.h: No such file or 
directory
    19 | #include <uuid/uuid.h>
       |          ^~~~~~~~~~~~~

> ---
>  .../arm-trusted-firmware/arm-trusted-firmware.hash     |  2 --
>  .../common/imx8mn-bsh-smm-s2/patches/linux/linux.hash  |  2 +-
>  .../common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash  |  2 +-
>  configs/imx8mn_bsh_smm_s2_defconfig                    | 10 +++++-----
>  configs/imx8mn_bsh_smm_s2_pro_defconfig                | 10 +++++-----
>  5 files changed, 12 insertions(+), 14 deletions(-)
>  delete mode 100644 
> board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> 
> diff --git 
> a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash 
> b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> deleted file mode 100644
> index 6f02bfbb22ef..000000000000
> --- 
> a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Locally calculated
> -sha256  
> 7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  
> arm-trusted-firmware-v2.10-git4.tar.gz
> diff --git 
> a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash 
> b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
> index 53eb1438945b..28988ed019bc 100644
> --- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
> +++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  
> 774698422ee54c5f1e704456f37c65c06b51b4e9a8b0866f34580d86fef8e226  
> linux-6.10.tar.xz
> +sha256  
> aee8a844fe152420bece70ffae8525b9b23089aa4da31fa32f30e1859bf93c3d  
> linux-6.11.8.tar.xz
> diff --git 
> a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash 
> b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
> index fe9b4f53dc63..904fa56c02a3 100644
> --- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
> +++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  
> f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  
> u-boot-2024.07.tar.bz2
> +sha256  
> b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  
> u-boot-2024.10.tar.bz2
> diff --git a/configs/imx8mn_bsh_smm_s2_defconfig 
> b/configs/imx8mn_bsh_smm_s2_defconfig
> index 2b358cf57b28..ff6539c114e8 100644
> --- a/configs/imx8mn_bsh_smm_s2_defconfig
> +++ b/configs/imx8mn_bsh_smm_s2_defconfig
> @@ -1,12 +1,12 @@
>  BR2_aarch64=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
>  BR2_GLOBAL_PATCH_DIR="board/bsh/common/imx8mn-bsh-smm-s2/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
>  
> BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.8"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  
> BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -21,19 +21,19 @@ BR2_TARGET_ROOTFS_UBIFS=y
>  BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
>  BR2_TARGET_ROOTFS_UBIFS_RT_NONE=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
>  
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60000"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>  BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig 
> b/configs/imx8mn_bsh_smm_s2_pro_defconfig
> index e903cbf3148a..010dcee17e6e 100644
> --- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
> +++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
> @@ -1,5 +1,5 @@
>  BR2_aarch64=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
>  BR2_GLOBAL_PATCH_DIR="board/bsh/common/imx8mn-bsh-smm-s2/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
> @@ -7,7 +7,7 @@ 
> BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
>  
> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.8"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  
> BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -23,18 +23,18 @@ BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
>  
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60000"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2pro"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>  BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> --
> 2.43.0
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
