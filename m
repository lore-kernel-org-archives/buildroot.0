Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E58C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 19:46:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6917E60F55
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 19:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6917E60F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4749C407A7;
	Fri,  5 Nov 2021 19:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y9e5ken9PwAY; Fri,  5 Nov 2021 19:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0D9E4079E;
	Fri,  5 Nov 2021 19:46:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADA701BF580
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 19:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D4A68254D
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 19:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zM7KNitEcTk8 for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 19:45:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6811D82404
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 19:45:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so10291918wmj.5
 for <buildroot@buildroot.org>; Fri, 05 Nov 2021 12:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=myPb96xuoV6lFegx4sK69MgvgJnfzwq80MRl+X2TR9g=;
 b=XX7yBAGZv0aY+K6+9Ijtoiptcn8PMdmobfuxwpSINQK/zOwbH1KkRmlZJwsUNi/37n
 OwgjB58xUd3XXMgeg/PV5slArAiFi/q3c1zXPNJ6tObQq52aDnbtzVqImVKGAgiry9xt
 FhgLz4snxy6CZvgYKDtLYg6FgawCKWA1Nmv72TBu7R7LG4IKBgXWdERxXeZar+Q5lenV
 3H9pOo7j1G/kuu+nLmn2/gaCCbOgP2BJJW/8PA6hLJb0wsWTjF6z9ORwOiugFCCoYLjf
 GQTXCjpsiLagQPwEPPVnGPNJBjODjD6TGf2DCZAnvMEYr1aNjEoijrqYdoabDKgiahOA
 eKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=myPb96xuoV6lFegx4sK69MgvgJnfzwq80MRl+X2TR9g=;
 b=0ncYsUr+KbrJPR85Z/xd93ZcDBTNvXOrr5nv4YSRBu2DI2F0rwRDLhcXAdwWPlWWQb
 YwiIyprreX3Z0DrVD4in9g8xJI8TCo/pFHwLZiygOUxVnP/HtURtGf7ZNqCjc7Bz0kzD
 dLazMXk0uSJj6F0PLkmg/Xf/+MWDMHAiwFn1OAvAyPrHFRNe4xRaCbLFKh4mbP4zgJWp
 676tfInVwmnDvenU9UC8XFllGAj0u9SDuvsWImNRl9IMtTn+AruMLZBVwDPtCf/AkbO+
 ePJvPyrhk2MiNAe7DHtxNaTdOsn46bycYBZjsXHW/DQYg6h1DVvJHmyXhSEK2d6kGKzX
 hS6g==
X-Gm-Message-State: AOAM530NIpv4fHaZHw5MVhWul32KBI76DQWKEz809U5A2eU1XBOh0Gqe
 ARu6AtHDrMzl+xC3MI8QVzTMCJpTcLs=
X-Google-Smtp-Source: ABdhPJzwhaxaIVC2vQTztzYGtEAdl4Dy2tW72VqEx3VK9yg27dUcffCrMDmv0nFhfYopbMAtH1nkFw==
X-Received: by 2002:a7b:c5d4:: with SMTP id n20mr32991574wmk.32.1636141546557; 
 Fri, 05 Nov 2021 12:45:46 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id t8sm6526140wmq.32.2021.11.05.12.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 12:45:46 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 20:45:35 +0100
Message-Id: <20211105194536.940253-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105194536.940253-1-romain.naour@gmail.com>
References: <20211105194536.940253-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] configs/qemu_arm_versatile_nommu_defconfig:
 update to Linux 5.15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rebase patch versatile-nommu.patch on top of v5.15.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../patches/linux/versatile-nommu.patch       | 31 ++++++++++++-------
 configs/qemu_arm_versatile_nommu_defconfig    |  6 ++--
 2 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch b/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
index 956ae5f5f5..1a5130deb4 100644
--- a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
+++ b/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
@@ -1,10 +1,19 @@
-From 525dd2f3cf4a94837ce6b71d793acb90c25a5654 Mon Sep 17 00:00:00 2001
+From 7c245ffc17a9ab6215830d4ecd8b2f9beddb487c Mon Sep 17 00:00:00 2001
 From: Waldemar Brodkorb <wbx@openadk.org>
 Date: Fri, 1 Feb 2019 11:36:20 +0100
 Subject: [PATCH] arm-versatile-nommu: Linux patch
 
 Originally made by Waldemar Brodkorb <wbx@openadk.org> from LKML.
 
+Rename CLKSRC_OF to TIMER_OF (kernel >= 4.13)
+https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=bb0eb050a577a866cb47c2dc37596f1207f4c2d9
+
+Remove GENERIC_CLOCKEVENTS since its enabled by default (kernel >= 5.11)
+https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=0774a6ed294b963dc76df2d8342ab86d030759ec
+
+Select CONFIG_GENERIC_IRQ_MULTI_HANDLER since irqchip doesn't select it anymore (kernel >= 5.12)
+https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a79f7051cccb6f3bcd3d2a0a058c7d5c79bb0371
+
 Signed-Off-by: Waldemar Brodkorb <wbx@openadk.org>
 [Gerome: reformated as a Git patch]
 Signed-off-by: Gerome Burlats <gerome.burlats@smile.fr>
@@ -21,10 +30,10 @@ Signed-off-by: Romain Naour <romain.naour@smile.fr>
  create mode 100644 arch/arm/mach-versatile/Makefile.boot
 
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 002e0cf025f5..c71299b6f91f 100644
+index dcf2df6da98f..c2155c1a2eba 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -343,6 +343,17 @@ config ARM_SINGLE_ARMV7M
+@@ -337,6 +337,17 @@ config ARM_SINGLE_ARMV7M
  	select SPARSE_IRQ
  	select USE_OF
  
@@ -32,21 +41,21 @@ index 002e0cf025f5..c71299b6f91f 100644
 +	bool "ARM Ltd. Versatile family"
 +	depends on !MMU
 +	select AUTO_ZRELADDR
-+	select CLKSRC_OF
++	select TIMER_OF
 +	select COMMON_CLK
-+	select GENERIC_CLOCKEVENTS
++	select GENERIC_IRQ_MULTI_HANDLER
 +	select GPIOLIB
 +	select SPARSE_IRQ
 +	select USE_OF
 +
- config ARCH_EBSA110
- 	bool "EBSA-110"
- 	select ARCH_USES_GETTIMEOFFSET
+ config ARCH_EP93XX
+ 	bool "EP93xx-based"
+ 	select ARCH_SPARSEMEM_ENABLE
 diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
-index 8986a91a6f31..69cb6404e8ce 100644
+index 98436702e0c7..7e63299ceb40 100644
 --- a/arch/arm/Kconfig.debug
 +++ b/arch/arm/Kconfig.debug
-@@ -1943,7 +1943,8 @@ config DEBUG_UNCOMPRESS
+@@ -1891,7 +1891,8 @@ config DEBUG_UNCOMPRESS
  config UNCOMPRESS_INCLUDE
  	string
  	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM || \
@@ -109,5 +118,5 @@ index 02ba68abe533..835b51bc597b 100644
  
  /*
 -- 
-2.17.1
+2.31.1
 
diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
index fa783f9299..59a6efd04f 100644
--- a/configs/qemu_arm_versatile_nommu_defconfig
+++ b/configs/qemu_arm_versatile_nommu_defconfig
@@ -25,13 +25,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-nommu.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
