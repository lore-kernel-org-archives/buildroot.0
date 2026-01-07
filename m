Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B15D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7683080809;
	Wed,  7 Jan 2026 17:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKPpFi56y6hd; Wed,  7 Jan 2026 17:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AAEC807B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808554;
	bh=ifx+8fmNJj/TjQyhRHaMkPwhV8MofF3aD1pHtk8aokY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JvN95Nl+fPvQUhKY1AufUCb1NGaQJsSGHZmQ7JmXOXykxbLSwIkp5dmWhX43vHrnG
	 9AXuwsQPVOe3xqH5xNATDy0h/GS3u6RBzPlGKEQni3rbpUjkj5XrePfhwBT3aXrZoD
	 p6I8yxs3QKuaATWyYRzsDurSOgEQEeXnmOn/QiWEr+xTgJux0I/be7JKODKY1xEGPC
	 GQStDsFbwaJAwafx5LmsbN1MHRvtNXg1bVO4oVqeT2t1U87/x+xrcYIMF8B7tm66XI
	 aL2GTgbA3P4Ruam48f97eppcqD96f+d8IPTyOOTmBiDaD6oyfJ0VMPbab0rQvCGfVM
	 +ML5J+tJPAJfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AAEC807B6;
	Wed,  7 Jan 2026 17:55:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8295825B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69D6A807AE
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKzBSiS5Z-sG for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:55:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9ABB80741
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9ABB80741
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9ABB80741
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1F8ACB97A704; Wed,  7 Jan 2026 18:55:48 +0100 (CET)
To: Peter Seiderer <ps.report@gmx.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:55:46 +0100
Message-ID: <20260107175546.230377-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218201147.2617551-1-ps.report@gmx.net>
References: <20251218201147.2617551-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808548; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=5/hirJifQeK1alZoOEL7Df/2y7lYSYC5Ps1k2vzDzAk=;
 b=Z1+Wc068PD2lIx1zc3ULV6lhTdSTOb7GoxN5sBkkeoJlXq2078+/nq1tFc4xOXqEVMEsMK
 cZqSNDNaLREhVYgqH4p64UCA2JUxtDoacfpq81X0SwPVfJGy3KD5ztkFbbe8BPNKHUsXXZ
 k4F0qooy/7mZ24pcQG2hmyZe11wxPJaF+CSxPl6N1itpq0dGiFwnWeVYgUfD3oFRopYgc2
 r0UYI0JC+ciTxEJGzQTzHMIIvZyOUzAZFBTKoRkzWEXacqLt4W5wtGrHgeh0TIpaE9mD3R
 +fXhv3lPAmopBnXJCSPZz9S/Bxs7KD4CNg6eHeWGQzEuJUa4A4UIpABkX22GoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Z1+Wc068
Subject: Re: [Buildroot] [PATCH v1 1/2] configs/raspberrypi*: bump kernel
 version to 21b4101 (6.12.61)
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
> Now based on 6.12.61 (from 6.12.41)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to 2025.11.x. Thanks

