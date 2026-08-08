Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CED8C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 15:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A93860641;
	Sat,  8 Aug 2026 15:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWaQEMmFqluu; Sat,  8 Aug 2026 15:28:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EEAE60699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786202890;
	bh=WQ1/lQDdBMC5xXcOTJeskKDT2HorcE7Zh17vOwaEdOw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=VEJ+/lq4+sKFEMq+oCMW/QJWjBCAKXUuUCTugZiQA1VBPYJU3g4pGwq1x49XwlAGF
	 z7d3ez8KMqUadQfO156iAEVidpLQN1MPKcbkYO2NLt1FlAaM2cV4HbPIOLKFmDz7r6
	 KFX9grFz6w4Hh+82MMJxN1Isy/guJA7wZgm/QAjumDmfkyebwN9hzxIcqf/UguZIFv
	 t4HI8Xq/a732GnVTqu86SotbI9rtyMCSvV/t5qF8ohWWMt5nn0yb6PDJUmMZnKBWAX
	 GS1fG2fVomTsK/hj7GmolGvmZwfrJzRAVYOQE9WfRB/onSRI21z1/9YMj2U5116I86
	 MxcUB75c1MKAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EEAE60699;
	Sat,  8 Aug 2026 15:28:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EB14144
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 149024060F
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWAm8CZ5YBjZ for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 15:28:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C4EEA4060A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4EEA4060A
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4EEA4060A
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:28:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BBFCF4E4115D;
 Sat,  8 Aug 2026 15:28:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6D0DE6045E;
 Sat,  8 Aug 2026 15:28:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4EB0F11C48557; 
 Sat,  8 Aug 2026 17:27:55 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sat,  8 Aug 2026 17:27:47 +0200
Message-ID: <20260808152753.1278414-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786202878; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=BdM9YK4uXha86Dboz7mDxTj7fIODnt7gzm8JQmldSJ0=;
 b=WquNOtEAVbuCYtSgN+N8Pn3o0n6vlMojwMsyiZKC1/IVprIuNe6MZ+4juEVfVCN2W1Ld4Y
 rV1MptuEMrUUKeSN072KDXuOyhYiwzOnxjhsPYjNWUJMPMZdfseqzBKxSKFeTF6HDfwgwg
 tlbktYLHCjSibw9oqgXU5acYldwhXeys1MjRAuKKMd5GJXGI85mtx+dyFm0GHmfe9yEkCl
 leQTWpP6Sn1wUcxngslHznrWgz6koXctp1pqKYLul+Ur3Gb+uLCt12QrzlOqEYEVJF1Qdx
 0/S5P8tOm7+RL310GZPDXMYAM4mRLktvDarJLPzgSKAeB2XvpbNghJkUx6pxrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=WquNOtEA
Subject: [Buildroot] [PATCH 1/5] toolchain/toolchain-external: drop Synopsys
 ARC toolchain
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This toolchain is from 2024.06 and has not been updated since then. It
was marked in commit 11a8cdd2bbbd0ef4adf600e4792d75f6f2122ec8 in
January 2025.

A warning was sent to Synopsys ARC people in December 2025, and
despite a reply that some effort would be made [1], no contributions
were actually done. Also, Alexey Brodkin is no longer at
Synopsys. Time to remove Synopsys ARC specific toolchain and toolchain
components.

[1] https://lore.kernel.org/buildroot/SJ2PR12MB818487232470DA4456967C73A1A3A@SJ2PR12MB8184.namprd12.prod.outlook.com/

Cc: ARC Maintainers <arc-buildroot@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                              |  7 ++++
 toolchain/toolchain-external/Config.in        |  6 ---
 .../toolchain-external-synopsys-arc/Config.in | 18 --------
 .../Config.in.options                         | 41 -------------------
 .../toolchain-external-synopsys-arc.hash      |  7 ----
 .../toolchain-external-synopsys-arc.mk        | 29 -------------
 6 files changed, 7 insertions(+), 101 deletions(-)
 delete mode 100644 toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index e2f9d9131f..da69682f93 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
