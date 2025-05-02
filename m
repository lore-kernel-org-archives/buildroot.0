Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2ACC3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C85783D7C;
	Fri,  2 May 2025 10:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RM5dDFqRgBd; Fri,  2 May 2025 10:39:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F84183DB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F84183DB5;
	Fri,  2 May 2025 10:39:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C27D6229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0BDA83D31
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmJq57CJQWPW for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:39:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F2DC983963
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2DC983963
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2DC983963
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:39:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EFF6C1C111C; Fri,  2 May 2025 12:39:53 +0200 (CEST)
Message-ID: <e6ecfa5d-5813-4510-b242-fd181d5ddb97@rnout.be>
Date: Fri, 2 May 2025 12:39:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com
References: <20250409061736.2335242-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250409061736.2335242-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182394; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JeH41BIGu9eGCVS3VVDlUKgEZydvkN/VWMkjniISNRo=;
 b=lZ3VowQQfPijXcB6IyVKpHrlTekgt4X1p5bHnHgVezu8SiNv1RsVTWa6jrT442U9MmQEHp
 iZ+JnI7OUNsrgDTP0VeCtvIUYaKNryi8N/wW8eX1guhov3No2kbLDFURJZcYatywLwRXiU
 im2HUzmJTNJEpWNLpM8SIpgobqIXNqqpO4IGjZ0GyZ9iAv7a9TmXj73gi1GjCUP3NdVAQt
 d7ID/bw8uhFyhHWmbzmrlcrvw00PHk4WeSRKq6PYTyKDt67ROglRxUmvuv+8Y39hxUZyVu
 bY166yBu8E81PhpUulRNFnborwQUz7WlGhbf9lItxr9bKqLF14eKcQiIflFNRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=lZ3VowQQ
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.179
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/04/2025 08:17, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 5.15.179 and, for the SD
> configuration, also updates U-Boot to version 2025.04.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to 2025.02.x (only Linux, not U-Boot), thanks.

  Regards,
  Arnout

> ---
>   .../stm32f469-disco/patches/linux/linux.hash                  | 2 +-
>   .../stm32f469-disco/patches/uboot/uboot.hash                  | 2 +-
>   configs/stm32f469_disco_sd_defconfig                          | 4 ++--
>   configs/stm32f469_disco_xip_defconfig                         | 2 +-
>   4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
> index 57c69adb36ce..4e0aeb77d880 100644
> --- a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
> +++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  a84ab5328c8a5a0e5c4a39a06b07479a7769c73af49a4c9ce59eeb644829d3b1  linux-5.15.176.tar.xz
> +sha256  9319a47b1e9b5d344ff6015431856d0c9640e4faedc527c87f9129061a27136f  linux-5.15.179.tar.xz
> diff --git a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
> index 50674352d71d..80ea21b7cb4c 100644
> --- a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
> +++ b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
> +sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
> diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
> index 3aa27f10ad02..6193855bd25c 100644
> --- a/configs/stm32f469_disco_sd_defconfig
> +++ b/configs/stm32f469_disco_sd_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.176"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.179"
>   BR2_LINUX_KERNEL_DEFCONFIG="stm32"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
>   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> @@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
> diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
> index 67db22f9332f..f014f77d7653 100644
> --- a/configs/stm32f469_disco_xip_defconfig
> +++ b/configs/stm32f469_disco_xip_defconfig
> @@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.176"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.179"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
>   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
