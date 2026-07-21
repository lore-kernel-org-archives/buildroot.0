Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D22BC44537
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 18:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D321880ECD;
	Tue, 21 Jul 2026 18:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZSBLytUG5hii; Tue, 21 Jul 2026 18:43:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E0C180F49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784659396;
	bh=/9yQo9+IdnYml6A0hJwbjP9fkaHTTubJS/UKDnqN1io=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JS+RuCIksOrEXEH6nXvZJ9CGdvMddqUMYU3U9gAFSCgZ0nBHIzyCbI5DYhrxGvcw4
	 7c6zQ9ekc7AMniBsWkhS8ATpsIFNIDRjT2MfnAcMQkYVjQW8HkTHiUMP1sovLubfQY
	 SKOXhRox2lkXLvKzN8kA7h/zQPnEx6OA7rW98aFFRRMk9QgXl6Hr9O/+uHT4lRlgWd
	 V2NLOfHawBHzMa3Px9XqaB+Ra3b9UE95DjazdMc0LpwvDU3gCpyqr/nbgaoKEi+tu7
	 /2j8JZHVccLswb+tZyfDS/PdX9Xb++smMvhxUTdIOw0oivfp596LxqsGJEaDFipv/Y
	 5GYAJxGe4Mc/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E0C180F49;
	Tue, 21 Jul 2026 18:43:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CED9109C
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F26F402F4
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gEZi9EfIrKuL for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 18:43:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D42E3400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D42E3400B5
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D42E3400B5
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:11 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-49553515a8bso38182995e9.1
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 11:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659390; x=1785264190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NZM+RVOmxC3VAQfrQVdht75iopJo5b7uOW2uRhF9txc=;
 b=fmPq7vh9I0oBNCsze1gJZ42nE9vbRUMtifPcPZUP+mMhCWG6+7mAhyU4fyfV0VJHn5
 XkM8ktiz4/gerxRyopTb2MyixSBBCeInGq5EKZtd/0Yf+8MOrpFb9xILhkutULVwQuU5
 9q7kPjsm/CK8d2kIbc6s39WpD+1cLjGxGMFe3toAsvj76DeIQHQ7yQ9aBQwmCmqL9c00
 AQfg5MSLgOG+fBr7JJtSsdttOtsAmTQ04HBusmxbDt1FF7aCVIPD330cOW7gD4Qkb3c1
 pRVRUvi36nox0r4e3pgfWK2JcFvSOC4OqEtWjmSHJWeKdGbln3Ahxm6lYx0OpkksgoLG
 y2sQ==
X-Gm-Message-State: AOJu0YyBP5rpRQrtHsDhw2880IqPSLIZFKdTv2K8pMrKxptTNc3t/zyM
 Kp2M4QbUysHQDxqSyg+pH0q8C/+4tLGBLojIV2Gbtu8uM22CFfqHyLJwpBA8YLGGbC1Mx4aKZym
 rdAcZ
X-Gm-Gg: AfdE7cnl1DaXh9WnZsNqeT9QjFkqjGlnnvbzMMTwXF0701aBb45VrWQ2yiA49opl+r/
 M3BsG5TzLCO4NXve2rV3GkyswYAZ1B2LEBqmxjRiU2BV7TpZ+cu8uPWywGfMFE6OZUMyGjucUfd
 xM1aivo7ETTtsseyuFIneqGZjWWTIh/9ig2c8F3+2TiUYXYJ3Tl1luvLH3wh5yCMV8JswPlZwlP
 vFTOQhOJk8yNyG/vSkLKEGpAyz/k6i/kCDQ5sRzNjxRgyp4UUoh+dxLmNGNCaeq8GnBIWnKc9oW
 LWB75GqsqgVecatbC2H6aU1XTuCPvoHDqrKwbUNwPu5YhzY/WpTDYrSzb2rj1kH2bHhYDSfzbkW
 UOwkoc0k1TEhS+c1tbP6eimP3YTa7icIzZKi+bSIepMX0TCpHn2ReSTtXnHplldFQfRdA+K8Cxx
 3IEpxgNxnktZq3ao1ID2Q9XaTkyLE4sKiTxzLTo1c3e3qR+8EQpudt/mPL0rfG1slgaWyaGUAf9
 l5bnxFri5IqYdKRAfR2E43J/c3nCAaDPD0PmvdMOA+OiaKYAT7rP2GkIE1ESZ4ZK+tRWaNjoXsC
 uVMlT4873Fs=
X-Received: by 2002:a05:600c:3b8c:b0:495:5039:391c with SMTP id
 5b1f17b1804b1-495503939b1mr197995625e9.26.1784659389845; 
 Tue, 21 Jul 2026 11:43:09 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956b030a64sm226505e9.3.2026.07.21.11.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:43:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue, 21 Jul 2026 20:42:49 +0200
Message-ID: <20260721184249.1579381-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721184249.1579381-1-dario.binacchi@amarulasolutions.com>
References: <20260721184249.1579381-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784659390; x=1785264190;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NZM+RVOmxC3VAQfrQVdht75iopJo5b7uOW2uRhF9txc=;
 b=iT0KQoqTwVdod8aBPqtZZBGgSACiEGNjNS5WRzlJU6MljFr7NoJ8pZOhAVZ4hKDxBR
 0PVjPYvb8rDOqRDGDVwbHwBsc041s7TPzWuvovjMRX115CXiAzwXlyAHe+cAPZebnp2F
 hyfNgMGuzz1blUjok9ts7SGVZiht+txbX8gwY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=iT0KQoqT
Subject: [Buildroot] [PATCH 6/6] configs/stm32f769_disco_sd: bump Linux to
 5.15.211 and U-Boot to 2026.07
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 5.15.211 and U-Boot to
version 2026.07.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f769-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f769-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f769_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
index 7929b2b9e344..b4a6bbd3f783 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
+sha256  beb954e53617928b751944a89b6670bf9a9c7177c641b24c5dba504e46f1d961  linux-5.15.211.tar.xz
diff --git a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
index 36322a6a904c..ff6e4ed2e2f6 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index d09b81b19b3e..602d3e8018ae 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.202"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xc0000000.config board/stmicroelectronics/stm32f769-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