+config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
+	bool "Synopsys ARC toolchain removed"
+	select BR2_LEGACY
+	help
+	  The Synopsys ARC external toolchain has been removed, as it
+	  was no longer maintained in Buildroot.
+
 config BR2_PACKAGE_TS4900_FPGA
 	bool "ts4900-fpga removed"
 	select BR2_LEGACY
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 831387bc4e..9d8c815438 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -14,9 +14,6 @@ source "toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in"
 # Aarch64 big-endian
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in"
 
-# ARC
-source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in"
-
 # ARM (use ARM toolchain by default)
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in"
 
@@ -102,9 +99,6 @@ source "toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.op
 # Aarch64 big-endian
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in.options"
 
-# ARC
-source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options"
-
 # ARM
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options"
 
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
deleted file mode 100644
index 07688a1416..0000000000
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ /dev/null
@@ -1,18 +0,0 @@
-config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
-	bool "Synopsys ARC 2024.06 toolchain"
-	depends on BR2_arc750d || BR2_arc770d || \
-		BR2_archs38_64mpy || BR2_archs38_full || \
-		BR2_archs4x_rel31 || BR2_archs4x
-	depends on BR2_HOSTARCH = "x86_64"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	# The toolchains have libncurses and libexpat in their
-	# sysroot, confusing Buildroot and causing build
-	# issues. Disable until the toolchains get fixed.
-	depends on BR2_BROKEN
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	help
-	  Toolchain for the ARC cores, from
-	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
deleted file mode 100644
index c60cf73460..0000000000
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
+++ /dev/null
@@ -1,41 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
-
-choice
-	prompt "Synopsys toolchain variant"
-
-config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC700
-	bool "Linux/uClibc ARC 700"
-	depends on BR2_arc750d || BR2_arc770d
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	select BR2_USE_WCHAR
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-
-config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_UCLIBC
-	bool "Linux/uClibc ARC HS"
-	depends on BR2_archs38_64mpy || BR2_archs38_full || \
-		BR2_archs4x_rel31 || BR2_archs4x
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	select BR2_USE_WCHAR
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-
-config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_GLIBC
-	bool "Linux/glibc ARC HS"
-	depends on BR2_archs38_64mpy || BR2_archs38_full || \
-		BR2_archs4x_rel31 || BR2_archs4x
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-
-endchoice
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "arc-linux"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-synopsys-arc"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
deleted file mode 100644
index 52273871ab..0000000000
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# From https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2024.06-release
-sha256  080bbf8c0747d221314d04b0fcef89f91dc82710afa1aa66a88f04c93719663a  arc_gnu_2024.06_prebuilt_uclibc_le_arc700_linux_install.tar.bz2
-sha256  37ad59b2624608cd126fab3a83a188edc18ad9e2bba8bbb778d46cdd49ad2ffe  arc_gnu_2024.06_prebuilt_glibc_le_archs_linux_install.tar.bz2
-sha256  6867bc6f895c29b053020423923ead2054b8474816f1d067f2726b13e8ee16c0  arc_gnu_2024.06_prebuilt_uclibc_le_archs_linux_install.tar.bz2
-sha256  6efd9025e4b226bf1b4a4d448670e00f928e61e0051a0b209b7adaa327945a32  arc_gnu_2024.06_prebuilt_uclibc_be_arc700_linux_install.tar.bz2
-sha256  ae2ffb5fbe8d6002341dd87d005400010e85dfc1df1e8db070a19ab7300d738f  arc_gnu_2024.06_prebuilt_glibc_be_archs_linux_install.tar.bz2
-sha256  892a576acdf962afafde345d2c830317cb14ff8ef95da7cadc79177c226db269  arc_gnu_2024.06_prebuilt_uclibc_be_archs_linux_install.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
deleted file mode 100644
index c88ca35c43..0000000000
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-################################################################################
-#
-# toolchain-external-synopsys-arc
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2024.06
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)-release
-
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC700),y)
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE = arc700
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_LIBC = uclibc
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_UCLIBC),y)
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE = archs
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_LIBC = uclibc
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_GLIBC),y)
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE = archs
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_LIBC = glibc
-endif
-
-ifeq ($(BR2_arcle),y)
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_ENDIANESS = le
-else
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_ENDIANESS = be
-endif
-
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SOURCE = arc_gnu_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)_prebuilt_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_LIBC)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_ENDIANESS)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE)_linux_install.tar.bz2
-
-$(eval $(toolchain-external-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
