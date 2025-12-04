Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04179D2A538
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE8EA61C98;
	Thu,  4 Dec 2025 20:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwgo8LT6xqll; Thu,  4 Dec 2025 20:43:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1D38613EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764881030;
	bh=/gSN53Ij67uTkwOiQghJnKUD2CiY/9pb1l27iDlgMzY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BORiktbkT8YEWkyqmOSRrrGIWe/lwazoG/hCi4ZGDj+vEZLKvsz87AMHEZCFX4I4F
	 J46AszouF71Mbi1AmnPGpuNYaVYef1AZw9jA02K+OBkR1niuAHIUnU1jBsB+22jFGu
	 RjHnPNUcydRaKCCdyFHvNmRtcr1DfBi+2GCC1EkswEDTRO2hraocYva5XqDjzKQHnR
	 Ae3o3kbotzRQ50DBndBLAG5YcFeia/qfLqsAJrWzBfA8LLSBGsvzbYtdfgAWARfq4J
	 kA1PGQsbLs2zHO0zjDTFpXVOsY7hksFollo/bvoDr83PeLAYpd6Me5RC1eNyUDbb6Y
	 CfYCvaMt4n3Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1D38613EB;
	Thu,  4 Dec 2025 20:43:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81AB01A9
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67B8361C91
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id roQldfGQJk6g for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:43:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5251C61C5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5251C61C5B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5251C61C5B
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 26C95B979ECC; Thu,  4 Dec 2025 21:43:44 +0100 (CET)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu,  4 Dec 2025 21:43:44 +0100
Message-ID: <20251204204344.13198-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251016173401.163407-1-dario.binacchi@amarulasolutions.com>
References: <20251016173401.163407-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764881025; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Sx1OQ2DPI+eiiEdOezMCf0n5O0KO6TlFWjb5m/kVvEc=;
 b=KRoJ4ubN9qxypnCvodUjuUXJ7cRqDVr0eP7GIQIGifRIS8nFUHBD5oru86VixyltOWeZbV
 z+6QMGY2q8t9Q1eaJf9wHr6so5uEXuhnB+D1ye8cEVjyvoVfuwhbx5JW+J1Yp4+83SllLy
 VMkQqX1D1VvNMFA5gpy3tccBXgp32xTkpf5+oP7ePc72g7A+16z7/uo8mMjMVVMUVjejoO
 KctPZsvFtDWp1BMjMnVmsrCmNEN0RpK/5Uy4P6oo0Bv+ytJ0YyjNPCQ8Vit/+OuyaLtnxF
 H7g4Dcj7qX4QmEkGvn8Mh2skVMx1gxiIGDvSCK4XHw81gYIMMxEb8m+RU0uy0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=KRoJ4ubN
Subject: Re: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump U-Boot and
 Linux versions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This patch bumps:
> 
> - U-Boot to version v2025.10
> - Linux kernel to version 6.12.53 (LTS)
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.08.x. Thanks

> ---
>  board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
>  board/ti/am62x-sk/patches/uboot/uboot.hash | 2 +-
>  configs/ti_am62x_sk_defconfig              | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
> index df60f9a5823d..4ac46f027b20 100644
> --- a/board/ti/am62x-sk/patches/linux/linux.hash
> +++ b/board/ti/am62x-sk/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  0fcbbbbcd456e87bbbfc8bf37af541fda62ccfcce76903503424fd101ef7bdee  linux-6.12.43.tar.xz
> +sha256  663507accae673afcf4e210b4ae8d4352e61d926202e5da3f04bf71ca1d2c0b5  linux-6.12.53.tar.xz
> diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
> index 440526977bd9..98a5c53aaf97 100644
> --- a/board/ti/am62x-sk/patches/uboot/uboot.hash
> +++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
> +sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
> diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
> index 211d58a66f3c..4349c966ace4 100644
> --- a/configs/ti_am62x_sk_defconfig
> +++ b/configs/ti_am62x_sk_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
>  BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.43"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.53"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
> @@ -26,12 +26,12 @@ BR2_TARGET_OPTEE_OS=y
>  BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
>  BR2_TARGET_TI_K3_R5_LOADER=y
>  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
> -BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2025.07"
> +BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2025.10"
>  BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
