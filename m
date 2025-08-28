Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B61EC8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 11:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09F1580EAA;
	Thu, 28 Aug 2025 11:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGVKdvL1su0J; Thu, 28 Aug 2025 11:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1640180EC8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1640180EC8;
	Thu, 28 Aug 2025 11:44:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C407E1B0
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AABD360D92
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 172NErAtSn81 for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 11:44:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C070160B8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C070160B8C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C070160B8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:44:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8CBA2B9783DE; Thu, 28 Aug 2025 13:44:51 +0200 (CEST)
Message-ID: <2881a599-f52f-435e-ae56-a1b6be4f3398@rnout.be>
Date: Thu, 28 Aug 2025 13:44:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Patrice Vilchez <Patrice.Vilchez@microchip.com>
References: <20250818204553.3225412-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250818204553.3225412-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756381491; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=g9T7liqM767gbXoPOI4Fncn/8JLaBIV/mqKmNU4ymlM=;
 b=Im17ljYE5aHybONptDmXSRL+2hxCNY6YNu95p6QoLMowbujvEsdV7ggCGE8DsLd3IoTQ7R
 Dmyok6nsjyeQdPJKBNxFicyiUfmvhk/SvUzW1W5tir/BQaDyC4I3gqwxYaihTJW38V1TAO
 UxNahOfVeycA0t1HfTFoaOT8bbFgKc7kKqxjFvuZZdlUcpDTZjZiDeI1VoB+RXU1QnR1Ra
 v2X1kXlROLHLkbGxolfn0AtRc25hVMLx1c2l6f5PZSRTVnNp3xWVxMuIzFWWnrO2LUHSrq
 bBgXOqHaaU4MkUBkE2/w36d61+NBwR74yMe5kxNETPpB8SvcPDD/ZBQHr/0Ihw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Im17ljYE
Subject: Re: [Buildroot] [PATCH] configs/at91sam9rlek: remove defconfig,
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



On 18/08/2025 22:45, Thomas Petazzoni via buildroot wrote:
> This defconfig no longer builds:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272534
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
>   .checkpackageignore            |  1 -
>   configs/at91sam9rlek_defconfig | 21 ---------------------
>   2 files changed, 22 deletions(-)
>   delete mode 100644 configs/at91sam9rlek_defconfig
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 5ed2f3e07a..12e5af6b7b 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -104,7 +104,6 @@ configs/aspeed_ast2600evb_defconfig lib_defconfig.ForceCheckHash
>   configs/asus_tinker-s_rk3288_defconfig lib_defconfig.ForceCheckHash
>   configs/asus_tinker_rk3288_defconfig lib_defconfig.ForceCheckHash
>   configs/at91sam9260eknf_defconfig lib_defconfig.ForceCheckHash
> -configs/at91sam9rlek_defconfig lib_defconfig.ForceCheckHash
>   configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
>   configs/atmel_sama5d2_xplained_mmc_defconfig lib_defconfig.ForceCheckHash
>   configs/atmel_sama5d2_xplained_mmc_dev_defconfig lib_defconfig.ForceCheckHash
> diff --git a/configs/at91sam9rlek_defconfig b/configs/at91sam9rlek_defconfig
> deleted file mode 100644
> index 8a1cb46e16..0000000000
> --- a/configs/at91sam9rlek_defconfig
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -BR2_arm=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
> -BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
> -BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
> -BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9rlek"
> -BR2_TARGET_ROOTFS_UBI=y
> -BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2047
> -BR2_TARGET_AT91BOOTSTRAP3=y
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
> -BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9rleknf_uboot"
> -BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="at91sam9rlek_nandflash"
> -BR2_PACKAGE_HOST_SAM_BA=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
