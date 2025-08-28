Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42EACA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 11:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 923A560D98;
	Thu, 28 Aug 2025 11:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZcXQtszwqSv; Thu, 28 Aug 2025 11:44:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE92860D92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE92860D92;
	Thu, 28 Aug 2025 11:44:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6E851B0
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD4D160D92
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sYXaHRbMn3hh for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 11:44:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF7F46076C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF7F46076C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF7F46076C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:44:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CC416B9783DE; Thu, 28 Aug 2025 13:44:31 +0200 (CEST)
Message-ID: <e2216d67-40c0-4fa6-bc47-b86a4a0c8e19@rnout.be>
Date: Thu, 28 Aug 2025 13:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Patrice Vilchez <Patrice.Vilchez@microchip.com>
References: <20250818204215.3223340-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250818204215.3223340-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756381473; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=4ba8t/y8n6lYGLCFw42Z8PR0lNymw0fPFT6fGk2S14o=;
 b=HhoaMp/mU3WaKZ8zPNiB+YQsfStHyc/0PGp9nvkDK8P9k5YnZ0De9TS/bQa6ORqzJVME/o
 AOHg+PSftUsQdp8LTHOqTOrcT+lon4vhq1uJzuHE79a+r6L/q6zDYn+BAbVP5bT6zmv+Lc
 CxibyeRim0JOB2qgjOEngYHimM2K4oXGr5lJIqCSmRWE+goQOLPCSmLkPRQkt0vk6MN8RG
 zbFAk0qHuCHu8tkrFq2qt9RbADqoVyKiyVDvvAV6VHLjWUMclOpSzgOPgKpqxGdiOzh065
 5ZNOBf5AqwcdeH0q/2i3KZoewcOjn4M9tLWyhEsrcx8QZzhJwSAW2qqKegbLYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=HhoaMp/m
Subject: Re: [Buildroot] [PATCH] configs/at91sam9g20dfc: remove defconfig,
 broken
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



On 18/08/2025 22:42, Thomas Petazzoni via buildroot wrote:
> This defconfig no longer builds:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272524
> 
> It is still based on the 4.8.6 kernel, which is not even an LTS
> kernel, so we cannot easily update to fix the issues which are most
> likely due to the newer gcc/binutils versions we're using now.
> 
> There is no DEVELOPERS entry attached to this configuration as well,
> and this defconfig has been broken for at least 2 months, probably
> more (our Gitlab CI history is only kept for ~2 months). So let's drop
> it, unles someone volunteers to resurrect it.
> 
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Patrice Vilchez <Patrice.Vilchez@microchip.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore              |  1 -
>   configs/at91sam9g20dfc_defconfig | 21 ---------------------
>   2 files changed, 22 deletions(-)
>   delete mode 100644 configs/at91sam9g20dfc_defconfig
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 7215c61fd1..9b9575524b 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -104,7 +104,6 @@ configs/aspeed_ast2600evb_defconfig lib_defconfig.ForceCheckHash
>   configs/asus_tinker-s_rk3288_defconfig lib_defconfig.ForceCheckHash
>   configs/asus_tinker_rk3288_defconfig lib_defconfig.ForceCheckHash
>   configs/at91sam9260eknf_defconfig lib_defconfig.ForceCheckHash
> -configs/at91sam9g20dfc_defconfig lib_defconfig.ForceCheckHash
>   configs/at91sam9g45m10ek_defconfig lib_defconfig.ForceCheckHash
>   configs/at91sam9rlek_defconfig lib_defconfig.ForceCheckHash
>   configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
> diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
> deleted file mode 100644
> index 6a79c95682..0000000000
> --- a/configs/at91sam9g20dfc_defconfig
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -BR2_arm=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
> -BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
> -BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
> -BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9g20ek"
> -BR2_TARGET_ROOTFS_UBI=y
> -BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2047
> -BR2_TARGET_AT91BOOTSTRAP3=y
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
> -BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9g20eknf_uboot"
> -BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="at91sam9g20ek_nandflash"
> -BR2_PACKAGE_HOST_SAM_BA=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
