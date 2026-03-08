Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEC8EA8548
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 21:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B298640B31;
	Sun,  8 Mar 2026 21:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qtt5aoWLpGah; Sun,  8 Mar 2026 21:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B259940C46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773005639;
	bh=uLa2YvfW8qoakwqIrT3SWy3tK7gfovuRMAWtK9f7S9Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jdkEyykww7q1zBJSwEKe/h4+EK6PgEw2OHdEn8fElfwWY/xlAD+ki773DO+TyI2Yx
	 sMezQntAthho6m6BMW87UuhN+1O3vEHHjtVqqFyos4QoCUKtdENx330bhNKz34YMWs
	 oGi1qTY7S5truBHxE0luLOaznIs/Af+z80VHixxsrDzgaRInXiiuqq7b2Oa38RQDE4
	 /Cnp2I2TaBsNOVABUUyV91PpJUr0F3f9dwO8sKyCcAggeGReNuYFHiElDQN8g3Z35u
	 VUCyc/lEEAEVU0MlwV/C4v3nbkDM/a5nugdmn2ZVPMg196CsltyGGQ+FiUEfToPUTQ
	 T16Pdd2sJWJhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B259940C46;
	Sun,  8 Mar 2026 21:33:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AF2A119
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60CE040B2D
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tp9TTbpOzcuC for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 21:33:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2761740ACC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2761740ACC
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2761740ACC
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:33:55 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so127532765e9.1
 for <buildroot@buildroot.org>; Sun, 08 Mar 2026 14:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773005633; x=1773610433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2CysJFBQ3E2NDqcWMBMXXm9uriOUa53e7M5u6JRvkFk=;
 b=bKJSLOGnAseX2A7YoTuPd+wqu0zZN+eXMZWLVkhYa6GTsoi6I/e1T9u4whCWxvYT+B
 TQY7XXvX3BODxpSzXktYjBX/1EDiN6SETZxQ1oLkDvWPqxr91yU/MLnJY+ANtELp7qBe
 Ndfk6/jAAVgu+lb5lQvImlPdfmU5SSpmWRh+mCaDl5HulNcKJCaf2xuC4lBSj6lerwuP
 w1vdvIzoua1E69Nm1Ddk9f5CC/2PfNudU5lSycobUyCbTQG0oi36e5gAEBd+zga00HBs
 YEcy/LKOAxEMurv+N5bhf2TWp3YRQ3cn3cW1hs7XxgR3kqSpzuWAd200RmPJYeWQsLPJ
 PiyQ==
X-Gm-Message-State: AOJu0Yx+LF33mDOUD0YARtblft9qk0ij6KhfwRqYObEOxyB0dZSCLAi2
 AKaWDDOQPvYrRkgHvxIHfRRNcCPQ68nx2gxdsBJWP4+SKmw6AT6Og7tMeorFxDtB4xik5XfBvEl
 aowYN
X-Gm-Gg: ATEYQzwaeQ+mq/bYmjPMLxZQIEAXuYt4Zq8iofvYm8zBncx79dJ/Srm5LPul4AlOLcV
 ICeOfOvOb69ERXA/VDF6i6je8BBZkuHpnQtFAyfe5h3N6GKtK/DYhCI7/9cjxBcqEF6LrSMC+YC
 Fl2X02oBRpWakFunAUObc7vvtTUD8YeHlvtHIT3fYpIU+Z27wDC4GNMReJ/eL6hspK+ZKCHuVmf
 mxe9mwK5Dp18yltfZb5MRBWj8WfBFBile84Iotj0/mDtPwDzbUX2+sO+t0cP3e9YOHjQG6ivPid
 HtaeOHmCWokH1l0TzarsupYUSoWqC75qhreV06auuIaCOEgUKiKtV32g5lZ6e2q2WbvoqbVorIi
 fC6x99yCzIACsYXT06w2rQP/rccTxXhNmqRb4B49fxsuQDXNjgC2gJcCaHvOwNSsxhC3L0wFocM
 MgiMbXO9xL15CSIJ1MkyonT5/eqOg0pE1etNId0y4d0SfuJc+Z5SLE3ZjGSm9OTesJk5isOBSzC
 XPcJUfoor02JjzTqx4HOeFzymfQGD77hLoT
