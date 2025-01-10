Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34584E77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 19:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F40DB60BE3;
	Fri, 10 Jan 2025 19:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vr8d4P7FP3me; Fri, 10 Jan 2025 19:54:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B01A060E53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B01A060E53;
	Fri, 10 Jan 2025 19:54:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0567942
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A17CA409F2
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kcK2TwBAgIsk for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 19:54:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E597F40903
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E597F40903
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E597F40903
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:09 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso17992465e9.1
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 11:54:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736538848; x=1737143648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=syrn7VJGwvrqFwAis7MfCIEttIqdZYjWuI3K8D7Yaz8=;
 b=WtcCn8aMNymXWaf8dGsxNS7kXKozpBSdLrrVfgvjIFWn+efRgO3gKsoNdPaeSn8i3T
 ev1RXazodZ99LVsLjr7rp9yJm5xEjKRWAu761x4RwRdS3YIGCsV7QJpaI40JdDHCueQv
 yWLnv/yZy0qidzNs32J1zcny7ZwkDnnFlbDSCuAxpmNsg8SqqDuzOfquX6Kh9+N7OtAO
 48HcYwptJa1eJQc409jbWSd/w3gQ9BNVzP+6YQ7aufHlmqoivhyylm9jTAFBVmeEsHl7
 o7Jd4rpXm8an1tP8mlmv7ik9pWY9VfA2anBovFpKbWZP5LEByNRELwitDjsv0tAVZSPH
 1Xug==
X-Gm-Message-State: AOJu0YzvQk+ctCMt0vhgIt0DKo1VaDLg72XI6vtqyEyrLen6eDFBjiG8
 TCqe2qTSYhUBBs1l9r8Y701s3wes70+++dsi/EDSwyCZ06qbchnJBbepEdzZ5NvOdRDtS8Gqr0H
 A
X-Gm-Gg: ASbGncuICoMLysYv3hb9brwdj3bQE3xEL6SCxWRm+YIdlFhDKpY6z0B9JjEXSVMlG9a
 gB2gvysTyfzP1F/Lo4bSjLMRtogi5/vXwuGCPOfS5J4bq7dX40F+jlk8EBvdxYnSjJlGACKuJB5
 +2iCo7ZQ72VTtEIDyPSwTmavcju0f24+Dz1ihzmAqi8dR4nJ6QrlbSbvGb4Nn69L/JcEOZgjNrB
 9BWAvP98K64DWGXYWbCsmBvMeKoDYDiJhhaQ3ZMALeBaF0Tr11BUIP49CmtWS9ftL9zUTRDN+ow
 TZgIA+Grm3OpFEOjsWmPpBqGuHwo57xioyjU+q7CyFS1T72ldY9i0A==
X-Google-Smtp-Source: AGHT+IFkKgFZsh8FKzfQ0cFUv5vd+axlx2fD3pDD59yKWh0a3+I48uwuAKErNuut/4357CVACW5R6w==
X-Received: by 2002:a05:600c:4ecd:b0:434:f335:83b with SMTP id
 5b1f17b1804b1-436e269723emr121712605e9.5.1736538847878; 
 Fri, 10 Jan 2025 11:54:07 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da66fcsm96439635e9.6.2025.01.10.11.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 11:54:07 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri, 10 Jan 2025 20:53:50 +0100
Message-ID: <20250110195359.3358022-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110195359.3358022-1-romain.naour@smile.fr>
References: <20250110195359.3358022-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736538848; x=1737143648; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=syrn7VJGwvrqFwAis7MfCIEttIqdZYjWuI3K8D7Yaz8=;
 b=uzD7HRPe+TxSDf/btJKc5bIHi3RmgXz4mIJAC+t+zPnk5k3dVEVj/zzbm5kaHelNkv
 25uewGHLWC4q7U+6/jmrfRFSI9nI6N/9bb5wp7aRKlX19T54kFbC/3ysFF1nlpFUPPtV
 crJcXxaS1wXPIJyueFn3cikEl7vGBqH4qepuQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=uzD7HRPe
Subject: [Buildroot] [PATCH v2 03/12] toolchain/toolchain-external: remove
 Bootlin nios2 external toolchain
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

We are going to remove nios2 support, so remove the Bootlin nios2
external toolchain.

