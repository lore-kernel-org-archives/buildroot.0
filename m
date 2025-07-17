Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBD3C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A2404118B;
	Thu, 17 Jul 2025 20:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtfPyG5RR0e5; Thu, 17 Jul 2025 20:14:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DA5D413B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DA5D413B9;
	Thu, 17 Jul 2025 20:14:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63FD61A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AB17607B2
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQNAFibImGo8 for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:14:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 947F36060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 947F36060C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 947F36060C
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:14:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 44D4EB977A8D; Thu, 17 Jul 2025 22:14:09 +0200 (CEST)
Message-ID: <4ff3970e-c5b6-4863-a340-5c721590e722@rnout.be>
Date: Thu, 17 Jul 2025 22:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, linux-amarula@amarulasolutions.com
References: <20250709222624.9650-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250709222624.9650-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752783250; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=daqcFILB+y3uaW+slr/VYkRkV/gCSA1wO6SH1Dt+QKs=;
 b=kIXsrFFS/ncfgogxuQM6++RHGt+kcbRaWuf44gkbRdHp9HDeaMhVoYpDy5gLF0czugYJHr
 6KGMFXQbqrF4ExOyOVZ2XOrIyraL9HRHz26Ryb/JQ815udnykm3f09yds6xOEm/9RSwmeS
 wFDVIO3R6qrcvwka2Qos/lMZNLeOYnmRk0I0+yyZqWcEcS5tlzomK6j3Qk4J3Y8bBndVWx
 9VK1BFduQHrH9uKBI7z3epxnKfIqJMq+Ds4agS3YARbEBL1A2aAbbxqnBMwUudMO+eNXhe
 BY/YMuKpcdYtVNf2bfAV0anSxMCkr6dxCgLlv39rDobOLM3FFZWJd9SgLAgcNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=kIXsrFFS
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/07/2025 00:26, Dario Binacchi wrote:
> This patch bumps:
> 
> - U-Boot to version v2025.07
> - Linux kernel to version 6.12.36 (LTS)
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to 2025.02.x and 2025.05.x (kernel update only), thanks.

  Regards,
  Arnout

> ---
>   board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
>   board/ti/am62x-sk/patches/uboot/uboot.hash | 2 +-
>   configs/ti_am62x_sk_defconfig              | 6 +++---
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
> index 1213da86b178..6c7685ad4d07 100644
> --- a/board/ti/am62x-sk/patches/linux/linux.hash
> +++ b/board/ti/am62x-sk/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  643142c1b5991560dd12f950825cc19e4497b95b82641918ecff1177f4130c1d  linux-6.12.24.tar.xz
> +sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
> diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
> index 80ea21b7cb4c..440526977bd9 100644
> --- a/board/ti/am62x-sk/patches/uboot/uboot.hash
> +++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
> +sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
> diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
> index 98c4839179c0..28e6fc03ba1c 100644
> --- a/configs/ti_am62x_sk_defconfig
> +++ b/configs/ti_am62x_sk_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
>   BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.24"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
> @@ -26,12 +26,12 @@ BR2_TARGET_OPTEE_OS=y
>   BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
>   BR2_TARGET_TI_K3_R5_LOADER=y
>   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
> -BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2025.04"
> +BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2025.07"
>   BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