X-Received: by 2002:a05:600c:64c7:b0:476:4efc:8ed4 with SMTP id
 5b1f17b1804b1-48526923bbcmr141094165e9.11.1773005632991; 
 Sun, 08 Mar 2026 14:33:52 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb3668csm458929445e9.13.2026.03.08.14.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 14:33:52 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun,  8 Mar 2026 22:33:47 +0100
Message-ID: <20260308213348.708846-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260308213348.708846-1-romain.naour@smile.fr>
References: <20260308213348.708846-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773005633; x=1773610433; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2CysJFBQ3E2NDqcWMBMXXm9uriOUa53e7M5u6JRvkFk=;
 b=RzDrASNI1KoUyeIwiRaQKxbZgu8I82kpz/2wwNu4luqQIfZzNjcbR7BtVIjmbchFG6
 ENk6dMX7JRf4HkYuuFBEnT/On21yEQpCX6zZ8ceD3VbIi/rYK+kFHX5dWUaWjxGD90N1
 n/QyWiiYea15txK+kaHMXILQWoQxNHlH/EhQU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=RzDrASNI
Subject: [Buildroot] [PATCH 3/4] configs/beagley_ai_defconfig: bump linux to
 6.18.16 and u-boot to 2026.01
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace OP-TEE TEE binary file tee-pager_v2.bin by tee-raw.bin using
the new option BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_RAW_BIN.

Remove unsued linux-headers.hash since we use a prebuilt toolchain.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../beagley-ai/patches/linux-headers/linux-headers.hash  | 1 -
 board/beagleboard/beagley-ai/patches/linux/linux.hash    | 4 ++--
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash         | 2 +-
 board/beagleboard/beagley-ai/patches/uboot/uboot.hash    | 2 +-
 configs/beagley_ai_defconfig                             | 9 +++++----
 5 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 120000 board/beagleboard/beagley-ai/patches/linux-headers/linux-headers.hash

diff --git a/board/beagleboard/beagley-ai/patches/linux-headers/linux-headers.hash b/board/beagleboard/beagley-ai/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/beagleboard/beagley-ai/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/beagleboard/beagley-ai/patches/linux/linux.hash b/board/beagleboard/beagley-ai/patches/linux/linux.hash
index 794837b285..eb4dcee958 100644
--- a/board/beagleboard/beagley-ai/patches/linux/linux.hash
+++ b/board/beagleboard/beagley-ai/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  2bb586c954277d070c8fdf6d7275faa93b4807d9bf3353b491d8149cca02b4fc  linux-6.15.6.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  4f21c01f4d04c1d1b3ed794153f8900802c92497be620b07c4869530f2d28ee3  linux-6.18.16.tar.xz
diff --git a/board/beagleboard/beagley-ai/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/beagleboard/beagley-ai/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
index 440526977b..b6a925ea4e 100644
--- a/board/beagleboard/beagley-ai/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/board/beagleboard/beagley-ai/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/beagleboard/beagley-ai/patches/uboot/uboot.hash b/board/beagleboard/beagley-ai/patches/uboot/uboot.hash
index 440526977b..b6a925ea4e 100644
--- a/board/beagleboard/beagley-ai/patches/uboot/uboot.hash
+++ b/board/beagleboard/beagley-ai/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/beagley_ai_defconfig b/configs/beagley_ai_defconfig
index 67516d8681..d0a3bf58c4 100644
--- a/configs/beagley_ai_defconfig
+++ b/configs/beagley_ai_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beagley-ai/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.15.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.16"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am67a-beagley-ai"
@@ -28,22 +28,23 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am67a_beagley_ai_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am67a_beagley_ai_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_RAW_BIN=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
