Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA52C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 15:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5A8982323;
	Sun, 10 Aug 2025 15:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_6KhuBiJ9sb; Sun, 10 Aug 2025 15:51:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FF65821FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FF65821FD;
	Sun, 10 Aug 2025 15:51:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87080154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 12:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E2348231C
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 12:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fq6ZWxhk5HtZ for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 12:48:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.235;
 helo=relay15.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4ABA182318
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ABA182318
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4ABA182318
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 12:48:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 0F7DA4429C;
 Sun, 10 Aug 2025 12:48:27 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sun, 10 Aug 2025 14:48:18 +0200
Message-ID: <20250810124820.2116495-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810124820.2116495-1-thomas.petazzoni@bootlin.com>
References: <20250810124820.2116495-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdelieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeelvefgkeduuedtleduiedtvedvieefuddvfeejkeetkeejvdeghfeiheeigeeunecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhmpdhrtghpthhtohepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomh
X-Mailman-Approved-At: Sun, 10 Aug 2025 15:51:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754830108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OOL/GiibWRlpC/dnsoYtskWxuPbROK1zkYRhRv8fAqc=;
 b=OVp5FFtbAzq2TU0HOQM+42syIZeu6XDP5xgwkso7eT1Phz1MfPcACSt+MVxOH+8V5Yuk5M
 WxhP5a6vYK8Q/KMk7BSH1/j8Zs4DOdNwLvUB4uDY1RS4GSacHpAdlUHmMMpG8TjKJgGtKI
 GznRewkhOR6z6d0dfXvur6PbjlJcQC+4Gb5St0SAdi41wsGltyzuZdLEDly+4oPlInqB30
 aJt2Lc/IV3mpF2SvXSXyrbnkbVo7A1ktcxWW/2byvra3s8FLIO8VQOg42hNA5zrC86FVtA
 /eafdAwRvDPyji+apzA9G2whuiphPncHLpJVRdvBItmpshP7sLkHs1P6uyWAuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OVp5FFtb
Subject: [Buildroot] [PATCH 3/3]
 toolchain/toolchain-external/toolchain-external-bootlin: update to Bootlin
 toolchains 2025.08-1
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

The toolchains have been rebuilt with a recent Buildroot, and are
based on:

- Stable toolchains:
  GCC 14.3
  Binutils 2.43.1
  GDB 15.2
  Linux headers 5.4
  glibc 2.41
  musl 1.2.5
  uclibc-ng 1.0.45

- Bleeding edge toolchains
  GCC 15.1
  Binutils 2.44
  GDB 16.3
  Linux headers 5.15
  glibc 2.41
  musl 1.2.5
  uclibc-ng 1.0.45

The microblaze bleeding-edge toolchains are back, since we integrated
the "atomic issue" fix.

All tests are successful:

  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1976388296

(note: the test branch had one more commit doing tweaks on the wget
option and re-enabling the backup site for unit tests, which are
needed to avoid intermittent failures of Gitlab CI jobs)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../tests/toolchain/test_external_bootlin.py  |   84 +
 .../Config.in.options                         | 1614 +++++++++--------
 .../toolchain-external-bootlin.hash           |  860 ++++-----
 .../toolchain-external-bootlin.mk             |  460 ++---
 4 files changed, 1645 insertions(+), 1373 deletions(-)

diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
index 74fe1635c9..6bcebf80c0 100644
--- a/support/testing/tests/toolchain/test_external_bootlin.py
+++ b/support/testing/tests/toolchain/test_external_bootlin.py
@@ -795,6 +795,20 @@ class TestExternalToolchainBootlinM68kcoldfireUclibcStable(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinMicroblazebeGlibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_microblazebe=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "microblaze-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinMicroblazebeGlibcStable(TestExternalToolchain):
     config = """
         BR2_microblazebe=y
@@ -809,6 +823,20 @@ class TestExternalToolchainBootlinMicroblazebeGlibcStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinMicroblazebeMuslBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_microblazebe=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "microblaze-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinMicroblazebeMuslStable(TestExternalToolchain):
     config = """
         BR2_microblazebe=y
@@ -823,6 +851,20 @@ class TestExternalToolchainBootlinMicroblazebeMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinMicroblazebeUclibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_microblazebe=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "microblaze-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinMicroblazebeUclibcStable(TestExternalToolchain):
     config = """
         BR2_microblazebe=y
@@ -837,6 +879,20 @@ class TestExternalToolchainBootlinMicroblazebeUclibcStable(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinMicroblazeelGlibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_microblazeel=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "microblazeel-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinMicroblazeelGlibcStable(TestExternalToolchain):
     config = """
         BR2_microblazeel=y
@@ -851,6 +907,20 @@ class TestExternalToolchainBootlinMicroblazeelGlibcStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinMicroblazeelMuslBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_microblazeel=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "microblazeel-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinMicroblazeelMuslStable(TestExternalToolchain):
     config = """
         BR2_microblazeel=y
@@ -865,6 +935,20 @@ class TestExternalToolchainBootlinMicroblazeelMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinMicroblazeelUclibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_microblazeel=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "microblazeel-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinMicroblazeelUclibcStable(TestExternalToolchain):
     config = """
         BR2_microblazeel=y
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index ef3d23d026..157f288421 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -57,11 +57,11 @@ config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Bootlin toolchain variant"
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
-	bool "aarch64 glibc bleeding-edge 2024.05-1"
+	bool "aarch64 glibc bleeding-edge 2025.08-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -82,12 +82,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
-	bool "aarch64 glibc stable 2024.05-1"
+	bool "aarch64 glibc stable 2025.08-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -106,11 +106,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE
-	bool "aarch64 musl bleeding-edge 2024.05-1"
+	bool "aarch64 musl bleeding-edge 2025.08-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -131,12 +131,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE
-	bool "aarch64 musl stable 2024.05-1"
+	bool "aarch64 musl stable 2025.08-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -154,10 +154,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE
-	bool "aarch64 uclibc bleeding-edge 2024.05-1"
+	bool "aarch64 uclibc bleeding-edge 2025.08-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -179,11 +179,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE
-	bool "aarch64 uclibc stable 2024.05-1"
+	bool "aarch64 uclibc stable 2025.08-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -203,11 +203,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
-	bool "aarch64be glibc bleeding-edge 2024.05-1"
+	bool "aarch64be glibc bleeding-edge 2025.08-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -228,12 +228,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
-	bool "aarch64be glibc stable 2024.05-1"
+	bool "aarch64be glibc stable 2025.08-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -252,11 +252,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_BLEEDING_EDGE
-	bool "aarch64be musl bleeding-edge 2024.05-1"
+	bool "aarch64be musl bleeding-edge 2025.08-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -277,12 +277,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_STABLE
-	bool "aarch64be musl stable 2024.05-1"
+	bool "aarch64be musl stable 2025.08-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -300,10 +300,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE
-	bool "aarch64be uclibc bleeding-edge 2024.05-1"
+	bool "aarch64be uclibc bleeding-edge 2025.08-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -325,11 +325,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE
-	bool "aarch64be uclibc stable 2024.05-1"
+	bool "aarch64be uclibc stable 2025.08-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -349,11 +349,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
-	bool "arcle-750d uclibc bleeding-edge 2024.05-1"
+	bool "arcle-750d uclibc bleeding-edge 2025.08-1"
 	depends on BR2_arcle
 	depends on BR2_arc750d
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -374,12 +374,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
-	bool "arcle-750d uclibc stable 2024.05-1"
+	bool "arcle-750d uclibc stable 2025.08-1"
 	depends on BR2_arcle
 	depends on BR2_arc750d
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -398,12 +398,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
-	bool "arcle-hs38 glibc bleeding-edge 2024.05-1"
+	bool "arcle-hs38 glibc bleeding-edge 2025.08-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -423,12 +423,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
-	bool "arcle-hs38 glibc stable 2024.05-1"
+	bool "arcle-hs38 glibc stable 2025.08-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -447,11 +447,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE
-	bool "arcle-hs38 uclibc bleeding-edge 2024.05-1"
+	bool "arcle-hs38 uclibc bleeding-edge 2025.08-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -472,12 +472,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE
-	bool "arcle-hs38 uclibc stable 2024.05-1"
+	bool "arcle-hs38 uclibc stable 2025.08-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -496,13 +496,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
-	bool "armv5-eabi glibc bleeding-edge 2024.05-1"
+	bool "armv5-eabi glibc bleeding-edge 2025.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -523,14 +523,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
-	bool "armv5-eabi glibc stable 2024.05-1"
+	bool "armv5-eabi glibc stable 2025.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -549,13 +549,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE
-	bool "armv5-eabi musl bleeding-edge 2024.05-1"
+	bool "armv5-eabi musl bleeding-edge 2025.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -576,14 +576,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
-	bool "armv5-eabi musl stable 2024.05-1"
+	bool "armv5-eabi musl stable 2025.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -602,12 +602,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE
-	bool "armv5-eabi uclibc bleeding-edge 2024.05-1"
+	bool "armv5-eabi uclibc bleeding-edge 2025.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -629,13 +629,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE
-	bool "armv5-eabi uclibc stable 2024.05-1"
+	bool "armv5-eabi uclibc stable 2025.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -655,13 +655,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
-	bool "armv6-eabihf glibc bleeding-edge 2024.05-1"
+	bool "armv6-eabihf glibc bleeding-edge 2025.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -682,14 +682,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
-	bool "armv6-eabihf glibc stable 2024.05-1"
+	bool "armv6-eabihf glibc stable 2025.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -708,13 +708,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE
-	bool "armv6-eabihf musl bleeding-edge 2024.05-1"
+	bool "armv6-eabihf musl bleeding-edge 2025.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -735,14 +735,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE
-	bool "armv6-eabihf musl stable 2024.05-1"
+	bool "armv6-eabihf musl stable 2025.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -761,12 +761,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE
-	bool "armv6-eabihf uclibc bleeding-edge 2024.05-1"
+	bool "armv6-eabihf uclibc bleeding-edge 2025.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -788,13 +788,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
-	bool "armv6-eabihf uclibc stable 2024.05-1"
+	bool "armv6-eabihf uclibc stable 2025.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -814,12 +814,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
-	bool "armv7-eabihf glibc bleeding-edge 2024.05-1"
+	bool "armv7-eabihf glibc bleeding-edge 2025.08-1"
 	depends on BR2_arm
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -840,13 +840,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
-	bool "armv7-eabihf glibc stable 2024.05-1"
+	bool "armv7-eabihf glibc stable 2025.08-1"
 	depends on BR2_arm
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -865,12 +865,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
-	bool "armv7-eabihf musl bleeding-edge 2024.05-1"
+	bool "armv7-eabihf musl bleeding-edge 2025.08-1"
 	depends on BR2_arm
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -891,13 +891,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
-	bool "armv7-eabihf musl stable 2024.05-1"
+	bool "armv7-eabihf musl stable 2025.08-1"
 	depends on BR2_arm
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -916,11 +916,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
-	bool "armv7-eabihf uclibc bleeding-edge 2024.05-1"
+	bool "armv7-eabihf uclibc bleeding-edge 2025.08-1"
 	depends on BR2_arm
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -942,12 +942,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
-	bool "armv7-eabihf uclibc stable 2024.05-1"
+	bool "armv7-eabihf uclibc stable 2025.08-1"
 	depends on BR2_arm
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -967,12 +967,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
-	bool "armebv7-eabihf glibc bleeding-edge 2024.05-1"
+	bool "armebv7-eabihf glibc bleeding-edge 2025.08-1"
 	depends on BR2_armeb
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -993,13 +993,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
-	bool "armebv7-eabihf glibc stable 2024.05-1"
+	bool "armebv7-eabihf glibc stable 2025.08-1"
 	depends on BR2_armeb
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1018,12 +1018,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
-	bool "armebv7-eabihf musl bleeding-edge 2024.05-1"
+	bool "armebv7-eabihf musl bleeding-edge 2025.08-1"
 	depends on BR2_armeb
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1044,13 +1044,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
-	bool "armebv7-eabihf musl stable 2024.05-1"
+	bool "armebv7-eabihf musl stable 2025.08-1"
 	depends on BR2_armeb
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1069,11 +1069,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
-	bool "armebv7-eabihf uclibc bleeding-edge 2024.05-1"
+	bool "armebv7-eabihf uclibc bleeding-edge 2025.08-1"
 	depends on BR2_armeb
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1095,12 +1095,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
-	bool "armebv7-eabihf uclibc stable 2024.05-1"
+	bool "armebv7-eabihf uclibc stable 2025.08-1"
 	depends on BR2_armeb
 	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -1120,12 +1120,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE
-	bool "armv7m uclibc bleeding-edge 2024.05-1"
+	bool "armv7m uclibc bleeding-edge 2025.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7M
 	depends on BR2_BINFMT_FLAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1145,13 +1145,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
-	bool "armv7m uclibc stable 2024.05-1"
+	bool "armv7m uclibc stable 2025.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7M
 	depends on BR2_BINFMT_FLAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -1169,11 +1169,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_BLEEDING_EDGE
-	bool "m68k-68xxx glibc bleeding-edge 2024.05-1"
+	bool "m68k-68xxx glibc bleeding-edge 2025.08-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1194,12 +1194,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_STABLE
-	bool "m68k-68xxx glibc stable 2024.05-1"
+	bool "m68k-68xxx glibc stable 2025.08-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1218,11 +1218,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_BLEEDING_EDGE
-	bool "m68k-68xxx musl bleeding-edge 2024.05-1"
+	bool "m68k-68xxx musl bleeding-edge 2025.08-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1243,12 +1243,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_STABLE
-	bool "m68k-68xxx musl stable 2024.05-1"
+	bool "m68k-68xxx musl stable 2025.08-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1267,10 +1267,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
-	bool "m68k-68xxx uclibc bleeding-edge 2024.05-1"
+	bool "m68k-68xxx uclibc bleeding-edge 2025.08-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1292,11 +1292,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE
-	bool "m68k-68xxx uclibc stable 2024.05-1"
+	bool "m68k-68xxx uclibc stable 2025.08-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -1316,10 +1316,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE
-	bool "m68k-coldfire uclibc bleeding-edge 2024.05-1"
+	bool "m68k-coldfire uclibc bleeding-edge 2025.08-1"
 	depends on BR2_m68k_cf
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1339,11 +1339,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE
-	bool "m68k-coldfire uclibc stable 2024.05-1"
+	bool "m68k-coldfire uclibc stable 2025.08-1"
 	depends on BR2_m68k_cf
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -1360,14 +1360,37 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE
 
 	  https://toolchains.bootlin.com/
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
+	bool "microblazebe glibc bleeding-edge 2025.08-1"
+	depends on BR2_microblazebe
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Bootlin toolchain for the microblazebe architecture, using
+	  the glibc C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
-	bool "microblazebe glibc stable 2024.05-1"
+	bool "microblazebe glibc stable 2025.08-1"
 	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -1383,14 +1406,37 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
 
 	  https://toolchains.bootlin.com/
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE
+	bool "microblazebe musl bleeding-edge 2025.08-1"
+	depends on BR2_microblazebe
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the microblazebe architecture, using
+	  the musl C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
-	bool "microblazebe musl stable 2024.05-1"
+	bool "microblazebe musl stable 2025.08-1"
 	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -1406,13 +1452,37 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
 
 	  https://toolchains.bootlin.com/
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE
+	bool "microblazebe uclibc bleeding-edge 2025.08-1"
+	depends on BR2_microblazebe
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	help
+	  Bootlin toolchain for the microblazebe architecture, using
+	  the uclibc C library. This is a bleeding-edge version,
+	  which means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
-	bool "microblazebe uclibc stable 2024.05-1"
+	bool "microblazebe uclibc stable 2025.08-1"
 	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -1430,14 +1500,37 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
 
 	  https://toolchains.bootlin.com/
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
+	bool "microblazeel glibc bleeding-edge 2025.08-1"
+	depends on BR2_microblazeel
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Bootlin toolchain for the microblazeel architecture, using
+	  the glibc C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
-	bool "microblazeel glibc stable 2024.05-1"
+	bool "microblazeel glibc stable 2025.08-1"
 	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -1453,14 +1546,37 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
 
 	  https://toolchains.bootlin.com/
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE
+	bool "microblazeel musl bleeding-edge 2025.08-1"
+	depends on BR2_microblazeel
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the microblazeel architecture, using
+	  the musl C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
-	bool "microblazeel musl stable 2024.05-1"
+	bool "microblazeel musl stable 2025.08-1"
 	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -1476,13 +1592,37 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
 
 	  https://toolchains.bootlin.com/
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE
+	bool "microblazeel uclibc bleeding-edge 2025.08-1"
+	depends on BR2_microblazeel
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	help
+	  Bootlin toolchain for the microblazeel architecture, using
+	  the uclibc C library. This is a bleeding-edge version,
+	  which means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE
-	bool "microblazeel uclibc stable 2024.05-1"
+	bool "microblazeel uclibc stable 2025.08-1"
 	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -1501,13 +1641,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
-	bool "mips32 glibc bleeding-edge 2024.05-1"
+	bool "mips32 glibc bleeding-edge 2025.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1528,14 +1668,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
-	bool "mips32 glibc stable 2024.05-1"
+	bool "mips32 glibc stable 2025.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1554,13 +1694,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE
-	bool "mips32 musl bleeding-edge 2024.05-1"
+	bool "mips32 musl bleeding-edge 2025.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1581,14 +1721,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE
-	bool "mips32 musl stable 2024.05-1"
+	bool "mips32 musl stable 2025.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1606,12 +1746,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE
-	bool "mips32 uclibc bleeding-edge 2024.05-1"
+	bool "mips32 uclibc bleeding-edge 2025.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1633,13 +1773,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE
-	bool "mips32 uclibc stable 2024.05-1"
+	bool "mips32 uclibc stable 2025.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -1659,13 +1799,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
-	bool "mips32el glibc bleeding-edge 2024.05-1"
+	bool "mips32el glibc bleeding-edge 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1686,14 +1826,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
-	bool "mips32el glibc stable 2024.05-1"
+	bool "mips32el glibc stable 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1712,13 +1852,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE
-	bool "mips32el musl bleeding-edge 2024.05-1"
+	bool "mips32el musl bleeding-edge 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1739,14 +1879,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE
-	bool "mips32el musl stable 2024.05-1"
+	bool "mips32el musl stable 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1764,12 +1904,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE
-	bool "mips32el uclibc bleeding-edge 2024.05-1"
+	bool "mips32el uclibc bleeding-edge 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1791,13 +1931,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE
-	bool "mips32el uclibc stable 2024.05-1"
+	bool "mips32el uclibc stable 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -1817,13 +1957,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
-	bool "mips32r5el glibc bleeding-edge 2024.05-1"
+	bool "mips32r5el glibc bleeding-edge 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1844,14 +1984,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
-	bool "mips32r5el glibc stable 2024.05-1"
+	bool "mips32r5el glibc stable 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1870,13 +2010,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE
-	bool "mips32r5el musl bleeding-edge 2024.05-1"
+	bool "mips32r5el musl bleeding-edge 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1897,14 +2037,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE
-	bool "mips32r5el musl stable 2024.05-1"
+	bool "mips32r5el musl stable 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -1923,12 +2063,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE
-	bool "mips32r5el uclibc bleeding-edge 2024.05-1"
+	bool "mips32r5el uclibc bleeding-edge 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1950,13 +2090,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE
-	bool "mips32r5el uclibc stable 2024.05-1"
+	bool "mips32r5el uclibc stable 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -1976,13 +2116,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
-	bool "mips32r6el glibc bleeding-edge 2024.05-1"
+	bool "mips32r6el glibc bleeding-edge 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2003,14 +2143,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
-	bool "mips32r6el glibc stable 2024.05-1"
+	bool "mips32r6el glibc stable 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2029,13 +2169,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE
-	bool "mips32r6el musl bleeding-edge 2024.05-1"
+	bool "mips32r6el musl bleeding-edge 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2056,14 +2196,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE
-	bool "mips32r6el musl stable 2024.05-1"
+	bool "mips32r6el musl stable 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2082,12 +2222,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE
-	bool "mips32r6el uclibc bleeding-edge 2024.05-1"
+	bool "mips32r6el uclibc bleeding-edge 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2109,13 +2249,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE
-	bool "mips32r6el uclibc stable 2024.05-1"
+	bool "mips32r6el uclibc stable 2025.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -2135,14 +2275,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
-	bool "mips64-n32 glibc bleeding-edge 2024.05-1"
+	bool "mips64-n32 glibc bleeding-edge 2025.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2163,15 +2303,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
-	bool "mips64-n32 glibc stable 2024.05-1"
+	bool "mips64-n32 glibc stable 2025.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2190,14 +2330,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE
-	bool "mips64-n32 musl bleeding-edge 2024.05-1"
+	bool "mips64-n32 musl bleeding-edge 2025.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2218,15 +2358,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE
-	bool "mips64-n32 musl stable 2024.05-1"
+	bool "mips64-n32 musl stable 2025.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2245,13 +2385,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE
-	bool "mips64-n32 uclibc bleeding-edge 2024.05-1"
+	bool "mips64-n32 uclibc bleeding-edge 2025.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2273,14 +2413,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE
-	bool "mips64-n32 uclibc stable 2024.05-1"
+	bool "mips64-n32 uclibc stable 2025.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -2300,14 +2440,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
-	bool "mips64el-n32 glibc bleeding-edge 2024.05-1"
+	bool "mips64el-n32 glibc bleeding-edge 2025.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2328,15 +2468,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
-	bool "mips64el-n32 glibc stable 2024.05-1"
+	bool "mips64el-n32 glibc stable 2025.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2355,14 +2495,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE
-	bool "mips64el-n32 musl bleeding-edge 2024.05-1"
+	bool "mips64el-n32 musl bleeding-edge 2025.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2383,15 +2523,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE
-	bool "mips64el-n32 musl stable 2024.05-1"
+	bool "mips64el-n32 musl stable 2025.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2410,13 +2550,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE
-	bool "mips64el-n32 uclibc bleeding-edge 2024.05-1"
+	bool "mips64el-n32 uclibc bleeding-edge 2025.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2438,14 +2578,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE
-	bool "mips64el-n32 uclibc stable 2024.05-1"
+	bool "mips64el-n32 uclibc stable 2025.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -2465,14 +2605,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
-	bool "mips64r6el-n32 glibc bleeding-edge 2024.05-1"
+	bool "mips64r6el-n32 glibc bleeding-edge 2025.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2493,15 +2633,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
-	bool "mips64r6el-n32 glibc stable 2024.05-1"
+	bool "mips64r6el-n32 glibc stable 2025.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2520,14 +2660,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE
-	bool "mips64r6el-n32 musl bleeding-edge 2024.05-1"
+	bool "mips64r6el-n32 musl bleeding-edge 2025.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2548,15 +2688,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE
-	bool "mips64r6el-n32 musl stable 2024.05-1"
+	bool "mips64r6el-n32 musl stable 2025.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2575,13 +2715,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE
-	bool "mips64r6el-n32 uclibc bleeding-edge 2024.05-1"
+	bool "mips64r6el-n32 uclibc bleeding-edge 2025.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2603,14 +2743,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE
-	bool "mips64r6el-n32 uclibc stable 2024.05-1"
+	bool "mips64r6el-n32 uclibc stable 2025.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -2630,12 +2770,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE
-	bool "openrisc glibc bleeding-edge 2024.05-1"
+	bool "openrisc glibc bleeding-edge 2025.08-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2656,12 +2796,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE
-	bool "openrisc glibc stable 2024.05-1"
+	bool "openrisc glibc stable 2025.08-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -2681,12 +2821,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
-	bool "openrisc musl bleeding-edge 2024.05-1"
+	bool "openrisc musl bleeding-edge 2025.08-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2707,13 +2847,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
-	bool "openrisc musl stable 2024.05-1"
+	bool "openrisc musl stable 2025.08-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2731,11 +2871,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
-	bool "openrisc uclibc bleeding-edge 2024.05-1"
+	bool "openrisc uclibc bleeding-edge 2025.08-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2757,12 +2897,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
-	bool "openrisc uclibc stable 2024.05-1"
+	bool "openrisc uclibc stable 2025.08-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -2782,12 +2922,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
-	bool "powerpc-440fp glibc bleeding-edge 2024.05-1"
+	bool "powerpc-440fp glibc bleeding-edge 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2808,13 +2948,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
-	bool "powerpc-440fp glibc stable 2024.05-1"
+	bool "powerpc-440fp glibc stable 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2833,12 +2973,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
-	bool "powerpc-440fp musl bleeding-edge 2024.05-1"
+	bool "powerpc-440fp musl bleeding-edge 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2858,13 +2998,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
-	bool "powerpc-440fp musl stable 2024.05-1"
+	bool "powerpc-440fp musl stable 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -2882,11 +3022,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
-	bool "powerpc-440fp uclibc bleeding-edge 2024.05-1"
+	bool "powerpc-440fp uclibc bleeding-edge 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2908,12 +3048,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
-	bool "powerpc-440fp uclibc stable 2024.05-1"
+	bool "powerpc-440fp uclibc stable 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -2933,12 +3073,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
-	bool "powerpc-e300c3 glibc bleeding-edge 2024.05-1"
+	bool "powerpc-e300c3 glibc bleeding-edge 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2959,13 +3099,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
-	bool "powerpc-e300c3 glibc stable 2024.05-1"
+	bool "powerpc-e300c3 glibc stable 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -2984,12 +3124,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
-	bool "powerpc-e300c3 musl bleeding-edge 2024.05-1"
+	bool "powerpc-e300c3 musl bleeding-edge 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3009,13 +3149,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
-	bool "powerpc-e300c3 musl stable 2024.05-1"
+	bool "powerpc-e300c3 musl stable 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -3033,11 +3173,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
-	bool "powerpc-e300c3 uclibc bleeding-edge 2024.05-1"
+	bool "powerpc-e300c3 uclibc bleeding-edge 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -3059,12 +3199,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
-	bool "powerpc-e300c3 uclibc stable 2024.05-1"
+	bool "powerpc-e300c3 uclibc stable 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -3084,12 +3224,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
-	bool "powerpc-e500mc glibc bleeding-edge 2024.05-1"
+	bool "powerpc-e500mc glibc bleeding-edge 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3110,13 +3250,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
-	bool "powerpc-e500mc glibc stable 2024.05-1"
+	bool "powerpc-e500mc glibc stable 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3135,12 +3275,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE
-	bool "powerpc-e500mc musl bleeding-edge 2024.05-1"
+	bool "powerpc-e500mc musl bleeding-edge 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3160,13 +3300,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE
-	bool "powerpc-e500mc musl stable 2024.05-1"
+	bool "powerpc-e500mc musl stable 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -3184,11 +3324,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE
-	bool "powerpc-e500mc uclibc bleeding-edge 2024.05-1"
+	bool "powerpc-e500mc uclibc bleeding-edge 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -3210,12 +3350,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE
-	bool "powerpc-e500mc uclibc stable 2024.05-1"
+	bool "powerpc-e500mc uclibc stable 2025.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -3235,12 +3375,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
-	bool "powerpc64-e5500 glibc bleeding-edge 2024.05-1"
+	bool "powerpc64-e5500 glibc bleeding-edge 2025.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3261,13 +3401,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
-	bool "powerpc64-e5500 glibc stable 2024.05-1"
+	bool "powerpc64-e5500 glibc stable 2025.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3286,12 +3426,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
-	bool "powerpc64-e6500 glibc bleeding-edge 2024.05-1"
+	bool "powerpc64-e6500 glibc bleeding-edge 2025.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3312,13 +3452,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
-	bool "powerpc64-e6500 glibc stable 2024.05-1"
+	bool "powerpc64-e6500 glibc stable 2025.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3337,12 +3477,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
-	bool "powerpc64-e6500 musl bleeding-edge 2024.05-1"
+	bool "powerpc64-e6500 musl bleeding-edge 2025.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3363,13 +3503,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
-	bool "powerpc64-e6500 musl stable 2024.05-1"
+	bool "powerpc64-e6500 musl stable 2025.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3388,12 +3528,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
-	bool "powerpc64-power8 glibc bleeding-edge 2024.05-1"
+	bool "powerpc64-power8 glibc bleeding-edge 2025.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3414,13 +3554,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
-	bool "powerpc64-power8 glibc stable 2024.05-1"
+	bool "powerpc64-power8 glibc stable 2025.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3439,12 +3579,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE
-	bool "powerpc64-power8 musl bleeding-edge 2024.05-1"
+	bool "powerpc64-power8 musl bleeding-edge 2025.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3465,13 +3605,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE
-	bool "powerpc64-power8 musl stable 2024.05-1"
+	bool "powerpc64-power8 musl stable 2025.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3490,12 +3630,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
-	bool "powerpc64le-power8 glibc bleeding-edge 2024.05-1"
+	bool "powerpc64le-power8 glibc bleeding-edge 2025.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3516,13 +3656,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
-	bool "powerpc64le-power8 glibc stable 2024.05-1"
+	bool "powerpc64le-power8 glibc stable 2025.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3541,12 +3681,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE
-	bool "powerpc64le-power8 musl bleeding-edge 2024.05-1"
+	bool "powerpc64le-power8 musl bleeding-edge 2025.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3567,13 +3707,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE
-	bool "powerpc64le-power8 musl stable 2024.05-1"
+	bool "powerpc64le-power8 musl stable 2025.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3592,14 +3732,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
-	bool "riscv32-ilp32d glibc bleeding-edge 2024.05-1"
+	bool "riscv32-ilp32d glibc bleeding-edge 2025.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3620,14 +3760,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_STABLE
-	bool "riscv32-ilp32d glibc stable 2024.05-1"
+	bool "riscv32-ilp32d glibc stable 2025.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3647,14 +3787,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_BLEEDING_EDGE
-	bool "riscv32-ilp32d musl bleeding-edge 2024.05-1"
+	bool "riscv32-ilp32d musl bleeding-edge 2025.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3675,14 +3815,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_STABLE
-	bool "riscv32-ilp32d musl stable 2024.05-1"
+	bool "riscv32-ilp32d musl stable 2025.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3702,13 +3842,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_BLEEDING_EDGE
-	bool "riscv32-ilp32d uclibc bleeding-edge 2024.05-1"
+	bool "riscv32-ilp32d uclibc bleeding-edge 2025.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -3730,13 +3870,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_STABLE
-	bool "riscv32-ilp32d uclibc stable 2024.05-1"
+	bool "riscv32-ilp32d uclibc stable 2025.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -3757,14 +3897,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE
-	bool "riscv64-lp64d glibc bleeding-edge 2024.05-1"
+	bool "riscv64-lp64d glibc bleeding-edge 2025.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3785,14 +3925,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE
-	bool "riscv64-lp64d glibc stable 2024.05-1"
+	bool "riscv64-lp64d glibc stable 2025.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3812,14 +3952,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE
-	bool "riscv64-lp64d musl bleeding-edge 2024.05-1"
+	bool "riscv64-lp64d musl bleeding-edge 2025.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3840,14 +3980,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE
-	bool "riscv64-lp64d musl stable 2024.05-1"
+	bool "riscv64-lp64d musl stable 2025.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
@@ -3867,14 +4007,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE
-	bool "riscv64-lp64d uclibc bleeding-edge 2024.05-1"
+	bool "riscv64-lp64d uclibc bleeding-edge 2025.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -3896,14 +4036,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE
-	bool "riscv64-lp64d uclibc stable 2024.05-1"
+	bool "riscv64-lp64d uclibc stable 2025.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -3924,12 +4064,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE
-	bool "s390x-z13 glibc bleeding-edge 2024.05-1"
+	bool "s390x-z13 glibc bleeding-edge 2025.08-1"
 	depends on BR2_s390x
 	depends on BR2_s390x_z13
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3950,13 +4090,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE
-	bool "s390x-z13 glibc stable 2024.05-1"
+	bool "s390x-z13 glibc stable 2025.08-1"
 	depends on BR2_s390x
 	depends on BR2_s390x_z13
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -3975,12 +4115,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_BLEEDING_EDGE
-	bool "s390x-z13 musl bleeding-edge 2024.05-1"
+	bool "s390x-z13 musl bleeding-edge 2025.08-1"
 	depends on BR2_s390x
 	depends on BR2_s390x_z13
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4001,13 +4141,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_STABLE
-	bool "s390x-z13 musl stable 2024.05-1"
+	bool "s390x-z13 musl stable 2025.08-1"
 	depends on BR2_s390x
 	depends on BR2_s390x_z13
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4025,12 +4165,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
-	bool "sh-sh4 glibc bleeding-edge 2024.05-1"
+	bool "sh-sh4 glibc bleeding-edge 2025.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4051,13 +4191,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
-	bool "sh-sh4 glibc stable 2024.05-1"
+	bool "sh-sh4 glibc stable 2025.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4076,12 +4216,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE
-	bool "sh-sh4 musl bleeding-edge 2024.05-1"
+	bool "sh-sh4 musl bleeding-edge 2025.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4102,13 +4242,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE
-	bool "sh-sh4 musl stable 2024.05-1"
+	bool "sh-sh4 musl stable 2025.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4126,11 +4266,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE
-	bool "sh-sh4 uclibc bleeding-edge 2024.05-1"
+	bool "sh-sh4 uclibc bleeding-edge 2025.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4152,12 +4292,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE
-	bool "sh-sh4 uclibc stable 2024.05-1"
+	bool "sh-sh4 uclibc stable 2025.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -4177,12 +4317,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
-	bool "sh-sh4aeb glibc bleeding-edge 2024.05-1"
+	bool "sh-sh4aeb glibc bleeding-edge 2025.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4203,13 +4343,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
-	bool "sh-sh4aeb glibc stable 2024.05-1"
+	bool "sh-sh4aeb glibc stable 2025.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4228,12 +4368,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE
-	bool "sh-sh4aeb musl bleeding-edge 2024.05-1"
+	bool "sh-sh4aeb musl bleeding-edge 2025.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4254,13 +4394,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE
-	bool "sh-sh4aeb musl stable 2024.05-1"
+	bool "sh-sh4aeb musl stable 2025.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4278,12 +4418,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
-	bool "sparc64 glibc bleeding-edge 2024.05-1"
+	bool "sparc64 glibc bleeding-edge 2025.08-1"
 	depends on BR2_sparc64
 	depends on BR2_sparc_v9
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4304,13 +4444,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE
-	bool "sparc64 glibc stable 2024.05-1"
+	bool "sparc64 glibc stable 2025.08-1"
 	depends on BR2_sparc64
 	depends on BR2_sparc_v9
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4329,11 +4469,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_BLEEDING_EDGE
-	bool "sparcv8 uclibc bleeding-edge 2024.05-1"
+	bool "sparcv8 uclibc bleeding-edge 2025.08-1"
 	depends on BR2_sparc
 	depends on BR2_sparc_v8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4355,12 +4495,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE
-	bool "sparcv8 uclibc stable 2024.05-1"
+	bool "sparcv8 uclibc stable 2025.08-1"
 	depends on BR2_sparc
 	depends on BR2_sparc_v8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -4380,14 +4520,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE
-	bool "x86-64 glibc bleeding-edge 2024.05-1"
+	bool "x86-64 glibc bleeding-edge 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4408,15 +4548,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE
-	bool "x86-64 glibc stable 2024.05-1"
+	bool "x86-64 glibc stable 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4435,14 +4575,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE
-	bool "x86-64 musl bleeding-edge 2024.05-1"
+	bool "x86-64 musl bleeding-edge 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4463,15 +4603,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE
-	bool "x86-64 musl stable 2024.05-1"
+	bool "x86-64 musl stable 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4489,13 +4629,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE
-	bool "x86-64 uclibc bleeding-edge 2024.05-1"
+	bool "x86-64 uclibc bleeding-edge 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4517,14 +4657,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE
-	bool "x86-64 uclibc stable 2024.05-1"
+	bool "x86-64 uclibc stable 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -4544,7 +4684,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
-	bool "x86-64-v2 glibc bleeding-edge 2024.05-1"
+	bool "x86-64-v2 glibc bleeding-edge 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4553,9 +4693,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4576,7 +4716,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE
-	bool "x86-64-v2 glibc stable 2024.05-1"
+	bool "x86-64-v2 glibc stable 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4585,10 +4725,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4607,7 +4747,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
-	bool "x86-64-v2 musl bleeding-edge 2024.05-1"
+	bool "x86-64-v2 musl bleeding-edge 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4616,9 +4756,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4639,7 +4779,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE
-	bool "x86-64-v2 musl stable 2024.05-1"
+	bool "x86-64-v2 musl stable 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4648,10 +4788,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4669,7 +4809,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-v2 uclibc bleeding-edge 2024.05-1"
+	bool "x86-64-v2 uclibc bleeding-edge 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4678,8 +4818,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4701,7 +4841,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE
-	bool "x86-64-v2 uclibc stable 2024.05-1"
+	bool "x86-64-v2 uclibc stable 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4710,9 +4850,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -4732,7 +4872,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
-	bool "x86-64-v3 glibc bleeding-edge 2024.05-1"
+	bool "x86-64-v3 glibc bleeding-edge 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4743,9 +4883,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4766,7 +4906,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE
-	bool "x86-64-v3 glibc stable 2024.05-1"
+	bool "x86-64-v3 glibc stable 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4777,10 +4917,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4799,7 +4939,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
-	bool "x86-64-v3 musl bleeding-edge 2024.05-1"
+	bool "x86-64-v3 musl bleeding-edge 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4810,9 +4950,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4833,7 +4973,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE
-	bool "x86-64-v3 musl stable 2024.05-1"
+	bool "x86-64-v3 musl stable 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4844,10 +4984,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -4865,7 +5005,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-v3 uclibc bleeding-edge 2024.05-1"
+	bool "x86-64-v3 uclibc bleeding-edge 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4876,8 +5016,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4899,7 +5039,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE
-	bool "x86-64-v3 uclibc stable 2024.05-1"
+	bool "x86-64-v3 uclibc stable 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4910,9 +5050,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -4932,7 +5072,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
-	bool "x86-64-v4 glibc bleeding-edge 2024.05-1"
+	bool "x86-64-v4 glibc bleeding-edge 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4944,9 +5084,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4967,7 +5107,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE
-	bool "x86-64-v4 glibc stable 2024.05-1"
+	bool "x86-64-v4 glibc stable 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4979,10 +5119,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -5001,7 +5141,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
-	bool "x86-64-v4 musl bleeding-edge 2024.05-1"
+	bool "x86-64-v4 musl bleeding-edge 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5013,9 +5153,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -5036,7 +5176,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE
-	bool "x86-64-v4 musl stable 2024.05-1"
+	bool "x86-64-v4 musl stable 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5048,10 +5188,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -5069,7 +5209,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-v4 uclibc bleeding-edge 2024.05-1"
+	bool "x86-64-v4 uclibc bleeding-edge 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5081,8 +5221,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -5104,7 +5244,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE
-	bool "x86-64-v4 uclibc stable 2024.05-1"
+	bool "x86-64-v4 uclibc stable 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5116,9 +5256,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -5138,7 +5278,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
-	bool "x86-64-core-i7 glibc bleeding-edge 2024.05-1"
+	bool "x86-64-core-i7 glibc bleeding-edge 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5147,9 +5287,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -5170,7 +5310,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
-	bool "x86-64-core-i7 glibc stable 2024.05-1"
+	bool "x86-64-core-i7 glibc stable 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5179,10 +5319,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -5201,7 +5341,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
-	bool "x86-64-core-i7 musl bleeding-edge 2024.05-1"
+	bool "x86-64-core-i7 musl bleeding-edge 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5210,9 +5350,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -5233,7 +5373,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
-	bool "x86-64-core-i7 musl stable 2024.05-1"
+	bool "x86-64-core-i7 musl stable 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5242,10 +5382,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -5264,7 +5404,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-core-i7 uclibc bleeding-edge 2024.05-1"
+	bool "x86-64-core-i7 uclibc bleeding-edge 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5273,8 +5413,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -5296,7 +5436,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
-	bool "x86-64-core-i7 uclibc stable 2024.05-1"
+	bool "x86-64-core-i7 uclibc stable 2025.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5305,9 +5445,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -5327,16 +5467,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
-	bool "x86-core2 glibc bleeding-edge 2024.05-1"
+	bool "x86-core2 glibc bleeding-edge 2025.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -5357,17 +5497,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
-	bool "x86-core2 glibc stable 2024.05-1"
+	bool "x86-core2 glibc stable 2025.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -5386,16 +5526,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
-	bool "x86-core2 musl bleeding-edge 2024.05-1"
+	bool "x86-core2 musl bleeding-edge 2025.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -5415,17 +5555,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
-	bool "x86-core2 musl stable 2024.05-1"
+	bool "x86-core2 musl stable 2025.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -5442,15 +5582,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE
-	bool "x86-core2 uclibc bleeding-edge 2024.05-1"
+	bool "x86-core2 uclibc bleeding-edge 2025.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -5472,16 +5612,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE
-	bool "x86-core2 uclibc stable 2024.05-1"
+	bool "x86-core2 uclibc stable 2025.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -5501,7 +5641,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
-	bool "x86-i686 glibc bleeding-edge 2024.05-1"
+	bool "x86-i686 glibc bleeding-edge 2025.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5511,9 +5651,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -5534,7 +5674,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
-	bool "x86-i686 glibc stable 2024.05-1"
+	bool "x86-i686 glibc stable 2025.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5544,10 +5684,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
@@ -5566,7 +5706,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
-	bool "x86-i686 musl bleeding-edge 2024.05-1"
+	bool "x86-i686 musl bleeding-edge 2025.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5576,9 +5716,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -5598,7 +5738,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
-	bool "x86-i686 musl stable 2024.05-1"
+	bool "x86-i686 musl stable 2025.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5608,10 +5748,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -5628,7 +5768,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
-	bool "x86-i686 uclibc bleeding-edge 2024.05-1"
+	bool "x86-i686 uclibc bleeding-edge 2025.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5638,8 +5778,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -5661,7 +5801,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
-	bool "x86-i686 uclibc stable 2024.05-1"
+	bool "x86-i686 uclibc stable 2025.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5671,9 +5811,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -5693,12 +5833,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
-	bool "xtensa-lx60 uclibc bleeding-edge 2024.05-1"
+	bool "xtensa-lx60 uclibc bleeding-edge 2025.08-1"
 	depends on BR2_xtensa
 	depends on BR2_XTENSA_CUSTOM
 	depends on BR2_XTENSA_LITTLE_ENDIAN
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -5720,13 +5860,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE
-	bool "xtensa-lx60 uclibc stable 2024.05-1"
+	bool "xtensa-lx60 uclibc stable 2025.08-1"
 	depends on BR2_xtensa
 	depends on BR2_XTENSA_CUSTOM
 	depends on BR2_XTENSA_LITTLE_ENDIAN
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
index 1515f35a91..c2a0034907 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
@@ -1,426 +1,438 @@
 # This file was auto-generated by support/scripts/gen-bootlin-toolchains
 # Do not edit
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2024.05-1.sha256
-sha256  4f64a9ecc2817db5a4cbf128fbd0162e9397cb2cf8316e005fc3fb3d16f097ae  aarch64--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2024.05-1.sha256
-sha256  b0fad860eb94b503a56d66ca8b9ba06d2d4826943e37ebd1d7217423f6ea5bb2  aarch64--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--bleeding-edge-2024.05-1.sha256
-sha256  7a2819d883ae1ddfc91b9ce325c972289d4aae0c692936e722120862a73021eb  aarch64--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--stable-2024.05-1.sha256
-sha256  f847da1195325525f3f07eef045ef40c6b48464a37e0f7fea77360dfe0bc1aa1  aarch64--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  f5480ea84fc71d85361de9a0d89ff7e1a9b9640de86db76b4dec6dd099535cdc  aarch64--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--stable-2024.05-1.sha256
-sha256  748de907a7b601490cbc6bdc816d31127fab6937c831b5c5d21d7f70decf15fe  aarch64--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--bleeding-edge-2024.05-1.sha256
-sha256  02f588c6900d33286b89db5a92e60fdf611a47da5d05c1ee644ba14e2630ffca  aarch64be--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--stable-2024.05-1.sha256
-sha256  a44e4b4cc016aded66f00109c1c5f64f881a8b7effc60bae2e84a5936fd3b0e4  aarch64be--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--bleeding-edge-2024.05-1.sha256
-sha256  af4ca347a5b1e725b0e0c7a4bccc9813005a3fbeb7d1127b4e5c4b07cc22eb5e  aarch64be--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--stable-2024.05-1.sha256
-sha256  f31e16c451f151157069d9890f8f8fa759b1188293e083194b4e64867f0da216  aarch64be--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  45a00779ad073ef2edcb4d42db6e74b02e26de639a6f5d3060d42ce0d9160b52  aarch64be--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--stable-2024.05-1.sha256
-sha256  ef200bd2d5d4762a3f5844703d3c7ef683f15189a1a0fe3857c2eaa117fd45c7  aarch64be--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  18a630b725d97b9903f44d487292c891f4994f83334363d0311014664dc8230a  arcle-750d--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--stable-2024.05-1.sha256
-sha256  74b2afe4f915708e81d9b595396ff82fbc841f698a0b78d778a52cf7be668081  arcle-750d--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--bleeding-edge-2024.05-1.sha256
-sha256  ad0c27042c1ef42b1e7ea5a6b2a7e77a82d8ae137d08c2b95d7d4baea60b5472  arcle-hs38--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--stable-2024.05-1.sha256
-sha256  247f590dede487c76579aa6c5233f634c6525cf31430496ae6dcbd0e07e8dc5b  arcle-hs38--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  38578d0503f123d3eb94afda435a7fa170337810c290e433f119f609856098a8  arcle-hs38--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--stable-2024.05-1.sha256
-sha256  982f6c2d3b161e8e07982f6fe846c18245d17b0ed602cddd64ad45c568c06b01  arcle-hs38--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2024.05-1.sha256
-sha256  1466a2c312a340d5314583c4ef3fbf955eaa0c16627712374e1f1d74d9a38505  armv5-eabi--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--stable-2024.05-1.sha256
-sha256  13f2bea0b06fe560fe60d199cd9d3fb1f20e2335bcc79b90c5130c3916a3ed92  armv5-eabi--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--bleeding-edge-2024.05-1.sha256
-sha256  5261ae65d4e454cb9d16a25a6f93f615742a10c64fb7ce08b7ce776c388abbdd  armv5-eabi--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--stable-2024.05-1.sha256
-sha256  9825d9a4515a92d2251aab3228ddbb6258440b0f952b95fcaa94653a4b29c71a  armv5-eabi--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  5dba09b35b3d5cfd3c44b4429bca73f5d9d5eec591810148928b3ceb8ef688ed  armv5-eabi--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--stable-2024.05-1.sha256
-sha256  c0c616d4f7d6702b8991f83a5a3777137f734e1eb610d4a20297eaef299ec59d  armv5-eabi--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--bleeding-edge-2024.05-1.sha256
-sha256  8c531910b5883352c39d84657c4a8052b67a318314273342890abec318159ead  armv6-eabihf--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--stable-2024.05-1.sha256
-sha256  2924afaa0d47e046339fe70bf526db5a19edaa58d87c6758a861ef41e2781368  armv6-eabihf--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--bleeding-edge-2024.05-1.sha256
-sha256  aeba34ea164503511233566148ccfddba3932ffe13f9d22bfa1a3bf2a31c63f7  armv6-eabihf--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--stable-2024.05-1.sha256
-sha256  cc7444189685f9405636568a582395e4e2b95347f8be0e6d63ed4e2791ab9267  armv6-eabihf--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  ba481ea8b2631871cdddc9ff9600cca3e7f4bdd558602ba936563ddd58039f8f  armv6-eabihf--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--stable-2024.05-1.sha256
-sha256  38e3c482368c96f177c164ed098e7022f45adf83d8715cb2f74238a5a7c0622d  armv6-eabihf--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2024.05-1.sha256
-sha256  10703f0184162ea6ebabb84696903154a8eb7b53175e76ccf5ca0a2294fc68ec  armv7-eabihf--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2024.05-1.sha256
-sha256  608263bc9dc3eadf0962ddb1165f1c2291001190f9927dee47d464e26374462c  armv7-eabihf--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--bleeding-edge-2024.05-1.sha256
-sha256  2a8274d28abd4779010dda6b54bfe0d259559181f99908440d39974f2619567a  armv7-eabihf--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--stable-2024.05-1.sha256
-sha256  5b34157a4c9f53064002f12f57c42836cd551c591a4be6a99b3ee201add506aa  armv7-eabihf--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  f36b736c6cea721e743b2a075285d7b4d65e3b20d3b5353503ebf1c5ee509d36  armv7-eabihf--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2024.05-1.sha256
-sha256  eec6e21cf9d36ab2e8b9dbf4e26311d3d152927c72550bfe84872858e63bcaf4  armv7-eabihf--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--bleeding-edge-2024.05-1.sha256
-sha256  664509d1a9abe7a01f6b2274aff9c9f26ec86bae42c601100dd7a2c5930d9d9c  armebv7-eabihf--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--stable-2024.05-1.sha256
-sha256  50ca1e7c8bf78cdc941edf93d0a350d2c6b5b8024b582a57c7815f6e631ba43b  armebv7-eabihf--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--bleeding-edge-2024.05-1.sha256
-sha256  d8dc252c024a031524e56284bcea7b4706146d35fb6b04c5f0461f0bf7a31a8b  armebv7-eabihf--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--stable-2024.05-1.sha256
-sha256  c804e2e963fc21db22a9d4611089e3b207937c63f95a87de62c4e789eff79a56  armebv7-eabihf--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  d81849ea8fe7f8eb4b306712435491479f380ce60e203a83f651df51de7d52e2  armebv7-eabihf--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--stable-2024.05-1.sha256
-sha256  7ad4a602c2055bc3e9b39e64fbef3c14e61b10605d1039db95a64b7efd1f6e7a  armebv7-eabihf--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  fbab243d632e5dcaa56a9468e0a7f6afa52ebc15edb33f70a7060194cff66401  armv7m--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--stable-2024.05-1.sha256
-sha256  9891f5a43d1002a652353064e6543a1371c795938ecb595dd2f47a2d0ecc1e62  armv7m--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--glibc--bleeding-edge-2024.05-1.sha256
-sha256  88d1e108412116778e01bd72f90c6bb06c97e3a846dcc061644eb2a18499dc93  m68k-68xxx--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--glibc--stable-2024.05-1.sha256
-sha256  77f22dcafc78cde84e6441bd450aa3edb628b8f36ef6c1a160c942f38b38e5ea  m68k-68xxx--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--musl--bleeding-edge-2024.05-1.sha256
-sha256  f61aa3160dd75267a0b6018ca198f36ea99510f51d5a70eef8f2ac02d713abb3  m68k-68xxx--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--musl--stable-2024.05-1.sha256
-sha256  4456ec5b09fba57222ec8c3b9cf4d19a118a5dc876a58939e7fd77033af80652  m68k-68xxx--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  9d7b25be2a49f2c059ede1bc87487e0d23251b0f7376e3db9b2c61f0841e9014  m68k-68xxx--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--stable-2024.05-1.sha256
-sha256  92b41ec8da2da233c65ce96ad9db5e849d0d687378c799f774df6efe7c8f0e28  m68k-68xxx--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  6ef31adc06bb53b0b9252bbf7cdc93c22f0d6838dc9f51a4dc6e0fe2016eceff  m68k-coldfire--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--stable-2024.05-1.sha256
-sha256  370953f7c1e3bcf8b4e6849906991019f742fbde8532850aabd4eb3978e4a933  m68k-coldfire--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--stable-2024.05-1.sha256
-sha256  7a24a6cd76175d77134a0d02852204c548c9d2722e08ecc02ccf49f4c477792d  microblazebe--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--stable-2024.05-1.sha256
-sha256  f1e0d9406fdb211c9f44b71d4d3b4b68ac5dec4e379b24ff8a488f7945b99dfe  microblazebe--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--stable-2024.05-1.sha256
-sha256  17c6aa01b8421961b17eca4950cab8d292aa87d073f325525de1e77c5f7a5546  microblazebe--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--stable-2024.05-1.sha256
-sha256  2468c298089873e4d86026b84ca68e46b4802413639a55f2db1c6aba181d66d6  microblazeel--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--stable-2024.05-1.sha256
-sha256  72611e45e0a77eac21b04bfae70395b8bcfaf2c969fe51638db48a94ca9030f4  microblazeel--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--stable-2024.05-1.sha256
-sha256  49657597e55aa7d771cb4546c1d37d7ab9408b426d8c45f1bf61d90a53322a65  microblazeel--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--bleeding-edge-2024.05-1.sha256
-sha256  550803b9531b5a6c227329484c69e9d70ed08a29a456e9b941c5fe6b68f8258c  mips32--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--stable-2024.05-1.sha256
-sha256  677402719c545e49eb71c3d27a5f495af38f60463b40ed705e24e43a9834c137  mips32--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--bleeding-edge-2024.05-1.sha256
-sha256  28374e4431305b2d99bef9f706e1827390fc71848ce88d274a55c98674948bbf  mips32--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--stable-2024.05-1.sha256
-sha256  f553aec760bfc9f452f1ab071b25b84fd36ed56ab4c75149b351144561b4e0b5  mips32--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  2080fffa0f9b4e9e8e994e855fd3560f3cc1daedfa8382b57138dc3e09c3b69f  mips32--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--stable-2024.05-1.sha256
-sha256  52ed979092edad8100bc0275426e7eccadefa68b908ac35d18d29c385b30e12d  mips32--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--bleeding-edge-2024.05-1.sha256
-sha256  9dbfb7de343fef34e954989cd80ba8856baf771d8563c072cdba7b0a264a3389  mips32el--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--stable-2024.05-1.sha256
-sha256  d0139b6ade7f3b72a5f9c33814696af817661e826c9c501f6cefcab4ac684c8f  mips32el--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--bleeding-edge-2024.05-1.sha256
-sha256  bceda5815e975ff09530e5ba18d673ce4eccbfe42a2bb23c10dfd1a0ab54deb8  mips32el--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--stable-2024.05-1.sha256
-sha256  608b1b2434af563513df21ae0a6ab52af8a07b72a4bda760df946419cdd2645a  mips32el--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  578d18e1ef57b4c616803ce21e6cd0b1d3599aeb017830554c01bb3e11c79a68  mips32el--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--stable-2024.05-1.sha256
-sha256  ae4400a934074a3b1b39fb7ec79fb535da4e65b668f2330ca14576d072f6b13e  mips32el--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--bleeding-edge-2024.05-1.sha256
-sha256  daff6281bea63185811e96d91bf23a79fef4d30ac2da0e9a115f78e9989eefa5  mips32r5el--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--stable-2024.05-1.sha256
-sha256  afb30c73afccebb84b146efc6c654aabd8b92185a26fb1ba357ac0a2ce5f7957  mips32r5el--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--bleeding-edge-2024.05-1.sha256
-sha256  47f1291fa2a95e3ecc67fe4f410e4788bc65880bb1c5e465792c8376ee036448  mips32r5el--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--stable-2024.05-1.sha256
-sha256  6092b5d5e5f814e64038b205155016c3b1d10e3a3079478b4e1b0ab0b533c380  mips32r5el--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  98dcb8efe8f4897c6e7e6088238789c4f42593d4b08739cb7cb8dcd157765887  mips32r5el--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--stable-2024.05-1.sha256
-sha256  61b94dee2f60abd1e6698b283de6c5e2491cb5baf635d255addd5b4e7cc83afa  mips32r5el--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--bleeding-edge-2024.05-1.sha256
-sha256  0b374f870964ec8158beddf478beeec48a4ce09fa25a4a9c51c20a82839b3429  mips32r6el--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--stable-2024.05-1.sha256
-sha256  482cb60a8d0445b961fe1c5282826da9071f17ab37729b9c1c4ce7aabd014c7d  mips32r6el--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--bleeding-edge-2024.05-1.sha256
-sha256  19d6f280f4595a5fd0b43e16e9cd006163d94a96d4377399d93f5736716d79bc  mips32r6el--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--stable-2024.05-1.sha256
-sha256  fd5b48ebbdd220b517f179f609bbd98895c65f3d152eadacc4137e51a9bbcd6f  mips32r6el--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  adf63f7412d82e59de5bd19ea30068d205d7013c312af475d8b45656d20221ec  mips32r6el--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--stable-2024.05-1.sha256
-sha256  b43c05fa3e3157b5cf3e45799dfbba5e305be16b5b80da98972e89de5d737658  mips32r6el--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--bleeding-edge-2024.05-1.sha256
-sha256  d9d39286b9022dcd54dcabecfdc66e54cfc635a517128f005fd0ab1d2cfcc42d  mips64-n32--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--stable-2024.05-1.sha256
-sha256  411d6e399455c032759f71ec0aaba004da4157f462d1192c2accbbff8827fd13  mips64-n32--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--bleeding-edge-2024.05-1.sha256
-sha256  a07cacf4c88056ea612f64c50352e9fa2bb87766760fbae03577c50690f72d15  mips64-n32--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--stable-2024.05-1.sha256
-sha256  c058630e79b53333cca28ee1f34c3bb3b17bf03908a01f5c400a232d490d6a7a  mips64-n32--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  8f571a7f93092743d1d2a59c6e88ed9096c0c44327f0e9b0b8eda97a2aa51c85  mips64-n32--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--stable-2024.05-1.sha256
-sha256  ac0aef32929d8521e8f7201b56d3e006d684e71f59b29b1d40d853d31b07f7f2  mips64-n32--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--bleeding-edge-2024.05-1.sha256
-sha256  fb0a9e12ad0267691174a0c70fe604fe5527945d9997a7329b56e87241c49fcc  mips64el-n32--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--stable-2024.05-1.sha256
-sha256  bc3035338f5874d1d6824fd75a9231d2a126e113b8d4e27f94c57be6795b97e0  mips64el-n32--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--bleeding-edge-2024.05-1.sha256
-sha256  0525423b138f5e8e83babe591ffd8ea9aed6f34f20ee4af5e346479cad6f3dbf  mips64el-n32--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--stable-2024.05-1.sha256
-sha256  d620b75ec5a05c0d76b132200e69c75c308c582696d616036d7b29dae21b730f  mips64el-n32--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  f9afb690787968bb0365130fe5350ccdf2b2618e5ab658d696fab84bac4b09e4  mips64el-n32--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--stable-2024.05-1.sha256
-sha256  b1ce285a91107632ca5492f3e05d3488df314484f0ab8700f5fce5085fb271b4  mips64el-n32--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--bleeding-edge-2024.05-1.sha256
-sha256  fd65b96514a6adf429b31dada2eeaae79a1eb00a21340998a24abe8420fcf06a  mips64r6el-n32--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--stable-2024.05-1.sha256
-sha256  573721a0d53dacc34bf28f7f3e7e46fa79856e600cd515b270366ef7b900351e  mips64r6el-n32--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--bleeding-edge-2024.05-1.sha256
-sha256  e4353c990ea99fb5e39f9c64b6b92e614c0c6cd1760730334b6f2391aa10f3c6  mips64r6el-n32--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--stable-2024.05-1.sha256
-sha256  cce09fc456b592a993a7c8d182cdd1f04397a8160f176d9ac6799d8e2e09cef7  mips64r6el-n32--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  e12b6536fbacb624b0d938345fb29b202c8b174893d0d8fbefde46fbe727c729  mips64r6el-n32--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--stable-2024.05-1.sha256
-sha256  a0db853f4c40d120d22e6762ca4bff64e0c3e3db74ab59950967917aeb9bf330  mips64r6el-n32--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--bleeding-edge-2024.05-1.sha256
-sha256  0de17cd13642f71f112d086c1df4b34670440ceb459478a0f3d55007945633ca  openrisc--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--stable-2024.05-1.sha256
-sha256  a6e06a72285ca8dc9974f2060cb79aa85e0a1388553871a7c48785a077cbbe2f  openrisc--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2024.05-1.sha256
-sha256  5765a9fd73d4b2fa8bb4fd0d94b8ee8b88307684182ed62e55e0775ecdcbf09c  openrisc--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2024.05-1.sha256
-sha256  cdc2a9e3f69aa32df36580151d51d359e98147a604745f9927dc0314e5d7dd39  openrisc--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  e79e8c669368cc2dfbccb4f6080491b06e6d2d8851f73e0c849e066821ccbb06  openrisc--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2024.05-1.sha256
-sha256  51527b6a9e2063db756d836e250866783bcdfb40ab0f122d6d65c7401806cc44  openrisc--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2024.05-1.sha256
-sha256  58efcbb6133dcc070332b570ee491840c8cf386a75180e7bf56c403549d61699  powerpc-440fp--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2024.05-1.sha256
-sha256  ebf598b97cd9641bf5993aa3f78288272771ceee21053ced5ac53b1194ebedd3  powerpc-440fp--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2024.05-1.sha256
-sha256  6888a4800d59228fcbd2c843378357619b32b7b8265ebc3b57895e4e92ca1d70  powerpc-440fp--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--stable-2024.05-1.sha256
-sha256  54eb3b651655b426c81ea7453470510a62e97356418f4ca748a35a7c0d225b52  powerpc-440fp--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  f98de4013224c65ecf36b9733236a0beed62782e67e9c4a5259a188e73d8dead  powerpc-440fp--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--stable-2024.05-1.sha256
-sha256  9ecebc59591b81e2d5b502b34ab29fcefd21f4c3343e7695beb2ee894d34dc3d  powerpc-440fp--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--bleeding-edge-2024.05-1.sha256
-sha256  2802aea45aab7231fe9301639beab9f632751edaf26cb49ede65ab45603f9807  powerpc-e300c3--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--stable-2024.05-1.sha256
-sha256  6c975a7293fde77a52f348124049645ee2ceee19e75ab6e0b2364043090a2dff  powerpc-e300c3--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--bleeding-edge-2024.05-1.sha256
-sha256  6689847112fdf6b1be5cd17cf351a1e85ec42a1034993e203efbba2fec011ca1  powerpc-e300c3--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--stable-2024.05-1.sha256
-sha256  60fb6b828e58b5548514fd65c50457d190791191d3a7dcec1fbf77f0028bc240  powerpc-e300c3--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  40ed47b662384ddc480c1cdaf3615d44956f51fc9c389688fe6054f3ebcb1f11  powerpc-e300c3--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--stable-2024.05-1.sha256
-sha256  45c3324fa19f66adc294bfb99c1ea45b1a1adafc2c2431c3ba1f56cd5588952a  powerpc-e300c3--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--bleeding-edge-2024.05-1.sha256
-sha256  86dab3468dd71a4a6677bdf75442297ff9a9e8deb6cd472846f6c73f09eefa16  powerpc-e500mc--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--stable-2024.05-1.sha256
-sha256  365e30fda99630e5bcf04c4913f905640025b90cc9d1a4b17cccfc729827d335  powerpc-e500mc--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--bleeding-edge-2024.05-1.sha256
-sha256  4337db3eae7b0d10057e49f1c01f6ff539de1490d1dde3b1b692306b1cb41533  powerpc-e500mc--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--stable-2024.05-1.sha256
-sha256  3456bca0016d0c3855a644845aa627c25cd61ce763529a6bae712f8d6d9ddd8d  powerpc-e500mc--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  774b1fb431e10c840529521ff2d8a80efaaf04d3d65698e60b3484e3ead85730  powerpc-e500mc--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--stable-2024.05-1.sha256
-sha256  e016795898f13326ee551aa0a21ee77e58e2749065136e162cb88e64aa21ff07  powerpc-e500mc--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--bleeding-edge-2024.05-1.sha256
-sha256  1747006fec4219fa71ac77b98e6b404f9f030140a5f1295465e3ef4391d91687  powerpc64-e5500--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2024.05-1.sha256
-sha256  588b8d77fbc991c2f26b356349cfdcd08d89df0d88477c8adfa00c20d9031ad3  powerpc64-e5500--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--bleeding-edge-2024.05-1.sha256
-sha256  904583088a1690e8e05c469202abf6df8fa719c55871b4a5dd240ba284240155  powerpc64-e6500--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--stable-2024.05-1.sha256
-sha256  dbc8d38479d0b80675cb410f3285d1f77044222c15e8547db59a53b38436b5de  powerpc64-e6500--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--bleeding-edge-2024.05-1.sha256
-sha256  61cbeafa30ff0ecd225f933892a1696b4bcf83abed49fee7ff6e963fcdb9063f  powerpc64-e6500--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--stable-2024.05-1.sha256
-sha256  2ee53f50a60a36f99243d6d9a2c15a7ee1e15384d10773d7f98da941506f1fb5  powerpc64-e6500--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--bleeding-edge-2024.05-1.sha256
-sha256  729c9a302bba3d03e1c834bf3ae8e080c63456d9eba8ecac4c8f481efea8b77e  powerpc64-power8--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--stable-2024.05-1.sha256
-sha256  8dfeb7f1ec38e623c98c125539df6ccc7fad1c057b7ab36d65c2b6426c03b332  powerpc64-power8--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--bleeding-edge-2024.05-1.sha256
-sha256  9cc19d57a1374afbd41624aaa968f01914f884e2fb303f73f90d6e94c23ba451  powerpc64-power8--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--stable-2024.05-1.sha256
-sha256  d5f928ed99dd4f7dae5c4b3d47c0f463a990b7744866d89ba82e08a7ee9f9a8a  powerpc64-power8--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--bleeding-edge-2024.05-1.sha256
-sha256  3b7382684dd77118498b5e502fd90af616c3f6006843d27f538881505cb4a4d7  powerpc64le-power8--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--stable-2024.05-1.sha256
-sha256  8133b74614f880eb8b76730efee77b8fd281c982bfa2791b72c5f836a529530d  powerpc64le-power8--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--bleeding-edge-2024.05-1.sha256
-sha256  8506103888d0ee23a2e3126083e4f05ef18399c7adeb4e68838f864435394409  powerpc64le-power8--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--stable-2024.05-1.sha256
-sha256  62f056b5993f6d1bf2d94a61d01e1d4aaa58906107db3af11ac882c989ed7c1d  powerpc64le-power8--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--bleeding-edge-2024.05-1.sha256
-sha256  944fb2719d8657f1c5ee359046caca25a2080fe3535e99cc9dca78c20973c6c8  riscv32-ilp32d--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--stable-2024.05-1.sha256
-sha256  00112418e6d4b0733019a673b682a39f1ce6300b9448cd840f1194aa4b064192  riscv32-ilp32d--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--musl--bleeding-edge-2024.05-1.sha256
-sha256  deabdc08dc49bebe43e445c015b393cb38ecb806ad04d230da2a5c95ef9f2fda  riscv32-ilp32d--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--musl--stable-2024.05-1.sha256
-sha256  bbf26ec29272814da1eb5eb97339ed36d2dda66655c4c3612951e3cfb2b842ec  riscv32-ilp32d--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  7fb15b36e351bb1d749abec24eb62b106ada56b3483a910352e9a48e0e8138ee  riscv32-ilp32d--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--uclibc--stable-2024.05-1.sha256
-sha256  4c74eb1062805f1e28ccc2aee7c006e55823a780eae84c81d5b58433361b4f11  riscv32-ilp32d--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--bleeding-edge-2024.05-1.sha256
-sha256  a9e41a646d6757e47ab0539171bef54a6c0bf68f191210500875b386ea15444c  riscv64-lp64d--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--stable-2024.05-1.sha256
-sha256  78e16f3def8b2ff3da09c16155f993ac7e4dc1791d0904ada03fcb2e04910aab  riscv64-lp64d--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--bleeding-edge-2024.05-1.sha256
-sha256  0acc030f695f48e29f03f25294ee5b6ebacc8ab93de5ed0c6988e9699c417510  riscv64-lp64d--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--stable-2024.05-1.sha256
-sha256  481c9353467f42d02edf9080954b3c14a75ff7c19ed9e8fbf9cfa67d028587d3  riscv64-lp64d--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  17d5745a3d063ebd94eb7172c2b10d0d157869e3fe46a8d27d0a4ec2da33b071  riscv64-lp64d--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--stable-2024.05-1.sha256
-sha256  1c336b0cc87a1c01a434b3666d4867f033c9f7844b0eb84887d32f309ba9ce6f  riscv64-lp64d--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--bleeding-edge-2024.05-1.sha256
-sha256  3f388a1549601fde95a084a439d8f514694d9819c2a75eaa678ac263b6ea5ccd  s390x-z13--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--stable-2024.05-1.sha256
-sha256  b37ed02693a370f28434c34655c64bcb96dc0d428a92ddbc99feb5608bcf64a1  s390x-z13--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--musl--bleeding-edge-2024.05-1.sha256
-sha256  9bbb6fc607a76c32964208ba2e2e0d09af4cd7f1d0b9511e524363e86147992d  s390x-z13--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--musl--stable-2024.05-1.sha256
-sha256  9dc280763cb2b18ea9417ffaf7fee2e24c9833033e730108138179a9887ef299  s390x-z13--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--bleeding-edge-2024.05-1.sha256
-sha256  f4e6c46deeee5301ea4782b5eb6705da5261b16afe40fcc342a1a7d2430e9061  sh-sh4--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--stable-2024.05-1.sha256
-sha256  6290f90417b194c467cf432d9c012d4321827160407c5b4664a443910a54c7d8  sh-sh4--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--bleeding-edge-2024.05-1.sha256
-sha256  3d6b8fb7c21d83528617eaaec7e078e0eecbfb0c939ea7be5794c287735d644d  sh-sh4--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--stable-2024.05-1.sha256
-sha256  acec95cc0b26cc82de58bd5aee7472511563cb0145ed2f74a72344070216cc39  sh-sh4--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  6b7a3e1048c7679c8ae9be113cd51a8be0b2816502f00bfd006a035753061700  sh-sh4--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--stable-2024.05-1.sha256
-sha256  3433820a3ca8296d5166fbe0d8bcc722536fa9d71b3631667bb5039a61fbc039  sh-sh4--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--bleeding-edge-2024.05-1.sha256
-sha256  cb4d6abb85e3e86d6d0b285d2b4d7ad6ece6483835f8950742e17ff5a2967ee3  sh-sh4aeb--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--stable-2024.05-1.sha256
-sha256  07c14c3c9bdee411bd1d5c04cd2a1ff50dd98231f1fb648f5746b0d2fab81767  sh-sh4aeb--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--bleeding-edge-2024.05-1.sha256
-sha256  1c10d7c73bc61076007bbab909400dfea9cb7c6f9c356c03ef2bbd996b8ba003  sh-sh4aeb--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--stable-2024.05-1.sha256
-sha256  ebcbbff459bdc76f9ee3627b8f8688d922192eafaf1890911d2c7454a4973aec  sh-sh4aeb--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--bleeding-edge-2024.05-1.sha256
-sha256  5bcbc1fb43b8f0240b2f2503c8dfa9a2efa38ea23d2a2f44df4acc5a1288ef9b  sparc64--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--stable-2024.05-1.sha256
-sha256  29d1e6c0d45ab95edf33ff2ee77b27869669f476a23d76fef96f56f8d3cc6234  sparc64--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  c74944737263acbabdbf7b646aa41dd6c96336d2dbbefdeebbba9866e1374a0a  sparcv8--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--stable-2024.05-1.sha256
-sha256  8ec2c84b84a13b854a13802537f0b04848056ebc65f6212202f6d8c8a78d4bc3  sparcv8--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--bleeding-edge-2024.05-1.sha256
-sha256  bc7ce1172602a377b5444d09b349e7d9fa2662b7ca59a95b884a7ea18c4de7c7  x86-64--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--stable-2024.05-1.sha256
-sha256  932823ca9a3e067e7e2a29810a666d20c9cc5bb550de947f6879e38ace1aa955  x86-64--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--bleeding-edge-2024.05-1.sha256
-sha256  2721cb2421ba1f9740a739247da9c12fbebbffeb131998719bc810d7319eb9b9  x86-64--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--stable-2024.05-1.sha256
-sha256  f3cf417d28e7df95bdab632ff837de66ac03145bd0e1dd78cc89aadfa6e31526  x86-64--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  80830735a18239dd644b6aefbecd24437cc593402120b6eba0ff8625306fff3c  x86-64--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--stable-2024.05-1.sha256
-sha256  da3c9a340e5d4c5037f2bc3114d262c5a27e8224df5c9ca6dbf5c5b4740445b4  x86-64--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--bleeding-edge-2024.05-1.sha256
-sha256  809974fbfa1231e87ce40a81c6b2f78dad0cf4b0a61a6e9480a1c453f3983471  x86-64-v2--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--stable-2024.05-1.sha256
-sha256  4db498b45f0a0d85d5810ffe2d9558225f73159d261bfc7d8c466893d2f1ca08  x86-64-v2--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--bleeding-edge-2024.05-1.sha256
-sha256  93e59f4ec983bf600337fc624e292ed86942d6c8f59af34ed8300a45474665f8  x86-64-v2--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--stable-2024.05-1.sha256
-sha256  f3c84a280e6fce53bdc95de1ce697fb354c85a3739c5102198e0930961a5bcc4  x86-64-v2--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  36b00ba714a82b0840165ce5d77931660d7daf571290638504791a71022f3fe5  x86-64-v2--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--stable-2024.05-1.sha256
-sha256  ca1dda638c053ca8a0992f71d02f4ccb54513d523bc3b09ded0017368ac258bb  x86-64-v2--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--bleeding-edge-2024.05-1.sha256
-sha256  18dcd9bebbe8369ffa577dfeae3c3d6622a8b7c022a6f41ce70048c7d41ce518  x86-64-v3--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--stable-2024.05-1.sha256
-sha256  21e08661a702695bfb1fbcbdb4c671e4c8146db2daf92e23e38e501f227584af  x86-64-v3--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--bleeding-edge-2024.05-1.sha256
-sha256  d2470a0001c7a00906752e8523a940a696a1218da7e9dd7b62f8fca3f58fcdda  x86-64-v3--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--stable-2024.05-1.sha256
-sha256  e7f7da14ff1378bb7ec2a4014fa4f4fdc07b089e248e50f60ce930fd9b9fbc0b  x86-64-v3--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  565883663c3e1901c7f8059dc8b55219940ffb464dc815b35801a81597a9b1de  x86-64-v3--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--stable-2024.05-1.sha256
-sha256  6bd8b7ad75da84eb0f4f9da277584e79906c0a24dfa30e908cc20847f37a23fd  x86-64-v3--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--bleeding-edge-2024.05-1.sha256
-sha256  5de99096e454f9fbbefd5e358ee926c1999912c7f154abb0dca081fc38474554  x86-64-v4--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--stable-2024.05-1.sha256
-sha256  b546f055275d333c689dd9e0c05ae63b5b5419b5e79a5784dea898cae8d2e093  x86-64-v4--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--bleeding-edge-2024.05-1.sha256
-sha256  f58bea6df4ab87cad5dcfe95f64a57365bd44a7624f19fb463762de1b41bf452  x86-64-v4--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--stable-2024.05-1.sha256
-sha256  fab47f56200fa54ce76c854f7a048fe61a2b346b87884199bb7e9ac527a86de1  x86-64-v4--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  2806f6e9a586d17b0009cf6b8b4ed351b3a6cefea552890e41ab9b56917c2470  x86-64-v4--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--stable-2024.05-1.sha256
-sha256  38ca4406dc1706153850ce331b82eda97e2badbd09ba033981da1bf66acaee17  x86-64-v4--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2024.05-1.sha256
-sha256  3076f0bd485696a1b8f29683d9330dcc79526cc9328064911548dd66e7bbe84f  x86-64-core-i7--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2024.05-1.sha256
-sha256  c80884040a81a33fdd6a4d3f54d63650dbeea280ee6324664faba094ad93bd74  x86-64-core-i7--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--bleeding-edge-2024.05-1.sha256
-sha256  0a8a2e6f6dfe8207bef3ce7c0445e4b72f57390ca590f6d50f61f03eeb8e2e0e  x86-64-core-i7--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--stable-2024.05-1.sha256
-sha256  da77433e841011e0d8e3c360851e1e4b88996888a749b41067bfd7296e47f1f3  x86-64-core-i7--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  eddf678bfb23dbc2d07157c3371f8c45e8e9f8438ad64b615fa35e94d2a840cc  x86-64-core-i7--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--stable-2024.05-1.sha256
-sha256  4c4a8ec05711f2e902b0cea50b29a6f536a0f184651ebe03fadcd8aa5febe11c  x86-64-core-i7--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2024.05-1.sha256
-sha256  999cc27420b4305e200017d0780759206656cf0d39f20fe4502e4e547c9a432b  x86-core2--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--stable-2024.05-1.sha256
-sha256  8bbff9a34cb5807bd81d46489c115fc4073726db2afab079ffdb7e4b44994b9e  x86-core2--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--bleeding-edge-2024.05-1.sha256
-sha256  583b11a382b536610c73583121500ee8e88ec3942f99090051a272ca0891dfac  x86-core2--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--stable-2024.05-1.sha256
-sha256  c28cb368d67172a6e2d404250cbd5b1be70c1ae4f77e4514a46ac82bf53c030c  x86-core2--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  d73f4119c0afc073fd1273cf1cc787b531b64665fb1dd1a2304de8c0fe4445ac  x86-core2--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--stable-2024.05-1.sha256
-sha256  69fb29808de400fe59dc8c47b60c0e0cb5b65f48cbef09432edfc8cecb25a6b3  x86-core2--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2024.05-1.sha256
-sha256  81115a9b098b86c5ff37f3adac265d55c572fef1936378991995c285d9a65847  x86-i686--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--stable-2024.05-1.sha256
-sha256  023e4f03cd212b5545c4c184238693b61b40fa36d257b84546100a92ea2c1d8b  x86-i686--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--bleeding-edge-2024.05-1.sha256
-sha256  1fadb2e0195eec06efef94f16339ad1a950789dde618bd17f22fbc7346893584  x86-i686--musl--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--stable-2024.05-1.sha256
-sha256  f16c0f2cff527bdf9753135d5e22dfe81390f3646c34d05d951d23f76fbe06e9  x86-i686--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  b958ab84b59f2993afa5b2aba4b24b42c95826ae9ea01f04cf6b2dfbbb2e8a6d  x86-i686--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--stable-2024.05-1.sha256
-sha256  e240d983717e03a8ea7c5ffba71077b555f05f40694f177e23756d2a47656599  x86-i686--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  eec483e97164d82939034c28bf3443e1d3d92f1674b9060d4086b773ac4e6ea0  xtensa-lx60--uclibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--stable-2024.05-1.sha256
-sha256  99f275b884895049a2d47812a94953199368da99f4bc2bd39869711006610c0e  xtensa-lx60--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2025.08-1.sha256
+sha256  54875d12829a792b8d4d1c9fb1f736afc60f514b0d260616f188eafafaac7cb5  aarch64--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2025.08-1.sha256
+sha256  dfb47eee874eef9e8a7fc042eee4e0a183f444b6bcde6a82fef8f009918389c9  aarch64--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--bleeding-edge-2025.08-1.sha256
+sha256  e102fe06809440bbca3b6d0d8837ffdb5122b07386d1d2ac023084d898aafe7b  aarch64--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--stable-2025.08-1.sha256
+sha256  defba831ffa1175236f137069333e21ed46d4d19feb5080a90cf248b6fc2cb08  aarch64--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  61e07fcd9e5e114e417d4c1fccf5cda5c75b1d5a1c005f848a6868ea4a0ba4e1  aarch64--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--stable-2025.08-1.sha256
+sha256  e2f636f61d9eddbb503f7c9b04db1d9000c3c9281d9943afe373a61cbf944e3a  aarch64--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--bleeding-edge-2025.08-1.sha256
+sha256  9ad606eae73d7b48a1f7f658a9cd4af48916855f8fa27f7c6d0ded20ee5e9d9a  aarch64be--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--stable-2025.08-1.sha256
+sha256  4eca1a03d3d73bd31427d0f231d40a9f00a682a50c6ae5b31f6738a4675f9dd8  aarch64be--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--bleeding-edge-2025.08-1.sha256
+sha256  e9152e550b0382df90ac177f9463d62ea2f7301372d71397db6205c7e7c6565a  aarch64be--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--stable-2025.08-1.sha256
+sha256  27c3196d69457ff201613eacb4764eb0f6dca8a2b56c4d4d13ee62c2fd3e18c7  aarch64be--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  d575f74461619f072bf394d784fb1e68d07cebb21ebf4ef07a40856152bffd92  aarch64be--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--stable-2025.08-1.sha256
+sha256  6d95a432130f38ddaffd04e08e2e21e3f58124e695d4c4ead7879a936d8333f9  aarch64be--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  2e38f7bcd0b7f81bfb54357b2fbd327300fb14f5977414f1f3dcb871dae5c75c  arcle-750d--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--stable-2025.08-1.sha256
+sha256  dd0fb263ec10ffd15a4743974af6509a66e705c1da1dc1a72a270702e4567be0  arcle-750d--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--bleeding-edge-2025.08-1.sha256
+sha256  9f871ad3a93ce027adb66b4239396fba8da021924877f6dd0fef5ee2e7c7b9a4  arcle-hs38--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--stable-2025.08-1.sha256
+sha256  c854f2339336662b02f8f440c348e25fa98eb80eb6c78405863b9ee5baa73a79  arcle-hs38--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  99086c8f5d779f1b19c57686778793020c7bb3af527604f132e2bda252915627  arcle-hs38--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--stable-2025.08-1.sha256
+sha256  acf19ed3f1fd6b633cd4ef0e84bb5df8c20890ac4efc7312de4c00221ba7a774  arcle-hs38--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2025.08-1.sha256
+sha256  bea49b0a172d318c9eb08a568e5a94ffac0d5f320aa88625e4c8126bc0dcd1fc  armv5-eabi--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--stable-2025.08-1.sha256
+sha256  53f3d7c2b0ce32f120043bf4b338b3ea3f3375015ed63f5b382a5f62894baeec  armv5-eabi--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--bleeding-edge-2025.08-1.sha256
+sha256  e8cc7d8033291da63a5390b3450c027d2722594f606d465d5303cb35186ef974  armv5-eabi--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--stable-2025.08-1.sha256
+sha256  8cdb4ad70c6b5a66427fa3315fe3ddde1c19c90232674dec59045e04d2a36cf1  armv5-eabi--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  b0a04c35aa32a5722dc4f3f73288685855b932e501bad9397a9a3da7a5a1f637  armv5-eabi--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--stable-2025.08-1.sha256
+sha256  e5415d32b39e94bf7b990ea4ead3619bf7055e338309d2cce2b6de2dd7307f12  armv5-eabi--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--bleeding-edge-2025.08-1.sha256
+sha256  a9c2557e48c010361411c0c42ebacb35543ff0aa3377211be3bd049414267d16  armv6-eabihf--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--stable-2025.08-1.sha256
+sha256  062c148a62785ce583f32e2e69bb1e8fc5dbb598bf4baacce0df118de4066de8  armv6-eabihf--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--bleeding-edge-2025.08-1.sha256
+sha256  4159a6456e6cf2858fc3356da135d34db489d446cea6edf943a2e6a2e342de11  armv6-eabihf--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--stable-2025.08-1.sha256
+sha256  1a283f0936953c139d7171187414839c119997ea816de201f97e79ea3cfd6947  armv6-eabihf--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  925c12a0c1c3d4e9f86b9c94947546e9c4f786c0b5cedce7e55bdd68e3aedb08  armv6-eabihf--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--stable-2025.08-1.sha256
+sha256  8977f8e657518955d685263d527aa05ea502c5cf937fff926c2e1abbe2150299  armv6-eabihf--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2025.08-1.sha256
+sha256  eed0e672d305ac08d444685b48eafb291c63387ef7916c1615354ebfb3d1ebdc  armv7-eabihf--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2025.08-1.sha256
+sha256  97d6fbaf19832002f3d6aa8fd31b2d29c1dc7b0752f4ae8ed35860fd33c1f9b4  armv7-eabihf--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--bleeding-edge-2025.08-1.sha256
+sha256  d3ec56feaeb5ffcb9c953b54acfcf99d32ad16542fe9206574f5cd1d11a74b48  armv7-eabihf--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--stable-2025.08-1.sha256
+sha256  2f3a34458c3a8b961bd09f89669130fcdc4c1dbc6e31ada720527e4ad3741c11  armv7-eabihf--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  4a2c03247bc9bdedf72bdd4cd4e3f1859fb9b915a92e16fdeedbeb6d6d6b3399  armv7-eabihf--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2025.08-1.sha256
+sha256  1368328e9214ec71f0f9cea5229559fdd477e614b1e85c062fb562357b0a00ba  armv7-eabihf--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--bleeding-edge-2025.08-1.sha256
+sha256  1380971b9c480a7b5ed704e33e6e5d77974ad3a1e4a3b9d525f63e150387f7a4  armebv7-eabihf--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--stable-2025.08-1.sha256
+sha256  98150dbf42927fe33a1ce51f48d13fcd83e04ba7c3d8c9ad0fc1837a3fa971ce  armebv7-eabihf--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--bleeding-edge-2025.08-1.sha256
+sha256  8e724c1a763d23a5ad107ddbb77cc34e534b7aeceecbd6f9e65ee0b133b7ebeb  armebv7-eabihf--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--stable-2025.08-1.sha256
+sha256  6429155d88514c508181483616ff23ec2307af5fa24ff55e340ff9a84acbb37d  armebv7-eabihf--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  fc9fb31cf07e3bd6d1206765b93250ae44fb09c535ac182619c9d1612d926c1c  armebv7-eabihf--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--stable-2025.08-1.sha256
+sha256  e048d4a7022b07cc585c5ef0c78842479bfcddcb521734f3278acb08a9f8dc99  armebv7-eabihf--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  13ebf698a4bfcdbb41d8e619cf76fbeb15224fe7c5239436a7e9c558ed7852db  armv7m--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--stable-2025.08-1.sha256
+sha256  8024e0e353c85eb9c0a70aa258a0b6a2023e619e4d8cde082578742a80e1278c  armv7m--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--glibc--bleeding-edge-2025.08-1.sha256
+sha256  7e59552b90bf7ac1d122977d68e8a67f00e56d4aa591f0690d7d7742f611fe19  m68k-68xxx--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--glibc--stable-2025.08-1.sha256
+sha256  0ad3bde066917d3d57b05b89fd13529acd401f4bef4a2afdd0c14452d039ca77  m68k-68xxx--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--musl--bleeding-edge-2025.08-1.sha256
+sha256  defaa92f0a236c32384b681c07511e3cdc6dc7350ee570dd79bc64427fa8380c  m68k-68xxx--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--musl--stable-2025.08-1.sha256
+sha256  356551e95045f9f3ead162d9966ae02c914049c2512e4fbf8ea81d06edd5f2fd  m68k-68xxx--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  a6566dd60e1f483d9eda0ffb6aa881e9995ee23f9f04bdb69924462a7903a5a4  m68k-68xxx--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--stable-2025.08-1.sha256
+sha256  bd065f2539e8ac03fdbe6fbb8b94f02c73337a828e958cc8e6fe27219c0b919e  m68k-68xxx--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  7bb582b01d02d01533019e949dfbee163a45b998d9c59d08832002efc46c9642  m68k-coldfire--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--stable-2025.08-1.sha256
+sha256  ae1f50f6b274464208ebd291dbd9a6b2fa35682c16ed390eab4d8f6607006a77  m68k-coldfire--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--bleeding-edge-2025.08-1.sha256
+sha256  0afdbfa599ea51e29242d2e3c2dc4e89f29e8d908ba988cee27eb51084660fda  microblazebe--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--stable-2025.08-1.sha256
+sha256  dd0851e3e95feaebac2e078b8ad49bea9a82007443808d054e09f0a10a43dcc6  microblazebe--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--bleeding-edge-2025.08-1.sha256
+sha256  f4ea28fd3e6651bf3044d08abe7816046da4898ca5d7611f3102bd6103930473  microblazebe--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--stable-2025.08-1.sha256
+sha256  99c6105e256a5a928595e18496996949201479fe9ea88aadcac8036d8be6d350  microblazebe--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  15f279cf63289f88ebac16772463e49d0d18d859d3e3bfe2c6ebe07dbc2cb9b7  microblazebe--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--stable-2025.08-1.sha256
+sha256  33eb906e9620604690986767be46cd0f516dc2b425a90d97b99f0977ff209557  microblazebe--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--bleeding-edge-2025.08-1.sha256
+sha256  9ce246743ac66207e76c3649a9880f5a727e46e58d5384283af8b9a369060b2f  microblazeel--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--stable-2025.08-1.sha256
+sha256  d171dcc14e21103636b4e6e9f59986303678d8a02435bde3453c3407fbe61424  microblazeel--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--bleeding-edge-2025.08-1.sha256
+sha256  515adfc96b617e57d5e0b0a2d552c55e014c3ba7ea0961ec205739015804bdea  microblazeel--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--stable-2025.08-1.sha256
+sha256  85654de9dff94aa016510ef1700e90ae25ea4c74a15d9bdde3bb543d2662f09a  microblazeel--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  add7bd4c6eed777af458fe84a5716005a10859528642dd8185b0293157cf10fa  microblazeel--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--stable-2025.08-1.sha256
+sha256  8ec6f521b5ca9ecb3eb98afd0c7bba7b42ba07329d08331aabe2300d9881a3b5  microblazeel--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--bleeding-edge-2025.08-1.sha256
+sha256  6594fd0af39c24e8c1dafb40b39aa7beb6d1bb51d54d525acf7088022ce9c318  mips32--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--stable-2025.08-1.sha256
+sha256  23d0f36aa7962230ef43338ba14ac2a7fa6eb68e15ef39cb9114ac711b907f70  mips32--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--bleeding-edge-2025.08-1.sha256
+sha256  a0a868d17980f80d1e40f81d4caa88b72f27dbad2b7c2119521a9bcc78969abe  mips32--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--stable-2025.08-1.sha256
+sha256  35b434d3ae1a46065d9e37de56b71bcf0e72bcda652f96d185e51dbea7ef045c  mips32--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  f6b86ced93fdd4de9d97db2a30aa0545822223c7be4a5dc043aa67b05b8dbe84  mips32--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--stable-2025.08-1.sha256
+sha256  0218bfa5ef4624350e48cc372632fb4bac60db54822a56f5565d4144c180f095  mips32--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--bleeding-edge-2025.08-1.sha256
+sha256  cee17e45c3c40255796b7ea80e0499aead00504ff51d0f8201ab10f18ff5e4eb  mips32el--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--stable-2025.08-1.sha256
+sha256  1085fe6b13d74205ef6e92d1d40fb3960bf6e4bad50555c723fa07416cb53c1c  mips32el--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--bleeding-edge-2025.08-1.sha256
+sha256  94dc82f94e87eb143d0959b3bf9e2bdd1d6d99e51752977e5cf1f249de69e46d  mips32el--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--stable-2025.08-1.sha256
+sha256  12a5e2f50b94b5c619730914db380ce9679798fb3c7460a40d480f77bb50628f  mips32el--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  075ba385cee0a40e32dbd658a517373488536150b6e2ebb9042ff6d4450257ff  mips32el--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--stable-2025.08-1.sha256
+sha256  3911658253cf2e4b6168f0dca1511b96dae355979cbe4aa457a3bfe8116b9d97  mips32el--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--bleeding-edge-2025.08-1.sha256
+sha256  5ed7b512c4b36244bfbaaccfc88b0f8cb81031ad6b709a18005ba8187d79114f  mips32r5el--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--stable-2025.08-1.sha256
+sha256  47e4a737c7f820c4f490ac7ffb54adf2c853d7a05e450ef1e6da3f44e663b487  mips32r5el--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--bleeding-edge-2025.08-1.sha256
+sha256  78c2942feb0bb1ee9f19060871fc320f33856abd1d9717a5c6aa8d9e0355bf20  mips32r5el--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--stable-2025.08-1.sha256
+sha256  c68ba5c5122c8df26c96348249467d3fdb4b1405a4ef316a365c1e8c82594edc  mips32r5el--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  14f6b101aba02a4978deddd4a9dc91d84e0145bba0b2c7204e439e036ab1b684  mips32r5el--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--stable-2025.08-1.sha256
+sha256  7ce96fc3e0fe7409de3db1a205d74c0c9cbd30ad1371fb54bcee5f50cb517c72  mips32r5el--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--bleeding-edge-2025.08-1.sha256
+sha256  3594f3dbc57ee3901af3c3f262969e633a57991e2b7b6ec7bd4ca6eed2b7c677  mips32r6el--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--stable-2025.08-1.sha256
+sha256  a43b136dcfc081a3c5cfe411cf9b47b7c1e8dd98d133e5afca72869e59c4794c  mips32r6el--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--bleeding-edge-2025.08-1.sha256
+sha256  3a64473a8a58e71bbaa45cb0eba9b7c079f34a2e153af23fee0f90f7bfd65da4  mips32r6el--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--stable-2025.08-1.sha256
+sha256  402aaf0420e728f45ee8702d05b84519d7f423944c59942cd17f65bb4cff75d2  mips32r6el--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  f840342d1775c349476c76cb2375c036c6a2061cc34c4fe7e22b1b1fbc993cf3  mips32r6el--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--stable-2025.08-1.sha256
+sha256  1731fc7edec2e39b5040bf09e1d8212c2b9ce9fee337148324134163f265e497  mips32r6el--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--bleeding-edge-2025.08-1.sha256
+sha256  fcf828be016eb08f67cdfa27caf6253bb61cb51a1ca1fff88881aa6dd8fa1771  mips64-n32--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--stable-2025.08-1.sha256
+sha256  4f6220f1ea1afe900dd0f014dedfaa7b216fb05b002bac0e5bf2377a50d198c6  mips64-n32--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--bleeding-edge-2025.08-1.sha256
+sha256  ebee97042671dee23107ea950a8a828219d66f28705376d46e8d71c5c4b8aff6  mips64-n32--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--stable-2025.08-1.sha256
+sha256  e84dfee1d90952396065d2bcd0f28dac3d315bb59012b6f7568a63f3789b853c  mips64-n32--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  cc4e36fc1f959fb0529376de5a6a70f25adb822fa0db4f876e070ded82599ca3  mips64-n32--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--stable-2025.08-1.sha256
+sha256  9938c76f4a65aaa79494237597cc751479e66938375abcd8a7bdddd39f04ccd0  mips64-n32--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--bleeding-edge-2025.08-1.sha256
+sha256  b2195ffc091a2ebd2027e5c06d2b68e4f294877b5352fc6b84982d9b67723a65  mips64el-n32--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--stable-2025.08-1.sha256
+sha256  3c370fb4ea2015ffe77ed69ec6af2b33bdb74be88d4ca544fe0588fed9762c7f  mips64el-n32--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--bleeding-edge-2025.08-1.sha256
+sha256  cdcf1e6852326aab2f3573a669e92aafd053c3c02256d382183f0cecbad4a3d8  mips64el-n32--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--stable-2025.08-1.sha256
+sha256  772712d2f0278f53bfde0e954cc7ad01d25ac837f9c40af2f25823b28e23aaef  mips64el-n32--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  5b62273a90a887dc3e0fdc08a07ab6ec792e32d69709e5e929bb073b5ba378fe  mips64el-n32--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--stable-2025.08-1.sha256
+sha256  da101611d048cfaf3f0df98da92da091286630dfcec6a794022713c7024a94e6  mips64el-n32--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--bleeding-edge-2025.08-1.sha256
+sha256  c5d55a8c3c18056faac6316bfc9d8adaf8a8b8f73bcb96477b36a56f79c5a1b6  mips64r6el-n32--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--stable-2025.08-1.sha256
+sha256  f2a449cbed813b357a1c327630d61e4e24aab33e1bccd64985e90a69e13b087a  mips64r6el-n32--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--bleeding-edge-2025.08-1.sha256
+sha256  d485e5984da474bc67e72626968db9f719e07c007aa71881aa48943c484e2072  mips64r6el-n32--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--stable-2025.08-1.sha256
+sha256  7c76ef9502a9b53fb17f3c6f0604b88de9f2bf5e3dad2d73536041e6473232bd  mips64r6el-n32--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  79289935bcfaa4929daf75a86cda8025eb4227aaaa9a81b768cdd0d7c5ba7251  mips64r6el-n32--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--stable-2025.08-1.sha256
+sha256  9a2a97e1ef4b2e320e053cc9918be5a9d10f460096827ef61c378a2347ccc522  mips64r6el-n32--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--bleeding-edge-2025.08-1.sha256
+sha256  87b78b6129470e687414e37dc14f025349574cf2c224047f9c1bc2f0779daaee  openrisc--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--stable-2025.08-1.sha256
+sha256  03b6e025b372970d4daf6879900b19df6fe23c9feb2c130c6743f36a48cb7d70  openrisc--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2025.08-1.sha256
+sha256  00a26576bafeccd7a4bdd7e8da649c7a8b465160c1dbade8a9b2559dc112ec0d  openrisc--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2025.08-1.sha256
+sha256  fcaa1ed86b5fddfb7c0b2e7ec507a54d4723a0468de466fbbc0331d14d37a3cc  openrisc--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  e877168c4eb637157e8dd9c4ac14de8d9492dcab8013434d9b62987014c8e534  openrisc--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2025.08-1.sha256
+sha256  c4554431ebbb615afaf12cdca0c9938ae41d77f45405e572be1ca91a52d19bd4  openrisc--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2025.08-1.sha256
+sha256  218af0ca2d46430e73e0773472d575b8e17f605df41887c12983af66438946c4  powerpc-440fp--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2025.08-1.sha256
+sha256  ff9425efff6ea7f9853fd2c0df7cf8f6c86d7a4cbd4f58605f3794e51237acfb  powerpc-440fp--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2025.08-1.sha256
+sha256  5c9f9a07aa2dbaab33289c81911eda55b7ed6f392a632df68c9d7e31b61af57a  powerpc-440fp--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--stable-2025.08-1.sha256
+sha256  5faa42457f06ded74f524074d73330f8156e53b4eb1e929069dc5df94d9a0868  powerpc-440fp--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  d4910ba94e356867bf7ae2e55e394a4419685d33c344a643ae1b8ccee3374457  powerpc-440fp--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--stable-2025.08-1.sha256
+sha256  864d99426acdccaa2787dcecffb800c502c0c5f4a344a6d2e2c609314631fbfe  powerpc-440fp--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--bleeding-edge-2025.08-1.sha256
+sha256  e9da6e9ac7864b16f07bac4d2454eca41baac027aac3ff29b36c7cf21fff7373  powerpc-e300c3--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--stable-2025.08-1.sha256
+sha256  581d0441a31bff4f3a0996b824afb3fe35c6c32f543765b28a6b63a5684fc116  powerpc-e300c3--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--bleeding-edge-2025.08-1.sha256
+sha256  9533c785819a5ee3d7075532de3b97cd57cd5290f2977b0de9ea5fa0174d1b02  powerpc-e300c3--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--stable-2025.08-1.sha256
+sha256  5f628b374b6857f4b4ceabe5e41b2565b07985a7e444978c87b0f864bb5a47fc  powerpc-e300c3--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  6b499b08a54ede805b3952ec2998868f1bbbf16a1ff6a3fe03a4e920bbd1786b  powerpc-e300c3--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--stable-2025.08-1.sha256
+sha256  397a57de82491dab311e0305e6c49ef7623abc8b9257333f4c41b8c854c963e2  powerpc-e300c3--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--bleeding-edge-2025.08-1.sha256
+sha256  2e0e681f684d0e2ef1ecdc187dc9dcbb91f64bcc940bb0e2255c2a3bf9e25383  powerpc-e500mc--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--stable-2025.08-1.sha256
+sha256  0232c110f2e47dcab4834ab375015a1a7a19379b059c352e5a95b5578f74a0a9  powerpc-e500mc--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--bleeding-edge-2025.08-1.sha256
+sha256  3901ee890ac5e3a4064cf4a6611d8bc6ec3124988c770d305830719ddfcb0065  powerpc-e500mc--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--stable-2025.08-1.sha256
+sha256  a863d426495f89a7732d7e1e8a9862854a9823c5c95ac79ea0d082f8be357e34  powerpc-e500mc--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  bf657e82026449af48b3b2c2199ac2752824ee621c8546d4619a0da0434f2024  powerpc-e500mc--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--stable-2025.08-1.sha256
+sha256  6a1e0c0a7bcbfde645a8d432711ccf2a223fde3c99a774c3938064d1ab955ef7  powerpc-e500mc--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--bleeding-edge-2025.08-1.sha256
+sha256  2351cf635eed3fd47a5655fdb918807136b90d2f4f4c83e51e73af064546f9a6  powerpc64-e5500--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2025.08-1.sha256
+sha256  0334d8c2b52043abc4ca5075af22ca9192b4c624ab7d4f31c8a6e1ed48c9f167  powerpc64-e5500--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--bleeding-edge-2025.08-1.sha256
+sha256  8af79b874733206e3b8ed2156c7bedf6359723370e145f8d8d51bf5ecf677bec  powerpc64-e6500--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--stable-2025.08-1.sha256
+sha256  7341a030bda89b7784d40a9d6df5725eb927fff39bf7990668bf919a9c68b65d  powerpc64-e6500--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--bleeding-edge-2025.08-1.sha256
+sha256  26eaed61de5538f16cb558ac5f64a860e325891dd194687e91b01ac9069309bf  powerpc64-e6500--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--stable-2025.08-1.sha256
+sha256  2df7bf4878887c8be4daa41521bff14281bd0163f3bf15c0652ddb7f34b1d803  powerpc64-e6500--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--bleeding-edge-2025.08-1.sha256
+sha256  56051f6fe8059eb5c4fa225767c816cf29c7f1de99d5dd012c671755f7f5baa2  powerpc64-power8--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--stable-2025.08-1.sha256
+sha256  5d4504754d9a1c6fe0385f4d32f83523a3c69d1e1f9926edd677139fed16e278  powerpc64-power8--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--bleeding-edge-2025.08-1.sha256
+sha256  c2ee0fe6036f30e00d42758b367d1f8dba3a6fb2fd8548c8d54caccf307d8ddb  powerpc64-power8--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--stable-2025.08-1.sha256
+sha256  37b16e86732696c6d30f4ac41ac6e279567ed1014c05dc44899600a9c8ada8ab  powerpc64-power8--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--bleeding-edge-2025.08-1.sha256
+sha256  c37471e3688d1a2232bd9b29bf3ba6fa833b0f683e45174d7eed36b901353392  powerpc64le-power8--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--stable-2025.08-1.sha256
+sha256  819c8dee94b1baff33943f3b01d669ea794a825e7b4cbead340ad5de8cff6baa  powerpc64le-power8--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--bleeding-edge-2025.08-1.sha256
+sha256  92758192acda8f5ab17448c702af906023fc60cc7d7808cab1e5731aec3c4453  powerpc64le-power8--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--stable-2025.08-1.sha256
+sha256  c32887d632e86da99a1c4efcc4358aa803b89d0d9651df65fb9d241c8edcd6cc  powerpc64le-power8--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--bleeding-edge-2025.08-1.sha256
+sha256  85befad773c292e4b356514d924eeb202c1078d3c2c6bb6ca35037f5b9ab79da  riscv32-ilp32d--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--stable-2025.08-1.sha256
+sha256  d42680e926542595c4c87629d33f5f90aac1e9a964c8955089e0514caa01b78f  riscv32-ilp32d--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--musl--bleeding-edge-2025.08-1.sha256
+sha256  f8227ec5579f4861f9293b6aeb4c14d5e0321bfe2485e20c15fc9647e4d608df  riscv32-ilp32d--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--musl--stable-2025.08-1.sha256
+sha256  f15e9ed67724b249eb149126eb6ed945648c3cdcd3c1c484b23c1a12df368391  riscv32-ilp32d--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  5c7f5dd0f146a575191c954459dd912d4301d4ef22dfb4a99b555bf6a5380399  riscv32-ilp32d--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--uclibc--stable-2025.08-1.sha256
+sha256  48e97598eb2fdf11e9d79e4aa93fa47a3404ec2e6bbd7e84acad6579cc9fee97  riscv32-ilp32d--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--bleeding-edge-2025.08-1.sha256
+sha256  4040cd45c13ff03e8daac0ef69caf4322ed10e9843914d628b315c5dc27bf9c9  riscv64-lp64d--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--stable-2025.08-1.sha256
+sha256  45209041e9ba5054aa9787c40bce0ac1e48b78528b6635b79dfb4253e1491ff0  riscv64-lp64d--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--bleeding-edge-2025.08-1.sha256
+sha256  5100cea9083aa2339113a61a64f857d4c8c68981d0a973e8fa1cd918a06b4854  riscv64-lp64d--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--stable-2025.08-1.sha256
+sha256  2c5155ce133c9c8dddde8f69b0715aa07e0520d99b1fd0131d915357c6fbce39  riscv64-lp64d--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  3c99d7f2f6c705e8bdc59c3e156f14e65d23fb933c2d968a1cef70a1d4a2817c  riscv64-lp64d--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--stable-2025.08-1.sha256
+sha256  04b82356a5956ebb58e03d163e958e9201071c24481102f18ac4e18efe1dc549  riscv64-lp64d--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--bleeding-edge-2025.08-1.sha256
+sha256  dbd0a4a2ce4cbdb9481baad78ed33d08fdd5ef6d660f2fb8aa4da97a0d5419a8  s390x-z13--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--stable-2025.08-1.sha256
+sha256  4e67f2751487493c2d68aab643de22a6e8cf81e6d918125b96b50eb5e02a85d5  s390x-z13--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--musl--bleeding-edge-2025.08-1.sha256
+sha256  c7f9a94ba17985d3c5608c93b22b920f65bf1e46e465d4588dfd20c2f7393905  s390x-z13--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--musl--stable-2025.08-1.sha256
+sha256  23f536ff2bf1a9d3b93210465471996bc7c918fbb5702a277d8e1e42ffab8559  s390x-z13--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--bleeding-edge-2025.08-1.sha256
+sha256  173a40ac99693a4b41749468f8f00c26511ffb2515bef0782c6074a9aebabe21  sh-sh4--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--stable-2025.08-1.sha256
+sha256  0bf080d351d4a97a412a7068baf75e036f071de323c5e04a71be6992576f79ce  sh-sh4--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--bleeding-edge-2025.08-1.sha256
+sha256  9c23e9504fedc250def212bdffd462bcbf1d0750d3914ade74ab5620e6534d23  sh-sh4--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--stable-2025.08-1.sha256
+sha256  cd08c2335b4676c3f51a8dd3b1b43cb02a8148b5c118b9c439f481ddb51bacf6  sh-sh4--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  cf2bdd8c2de851c6be0f830677abf8b8edd315fc5ab366b3450a022027b1b8d5  sh-sh4--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--stable-2025.08-1.sha256
+sha256  e8c2065017a3cd2355dcbb12773edfa6b8078e963178f047ccdfa493ccef1f6a  sh-sh4--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--bleeding-edge-2025.08-1.sha256
+sha256  a06a9b61d07f78510f17def530ee428e1a0db6ab430a0cbc65d2445523995b70  sh-sh4aeb--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--stable-2025.08-1.sha256
+sha256  3816efda0e543ce8fdb22ef830df3bf8de32c8bca42122f830f2f10d2f6000de  sh-sh4aeb--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--bleeding-edge-2025.08-1.sha256
+sha256  08f0f9d416214e1ef6abeaebe6f5298809895bf3575f568a76a7abadfd609b22  sh-sh4aeb--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--stable-2025.08-1.sha256
+sha256  85d562535d9f2e377086296df44b87c11cfa751c1112bdb09921cd2c11055457  sh-sh4aeb--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--bleeding-edge-2025.08-1.sha256
+sha256  43cf9403feec9299a0d61d6aa0a7360dedc25187b0c5383cfb69cf2ac703be5c  sparc64--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--stable-2025.08-1.sha256
+sha256  39c2a3ec9865bcdcdc4eb77a149283d92124761bcdacda347a12dbc1d4e6eb1d  sparc64--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  0bf2103e45611de427294b51beda4ac6a404cda34622f7670534dcbc80f98d37  sparcv8--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--stable-2025.08-1.sha256
+sha256  5d099c4ecdac8e030e04e5b5139e635a9a1faa64bb77f452b33ef469f93b6e46  sparcv8--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--bleeding-edge-2025.08-1.sha256
+sha256  dc986211c6a8701868277d52e8f5061ea13d119ce0d9f23b61f1b0373984479b  x86-64--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--stable-2025.08-1.sha256
+sha256  760acd5c3159448b618e237b61935335baada74fe0cdc0d7611826cb49b41c8c  x86-64--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--bleeding-edge-2025.08-1.sha256
+sha256  830644a5f9c921fd8df2d40ab80dd81f03a662e5a7ad3cee20dbe2fde0de272e  x86-64--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--stable-2025.08-1.sha256
+sha256  09fca3aa89540f1b01b5f4210d488cbeb00f522044c53e9989b1dd8a38076912  x86-64--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  8afb195a0aaa5c83d539d28bb4efcd6f5a3442d02e0e48318df7f495d0749140  x86-64--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--stable-2025.08-1.sha256
+sha256  39499bcca6c50e39ed61c2afbf0b4005fc676df72b9b68fff75347439061eb2c  x86-64--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--bleeding-edge-2025.08-1.sha256
+sha256  9461ecd9f2b2f99d3ac7c52d49d9491b35d732f6c8fc60c8f226e34541ed9e3d  x86-64-v2--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--stable-2025.08-1.sha256
+sha256  fcbf8a7ce1c1c5dbd8d322a54f0fa8d5e18dec7511df66032d553a0a8639a076  x86-64-v2--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--bleeding-edge-2025.08-1.sha256
+sha256  edaef4802e3891f44a466a1c3cfbe84215815996fd606494fbffa9c7fdfe01fc  x86-64-v2--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--stable-2025.08-1.sha256
+sha256  d1ee83f905eaf2c4853d8102f408be0c3bf627531e71ab8fd796d94684077316  x86-64-v2--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  dbd93aa8318e1b04aa6678aea8791c781bff06cee98a9f4a300e88ebb170ce40  x86-64-v2--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--stable-2025.08-1.sha256
+sha256  d6422faad1384b3b58177149b257b814528058bba210a3fd2e70ebbc4272bfe4  x86-64-v2--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--bleeding-edge-2025.08-1.sha256
+sha256  f055e7c1c5725dd4fbb7cf5d929b3c3d363a4c25c29070fc25041ba56086b2ac  x86-64-v3--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--stable-2025.08-1.sha256
+sha256  fd63f95fa5eb52ef891da434bd3deada493d78fc11e42144f02d8806d7b47504  x86-64-v3--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--bleeding-edge-2025.08-1.sha256
+sha256  3f352161c60f7a0ae1784bf429b849a70862f00d5154758d48f384bfda561234  x86-64-v3--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--stable-2025.08-1.sha256
+sha256  57324b3e06559a0e03ecb0a64faf7d4996c6f8e60d82f9222c479877ff5717cb  x86-64-v3--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  99da8fd247b96495e02405879b2bed096deae97e7d426c3ef79144cd66aa52d0  x86-64-v3--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--stable-2025.08-1.sha256
+sha256  08b0b8cff1aea69bda3e88917a3c8deb3e05ec71c55c31079dc7780126f2bfb5  x86-64-v3--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--bleeding-edge-2025.08-1.sha256
+sha256  de960c26eda01fd0e68c30f3041ffe1a68deb3a9d9dde57e1a7c17b3954135a0  x86-64-v4--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--stable-2025.08-1.sha256
+sha256  8f1a5623cb0a0b7814d7b87495685f5e98338f78062ea749c31648554a58ddc2  x86-64-v4--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--bleeding-edge-2025.08-1.sha256
+sha256  35b38a6281f1f22c1fe5a2bdfae94dd999ad32c4e61e12c34d5ca1cd6c2b9436  x86-64-v4--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--stable-2025.08-1.sha256
+sha256  e259c0a51b4fc3c43c254a2e7446abafe38f01f00cf5d7f8f46183dd768eb223  x86-64-v4--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  ffbeb7be63eccc921d51561cfaf105b7939c0a5b71a141baf953d4ae64bfce6c  x86-64-v4--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--stable-2025.08-1.sha256
+sha256  7df276b2409c57175586b132bb058babbd724a06dddf0b3dad548ff82aa7a1f2  x86-64-v4--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2025.08-1.sha256
+sha256  3777ad89e6d60bc8fafb83b6b74284b6c56aee20ea00e51dfa466800e98dcdb9  x86-64-core-i7--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2025.08-1.sha256
+sha256  f40b098d0435485a76307347e36e8f11727d25c8f5ba09a1c048d5e9e1edb2f0  x86-64-core-i7--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--bleeding-edge-2025.08-1.sha256
+sha256  a7d861e2a1575d427d9572a78e7f01ba83cc11e544255c5fac54d4a4421b4d1e  x86-64-core-i7--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--stable-2025.08-1.sha256
+sha256  780df995a9f389541f15abff72672c9b68ea86793c34b1dba16c0271a8e392d8  x86-64-core-i7--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  ac4cc4f555b04a44bb9ff6f8358720d40df50d6b894bceb49ce733ab3283faa4  x86-64-core-i7--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--stable-2025.08-1.sha256
+sha256  46166ced0ec5e8c7a5fc85ac2c732f2b26c465c00a5d4c9967ebb22eb4e0a08e  x86-64-core-i7--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2025.08-1.sha256
+sha256  517a90df28fadcaf95c10f062d7860439c2485fa68cb40a8d56c00835d7b8a39  x86-core2--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--stable-2025.08-1.sha256
+sha256  69eb5c2dfc9e1dc594feda5e5f61d60d60de830ab4390751b4f2c07b084e939f  x86-core2--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--bleeding-edge-2025.08-1.sha256
+sha256  e70163fa62426347762c3a36e8cf8343086c7e4ca36e2a159b91828e3b096a69  x86-core2--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--stable-2025.08-1.sha256
+sha256  c3225387d2e30e4612066ad15d7303f352a0f55c981b8f8b32fd3bc7102be409  x86-core2--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  f65287b7c609c5fd92c10f69a1f0a088df9c15fd7aa8c6f2c9ad375f5dbaa5a0  x86-core2--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--stable-2025.08-1.sha256
+sha256  25b4d942afbdb4c4f943f93ce87de494f0308f9cfce540e650a02ff70ab0439f  x86-core2--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2025.08-1.sha256
+sha256  db558ce3aeb76d0e3f8c177f8ddd9efaeeacacfb02f1ce7491d537697eb1939e  x86-i686--glibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--stable-2025.08-1.sha256
+sha256  f9b365d7fd8f8860dfb1845ff731013550f071ca4a8de0e5074abc995296b26c  x86-i686--glibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--bleeding-edge-2025.08-1.sha256
+sha256  5f8a7a097d33c33bab851b8fd43ef352a3184feb2a322584fb80a0a84cf9793f  x86-i686--musl--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--stable-2025.08-1.sha256
+sha256  3a340ebc386a057f5ddb24d8f4bbde07d2c013c99cebc02ac38565e2849bfda0  x86-i686--musl--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  dbc61fc1b20b83fb11e872276eeab42988bc01d07b063297ce7a8dcf6a965381  x86-i686--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--stable-2025.08-1.sha256
+sha256  42ae08d2440d73a9d25442b1499c0f5e3a10fd278f79439c849dbc3a0f16eb42  x86-i686--uclibc--stable-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--bleeding-edge-2025.08-1.sha256
+sha256  83c13b7ea8ae433da2fe3f3fd7f723bcb692ec168e9e284534ac1999ef553197  xtensa-lx60--uclibc--bleeding-edge-2025.08-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--stable-2025.08-1.sha256
+sha256  a77b21ea3ef1b8d14a78103a645f23b5290b6ed1e8a9f95fd5eee669ffe258d2  xtensa-lx60--uclibc--stable-2025.08-1.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
index 2ba7bf10da..7087e2cadf 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
@@ -7,1273 +7,1309 @@
 # This file was auto-generated by support/scripts/gen-bootlin-toolchains
 # Do not edit
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-750d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-750d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7m--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7m--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-coldfire--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-coldfire--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e5500--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e5500--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparc64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparc64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparcv8--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparcv8--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = xtensa-lx60--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2025.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = xtensa-lx60--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs
 endif
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
