Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28782C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEB6340702;
	Fri, 16 May 2025 11:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTiv4yxCgH7w; Fri, 16 May 2025 11:02:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A8C040704
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A8C040704;
	Fri, 16 May 2025 11:02:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2704B13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17E474071C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DP--7so4xeQq for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:02:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2596740704
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2596740704
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2596740704
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:02:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 394EF1C0FA2; Fri, 16 May 2025 13:02:11 +0200 (CEST)
Message-ID: <31abcafb-0f25-4b9c-8c22-0694600f5125@rnout.be>
Date: Fri, 16 May 2025 13:02:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrik Olsson <johan.patrik.olsson@gmail.com>, buildroot@buildroot.org
References: <20250510205029.456321-1-johan.patrik.olsson@gmail.com>
 <20250510205029.456321-2-johan.patrik.olsson@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250510205029.456321-2-johan.patrik.olsson@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747393331; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zZOTcBcq2+nn1PsNRQpQfUpPQHHKaGNEb7KbUNztBNQ=;
 b=XAqXqxKu3oJh+kZtAix/EZTDmjig5JqwTz/U5+YHGGPKaMbCvmLMjnB9xGlKAQVSQFCRIZ
 SgWVdUwTCamICi7QadNeMQ85jinXG8uxv9yHAupF7M0uWS9kPkbn4HX+/TaGUkGdmvOesk
 vQEMgulDB3EdDwv81TTuwb5YEqU4i51uXAkEQUl27T65/eqjYL2HYvDmP4Aim8z37GrqGb
 gAFh2TVM0Ycjbn3yV5eK8Ca+Xq2cVWijXc8DEnH1phNKQ9fnNNWg87dJDDvZrE4x+sarGE
 1igo3+rgfX3TcvYYsGq5PYToU5OwFj7AuMxWMHf5SGgV9q7y2wbgW7tCEB81CQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XAqXqxKu
Subject: Re: [Buildroot] [PATCH 2/2] configs: rock4se: bump TF-A,
 U-Boot and Linux versions
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



On 10/05/2025 22:50, Patrik Olsson wrote:
> This patch bumps:
> - TF-A to version v2.12 (LTS)
> - U-Boot to version v2025.04
> - Linux kernel to version 6.12.28 (LTS)
> 
> Signed-off-by: Patrik Olsson <johan.patrik.olsson@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   board/radxa/rock4se/patches/linux/linux.hash | 2 +-
>   board/radxa/rock4se/patches/uboot/uboot.hash | 2 +-
>   configs/rock4se_defconfig                    | 6 +++---
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/board/radxa/rock4se/patches/linux/linux.hash b/board/radxa/rock4se/patches/linux/linux.hash
> index 9108b3e01a..8ad0e7d8c0 100644
> --- a/board/radxa/rock4se/patches/linux/linux.hash
> +++ b/board/radxa/rock4se/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  4a516e5ed748537a73cb42ec47fbbeb6df8b1298e8892c29c0e91de79095b297  linux-6.12.10.tar.xz
> +sha256  e8a099182562aecff781de72ce769461e706d97af42d740dff20eb450dd5771e  linux-6.12.28.tar.xz
> diff --git a/board/radxa/rock4se/patches/uboot/uboot.hash b/board/radxa/rock4se/patches/uboot/uboot.hash
> index 904fa56c02..80ea21b7cb 100644
> --- a/board/radxa/rock4se/patches/uboot/uboot.hash
> +++ b/board/radxa/rock4se/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
> +sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
> diff --git a/configs/rock4se_defconfig b/configs/rock4se_defconfig
> index a0fbf9b3d5..29437b9be3 100644
> --- a/configs/rock4se_defconfig
> +++ b/configs/rock4se_defconfig
> @@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock4se/genimage.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.10"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.28"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rock-4se"
> @@ -22,14 +22,14 @@ BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock-4se-rk3399"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
