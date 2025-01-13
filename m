Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4C1E7719F
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 13:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D26860A78;
	Mon, 13 Jan 2025 13:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBttconmsE-y; Mon, 13 Jan 2025 13:03:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2FBE60A98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2FBE60A98;
	Mon, 13 Jan 2025 13:03:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2062A95F
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DED940342
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jN1T50iL9jRq for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 13:03:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 42EB640325
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42EB640325
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42EB640325
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:29 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so3332196f8f.0
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 05:03:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736773407; x=1737378207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TG1WMlOpPNRVM5mZUBck9pJ7f7bQ3e/SgFfFz3noTpY=;
 b=drTH3hzq/6SY8VA8h8LakSxSUHv0tdYN4DzRXEHbQ1/5ioHcg1UAuLNA7pVghW8/ox
 k9TY7BADGYBZ9nWrTpiI04lL0SmBo02Y2F1aurv335Ecd/sI+pESzVvie/nVADhACbqD
 Z2gFjz6QFPv6i/cyysqu0qpJoPTiUWUo5H429Pc+4y0apnDjsMoCl0fqNM/FvTZ8rfnw
 cDxKE/7uZvSr4cioEwu4Yu0GCiXj7BVhUQE5+N134uxvHD/bRCj+1Ex3PGM8FEuK7wFb
 /VCQ0hqC5xdurOGrerT/VDed25+lOt6Y5LYf24Zgptaz9e8qnq34VFSmKf0GItcPA8du
 vQ6w==
X-Gm-Message-State: AOJu0YyvUBcqueuRJLcFAN0xJZAkthqVhLFV5jmmEYhxttqVoO63EUkZ
 CSjgh4loaZoYRV9XOf7YQYPqSVXP4ss4rAMFR15a8/7xF7NQSjwwZ2jpwL4R3hjdD7/oXUA2vc6
 b
X-Gm-Gg: ASbGnct6T5+Dw9YcDoOpYY/e9x51I1Nmgiybp50DNPt0jxAqS/8FgcrC4puYQ97f+ID
 7KynG7dUC03xJlMwhy4RvFDp4Y6D60fRU5omXsBMcYZ5gJkopsoyVKrcxZ2/EWPbZ/0QCjUQ+hi
 F9Pb8dzA5mX/YfucBw38uH7FjtoYB8u6ahZMlip/aSfcUrvFcQul3yI7QaVMtHBjlA1oAU6y8ly
 Nn2j/ysoN8Z1Nm6GdGqHJ40vytiVyhNMddO8963Wm9zzc/LjaI6JfT+LjvicxV+vJtnvWzznF7n
 InLq4fl1p5RC/6G27sCT3ElSDh4TAYpYPxIvRJ1+sMsziUdhGX0Vdw==
X-Google-Smtp-Source: AGHT+IEZk6b2ii7Swba02YqGjAHZOV3SXyBWtgx1LRn9chw/e4+T982/UdkWpIfPr8+v6Wk11TDdlg==
X-Received: by 2002:a5d:59ae:0:b0:381:ed32:d604 with SMTP id
 ffacd0b85a97d-38a8b0d3443mr16952135f8f.10.1736773407089; 
 Mon, 13 Jan 2025 05:03:27 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b80d4sm11812279f8f.85.2025.01.13.05.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 05:03:26 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Mon, 13 Jan 2025 14:03:20 +0100
Message-ID: <20250113130322.3962035-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113130322.3962035-1-romain.naour@smile.fr>
References: <20250113130322.3962035-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736773407; x=1737378207; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TG1WMlOpPNRVM5mZUBck9pJ7f7bQ3e/SgFfFz3noTpY=;
 b=CYKk1LnqGuDOWTJVzHyFrlRmrEuMQ0VNxsXh4CODf+6o0M+7RTpMQo9xt7de3fYHAV
 OnlPNqvgP/O2K3t0p12lKTwR9+6CcLKBtjCSQiPM1lGrmUwXWH3N+v2T3me/dNt9U+Ig
 4G7ucPVxKIur3Af7z+ZSsPNFaD12ugPnPtEcU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=CYKk1Lnq
Subject: [Buildroot] [PATCH 4/6]
 toolchain/toolchain-external/toolchain-external-arm-arm: bump to 14.2.rel1
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

Tested with qemu_arm_vexpress_defconfig.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../toolchain-external-arm-arm/Config.in               | 10 +++++-----
 .../toolchain-external-arm-arm.hash                    |  8 ++++----
 .../toolchain-external-arm-arm.mk                      |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 683854e05e..7b1a7fb27f 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -3,23 +3,23 @@ comment "Arm toolchains available for Cortex-A with NEON + EABIhf"
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF || !BR2_ARM_CPU_HAS_NEON
 
 config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
-	bool "Arm ARM 13.3.rel1"
+	bool "Arm ARM 14.2.rel1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_ARM_CPU_HAS_NEON
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
-	  Arm toolchain for the ARM architecture. It uses GCC 13.3,
-	  GDB 14, glibc 2.38, Binutils 2.42. It generates code
+	  Arm toolchain for the ARM architecture. It uses GCC 14.2,
+	  GDB 15, glibc 2.40, Binutils 2.43. It generates code
 	  that runs on all Cortex-A profile devices. The code
 	  generated uses the hard floating point calling convention,
 	  and uses the NEON FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index 6d4facfdad..9a657a5ed4 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz.sha256asc
-sha256  560267bdecf966b7a48467d0af6c81a85b906ef7b0a9b9dd91f506184b940281  arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz
-# From https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz.sha256asc
-sha256  377d11ec2b55c55306d435d3f2e3760f92efafa649393d5b6778457b3c8af1ab  arm-gnu-toolchain-13.3.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz.sha256asc
+sha256  32301a5a33aab47810837cdab848a5a513ca22804d3168d3ada5833828b07912  arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz.sha256asc
+sha256  3fe832f9c831323a37ff54bfb5ac7a083acdd473f2c93feaf0cb3c1ac690d739  arm-gnu-toolchain-14.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 84e0e18276..86937a7412 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 13.3.rel1
+TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 14.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-$(HOSTARCH)-arm-none-linux-gnueabihf.tar.xz
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
