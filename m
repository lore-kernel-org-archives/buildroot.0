Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F524CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 389FD60F12;
	Mon, 17 Nov 2025 19:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrAR_qHRHCBT; Mon, 17 Nov 2025 19:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41D8760F6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41D8760F6F;
	Mon, 17 Nov 2025 19:57:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AC391BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BD0A60F12
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rO__zlv0xsnz for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:57:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 878A860F6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 878A860F6F
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 878A860F6F
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:57:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B6AE2B9796C0; Mon, 17 Nov 2025 20:57:52 +0100 (CET)
Message-ID: <cc2c7ffd-ead0-4a23-8935-8babc61f6542@rnout.be>
Date: Mon, 17 Nov 2025 20:57:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
References: <20251031091211.2337622-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251031091211.2337622-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409473; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=ib9O9DPXcUCfqfoKhyYoTIrVBQHehNPpbJaEa1Gc8Ms=;
 b=RfkQ75eUIaRfsXu675ldleyZzu6grEZe0LEzDY6m9Q/OpP9VBVSlZun0P5M3+vOzyCQCww
 QF5hy9i4darvc/Z0iBYdS8lSt2q3kLogzi0gie7ht/NoCpHJn2CPSsiGqrq25a6xWG+jSz
 zpuewiH31vx70QFkQdrSxGvJjVMQVZgJXnSIjI6cf/6gY4ZWdZbIvHj0mcwSUk8MJhccjH
 IUadu4oXthwKvICpnEFmluvCEXakQrG5H7NFhS8NH0D1aR0Aygv952ET+IvfrscqTHp/Rg
 Q6bGs/Fs8cZty9lHqnaTsdSzuD8UDp/J8yUjdok6Tmvriqks30Ck46Xwd8fGsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=RfkQ75eU
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: bump
 Linux to 6.12.56 and U-Boot to 2025.10
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



On 31/10/2025 10:12, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.12.56 and U-Boot to
> version 2025.10.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash | 2 +-
>   board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash | 2 +-
>   configs/imx8mn_bsh_smm_s2_defconfig                         | 4 ++--
>   configs/imx8mn_bsh_smm_s2_pro_defconfig                     | 4 ++--
>   4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
> index 839b62862a60..b61e87cec65d 100644
> --- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
> +++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>   # From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  6e562502a8fd11639f558e43b74f0df0d85fa85e60f5332acb275a75a35f5345  linux-6.12.39.tar.xz
> +sha256  55432b2af352f7bf3053c348d8549df2f2deeaa4a361c65d638c2f3b2ca7ec96  linux-6.12.56.tar.xz
> diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
> index 440526977bd9..98a5c53aaf97 100644
> --- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
> +++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
> +sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
> diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
> index 662aea69deb1..ee8fb9bea39d 100644
> --- a/configs/imx8mn_bsh_smm_s2_defconfig
> +++ b/configs/imx8mn_bsh_smm_s2_defconfig
> @@ -6,7 +6,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.39"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.56"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -28,7 +28,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
> index f1e9d0c0a151..1abe3a531a72 100644
> --- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
> +++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
> @@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.39"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.56"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -29,7 +29,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2pro"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