Remove this toolchain from the Buildroot testsuite.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy                              | 12 +++++
 .../tests/toolchain/test_external_bootlin.py  | 28 -----------
 .../Config.in.options                         | 50 -------------------
 .../toolchain-external-bootlin.hash           |  4 --
 .../toolchain-external-bootlin.mk             | 12 -----
 5 files changed, 12 insertions(+), 94 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index fd12f8d49f..54c251be1f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,18 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
+	bool "Bootlin nios2 glibc bleeding-edge toolchain removed"
+	select BR2_LEGACY
+	help
+	  The nios2 Bootlin toolchains have been removed.
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
+	bool "Bootlin nios2 glibc stable toolchain removed"
+	select BR2_LEGACY
+	help
+	  The nios2 Bootlin toolchains have been removed.
+
 config BR2_PACKAGE_DIRECTFB
 	bool "directfb has been removed"
 	select BR2_LEGACY
diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
index c137444cbc..6bcebf80c0 100644
--- a/support/testing/tests/toolchain/test_external_bootlin.py
+++ b/support/testing/tests/toolchain/test_external_bootlin.py
@@ -1653,34 +1653,6 @@ class TestExternalToolchainBootlinMips64r6eln32UclibcStable(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
-class TestExternalToolchainBootlinNios2GlibcBleedingEdge(TestExternalToolchain):
-    config = """
-        BR2_nios2=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-    toolchain_prefix = "nios2-linux"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-
-class TestExternalToolchainBootlinNios2GlibcStable(TestExternalToolchain):
-    config = """
-        BR2_nios2=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-    toolchain_prefix = "nios2-linux"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-
 class TestExternalToolchainBootlinOpenriscGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_or1k=y
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 098e44fc36..1bbc0239e6 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -22,7 +22,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_mips64 && BR2_mips_64 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_mips64el && BR2_mips_64 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_mips64el && BR2_mips_64r6 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
-	default y if BR2_nios2
 	default y if BR2_or1k
 	default y if BR2_powerpc && BR2_powerpc_440fp
 	default y if BR2_powerpc && BR2_powerpc_e300c3
@@ -2782,55 +2781,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE
 
 	  https://toolchains.bootlin.com/
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
-	bool "nios2 glibc bleeding-edge 2024.05-1"
-	depends on BR2_nios2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	select BR2_TOOLCHAIN_HAS_OPENMP
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	help
-	  Bootlin toolchain for the nios2 architecture, using the
-	  glibc C library. This is a bleeding-edge version, which
-	  means it is using the latest versions of gcc, gdb and
-	  binutils.
-
-	  https://toolchains.bootlin.com/
-
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
-	bool "nios2 glibc stable 2024.05-1"
-	depends on BR2_nios2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_OPENMP
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	help
-	  Bootlin toolchain for the nios2 architecture, using the
-	  glibc C library. This is a stable version, which means it
-	  is using stable and proven versions of gcc, gdb and
-	  binutils.
-
-	  https://toolchains.bootlin.com/
-
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE
 	bool "openrisc glibc bleeding-edge 2024.05-1"
 	depends on BR2_or1k
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
index adc42531cc..daa5c4cc79 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
@@ -212,10 +212,6 @@ sha256  cce09fc456b592a993a7c8d182cdd1f04397a8160f176d9ac6799d8e2e09cef7  mips64
 sha256  e12b6536fbacb624b0d938345fb29b202c8b174893d0d8fbefde46fbe727c729  mips64r6el-n32--uclibc--bleeding-edge-2024.05-1.tar.xz
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--stable-2024.05-1.sha256
 sha256  a0db853f4c40d120d22e6762ca4bff64e0c3e3db74ab59950967917aeb9bf330  mips64r6el-n32--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--bleeding-edge-2024.05-1.sha256
-sha256  5d034a538a8613ef324ae96f097c122ed99574ec8707e3274743e4d79efd374c  nios2--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--stable-2024.05-1.sha256
-sha256  db7a12e0b22037f3aad01cd126b5f1bfe7dc514e37f8c484eb587b861f20fbcd  nios2--glibc--stable-2024.05-1.tar.xz
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--bleeding-edge-2024.05-1.sha256
 sha256  0de17cd13642f71f112d086c1df4b34670440ceb459478a0f3d55007945633ca  openrisc--glibc--bleeding-edge-2024.05-1.tar.xz
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--stable-2024.05-1.sha256
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
index 18639db1b3..a3d8ce215c 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
@@ -642,18 +642,6 @@ TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--stable-$(TOOLCHAIN_E
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = nios2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
-TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs
-endif
-
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = nios2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
-TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs
-endif
-
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE),y)
 TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
