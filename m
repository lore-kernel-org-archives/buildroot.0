Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41979CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0730781E7F;
	Wed, 22 Oct 2025 16:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCCpfi3AypFn; Wed, 22 Oct 2025 16:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2539781EB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2539781EB9;
	Wed, 22 Oct 2025 16:49:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CDC143F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23FEA81EA8
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqLHFibEOAYn for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:49:45 +0000 (UTC)
X-Greylist: delayed 349 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 22 Oct 2025 16:49:45 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 40B1C81E7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40B1C81E7F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40B1C81E7F
 for <buildroot@busybox.net>; Wed, 22 Oct 2025 16:49:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 64AF8B9784ED; Wed, 22 Oct 2025 18:43:54 +0200 (CEST)
To: Francois Perrad <francois.perrad@gadz.org>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@busybox.net
Date: Wed, 22 Oct 2025 18:43:53 +0200
Message-ID: <20251022164353.286934-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010122812.356563-1-francois.perrad@gadz.org>
References: <20251010122812.356563-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151434; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=2uXyhO84dt6WDUJKEj977Af//fP9PM0p8rTpIOy2Z64=;
 b=DVBRO0eVhaZUirJpAXT3/BItOp2ro1MxP15GJ2Fq3PpirImSofH4rVkGQCjspR/svtsx3+
 4ApPsVuMwTMaT7UuDPGUBjXwfd7JTHE7s2gQtW6jTc6YQRLF8ZRcH6+LezeGOQ4KwXHg6c
 yAzLv/O1MHPfD1Bs3ZImCvnEBika11CC+8s/b66/34/EMQct31PwQCGlP+KjKt+3P/f8lq
 UTCUQCMpl6AOo2BYCz6axTYffSvS593DuOxAQb1djR5TZOLzq1EySJ3KzoVml/lNpPrEUx
 Mnv76KoKYRAjal31cqSy9BP/ltgMpZHIAH409v7E2M6tuRbgki8Akn3ZFEvTJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=DVBRO0eV
Subject: Re: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump
 Linux and U-Boot
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
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to 2025.08.x. Thanks

> ---
>  board/olimex/a20_olinuxino/patches/linux/linux.hash | 2 +-
>  board/olimex/a20_olinuxino/patches/uboot/uboot.hash | 2 +-
>  configs/olimex_a20_olinuxino_lime2_defconfig        | 4 ++--
>  configs/olimex_a20_olinuxino_lime_defconfig         | 4 ++--
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash b/board/olimex/a20_olinuxino/patches/linux/linux.hash
> index 49740ece9..52688f83e 100644
> --- a/board/olimex/a20_olinuxino/patches/linux/linux.hash
> +++ b/board/olimex/a20_olinuxino/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
> +sha256  c435bd74d1c21fc5a950781a50d78bae2b93944144694843359948ad3afc72a5  linux-6.12.50.tar.xz
> diff --git a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
> index 30246a7cd..a2725383c 100644
> --- a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
> +++ b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
> +sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
> diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
> index 3e86696b4..ff6eca176 100644
> --- a/configs/olimex_a20_olinuxino_lime2_defconfig
> +++ b/configs/olimex_a20_olinuxino_lime2_defconfig
> @@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.50"
>  BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
> index 524dc0800..7d95bd4d4 100644
> --- a/configs/olimex_a20_olinuxino_lime_defconfig
> +++ b/configs/olimex_a20_olinuxino_lime_defconfig
> @@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.50"
>  BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
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
