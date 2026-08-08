Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBC2C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 15:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3941B606A2;
	Sat,  8 Aug 2026 15:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9N2D4pQk__9; Sat,  8 Aug 2026 15:28:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2746C6067D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786202889;
	bh=WMv9aJGPUZLGTfyhyR8rB+hrbKleU6922NPq+OI2gko=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GMwSf16pEn+yGhuoqIIm7+O8hEww+DMcMWWUbLXo6Dz6mAlu2pxVOeZganjW7kjzr
	 r1TuZV1o1qK5cQbW8JqfnTg8oCdUpCe+J/qja/Zi85AiaAwqoCsUYlObLA+htCw3Y6
	 0OlHqq+ayhJOFAaBqmJzuzPbvi/KVLEBAdikPICZYVezkcExqywDmiE+Ny3hQBR5TC
	 aSe4M9TyEqj+cd223+ss7PEp5CpTjFX/GJmZu/JghCG1bBRH69y0wX50Cu3vWwC7et
	 WiEmNvSLhays9rR5+BTyZS1eqyWh2+mFgV5CZ3qHILGzoOq/7ByswtA91wB2VvPelz
	 SbdKdS5l+4shA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2746C6067D;
	Sat,  8 Aug 2026 15:28:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09106282
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E37044013B
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXZjaSH0JYdg for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 15:28:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C54CB40137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C54CB40137
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C54CB40137
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:28:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CB39B1A14EB;
 Sat,  8 Aug 2026 15:28:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A07F76045E;
 Sat,  8 Aug 2026 15:28:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 76E2A11C4855E; 
 Sat,  8 Aug 2026 17:28:03 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sat,  8 Aug 2026 17:27:48 +0200
Message-ID: <20260808152753.1278414-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808152753.1278414-1-thomas.petazzoni@bootlin.com>
References: <20260808152753.1278414-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786202884; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=SdPp0Z4bZ65QX3geylwdEirNausWjSkeKip8EPnJkRo=;
 b=gWPJ9R2bWJZQ0k316DZ0nmMkGSk7xHYPICxGWSdFwssJgTzG+NHXyIdOvSpGGuQxgslr7t
 YIjELF39e6DxgNHLcpmxCpHvIDL/PBtNAclHFOEy0eS/nFZXEabupqc845V7WpB5SHTCs0
 M8kcv3E6x4PyVK/gpW6iSxuUiz2eZBkB/t1NTFACURiZqKwuxyBFtovKbRpRnbUTJWXmN+
 g6HbCQHDtpXkhuDwnfQF0AEof+oeGJJccGSBqqhdb3LXJK2YV7gmYc3jjRC/TExVxEyh35
 gmSA+nhtTP6gY+VoC/BrdUGK3+vjA1lDAqC+4cmjN56K16woTTPJ9gEmDwA4+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=gWPJ9R2b
Subject: [Buildroot] [PATCH 2/5] package/gcc: drop ARC-specific version
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

A warning was sent to Synopsys ARC people in December 2025 that the
ARC support in Buildroot was poorly maintained and in particular the
ARC-pspecific toolchain components. Despite a reply that some effort
would be made [1], no contributions were actually done. Also, Alexey
Brodkin is no longer at Synopsys. Time to remove Synopsys ARC specific
toolchain and toolchain components.

This commit removes the ARC-specific gcc version.

[1] https://lore.kernel.org/buildroot/SJ2PR12MB818487232470DA4456967C73A1A3A@SJ2PR12MB8184.namprd12.prod.outlook.com/

Fixes:

  https://autobuild.buildroot.org/results/9f2d41d503916d11f3e23b64fe0656ce9ee7f778/

Cc: ARC Maintainers <arc-buildroot@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy             | 9 +++++++--
 package/gcc/Config.in.host   | 9 ---------
 package/gcc/gcc.hash         | 2 --
 package/gcc/gcc.mk           | 6 ------
 package/harfbuzz/harfbuzz.mk | 4 ----
 5 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index da69682f93..2c8a0f1a04 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
+config BR2_GCC_VERSION_ARC
+	bool "ARC-specific gcc version removed"
+	select BR2_LEGACY
+	help
+	  Support for the ARC-specific gcc version was removed, as it
+	  was no longer maintained in Buildroot.
+
 config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	bool "Synopsys ARC toolchain removed"
 	select BR2_LEGACY
@@ -6269,8 +6276,6 @@ config BR2_GCC_VERSION_4_8_ARC
 	help
 	  The option that selects the gcc version for the ARC
 	  architecture has been renamed to BR2_GCC_VERSION_ARC.
-# Note: BR2_GCC_VERSION_4_8_ARC is still referenced from
-# package/gcc/Config.in.host
 
 config BR2_KERNEL_HEADERS_4_0
 	bool "kernel headers version 4.0.x are no longer supported"
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index d8b89d942c..68da9aae73 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -2,19 +2,11 @@ comment "GCC Options"
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_ARC if BR2_GCC_VERSION_4_8_ARC # legacy
-	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_POWERPC_SPE if BR2_POWERPC_CPU_HAS_SPE
 	default BR2_GCC_VERSION_15_X
 	help
 	  Select the version of gcc you wish to use.
 
-config BR2_GCC_VERSION_ARC
-	bool "gcc arc (14.2)"
-	# Only supported architecture
-	depends on BR2_arc
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-
 config BR2_GCC_VERSION_POWERPC_SPE
 	bool "gcc powerpc spe"
 	# powerpc spe support has been deprecated since gcc 8.x.
@@ -71,7 +63,6 @@ config BR2_GCC_VERSION
 	default "14.4.0"    if BR2_GCC_VERSION_14_X
 	default "15.3.0"    if BR2_GCC_VERSION_15_X
 	default "16.2.0"    if BR2_GCC_VERSION_16_X
-	default "arc-2024.12-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index a1230d758e..49f87e25bb 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -7,8 +7,6 @@ sha512  0de9e296153b52c021b1c7e63c9c62151d7a0ac03f23ce6e9f772c1b0eb783f6acdd81cc
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-16.2.0/sha512.sum
 sha512  c51c30ca7422d0cbecf504b2e0f33c3aca31e0f90a76b65217f465163fa6fa17b3f5de39e145c47e5bab90ac0ce7fff3b03c8d553ae36e01faaea5a50f8648d1  gcc-16.2.0.tar.xz
 
-# Locally calculated (fetched from Github)
-sha512  7f08ae335d9112be65e92c3744c095d8fa265994b8282274948f99fe37409531e627e6dadfb77b138a82fa09d012c56d8c075b482a5a5186814a57f9db63c29e  gcc-arc-2024.12-release.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index ea96286c32..9109777bd7 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -9,14 +9,8 @@
 #
 
 GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
-
-ifeq ($(BR2_GCC_VERSION_ARC),y)
-GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
-GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
-else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.xz
-endif
 
 HOST_GCC_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
 HOST_GCC_LICENSE_FILES = COPYING COPYING3 COPYING.LIB COPYING3.LIB
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 77d96febf3..d87d2c41bf 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -94,9 +94,5 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 HARFBUZZ_CXXFLAGS += $(TARGET_CXXFLAGS) -DHB_NO_MT
 endif
 
-ifeq ($(BR2_GCC_VERSION_ARC),y)
-HARFBUZZ_CXXFLAGS += -O0
-endif
-
 $(eval $(meson-package))
 $(eval $(host-meson-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