> ---
>  board/raspberrypi/patches/linux/linux.hash | 2 +-
>  configs/raspberrypi0_defconfig             | 2 +-
>  configs/raspberrypi0w_defconfig            | 2 +-
>  configs/raspberrypi2_64_defconfig          | 2 +-
>  configs/raspberrypi2_defconfig             | 2 +-
>  configs/raspberrypi3_64_defconfig          | 2 +-
>  configs/raspberrypi3_defconfig             | 2 +-
>  configs/raspberrypi3_qt5we_defconfig       | 2 +-
>  configs/raspberrypi4_64_defconfig          | 2 +-
>  configs/raspberrypi4_defconfig             | 2 +-
>  configs/raspberrypi5_defconfig             | 2 +-
>  configs/raspberrypi_defconfig              | 2 +-
>  configs/raspberrypicm4io_64_defconfig      | 2 +-
>  configs/raspberrypicm4io_defconfig         | 2 +-
>  configs/raspberrypicm5io_defconfig         | 2 +-
>  configs/raspberrypizero2w_64_defconfig     | 2 +-
>  configs/raspberrypizero2w_defconfig        | 2 +-
>  17 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/board/raspberrypi/patches/linux/linux.hash b/board/raspberrypi/patches/linux/linux.hash
> index 51b0684b20..fedfd9d4c9 100644
> --- a/board/raspberrypi/patches/linux/linux.hash
> +++ b/board/raspberrypi/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  afc44e2899a3c32a1b968272a5816e5c90bea346341153807553396621e65dde  linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz
> +sha256  7c31df8061aae748a6e72417bfe743a54198fb5bdc96e229ecc605dc621d32ef  linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz
> diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
> index 1be48c32dc..9c000dc39d 100644
> --- a/configs/raspberrypi0_defconfig
> +++ b/configs/raspberrypi0_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero"
> diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
> index c7803c5af6..a2392faf0b 100644
> --- a/configs/raspberrypi0w_defconfig
> +++ b/configs/raspberrypi0w_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0w/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0w/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero-w"
> diff --git a/configs/raspberrypi2_64_defconfig b/configs/raspberrypi2_64_defconfig
> index 57f98c7396..f8cadcb731 100644
> --- a/configs/raspberrypi2_64_defconfig
> +++ b/configs/raspberrypi2_64_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2-64/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2-64/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-2-b"
> diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
> index 60eb62b473..5e3af7864b 100644
> --- a/configs/raspberrypi2_defconfig
> +++ b/configs/raspberrypi2_defconfig
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2709-rpi-2-b broadcom/bcm2710-rpi-2-b"
> diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
> index 59b8b3fc6f..31568129ac 100644
> --- a/configs/raspberrypi3_64_defconfig
> +++ b/configs/raspberrypi3_64_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
> diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
> index 3f7fdeb3ab..4cc73708e8 100644
> --- a/configs/raspberrypi3_defconfig
> +++ b/configs/raspberrypi3_defconfig
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
> diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
> index 8cbb8b0d41..48284513dd 100644
> --- a/configs/raspberrypi3_qt5we_defconfig
> +++ b/configs/raspberrypi3_qt5we_defconfig
> @@ -12,7 +12,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
> diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
> index c0a33c3eb5..ce79952ff7 100644
> --- a/configs/raspberrypi4_64_defconfig
> +++ b/configs/raspberrypi4_64_defconfig
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400 broadcom/bcm2711-rpi-cm4 broadcom/bcm2711-rpi-cm4s"
> diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
> index 75078a3c2c..a6df6fd923 100644
> --- a/configs/raspberrypi4_defconfig
> +++ b/configs/raspberrypi4_defconfig
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400 broadcom/bcm2711-rpi-cm4 broadcom/bcm2711-rpi-cm4s"
> diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
> index 6928e2ba0f..63432f45d5 100644
> --- a/configs/raspberrypi5_defconfig
> +++ b/configs/raspberrypi5_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi5/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi5/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
> index 00525e050e..fd8508661c 100644
> --- a/configs/raspberrypi_defconfig
> +++ b/configs/raspberrypi_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-b-rev1 broadcom/bcm2708-rpi-b broadcom/bcm2708-rpi-b-plus broadcom/bcm2708-rpi-cm"
> diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
> index 648740c273..53f5193db4 100644
> --- a/configs/raspberrypicm4io_64_defconfig
> +++ b/configs/raspberrypicm4io_64_defconfig
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io-64/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io-64/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
> diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
> index e5bbff76c1..01e02fd300 100644
> --- a/configs/raspberrypicm4io_defconfig
> +++ b/configs/raspberrypicm4io_defconfig
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
> diff --git a/configs/raspberrypicm5io_defconfig b/configs/raspberrypicm5io_defconfig
> index 122a25ed92..706f759832 100644
> --- a/configs/raspberrypicm5io_defconfig
> +++ b/configs/raspberrypicm5io_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm5io/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm5io/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/raspberrypizero2w_64_defconfig b/configs/raspberrypizero2w_64_defconfig
> index 7a00fa14ac..e926f6f23d 100644
> --- a/configs/raspberrypizero2w_64_defconfig
> +++ b/configs/raspberrypizero2w_64_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w-64/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w-64/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-zero-2-w"
> diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
> index 36e66676fa..eb23324e11 100644
> --- a/configs/raspberrypizero2w_defconfig
> +++ b/configs/raspberrypizero2w_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-zero-2-w"
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
