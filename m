Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0E9C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FF5B41602;
	Thu, 17 Jul 2025 20:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81fc6Y8d6u86; Thu, 17 Jul 2025 20:15:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE8494150F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE8494150F;
	Thu, 17 Jul 2025 20:15:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6E4A226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4A274150F
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymPtFpzmCoBz for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:15:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0FB62413B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FB62413B9
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FB62413B9
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:15:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CDAC5B977A8D; Thu, 17 Jul 2025 22:14:59 +0200 (CEST)
Message-ID: <63c66f7f-ec61-4bef-9008-c6cad47ec420@rnout.be>
Date: Thu, 17 Jul 2025 22:14:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>
References: <20250711061509.1772371-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250711061509.1772371-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752783300; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=x6HtWLibsOaY9GL7Tr2nIeQC9CeC+hH0sSyxojof53g=;
 b=AqJG7Kh2ke2bY8H3s3T+gLafMmwcDLgGTNc0cbVs3gOfcmB27mZabi9UI5TpwG+Gq59aE+
 ZO+8pzsx78k1PSCWWhk06/3+l+OqKCnGU5uFWoZLteocDTs0e8Gk/O9b5FkYk8z7aXuAL7
 UuIVy4xIc0Jdynh1Bd0HYwG9amGo6H1Hd5QKw16/N+g3m+xAj8KKdZ9liPjc+KK33ByZZJ
 pr7yHZaWRcUUHyjd2ef4RdxL4WsoqwR8k32JCxvfY0gyewF+C4e/OkuBYebCm6HdtFLTl+
 8mLfQDKmdGizoLcRu6EsXAAIQoFr5nqejYv0gVFzP10hocnClvnbThyR8bGXFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=AqJG7Kh2
Subject: Re: [Buildroot] [PATCH 1/1] configs/beaglebone: bump Linux to
 6.12.23-ti-arm32-r11 and U-Boot to 2025.07
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



On 11/07/2025 08:15, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.12.23-ti-arm32-r11 and
> U-Boot to version 2025.07.
> 
> Tested on beaglebone black.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to 2025.05.x, thanks.

  Not applied to 2025.02.x because that is still on an older kernel series.

  Regards,
  Arnout

> ---
>   board/beagleboard/beaglebone/patches/linux/linux.hash | 2 +-
>   board/beagleboard/beaglebone/patches/uboot/uboot.hash | 2 +-
>   configs/beaglebone_defconfig                          | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
> index 5f6bd2bec165..f2c09d9872c2 100644
> --- a/board/beagleboard/beaglebone/patches/linux/linux.hash
> +++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  203743e32c9fba3bb9f965c1b3799977961a9d25071d6d482d96d74adfdbaadb  linux-6.12.17-ti-arm32-r9.tar.gz
> +sha256  3654ca31003d90d20b195b23f8d60b78fcffbf0fd7fed6116c22719e20ac933d  linux-6.12.23-ti-arm32-r11.tar.gz
> diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
> index 80ea21b7cb4c..440526977bd9 100644
> --- a/board/beagleboard/beaglebone/patches/uboot/uboot.hash
> +++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
> +sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index b4035215dea1..bb63fda37592 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.12.17-ti-arm32-r9)/linux-6.12.17-ti-arm32-r9.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.12.23-ti-arm32-r11)/linux-6.12.23-ti-arm32-r11.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless"
> @@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
