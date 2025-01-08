Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6ACE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 23:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FDF480DE2;
	Wed,  8 Jan 2025 23:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TehyQMg5OMC2; Wed,  8 Jan 2025 23:05:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B110380DED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B110380DED;
	Wed,  8 Jan 2025 23:05:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 824741FF9
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A42D607A4
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_GlM45aAEyV for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 23:05:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB65D605F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB65D605F7
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB65D605F7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:29 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385e06af753so163646f8f.2
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 15:05:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736377527; x=1736982327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=syrn7VJGwvrqFwAis7MfCIEttIqdZYjWuI3K8D7Yaz8=;
 b=Q2xTQL4pCPQRe4gMP/oosFBCQm9qNCgD6zG68qeL1uAHxzGvsNPCxUQLJqGC09NN4h
 dD2V5Qehp1AHvdu9nxiXtC327R7Td8MDjLApyC2VN3igZeBy4lAz14lT94r8efXsTHh9
 V8LYyDj6H1k9Oa2HBnGrsiuFmWQY+/yCcCAgMfc45x1g6gUX8/qT/1Le3Bx1GFP7gHjv
 njeayQI0N3uiE/oWq5YNgJBGWLi0ghDjxgPaFNpkcyfdqPKgok7JQJKEqoRSHrAZycpr
 JBpoF5yeCRZpQ6LTDZSZfin5yzlIUSh03/n3VrXGM2wzrgBQCsg0o9jQO7rPTk00Hk+p
 omfw==
X-Gm-Message-State: AOJu0YzZlKsZUQU7Pj3FJoe9z3e/MefWVUHcGXCYvaGEGqjtXp9AAKJn
 Iz3djT3zRDLcp//vn52/8PP3Dh7B0eGsNpUN5lXfBOYBYSFT6OATdMyDLTezuDgjW95LPqkzpAu
 m
X-Gm-Gg: ASbGncvTdXaeFcWywT7qN6e9YXHcBanme0dDbtJ8SHHFaUsDIB77bTOqkWWwlUjAsDW
 MUrsAenvc5aOFC2w3q/KLwvbqQC6gaHoVayip15erB13XJZe0s9MXfuT5up7Lvz2x6FRSa2qBPx
 jfiJAgIcyR1AiehAJ9bUb99/AZHZ0rEsYy+GjYfoMmECeULyn/b3PztVlhaMowVuQqgC3ZLT2qA
 S6+2bWrUJWyYDYPEFKCfLB/1JLnTPmYrsMvkKuAUKcuy6D6PrR/8QjSYV648Nlc5fIsukkEWaBE
 EIBxhhQG7/qcDjGVOdT1dGZZaHxeW8ZAIz13Wet7Dq+Hd9+QucPBBg==
X-Google-Smtp-Source: AGHT+IFbsy4objJDpZzL88T4jf0WD2+nBgSPicn0oA8FR0A2RFkY3CM+/I+dDI+b38fH4DQKyfzE/Q==
X-Received: by 2002:a5d:5847:0:b0:38a:86db:4d1f with SMTP id
 ffacd0b85a97d-38a8730a6a0mr3469780f8f.25.1736377527506; 
 Wed, 08 Jan 2025 15:05:27 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e03ffcsm1059745e9.20.2025.01.08.15.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 15:05:27 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Thu,  9 Jan 2025 00:05:12 +0100
Message-ID: <20250108230521.1345210-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108230521.1345210-1-romain.naour@smile.fr>
References: <20250108230521.1345210-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736377527; x=1736982327; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=syrn7VJGwvrqFwAis7MfCIEttIqdZYjWuI3K8D7Yaz8=;
 b=qinZhzqBOrsuRimPpmvoyRid2JBU3yiS6J3qcY7EAh4Qw2H/kxfKV4cyAaDDcYXeQX
 rsmc2yTlZZi3lMG2wM2iVcE/0E9vnO775GEgJQSsRUpUFn5J6AasrRM6OZTE4M7rmfvy
 an7/AiSOzZlmMva3zP4TbBSei1CxSU52p7bo8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=qinZhzqB
Subject: [Buildroot] [PATCH 03/12] toolchain/toolchain-external: remove
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
