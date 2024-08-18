Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C54C5320E
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 07:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24949607DD;
	Mon, 19 Aug 2024 07:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7lCv44S4d3Z; Mon, 19 Aug 2024 07:44:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56584607BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56584607BC;
	Mon, 19 Aug 2024 07:44:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55FF41BF407
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 21:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4255640447
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 21:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8dn1h-D0lFms for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 21:43:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E3BB402E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E3BB402E5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E3BB402E5
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 21:43:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id ABB3B60005;
 Sun, 18 Aug 2024 21:43:09 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 18 Aug 2024 23:43:04 +0200
Message-ID: <20240818214305.1051667-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240818214305.1051667-1-thomas.petazzoni@bootlin.com>
References: <20240818214305.1051667-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Approved-At: Mon, 19 Aug 2024 07:44:32 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724017390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fU9XoQMNxnBzjYzNIO0L00O7+NvkSKVPpZRRF5ewSaY=;
 b=Kv3B4fg1dySpR9h7YfnNYLX0Py957eATastGJa0xwMlQfykT2SHDBpCly2aM0bOpy0mUMI
 rrJHEwcu7AvZJllq8HmFEDDqMo2aFRFXuK37TDPrWhDviIXkHg+CuMb2DX8n/+M5t6ME2Z
 wNG+xOu+dwLSBm2UkQlYYvZF+nSYci2sK/22CBnDy2rUUSkbenAI/hhzX1t6JAkZKMvaTz
 Vx6TtXjqDnzQNayCLToCKdIAtTZCR+WctE7dYWq01Los6+QGlSRXaX0FDvH1jeOhhEezdN
 meMgDjF17txkO5tdBuTdrJYwalykd+pxSdcd8kZRFcYmbD2QwWQ42hl0sK/XyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Kv3B4fg1
Subject: [Buildroot] [PATCH next 2/2]
 toolchain/toolchain-external/toolchain-external-bootlin: bump to 2024.05
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit updates the Bootlin external toolchain package to use the
recently released 2024.05 toolchains.

Notable changes:

- Tarballs are now xz-compressed instead of bz2-compressed

- We have new toolchains: RISC-V 32-bit glibc stable, RISC-V 32-bit
  uClibc, S390 uClibc, and the Sparc V8 is finally updated

All unit tests are passing, except 2 (see below):

  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1417551794/builds

The two tests that are not passing are the RISC-V 32-bit musl:

  https://gitlab.com/tpetazzoni/buildroot/-/jobs/7607519955
  https://gitlab.com/tpetazzoni/buildroot/-/jobs/7607519954

This is due to a bug in Busybox, and already existed prior to this
toolchain update.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
NOTE: this patch depends on
https://patchwork.ozlabs.org/project/buildroot/patch/20240810215624.482529-2-thomas.petazzoni@bootlin.com/,
which introduces the BR2_ARCH_NEEDS_GCC_AT_LEAST_15 symbol also used
in this series.

 .../tests/toolchain/test_external_bootlin.py  |   81 +
 .../Config.in.options                         | 1519 +++++++++--------
 .../toolchain-external-bootlin.hash           |  870 +++++-----
 .../toolchain-external-bootlin.mk             |  890 +++++-----
 4 files changed, 1756 insertions(+), 1604 deletions(-)

diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
index 2ed69b9ff8..c137444cbc 100644
--- a/support/testing/tests/toolchain/test_external_bootlin.py
+++ b/support/testing/tests/toolchain/test_external_bootlin.py
@@ -2262,6 +2262,23 @@ class TestExternalToolchainBootlinRiscv32ilp32dGlibcBleedingEdge(TestExternalToo
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinRiscv32ilp32dGlibcStable(TestExternalToolchain):
+    config = """
+        BR2_riscv=y
+        BR2_riscv_g=y
+        BR2_RISCV_32=y
+        BR2_RISCV_ABI_ILP32D=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "riscv32-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinRiscv32ilp32dMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_riscv=y
@@ -2296,6 +2313,40 @@ class TestExternalToolchainBootlinRiscv32ilp32dMuslStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinRiscv32ilp32dUclibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_riscv=y
+        BR2_riscv_g=y
+        BR2_RISCV_32=y
+        BR2_RISCV_ABI_ILP32D=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "riscv32-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinRiscv32ilp32dUclibcStable(TestExternalToolchain):
+    config = """
+        BR2_riscv=y
+        BR2_riscv_g=y
+        BR2_RISCV_32=y
+        BR2_RISCV_ABI_ILP32D=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "riscv32-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinRiscv64lp64dGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_riscv=y
@@ -2434,6 +2485,36 @@ class TestExternalToolchainBootlinS390xz13GlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinS390xz13MuslBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_s390x=y
+        BR2_s390x_z13=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "s390x-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinS390xz13MuslStable(TestExternalToolchain):
+    config = """
+        BR2_s390x=y
+        BR2_s390x_z13=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "s390x-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinShsh4GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_sh=y
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 7a9bffb5ae..e3ee7aa2c0 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -58,11 +58,11 @@ config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Bootlin toolchain variant"
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
-	bool "aarch64 glibc bleeding-edge 2024.02-1"
+	bool "aarch64 glibc bleeding-edge 2024.05-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -83,14 +83,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
-	bool "aarch64 glibc stable 2024.02-1"
+	bool "aarch64 glibc stable 2024.05-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -108,11 +107,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE
-	bool "aarch64 musl bleeding-edge 2024.02-1"
+	bool "aarch64 musl bleeding-edge 2024.05-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -133,14 +132,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE
-	bool "aarch64 musl stable 2024.02-1"
+	bool "aarch64 musl stable 2024.05-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -157,10 +155,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE
-	bool "aarch64 uclibc bleeding-edge 2024.02-1"
+	bool "aarch64 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -182,15 +180,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE
-	bool "aarch64 uclibc stable 2024.02-1"
+	bool "aarch64 uclibc stable 2024.05-1"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -207,11 +204,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
-	bool "aarch64be glibc bleeding-edge 2024.02-1"
+	bool "aarch64be glibc bleeding-edge 2024.05-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -232,14 +229,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
-	bool "aarch64be glibc stable 2024.02-1"
+	bool "aarch64be glibc stable 2024.05-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -257,11 +253,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_BLEEDING_EDGE
-	bool "aarch64be musl bleeding-edge 2024.02-1"
+	bool "aarch64be musl bleeding-edge 2024.05-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -282,14 +278,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_STABLE
-	bool "aarch64be musl stable 2024.02-1"
+	bool "aarch64be musl stable 2024.05-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -306,10 +301,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE
-	bool "aarch64be uclibc bleeding-edge 2024.02-1"
+	bool "aarch64be uclibc bleeding-edge 2024.05-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -331,15 +326,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE
-	bool "aarch64be uclibc stable 2024.02-1"
+	bool "aarch64be uclibc stable 2024.05-1"
 	depends on BR2_aarch64_be
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -356,11 +350,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
-	bool "arcle-750d uclibc bleeding-edge 2024.02-1"
+	bool "arcle-750d uclibc bleeding-edge 2024.05-1"
 	depends on BR2_arcle
 	depends on BR2_arc750d
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -381,7 +375,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
-	bool "arcle-750d uclibc stable 2024.02-1"
+	bool "arcle-750d uclibc stable 2024.05-1"
 	depends on BR2_arcle
 	depends on BR2_arc750d
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
@@ -390,7 +384,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -406,12 +399,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
-	bool "arcle-hs38 glibc bleeding-edge 2024.02-1"
+	bool "arcle-hs38 glibc bleeding-edge 2024.05-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -431,15 +424,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
-	bool "arcle-hs38 glibc stable 2023.11-1"
+	bool "arcle-hs38 glibc stable 2024.05-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -456,11 +448,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE
-	bool "arcle-hs38 uclibc bleeding-edge 2024.02-1"
+	bool "arcle-hs38 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -481,7 +473,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE
-	bool "arcle-hs38 uclibc stable 2024.02-1"
+	bool "arcle-hs38 uclibc stable 2024.05-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
@@ -490,7 +482,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -506,13 +497,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
-	bool "armv5-eabi glibc bleeding-edge 2024.02-1"
+	bool "armv5-eabi glibc bleeding-edge 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -533,16 +524,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
-	bool "armv5-eabi glibc stable 2024.02-1"
+	bool "armv5-eabi glibc stable 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -560,13 +550,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE
-	bool "armv5-eabi musl bleeding-edge 2024.02-1"
+	bool "armv5-eabi musl bleeding-edge 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -587,16 +577,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
-	bool "armv5-eabi musl stable 2024.02-1"
+	bool "armv5-eabi musl stable 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -614,12 +603,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE
-	bool "armv5-eabi uclibc bleeding-edge 2024.02-1"
+	bool "armv5-eabi uclibc bleeding-edge 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -641,17 +630,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE
-	bool "armv5-eabi uclibc stable 2024.02-1"
+	bool "armv5-eabi uclibc stable 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -668,13 +656,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
-	bool "armv6-eabihf glibc bleeding-edge 2024.02-1"
+	bool "armv6-eabihf glibc bleeding-edge 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -695,16 +683,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
-	bool "armv6-eabihf glibc stable 2024.02-1"
+	bool "armv6-eabihf glibc stable 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -722,13 +709,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE
-	bool "armv6-eabihf musl bleeding-edge 2024.02-1"
+	bool "armv6-eabihf musl bleeding-edge 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -749,16 +736,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE
-	bool "armv6-eabihf musl stable 2024.02-1"
+	bool "armv6-eabihf musl stable 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -776,12 +762,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE
-	bool "armv6-eabihf uclibc bleeding-edge 2024.02-1"
+	bool "armv6-eabihf uclibc bleeding-edge 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -803,17 +789,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
-	bool "armv6-eabihf uclibc stable 2024.02-1"
+	bool "armv6-eabihf uclibc stable 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -830,13 +815,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
-	bool "armv7-eabihf glibc bleeding-edge 2024.02-1"
+	bool "armv7-eabihf glibc bleeding-edge 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -857,16 +842,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
-	bool "armv7-eabihf glibc stable 2024.02-1"
+	bool "armv7-eabihf glibc stable 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -884,13 +868,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
-	bool "armv7-eabihf musl bleeding-edge 2024.02-1"
+	bool "armv7-eabihf musl bleeding-edge 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -911,16 +895,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
-	bool "armv7-eabihf musl stable 2024.02-1"
+	bool "armv7-eabihf musl stable 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -938,12 +921,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
-	bool "armv7-eabihf uclibc bleeding-edge 2024.02-1"
+	bool "armv7-eabihf uclibc bleeding-edge 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -965,17 +948,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
-	bool "armv7-eabihf uclibc stable 2024.02-1"
+	bool "armv7-eabihf uclibc stable 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -992,13 +974,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
-	bool "armebv7-eabihf glibc bleeding-edge 2024.02-1"
+	bool "armebv7-eabihf glibc bleeding-edge 2024.05-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1019,16 +1001,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
-	bool "armebv7-eabihf glibc stable 2024.02-1"
+	bool "armebv7-eabihf glibc stable 2024.05-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1046,13 +1027,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
-	bool "armebv7-eabihf musl bleeding-edge 2024.02-1"
+	bool "armebv7-eabihf musl bleeding-edge 2024.05-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1073,16 +1054,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
-	bool "armebv7-eabihf musl stable 2024.02-1"
+	bool "armebv7-eabihf musl stable 2024.05-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1100,12 +1080,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
-	bool "armebv7-eabihf uclibc bleeding-edge 2024.02-1"
+	bool "armebv7-eabihf uclibc bleeding-edge 2024.05-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1127,17 +1107,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
-	bool "armebv7-eabihf uclibc stable 2024.02-1"
+	bool "armebv7-eabihf uclibc stable 2024.05-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -1154,11 +1133,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE
-	bool "armv7m uclibc bleeding-edge 2024.02-1"
+	bool "armv7m uclibc bleeding-edge 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7M
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1178,16 +1157,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
-	bool "armv7m uclibc stable 2024.02-1"
+	bool "armv7m uclibc stable 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7M
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -1202,11 +1180,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_BLEEDING_EDGE
-	bool "m68k-68xxx glibc bleeding-edge 2024.02-1"
+	bool "m68k-68xxx glibc bleeding-edge 2024.05-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1227,14 +1205,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_STABLE
-	bool "m68k-68xxx glibc stable 2024.02-1"
+	bool "m68k-68xxx glibc stable 2024.05-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1252,11 +1229,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_BLEEDING_EDGE
-	bool "m68k-68xxx musl bleeding-edge 2024.02-1"
+	bool "m68k-68xxx musl bleeding-edge 2024.05-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1277,14 +1254,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_STABLE
-	bool "m68k-68xxx musl stable 2024.02-1"
+	bool "m68k-68xxx musl stable 2024.05-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1302,10 +1278,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
-	bool "m68k-68xxx uclibc bleeding-edge 2024.02-1"
+	bool "m68k-68xxx uclibc bleeding-edge 2024.05-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1327,15 +1303,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE
-	bool "m68k-68xxx uclibc stable 2024.02-1"
+	bool "m68k-68xxx uclibc stable 2024.05-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -1352,10 +1327,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE
-	bool "m68k-coldfire uclibc bleeding-edge 2024.02-1"
+	bool "m68k-coldfire uclibc bleeding-edge 2024.05-1"
 	depends on BR2_m68k_cf
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1375,15 +1350,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE
-	bool "m68k-coldfire uclibc stable 2024.02-1"
+	bool "m68k-coldfire uclibc stable 2024.05-1"
 	depends on BR2_m68k_cf
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -1398,12 +1372,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
-	bool "microblazebe glibc bleeding-edge 2024.02-1"
+	bool "microblazebe glibc bleeding-edge 2024.05-1"
 	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1421,12 +1395,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
-	bool "microblazebe glibc stable 2024.02-1"
+	bool "microblazebe glibc stable 2024.05-1"
 	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1444,12 +1418,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE
-	bool "microblazebe musl bleeding-edge 2024.02-1"
+	bool "microblazebe musl bleeding-edge 2024.05-1"
 	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1467,12 +1441,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
-	bool "microblazebe musl stable 2024.02-1"
+	bool "microblazebe musl stable 2024.05-1"
 	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1490,11 +1464,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE
-	bool "microblazebe uclibc bleeding-edge 2024.02-1"
+	bool "microblazebe uclibc bleeding-edge 2024.05-1"
 	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1514,11 +1488,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
-	bool "microblazebe uclibc stable 2024.02-1"
+	bool "microblazebe uclibc stable 2024.05-1"
 	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1538,12 +1512,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
-	bool "microblazeel glibc bleeding-edge 2024.02-1"
+	bool "microblazeel glibc bleeding-edge 2024.05-1"
 	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1561,12 +1535,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
-	bool "microblazeel glibc stable 2024.02-1"
+	bool "microblazeel glibc stable 2024.05-1"
 	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1584,12 +1558,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE
-	bool "microblazeel musl bleeding-edge 2024.02-1"
+	bool "microblazeel musl bleeding-edge 2024.05-1"
 	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1607,12 +1581,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
-	bool "microblazeel musl stable 2024.02-1"
+	bool "microblazeel musl stable 2024.05-1"
 	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1630,11 +1604,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE
-	bool "microblazeel uclibc bleeding-edge 2024.02-1"
+	bool "microblazeel uclibc bleeding-edge 2024.05-1"
 	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1654,11 +1628,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE
-	bool "microblazeel uclibc stable 2024.02-1"
+	bool "microblazeel uclibc stable 2024.05-1"
 	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1678,13 +1652,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
-	bool "mips32 glibc bleeding-edge 2024.02-1"
+	bool "mips32 glibc bleeding-edge 2024.05-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1705,16 +1679,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
-	bool "mips32 glibc stable 2024.02-1"
+	bool "mips32 glibc stable 2024.05-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1732,13 +1705,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE
-	bool "mips32 musl bleeding-edge 2024.02-1"
+	bool "mips32 musl bleeding-edge 2024.05-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1759,16 +1732,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE
-	bool "mips32 musl stable 2024.02-1"
+	bool "mips32 musl stable 2024.05-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1785,12 +1757,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE
-	bool "mips32 uclibc bleeding-edge 2024.02-1"
+	bool "mips32 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1812,17 +1784,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE
-	bool "mips32 uclibc stable 2024.02-1"
+	bool "mips32 uclibc stable 2024.05-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -1839,13 +1810,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
-	bool "mips32el glibc bleeding-edge 2024.02-1"
+	bool "mips32el glibc bleeding-edge 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1866,16 +1837,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
-	bool "mips32el glibc stable 2024.02-1"
+	bool "mips32el glibc stable 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1893,13 +1863,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE
-	bool "mips32el musl bleeding-edge 2024.02-1"
+	bool "mips32el musl bleeding-edge 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1920,16 +1890,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE
-	bool "mips32el musl stable 2024.02-1"
+	bool "mips32el musl stable 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1946,12 +1915,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE
-	bool "mips32el uclibc bleeding-edge 2024.02-1"
+	bool "mips32el uclibc bleeding-edge 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1973,17 +1942,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE
-	bool "mips32el uclibc stable 2024.02-1"
+	bool "mips32el uclibc stable 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -2000,13 +1968,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
-	bool "mips32r5el glibc bleeding-edge 2024.02-1"
+	bool "mips32r5el glibc bleeding-edge 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2027,16 +1995,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
-	bool "mips32r5el glibc stable 2024.02-1"
+	bool "mips32r5el glibc stable 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -2054,13 +2021,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE
-	bool "mips32r5el musl bleeding-edge 2024.02-1"
+	bool "mips32r5el musl bleeding-edge 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2081,16 +2048,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE
-	bool "mips32r5el musl stable 2024.02-1"
+	bool "mips32r5el musl stable 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -2108,12 +2074,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE
-	bool "mips32r5el uclibc bleeding-edge 2024.02-1"
+	bool "mips32r5el uclibc bleeding-edge 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2135,17 +2101,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE
-	bool "mips32r5el uclibc stable 2024.02-1"
+	bool "mips32r5el uclibc stable 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -2162,13 +2127,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
-	bool "mips32r6el glibc bleeding-edge 2024.02-1"
+	bool "mips32r6el glibc bleeding-edge 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2189,16 +2154,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
-	bool "mips32r6el glibc stable 2024.02-1"
+	bool "mips32r6el glibc stable 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -2216,13 +2180,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE
-	bool "mips32r6el musl bleeding-edge 2024.02-1"
+	bool "mips32r6el musl bleeding-edge 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2243,16 +2207,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE
-	bool "mips32r6el musl stable 2024.02-1"
+	bool "mips32r6el musl stable 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -2270,12 +2233,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE
-	bool "mips32r6el uclibc bleeding-edge 2024.02-1"
+	bool "mips32r6el uclibc bleeding-edge 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2297,17 +2260,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE
-	bool "mips32r6el uclibc stable 2024.02-1"
+	bool "mips32r6el uclibc stable 2024.05-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -2324,14 +2286,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
-	bool "mips64-n32 glibc bleeding-edge 2024.02-1"
+	bool "mips64-n32 glibc bleeding-edge 2024.05-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2352,17 +2314,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
-	bool "mips64-n32 glibc stable 2024.02-1"
+	bool "mips64-n32 glibc stable 2024.05-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -2380,14 +2341,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE
-	bool "mips64-n32 musl bleeding-edge 2024.02-1"
+	bool "mips64-n32 musl bleeding-edge 2024.05-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2408,17 +2369,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE
-	bool "mips64-n32 musl stable 2024.02-1"
+	bool "mips64-n32 musl stable 2024.05-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -2436,13 +2396,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE
-	bool "mips64-n32 uclibc bleeding-edge 2024.02-1"
+	bool "mips64-n32 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2464,18 +2424,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE
-	bool "mips64-n32 uclibc stable 2024.02-1"
+	bool "mips64-n32 uclibc stable 2024.05-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -2492,14 +2451,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
-	bool "mips64el-n32 glibc bleeding-edge 2024.02-1"
+	bool "mips64el-n32 glibc bleeding-edge 2024.05-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2520,17 +2479,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
-	bool "mips64el-n32 glibc stable 2024.02-1"
+	bool "mips64el-n32 glibc stable 2024.05-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -2548,14 +2506,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE
-	bool "mips64el-n32 musl bleeding-edge 2024.02-1"
+	bool "mips64el-n32 musl bleeding-edge 2024.05-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2576,17 +2534,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE
-	bool "mips64el-n32 musl stable 2024.02-1"
+	bool "mips64el-n32 musl stable 2024.05-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -2604,13 +2561,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE
-	bool "mips64el-n32 uclibc bleeding-edge 2024.02-1"
+	bool "mips64el-n32 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2632,18 +2589,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE
-	bool "mips64el-n32 uclibc stable 2024.02-1"
+	bool "mips64el-n32 uclibc stable 2024.05-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -2660,14 +2616,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
-	bool "mips64r6el-n32 glibc bleeding-edge 2024.02-1"
+	bool "mips64r6el-n32 glibc bleeding-edge 2024.05-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2688,17 +2644,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
-	bool "mips64r6el-n32 glibc stable 2024.02-1"
+	bool "mips64r6el-n32 glibc stable 2024.05-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -2716,14 +2671,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE
-	bool "mips64r6el-n32 musl bleeding-edge 2024.02-1"
+	bool "mips64r6el-n32 musl bleeding-edge 2024.05-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2744,17 +2699,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE
-	bool "mips64r6el-n32 musl stable 2024.02-1"
+	bool "mips64r6el-n32 musl stable 2024.05-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -2772,13 +2726,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE
-	bool "mips64r6el-n32 uclibc bleeding-edge 2024.02-1"
+	bool "mips64r6el-n32 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2800,18 +2754,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE
-	bool "mips64r6el-n32 uclibc stable 2024.02-1"
+	bool "mips64r6el-n32 uclibc stable 2024.05-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -2828,11 +2781,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
-	bool "nios2 glibc bleeding-edge 2024.02-1"
+	bool "nios2 glibc bleeding-edge 2024.05-1"
 	depends on BR2_nios2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2853,14 +2806,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
-	bool "nios2 glibc stable 2024.02-1"
+	bool "nios2 glibc stable 2024.05-1"
 	depends on BR2_nios2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -2878,12 +2830,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE
-	bool "openrisc glibc bleeding-edge 2024.02-1"
+	bool "openrisc glibc bleeding-edge 2024.05-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2904,15 +2856,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE
-	bool "openrisc glibc stable 2023.11-1"
+	bool "openrisc glibc stable 2024.05-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -2930,12 +2881,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
-	bool "openrisc musl bleeding-edge 2024.02-1"
+	bool "openrisc musl bleeding-edge 2024.05-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2956,15 +2907,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
-	bool "openrisc musl stable 2024.02-1"
+	bool "openrisc musl stable 2024.05-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -2981,11 +2931,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
-	bool "openrisc uclibc bleeding-edge 2024.02-1"
+	bool "openrisc uclibc bleeding-edge 2024.05-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -3007,16 +2957,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
-	bool "openrisc uclibc stable 2024.02-1"
+	bool "openrisc uclibc stable 2024.05-1"
 	depends on BR2_or1k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -3033,12 +2982,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
-	bool "powerpc-440fp glibc bleeding-edge 2024.02-1"
+	bool "powerpc-440fp glibc bleeding-edge 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3059,15 +3008,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
-	bool "powerpc-440fp glibc stable 2024.02-1"
+	bool "powerpc-440fp glibc stable 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -3085,12 +3033,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
-	bool "powerpc-440fp musl bleeding-edge 2024.02-1"
+	bool "powerpc-440fp musl bleeding-edge 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3110,15 +3058,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
-	bool "powerpc-440fp musl stable 2024.02-1"
+	bool "powerpc-440fp musl stable 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -3135,11 +3082,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
-	bool "powerpc-440fp uclibc bleeding-edge 2024.02-1"
+	bool "powerpc-440fp uclibc bleeding-edge 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -3161,16 +3108,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
-	bool "powerpc-440fp uclibc stable 2024.02-1"
+	bool "powerpc-440fp uclibc stable 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -3187,12 +3133,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
-	bool "powerpc-e300c3 glibc bleeding-edge 2024.02-1"
+	bool "powerpc-e300c3 glibc bleeding-edge 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3213,15 +3159,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
-	bool "powerpc-e300c3 glibc stable 2024.02-1"
+	bool "powerpc-e300c3 glibc stable 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -3239,12 +3184,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
-	bool "powerpc-e300c3 musl bleeding-edge 2024.02-1"
+	bool "powerpc-e300c3 musl bleeding-edge 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3264,15 +3209,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
-	bool "powerpc-e300c3 musl stable 2024.02-1"
+	bool "powerpc-e300c3 musl stable 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -3289,11 +3233,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
-	bool "powerpc-e300c3 uclibc bleeding-edge 2024.02-1"
+	bool "powerpc-e300c3 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -3315,16 +3259,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
-	bool "powerpc-e300c3 uclibc stable 2024.02-1"
+	bool "powerpc-e300c3 uclibc stable 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -3341,12 +3284,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
-	bool "powerpc-e500mc glibc bleeding-edge 2024.02-1"
+	bool "powerpc-e500mc glibc bleeding-edge 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3367,15 +3310,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
-	bool "powerpc-e500mc glibc stable 2024.02-1"
+	bool "powerpc-e500mc glibc stable 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -3393,12 +3335,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE
-	bool "powerpc-e500mc musl bleeding-edge 2024.02-1"
+	bool "powerpc-e500mc musl bleeding-edge 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3418,15 +3360,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE
-	bool "powerpc-e500mc musl stable 2024.02-1"
+	bool "powerpc-e500mc musl stable 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -3443,11 +3384,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE
-	bool "powerpc-e500mc uclibc bleeding-edge 2024.02-1"
+	bool "powerpc-e500mc uclibc bleeding-edge 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -3469,16 +3410,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE
-	bool "powerpc-e500mc uclibc stable 2024.02-1"
+	bool "powerpc-e500mc uclibc stable 2024.05-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -3495,12 +3435,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
-	bool "powerpc64-e5500 glibc bleeding-edge 2024.02-1"
+	bool "powerpc64-e5500 glibc bleeding-edge 2024.05-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3521,15 +3461,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
-	bool "powerpc64-e5500 glibc stable 2024.02-1"
+	bool "powerpc64-e5500 glibc stable 2024.05-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -3547,12 +3486,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
-	bool "powerpc64-e6500 glibc bleeding-edge 2024.02-1"
+	bool "powerpc64-e6500 glibc bleeding-edge 2024.05-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3573,15 +3512,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
-	bool "powerpc64-e6500 glibc stable 2024.02-1"
+	bool "powerpc64-e6500 glibc stable 2024.05-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -3599,12 +3537,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
-	bool "powerpc64-e6500 musl bleeding-edge 2024.02-1"
+	bool "powerpc64-e6500 musl bleeding-edge 2024.05-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3625,15 +3563,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
-	bool "powerpc64-e6500 musl stable 2024.02-1"
+	bool "powerpc64-e6500 musl stable 2024.05-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -3651,12 +3588,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
-	bool "powerpc64-power8 glibc bleeding-edge 2024.02-1"
+	bool "powerpc64-power8 glibc bleeding-edge 2024.05-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3677,15 +3614,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
-	bool "powerpc64-power8 glibc stable 2024.02-1"
+	bool "powerpc64-power8 glibc stable 2024.05-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -3703,12 +3639,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE
-	bool "powerpc64-power8 musl bleeding-edge 2024.02-1"
+	bool "powerpc64-power8 musl bleeding-edge 2024.05-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3729,15 +3665,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE
-	bool "powerpc64-power8 musl stable 2024.02-1"
+	bool "powerpc64-power8 musl stable 2024.05-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -3755,12 +3690,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
-	bool "powerpc64le-power8 glibc bleeding-edge 2024.02-1"
+	bool "powerpc64le-power8 glibc bleeding-edge 2024.05-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3781,15 +3716,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
-	bool "powerpc64le-power8 glibc stable 2024.02-1"
+	bool "powerpc64le-power8 glibc stable 2024.05-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -3807,12 +3741,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE
-	bool "powerpc64le-power8 musl bleeding-edge 2024.02-1"
+	bool "powerpc64le-power8 musl bleeding-edge 2024.05-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3833,15 +3767,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE
-	bool "powerpc64le-power8 musl stable 2024.02-1"
+	bool "powerpc64le-power8 musl stable 2024.05-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -3859,14 +3792,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
-	bool "riscv32-ilp32d glibc bleeding-edge 2024.02-1"
+	bool "riscv32-ilp32d glibc bleeding-edge 2024.05-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3886,8 +3819,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
 
 	  https://toolchains.bootlin.com/
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_BLEEDING_EDGE
-	bool "riscv32-ilp32d musl bleeding-edge 2024.02-1"
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_STABLE
+	bool "riscv32-ilp32d glibc stable 2024.05-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
@@ -3895,6 +3828,33 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_BLEEDING_EDGE
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Bootlin toolchain for the riscv32-ilp32d architecture,
+	  using the glibc C library. This is a stable version, which
+	  means it is using stable and proven versions of gcc, gdb
+	  and binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_BLEEDING_EDGE
+	bool "riscv32-ilp32d musl bleeding-edge 2024.05-1"
+	depends on BR2_riscv
+	depends on BR2_riscv_g
+	depends on BR2_RISCV_32
+	depends on BR2_RISCV_ABI_ILP32D
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3915,17 +3875,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_STABLE
-	bool "riscv32-ilp32d musl stable 2024.02-1"
+	bool "riscv32-ilp32d musl stable 2024.05-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -3942,15 +3901,70 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_STABLE
 
 	  https://toolchains.bootlin.com/
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_BLEEDING_EDGE
+	bool "riscv32-ilp32d uclibc bleeding-edge 2024.05-1"
+	depends on BR2_riscv
+	depends on BR2_riscv_g
+	depends on BR2_RISCV_32
+	depends on BR2_RISCV_ABI_ILP32D
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	help
+	  Bootlin toolchain for the riscv32-ilp32d architecture,
+	  using the uclibc C library. This is a bleeding-edge
+	  version, which means it is using the latest versions of
+	  gcc, gdb and binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_STABLE
+	bool "riscv32-ilp32d uclibc stable 2024.05-1"
+	depends on BR2_riscv
+	depends on BR2_riscv_g
+	depends on BR2_RISCV_32
+	depends on BR2_RISCV_ABI_ILP32D
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	help
+	  Bootlin toolchain for the riscv32-ilp32d architecture,
+	  using the uclibc C library. This is a stable version, which
+	  means it is using stable and proven versions of gcc, gdb
+	  and binutils.
+
+	  https://toolchains.bootlin.com/
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE
-	bool "riscv64-lp64d glibc bleeding-edge 2024.02-1"
+	bool "riscv64-lp64d glibc bleeding-edge 2024.05-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3971,17 +3985,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE
-	bool "riscv64-lp64d glibc stable 2023.11-1"
+	bool "riscv64-lp64d glibc stable 2024.05-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -3999,14 +4012,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE
-	bool "riscv64-lp64d musl bleeding-edge 2024.02-1"
+	bool "riscv64-lp64d musl bleeding-edge 2024.05-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4027,17 +4040,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE
-	bool "riscv64-lp64d musl stable 2023.11-1"
+	bool "riscv64-lp64d musl stable 2024.05-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -4055,14 +4067,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE
-	bool "riscv64-lp64d uclibc bleeding-edge 2024.02-1"
+	bool "riscv64-lp64d uclibc bleeding-edge 2024.05-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4084,19 +4096,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE
-	bool "riscv64-lp64d uclibc stable 2023.11-1"
+	bool "riscv64-lp64d uclibc stable 2024.05-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -4113,12 +4124,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE
-	bool "s390x-z13 glibc bleeding-edge 2024.02-1"
+	bool "s390x-z13 glibc bleeding-edge 2024.05-1"
 	depends on BR2_s390x
 	depends on BR2_s390x_z13
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4139,15 +4150,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE
-	bool "s390x-z13 glibc stable 2024.02-1"
+	bool "s390x-z13 glibc stable 2024.05-1"
 	depends on BR2_s390x
 	depends on BR2_s390x_z13
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -4164,13 +4174,63 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE
 
 	  https://toolchains.bootlin.com/
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_BLEEDING_EDGE
+	bool "s390x-z13 musl bleeding-edge 2024.05-1"
+	depends on BR2_s390x
+	depends on BR2_s390x_z13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the s390x-z13 architecture, using the
+	  musl C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_STABLE
+	bool "s390x-z13 musl stable 2024.05-1"
+	depends on BR2_s390x
+	depends on BR2_s390x_z13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the s390x-z13 architecture, using the
+	  musl C library. This is a stable version, which means it is
+	  using stable and proven versions of gcc, gdb and binutils.
+
+	  https://toolchains.bootlin.com/
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
-	bool "sh-sh4 glibc bleeding-edge 2024.02-1"
+	bool "sh-sh4 glibc bleeding-edge 2024.05-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4191,15 +4251,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
-	bool "sh-sh4 glibc stable 2024.02-1"
+	bool "sh-sh4 glibc stable 2024.05-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -4217,12 +4276,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE
-	bool "sh-sh4 musl bleeding-edge 2024.02-1"
+	bool "sh-sh4 musl bleeding-edge 2024.05-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4243,15 +4302,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE
-	bool "sh-sh4 musl stable 2024.02-1"
+	bool "sh-sh4 musl stable 2024.05-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -4268,11 +4326,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE
-	bool "sh-sh4 uclibc bleeding-edge 2024.02-1"
+	bool "sh-sh4 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4294,16 +4352,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE
-	bool "sh-sh4 uclibc stable 2024.02-1"
+	bool "sh-sh4 uclibc stable 2024.05-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -4320,12 +4377,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
-	bool "sh-sh4aeb glibc bleeding-edge 2024.02-1"
+	bool "sh-sh4aeb glibc bleeding-edge 2024.05-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4346,15 +4403,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
-	bool "sh-sh4aeb glibc stable 2024.02-1"
+	bool "sh-sh4aeb glibc stable 2024.05-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -4372,12 +4428,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE
-	bool "sh-sh4aeb musl bleeding-edge 2024.02-1"
+	bool "sh-sh4aeb musl bleeding-edge 2024.05-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4398,15 +4454,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE
-	bool "sh-sh4aeb musl stable 2024.02-1"
+	bool "sh-sh4aeb musl stable 2024.05-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -4423,12 +4478,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
-	bool "sparc64 glibc bleeding-edge 2024.02-1"
+	bool "sparc64 glibc bleeding-edge 2024.05-1"
 	depends on BR2_sparc64
 	depends on BR2_sparc_v9
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4449,15 +4504,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE
-	bool "sparc64 glibc stable 2024.02-1"
+	bool "sparc64 glibc stable 2024.05-1"
 	depends on BR2_sparc64
 	depends on BR2_sparc_v9
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -4475,12 +4529,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_BLEEDING_EDGE
-	bool "sparcv8 uclibc bleeding-edge 2022.08-2"
+	bool "sparcv8 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_sparc
 	depends on BR2_sparc_v8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_12
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
@@ -4501,16 +4555,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE
-	bool "sparcv8 uclibc stable 2022.08-1"
+	bool "sparcv8 uclibc stable 2024.05-1"
 	depends on BR2_sparc
 	depends on BR2_sparc_v8
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_11
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -4527,14 +4580,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE
-	bool "x86-64 glibc bleeding-edge 2024.02-1"
+	bool "x86-64 glibc bleeding-edge 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4555,17 +4608,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE
-	bool "x86-64 glibc stable 2024.02-1"
+	bool "x86-64 glibc stable 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -4583,14 +4635,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE
-	bool "x86-64 musl bleeding-edge 2024.02-1"
+	bool "x86-64 musl bleeding-edge 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4611,17 +4663,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE
-	bool "x86-64 musl stable 2024.02-1"
+	bool "x86-64 musl stable 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -4638,13 +4689,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE
-	bool "x86-64 uclibc bleeding-edge 2024.02-1"
+	bool "x86-64 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4666,18 +4717,17 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE
-	bool "x86-64 uclibc stable 2024.02-1"
+	bool "x86-64 uclibc stable 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -4694,7 +4744,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
-	bool "x86-64-v2 glibc bleeding-edge 2024.02-1"
+	bool "x86-64-v2 glibc bleeding-edge 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4703,9 +4753,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4726,7 +4776,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE
-	bool "x86-64-v2 glibc stable 2024.02-1"
+	bool "x86-64-v2 glibc stable 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4735,12 +4785,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -4758,7 +4807,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
-	bool "x86-64-v2 musl bleeding-edge 2024.02-1"
+	bool "x86-64-v2 musl bleeding-edge 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4767,9 +4816,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4790,7 +4839,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE
-	bool "x86-64-v2 musl stable 2024.02-1"
+	bool "x86-64-v2 musl stable 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4799,12 +4848,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -4821,7 +4869,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-v2 uclibc bleeding-edge 2024.02-1"
+	bool "x86-64-v2 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4830,8 +4878,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4853,7 +4901,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE
-	bool "x86-64-v2 uclibc stable 2024.02-1"
+	bool "x86-64-v2 uclibc stable 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4862,13 +4910,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -4885,7 +4932,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
-	bool "x86-64-v3 glibc bleeding-edge 2024.02-1"
+	bool "x86-64-v3 glibc bleeding-edge 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4896,9 +4943,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4919,7 +4966,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE
-	bool "x86-64-v3 glibc stable 2024.02-1"
+	bool "x86-64-v3 glibc stable 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4930,12 +4977,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -4953,7 +4999,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
-	bool "x86-64-v3 musl bleeding-edge 2024.02-1"
+	bool "x86-64-v3 musl bleeding-edge 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4964,9 +5010,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4987,7 +5033,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE
-	bool "x86-64-v3 musl stable 2024.02-1"
+	bool "x86-64-v3 musl stable 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4998,12 +5044,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -5020,7 +5065,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-v3 uclibc bleeding-edge 2024.02-1"
+	bool "x86-64-v3 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5031,8 +5076,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -5054,7 +5099,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE
-	bool "x86-64-v3 uclibc stable 2024.02-1"
+	bool "x86-64-v3 uclibc stable 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5065,13 +5110,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -5088,7 +5132,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
-	bool "x86-64-v4 glibc bleeding-edge 2024.02-1"
+	bool "x86-64-v4 glibc bleeding-edge 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5100,9 +5144,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -5123,7 +5167,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE
-	bool "x86-64-v4 glibc stable 2024.02-1"
+	bool "x86-64-v4 glibc stable 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5135,12 +5179,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -5158,7 +5201,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
-	bool "x86-64-v4 musl bleeding-edge 2024.02-1"
+	bool "x86-64-v4 musl bleeding-edge 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5170,9 +5213,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -5193,7 +5236,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE
-	bool "x86-64-v4 musl stable 2024.02-1"
+	bool "x86-64-v4 musl stable 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5205,12 +5248,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -5227,7 +5269,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-v4 uclibc bleeding-edge 2024.02-1"
+	bool "x86-64-v4 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5239,8 +5281,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -5262,7 +5304,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE
-	bool "x86-64-v4 uclibc stable 2024.02-1"
+	bool "x86-64-v4 uclibc stable 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5274,13 +5316,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -5297,7 +5338,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
-	bool "x86-64-core-i7 glibc bleeding-edge 2024.02-1"
+	bool "x86-64-core-i7 glibc bleeding-edge 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5306,9 +5347,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -5329,7 +5370,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
-	bool "x86-64-core-i7 glibc stable 2024.02-1"
+	bool "x86-64-core-i7 glibc stable 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5338,12 +5379,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -5361,7 +5401,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
-	bool "x86-64-core-i7 musl bleeding-edge 2024.02-1"
+	bool "x86-64-core-i7 musl bleeding-edge 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5370,9 +5410,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -5393,7 +5433,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
-	bool "x86-64-core-i7 musl stable 2024.02-1"
+	bool "x86-64-core-i7 musl stable 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5402,12 +5442,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -5425,7 +5464,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-core-i7 uclibc bleeding-edge 2024.02-1"
+	bool "x86-64-core-i7 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5434,8 +5473,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -5457,7 +5496,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
-	bool "x86-64-core-i7 uclibc stable 2024.02-1"
+	bool "x86-64-core-i7 uclibc stable 2024.05-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5466,13 +5505,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -5489,16 +5527,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
-	bool "x86-core2 glibc bleeding-edge 2024.02-1"
+	bool "x86-core2 glibc bleeding-edge 2024.05-1"
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
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -5519,19 +5557,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
-	bool "x86-core2 glibc stable 2024.02-1"
+	bool "x86-core2 glibc stable 2024.05-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -5549,16 +5586,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
-	bool "x86-core2 musl bleeding-edge 2024.02-1"
+	bool "x86-core2 musl bleeding-edge 2024.05-1"
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
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -5578,19 +5615,18 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
-	bool "x86-core2 musl stable 2024.02-1"
+	bool "x86-core2 musl stable 2024.05-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -5606,15 +5642,15 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE
-	bool "x86-core2 uclibc bleeding-edge 2024.02-1"
+	bool "x86-core2 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -5636,20 +5672,19 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE
-	bool "x86-core2 uclibc stable 2024.02-1"
+	bool "x86-core2 uclibc stable 2024.05-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -5666,7 +5701,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
-	bool "x86-i686 glibc bleeding-edge 2024.02-1"
+	bool "x86-i686 glibc bleeding-edge 2024.05-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5676,9 +5711,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -5699,7 +5734,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
-	bool "x86-i686 glibc stable 2024.02-1"
+	bool "x86-i686 glibc stable 2024.05-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5709,12 +5744,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -5732,7 +5766,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
-	bool "x86-i686 musl bleeding-edge 2024.02-1"
+	bool "x86-i686 musl bleeding-edge 2024.05-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5742,9 +5776,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -5764,7 +5798,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
-	bool "x86-i686 musl stable 2024.02-1"
+	bool "x86-i686 musl stable 2024.05-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5774,12 +5808,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -5795,7 +5828,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
-	bool "x86-i686 uclibc bleeding-edge 2024.02-1"
+	bool "x86-i686 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5805,8 +5838,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -5828,7 +5861,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
-	bool "x86-i686 uclibc stable 2024.02-1"
+	bool "x86-i686 uclibc stable 2024.05-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5838,13 +5871,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
@@ -5861,12 +5893,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
-	bool "xtensa-lx60 uclibc bleeding-edge 2024.02-1"
+	bool "xtensa-lx60 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_xtensa
 	depends on BR2_XTENSA_CUSTOM
 	depends on BR2_XTENSA_LITTLE_ENDIAN
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -5888,17 +5920,16 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE
-	bool "xtensa-lx60 uclibc stable 2024.02-1"
+	bool "xtensa-lx60 uclibc stable 2024.05-1"
 	depends on BR2_xtensa
 	depends on BR2_XTENSA_CUSTOM
 	depends on BR2_XTENSA_LITTLE_ENDIAN
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
index 547e87b070..adc42531cc 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
@@ -1,432 +1,442 @@
 # This file was auto-generated by support/scripts/gen-bootlin-toolchains
 # Do not edit
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2024.02-1.sha256
-sha256  09a5a8a59403e3df7a557014d0f9463e8e366c5431656252f0ce3fc00ecfc050  aarch64--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2024.02-1.sha256
-sha256  30a7a7e8f1c7165ca0c6ad6a11403e94ea65144a3c0181c2fa1f619ab972f26f  aarch64--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--bleeding-edge-2024.02-1.sha256
-sha256  d81e3517b69ebc49bec9e130952cd7c18fd0f84e992720e18e9cd02110c00296  aarch64--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--stable-2024.02-1.sha256
-sha256  aaa1a5c9212067de3618afbb8f3de4047d99fa1d23e5bc1452bab7fd3744df2e  aarch64--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  225e3d9a1fd938e7779e357bc36d8639df8c413c4b31056292c83281677d184d  aarch64--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--stable-2024.02-1.sha256
-sha256  de74a7fd974a5601418a60da645b433df6fd7773dda124a10d860c7f586e5a9d  aarch64--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--bleeding-edge-2024.02-1.sha256
-sha256  80cb37b022aa74c7329cef44336024fc5ca18c6193fdabfef01241153aba7f9d  aarch64be--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--stable-2024.02-1.sha256
-sha256  aff4f324dd6318a66e94e512a0582c25f765b24e91e4e5576f7b917d585439e6  aarch64be--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--bleeding-edge-2024.02-1.sha256
-sha256  c3ac7754efd3bf2968021ca7321edc8ea361ee3e071ed50b2d2d72c68d0a0de9  aarch64be--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--stable-2024.02-1.sha256
-sha256  143f57255fd8be375b3b16f4346a419968ba53fc839d6623752a4e9649809f21  aarch64be--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  0d25460ea796663839c0d023686fde91f248e19cbcc1c5eab1f6daa504bad019  aarch64be--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--stable-2024.02-1.sha256
-sha256  ea1f0195ce312417f7ef915a5c5c339893f48a20698f46b3ed183cf0f6b8faab  aarch64be--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  a3a59cb25854ccb052035636e6d65c6ef3158182b69d23d2bd6c8a6e4284a052  arcle-750d--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--stable-2024.02-1.sha256
-sha256  315da85c124833e012565ec0c4cfdb8a334a302d21ab1f4b1289837035dcfa40  arcle-750d--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--bleeding-edge-2024.02-1.sha256
-sha256  2bf7b934cf62035ebed6e999ecd0a9af815297151362e799472437bcca0498f9  arcle-hs38--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--stable-2023.11-1.sha256
-sha256  91c048fb79152969253a3bb96a9cd77c79c2ba5a3081d2da7cf103069661e303  arcle-hs38--glibc--stable-2023.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  2729a47b36989dc95346d31934dcb358f240075dc838c35ccac075f67322ab64  arcle-hs38--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--stable-2024.02-1.sha256
-sha256  9d0ef6443c7192e5ae5301e9c1cc22437224e404ed3232dd17fc042dd2e6b5b5  arcle-hs38--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2024.02-1.sha256
-sha256  8f6c0bd14479ced3814917a12cc8c0809fa5161c87da39b362a1ec8bc348e95c  armv5-eabi--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--stable-2024.02-1.sha256
-sha256  9c43357d0eb79ba3f1aab8f020bdc673d24af0a44e2825c19eee2917308bc47e  armv5-eabi--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--bleeding-edge-2024.02-1.sha256
-sha256  8dac4ea5697a42a88bd1d7d91c3d57a20a7db6239857def3d7518c8e2330b5a4  armv5-eabi--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--stable-2024.02-1.sha256
-sha256  be82371ce785f28be097887fa43e6e63644c9226f12ca4c3f23e54792dba18e8  armv5-eabi--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  6333e0b6e5e1b40c92eb276fe6ecc713932b159df01df6e58d48285e4a9076b7  armv5-eabi--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--stable-2024.02-1.sha256
-sha256  68fba0cfb5af4136fe88fb451db9005ed2a8576509a9b1daf140eca5575460d5  armv5-eabi--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--bleeding-edge-2024.02-1.sha256
-sha256  45aabb8a3b31bb28518680eb9bc91a7f9228bdb71c6473f7d3ba03754f3f8769  armv6-eabihf--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--stable-2024.02-1.sha256
-sha256  e3d873f4be92438632da140c087bbd0025e406d138e7f5832d9481af1c9146ef  armv6-eabihf--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--bleeding-edge-2024.02-1.sha256
-sha256  04e7b5803f4f9984cab333570d537ce185d8a9892b95f2db7ba2e50c22e6b7bc  armv6-eabihf--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--stable-2024.02-1.sha256
-sha256  2d91a0a9fb4cff3046943307c70054507ec12c43eedbeb95eb597cfee2d3b58d  armv6-eabihf--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  3fcc8fdf8eaa94ac48f3d8a51484904829c665a018d8a8ef8ae9491382f944f9  armv6-eabihf--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--stable-2024.02-1.sha256
-sha256  cbd1de7ca4921e55c85a074ee2381996d07e2a5e378d3c3e6b86da587a0aa9fc  armv6-eabihf--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2024.02-1.sha256
-sha256  db5178feac8a02f3dc6fab16448d0ca2835bc915ca0453f6aba6510b7dccfb5d  armv7-eabihf--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2024.02-1.sha256
-sha256  ec079d95388d5313f73e67fd32859ccbe2369f280d74aa103c40323c8cc6bd57  armv7-eabihf--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--bleeding-edge-2024.02-1.sha256
-sha256  9c1cd34a2f488c01315ce4943a4b1ba59f92608cf902dfe3606eb1d1b2503e45  armv7-eabihf--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--stable-2024.02-1.sha256
-sha256  88b5f04190e095969bd4fa5ffb4322181f2311b09e075d6ee13d74e88e7bff32  armv7-eabihf--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  900a2e383165cf6cc32c1e9271bce2d686702e6407058b7a196e49b812b8d05f  armv7-eabihf--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2024.02-1.sha256
-sha256  bfbd81e15f771f4dbf0537677f4338731faaaa6fc250efd5027ccbe347b1f3f1  armv7-eabihf--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--bleeding-edge-2024.02-1.sha256
-sha256  76d31189aa2b52320a35757cb45920ae91303681e7e72601ce858082d7ed5120  armebv7-eabihf--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--stable-2024.02-1.sha256
-sha256  0075aee77819c918cf54c1d2cda3ccbea2e59ac93cbbc42706736b741d6d625e  armebv7-eabihf--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--bleeding-edge-2024.02-1.sha256
-sha256  2c142234299301d3871c6ec878eaefc08dd14785cb96e691e605d23c0a7d1f2e  armebv7-eabihf--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--stable-2024.02-1.sha256
-sha256  6ee263a880819cf629f3ace5c2da9174ab19d1bdf4be59d9ffc6cc52b7693bc8  armebv7-eabihf--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  1fbb9bcdcc82c1dbb226dfe47c568d7f1d46676974aecbe46f711ef4b5939298  armebv7-eabihf--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--stable-2024.02-1.sha256
-sha256  fab1646eca9a5bf1ccd5fd95f26a48b9fa4cc24b70051140710f95bd8c3899ba  armebv7-eabihf--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  eebbdae08ba9ae84f0eccf2154b7c295fa60c787f6767015ac2b2df113809cec  armv7m--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--stable-2024.02-1.sha256
-sha256  b421fb864bcd3d7ad5e964d344b5790724e05642380784cef547e9c1f99282cd  armv7m--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--glibc--bleeding-edge-2024.02-1.sha256
-sha256  9943453b4afb89670c4de266a24d0406a2fb0c44cd030c50a86e2524c709ed01  m68k-68xxx--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--glibc--stable-2024.02-1.sha256
-sha256  bf6d5f67104787dedee69f565e180af91c9e2ee12b184eb29c4a91e1cfb41d13  m68k-68xxx--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--musl--bleeding-edge-2024.02-1.sha256
-sha256  510677f9ab05f6d8ac726459897d936064c4adcc5c5d2b6e9f52f7bab9677eac  m68k-68xxx--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--musl--stable-2024.02-1.sha256
-sha256  a4701199b74e5d242c5b61b3d23a03b4958b8d2c438c9744f7b6198ad78d8b5c  m68k-68xxx--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  2e0727f0ba9549ccb8abd7f7bd3f1be13b516e20665e1da4a8106a247a7fd334  m68k-68xxx--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--stable-2024.02-1.sha256
-sha256  35ec4229ef7ae582ece4709b5906a9423c6f2284831a9b84ca13a5a5d98710c7  m68k-68xxx--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  1b742f3fc3eb62c6c6cd7c3a0436ec92d647270e6acd8295b295399c58f3e224  m68k-coldfire--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--stable-2024.02-1.sha256
-sha256  b2acfb9d72156c6cf0da98f50487d4cd437fd9018e85e861bb1d506b85d52fd4  m68k-coldfire--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--bleeding-edge-2024.02-1.sha256
-sha256  22f742453af1c315ca9376e0bff1e5fd04fee72b3b6c037b7ac99750ec96afd4  microblazebe--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--stable-2024.02-1.sha256
-sha256  826cdbb09adca7544cd8d09a38958423f52655a8ce17ea95e4880348ea5ec594  microblazebe--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--bleeding-edge-2024.02-1.sha256
-sha256  112e3496aa3e5e7515fe8d06060cae5e6a794cd2c82f7b0cfed40ee75775138c  microblazebe--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--stable-2024.02-1.sha256
-sha256  627ccc508f29a9e4f881af97e0faf46fd5a7926f88dfc594a38d9063cb74db59  microblazebe--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  1f0101f66f0d8e1ff316bcb24ca0082ce58bc69724a15aa0d9a2fee5e1e70f2b  microblazebe--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--stable-2024.02-1.sha256
-sha256  7f26818820b3a04c6e3e2ca268efc4b733fcba5a1a6568d4f4f243b8482b88fa  microblazebe--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--bleeding-edge-2024.02-1.sha256
-sha256  102d68fd19e0bf2b14d49e2a29317196ec63baa1cbcffcb0ebc3ffc158b31750  microblazeel--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--stable-2024.02-1.sha256
-sha256  0795f6ccb2584d51b378974c36532b1c994672694b1bca63953a162811b9fdcb  microblazeel--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--bleeding-edge-2024.02-1.sha256
-sha256  c35b0cd70231e307dc2573d876fd0d0efc3c9f32cc32e21e577228cefdbe1c9a  microblazeel--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--stable-2024.02-1.sha256
-sha256  b9791b921fdb8c001949eaaccfa0746f142902d5df297455e1b9c4f029c1db93  microblazeel--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  fbeabfc16b10e61a37c2924d60290fcaab40ddfcb8314e20ea1461a4fb588eb4  microblazeel--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--stable-2024.02-1.sha256
-sha256  ce20fcbed964958860b1883a80a48829b3331d6a10abc7cff0522768707211b6  microblazeel--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--bleeding-edge-2024.02-1.sha256
-sha256  aa990348607011c16eef583ab564fa7bef49a24141f247edb96f62970b3108fc  mips32--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--stable-2024.02-1.sha256
-sha256  595cedbc0e70d5c939529ecc8d09c3a8eff63f77c3d0772b7ae306e1b3b5aef9  mips32--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--bleeding-edge-2024.02-1.sha256
-sha256  1df8d93bdaca510993b2f189fea08c5a153a18bc6c54f3a6a833a5c7a26349df  mips32--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--stable-2024.02-1.sha256
-sha256  a0fde56bf905b9057aed8688b8e60a93fcdca1097bcc4748f24b23e26c12f462  mips32--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  ee7a1fa00cae9b6b190b436537ad9f7c8eb2c86f72327de7b583c786e5cb6780  mips32--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--stable-2024.02-1.sha256
-sha256  3dcaeb45fb690b2d47426bae75adaa0c7042cbe9f5c774faf2d70c0174c88196  mips32--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--bleeding-edge-2024.02-1.sha256
-sha256  6f3875119a362c76119fc75d52d191b4b9a7c23615a19aaa85ffae97c360fe14  mips32el--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--stable-2024.02-1.sha256
-sha256  d92f8531fd703bc7b25f3d70ffac49ee7536171c8d854967312e3c98d8641c57  mips32el--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--bleeding-edge-2024.02-1.sha256
-sha256  e315f917711fb99783572485b8adbabd4f19cc035356cd30a0d628823ed6fd32  mips32el--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--stable-2024.02-1.sha256
-sha256  25c0b3217df1bf1a7bae2cc4f56cdeab9fec98b172bbf0b336b2e8fe41d3ee4e  mips32el--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  43618ec1849db61dd55cb34e3aba28d741a713642b335dcef79687358cbcdf38  mips32el--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--stable-2024.02-1.sha256
-sha256  1e5cfcfe9f9cc7ab7abd843b8ae22fe959aa9c929dc3d4f353653899bb9771a1  mips32el--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--bleeding-edge-2024.02-1.sha256
-sha256  6c0eb902af46dbbf069080755c9e16ad5e7f725f055a3e2b47d552f54a733ab9  mips32r5el--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--stable-2024.02-1.sha256
-sha256  375f1f5f42b0d6559111ca12acbc2622057cf2be7b30b99cb32b823a76d7bdf7  mips32r5el--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--bleeding-edge-2024.02-1.sha256
-sha256  fb440165ff535234f88cdfd99c37cc96a3c349d2487f52b62bf879261cb6b837  mips32r5el--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--stable-2024.02-1.sha256
-sha256  c6b03bfb2f00476cc38b38f910c8a3884b8b77d7aecb307fdb6f06b18ff3456a  mips32r5el--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  744d98a6c6eda7fd0ae50771680c6661439906469de9df1d5f1ff758ce1ddb52  mips32r5el--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--stable-2024.02-1.sha256
-sha256  89bed915ce8f2a7f09a0ae154a7a5435288f15de381c0ba5af4eee37cef81be3  mips32r5el--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--bleeding-edge-2024.02-1.sha256
-sha256  c345005e9fedc78ace9c5478882f094769d056979f85f432ee763837407bdd09  mips32r6el--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--stable-2024.02-1.sha256
-sha256  64321a05be857085ca1e138942456f7adf0d75188684955d404651e9a7792029  mips32r6el--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--bleeding-edge-2024.02-1.sha256
-sha256  c44ce7050fdb0a729fa42bd6f15238c95f8c2e3540dd703db1861c273399206f  mips32r6el--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--stable-2024.02-1.sha256
-sha256  d25a9efb1bf06a845995de0bc5d24e8417ad538b8b68f12c02bc1b9aadabc9d7  mips32r6el--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  2a4296e6517a8dc18cdcc304c20834987c29bf994819209a1f30abff29761394  mips32r6el--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--stable-2024.02-1.sha256
-sha256  16ec7dddcafb4c8834aaa79317f78a180907f3ca2f82fc0d37703d47424fe684  mips32r6el--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--bleeding-edge-2024.02-1.sha256
-sha256  f556d8fb16eeb8c31cc8edbcc4855d4eac15de4b10cc694e82690132022c835a  mips64-n32--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--stable-2024.02-1.sha256
-sha256  dae5bd6ff5a79b22b60a42834b98b1b81e5ed7445f477130fbfea9b081364b29  mips64-n32--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--bleeding-edge-2024.02-1.sha256
-sha256  4e1bb50ff41b2e8f26c8c48217017abe16e251c3c9a453c1bbed3629939bb35a  mips64-n32--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--stable-2024.02-1.sha256
-sha256  7c9400fec57e1d28ed59fb47e0f40bfb7c98781d8573a8fd5f98ea82cf88058f  mips64-n32--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  a83df99f15d1507f39461ab6bcb09d3fc25c4df90fe4fa975bd23294dfed182d  mips64-n32--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--stable-2024.02-1.sha256
-sha256  7f6731cd454f98a503579b94822316d95ed1dd3afc6e325ecc5bbfa76065ca05  mips64-n32--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--bleeding-edge-2024.02-1.sha256
-sha256  4a2651f656e84649bca3686960c8b40eb8ce193a60a3942e2b98895dc584717e  mips64el-n32--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--stable-2024.02-1.sha256
-sha256  138d29328daf5d08ced6b79214cbb3884f168ae90414022041e35dcd2bbb5943  mips64el-n32--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--bleeding-edge-2024.02-1.sha256
-sha256  033ad6b1add333d9a7c969b987d51f7ebb3a0f819488ad287d5932afc0860825  mips64el-n32--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--stable-2024.02-1.sha256
-sha256  70c2a720c018bba0384e9aae147cfa706141b6918da11b09fbee16178473e769  mips64el-n32--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  dbb806a185f1770accdc54668435293966955f891b214c7ea33dfe2a836f5bf4  mips64el-n32--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--stable-2024.02-1.sha256
-sha256  b7ca42af6258fa7204716f4145478f1510c6ff4c093a9efa70a03fcf757b25a6  mips64el-n32--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--bleeding-edge-2024.02-1.sha256
-sha256  ec8635038743dc95e181963096a13cd9aa806ee1fa41251e54ff57bb092f762e  mips64r6el-n32--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--stable-2024.02-1.sha256
-sha256  064bca63fa00ccf1c6982eb9b1d1d71f61096f2826b9134322e16a38b1317937  mips64r6el-n32--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--bleeding-edge-2024.02-1.sha256
-sha256  931f2bace4d0264321ad5434d960c7180a85f0d25192bf951cc8223b7b0c96ff  mips64r6el-n32--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--stable-2024.02-1.sha256
-sha256  fff80653c6814bd87522fbdef6b89de386a60ed53fa7fcfb35603d055f55a071  mips64r6el-n32--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  1674501dde087ee3160ae77f7940960e43839e83443f225e6d9745d41d3df118  mips64r6el-n32--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--stable-2024.02-1.sha256
-sha256  ff6c4296a50913ccf9a20a4270ff74ae6a35878b66140216b349a89a72e2cef4  mips64r6el-n32--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--bleeding-edge-2024.02-1.sha256
-sha256  72ef91ac2c7f00a41449b7e87845bcb6a944ce9ed94b62e19652830ecab42a03  nios2--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--stable-2024.02-1.sha256
-sha256  0fb3b7204a80466e56da5a63683437ed0934617e7d6979ab0d140e3ca5440144  nios2--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--bleeding-edge-2024.02-1.sha256
-sha256  7af2336389d5d64c48722d257fa7ad10e83ce1c25ac49aaa5fdcc70bd09220bf  openrisc--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--stable-2023.11-1.sha256
-sha256  35eb515b554a8dcb60cae731aba49b9588cfec379f434d106de9a971015d7cf1  openrisc--glibc--stable-2023.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2024.02-1.sha256
-sha256  02abf22a8620893cc974038ac9401c2c74eb39f2a549a20939f460d694bf984c  openrisc--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2024.02-1.sha256
-sha256  34dfd1fd3977792754eb03c5ef877045a476a52ffcecf18418bca81514ae0308  openrisc--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  2d9c293c1123c30e813414610a4d060bcdef6461c82e258d405011be38fda6f6  openrisc--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2024.02-1.sha256
-sha256  e885e4bdcc73eeda5a18689abecadbf6686518c049e9c785c7485d80ea74d3dd  openrisc--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2024.02-1.sha256
-sha256  9e5601beacf2b4d96f7ed12851c722b8f83beaa9da8f7ae7734816fca2d4da1e  powerpc-440fp--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2024.02-1.sha256
-sha256  8961f117690f91afa8dcca7ab875dacf1674480c0bf53548fec2d53932823a8b  powerpc-440fp--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2024.02-1.sha256
-sha256  5abd9ec89e402a9de7bdadd595d39de9181f0d351573751c8499aaef93c0d441  powerpc-440fp--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--stable-2024.02-1.sha256
-sha256  20647de8d019a15a92126b0be5c24e16b61b92730c620b156e11989579dc3ea8  powerpc-440fp--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  2108261d7785cc2c1f81c7b62da5c4874fe6ae3eae8b9c704df4a8bc8a4d7624  powerpc-440fp--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--stable-2024.02-1.sha256
-sha256  2d47170edf21a2377261cd6fd0fe0fe552aefc5f5204b6299bdbc2af4f96317b  powerpc-440fp--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--bleeding-edge-2024.02-1.sha256
-sha256  f6c6f5d741d7f7798d5d9e3e859b063907ec3653436f752a70f0789c5d7accd5  powerpc-e300c3--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--stable-2024.02-1.sha256
-sha256  f780144616fa6e04f9f237df5ae08b1871f087204e7cd41ad2df06ee4fc3ed2f  powerpc-e300c3--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--bleeding-edge-2024.02-1.sha256
-sha256  f8c2aaacc7dd5922c7c719b35b92186ca86ede97ae955f753d7387f92943be64  powerpc-e300c3--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--stable-2024.02-1.sha256
-sha256  f29603df78b64381bf9d7c6128a7a6798320cbeb1779680511b8181a02d30c3b  powerpc-e300c3--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  090f5a4f83bca5473166375e09bf234e2ea14406761a959ac08b89b02c696363  powerpc-e300c3--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--stable-2024.02-1.sha256
-sha256  03a688e3f3fffae1c441abc540dc8be9cf8e524e36efc52aa5bcbe9deeb356b9  powerpc-e300c3--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--bleeding-edge-2024.02-1.sha256
-sha256  90b2cd8c0be088049ed0859eaf4cd09367327c54a956e8a3956083bd99fc96df  powerpc-e500mc--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--stable-2024.02-1.sha256
-sha256  f1d8d2518ec5401c0a5f489bdb4087f082bf97b6803af0dfc30b82b25d02d8cb  powerpc-e500mc--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--bleeding-edge-2024.02-1.sha256
-sha256  81d63ff9c17d0089c477c769c4dea466c5bcf49624334d86963ae9fd474c6dff  powerpc-e500mc--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--stable-2024.02-1.sha256
-sha256  049afaa48adcf1ef21562c004e695aeb08a152cb2f4dff39c35d6ea62e57a35b  powerpc-e500mc--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  a34b562df36f65841a594864260001f203ad2dbb4e910d2dc7427153d465b208  powerpc-e500mc--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--stable-2024.02-1.sha256
-sha256  6028c4014ea1a0fd21b18284c1d02fe28167165e8065d9901d0361c03a9c6075  powerpc-e500mc--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--bleeding-edge-2024.02-1.sha256
-sha256  762eda55a9eac9b079b1b2ad676f74b3ca74bd90382b08763ce2926be29b5898  powerpc64-e5500--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2024.02-1.sha256
-sha256  7062230408225e330705f0b076c9bbb5adab644790f3d3a2386477bcc917ff69  powerpc64-e5500--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--bleeding-edge-2024.02-1.sha256
-sha256  58c29657c99c57f781ee6e4de91e889826ed063a64c7dc162cecbc639a8837e0  powerpc64-e6500--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--stable-2024.02-1.sha256
-sha256  5f4f605b2f3e94652ec94cb2f9880e719e6e61451026dc51fcf9c913152b60e9  powerpc64-e6500--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--bleeding-edge-2024.02-1.sha256
-sha256  834aa216bec987f5ef04d9179bfea2efa850685e74bd153839873683ad112c4b  powerpc64-e6500--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--stable-2024.02-1.sha256
-sha256  358af0323bb08ecebd9ec6d383333c13086a650968ae9cea8fdd5118dcbc2dc8  powerpc64-e6500--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--bleeding-edge-2024.02-1.sha256
-sha256  c37381eef32ee54e4bd7794306647a8df6258c686e70d3ef4a61e58b3e49407a  powerpc64-power8--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--stable-2024.02-1.sha256
-sha256  d451dde868287a5454c39dfc1d1fb888d054191756de9da982c0fe015223157b  powerpc64-power8--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--bleeding-edge-2024.02-1.sha256
-sha256  405c7d69aa6538aac7020f53dc414b4dfadd48e95a670e5dd3e70e33402e0a4f  powerpc64-power8--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--stable-2024.02-1.sha256
-sha256  d73cc758c021163ba9672e0d0de527d45868649bed76eefd1af63a035d40226a  powerpc64-power8--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--bleeding-edge-2024.02-1.sha256
-sha256  f619d173a359c30ba71fa0a6bae26a71647b4f0d00d063564e0deeaeebd10c2b  powerpc64le-power8--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--stable-2024.02-1.sha256
-sha256  1224e21a64d551fa0e50aa4e1a2b684c2a3e2a395244c3771e82e7d92201359b  powerpc64le-power8--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--bleeding-edge-2024.02-1.sha256
-sha256  5884756550dca096903f3430802d5ccccb1232aa600f8bc2dcc2f8fb8a7cfcc1  powerpc64le-power8--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--stable-2024.02-1.sha256
-sha256  66c3325c8cd22c78e6377d594745ca881227fd9858cea57ce84daadf3b61de04  powerpc64le-power8--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--bleeding-edge-2024.02-1.sha256
-sha256  ae046c9e6616f6b33d82c0d581efb41c4c6428fa1c1345417c82533cc27fb86e  riscv32-ilp32d--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--musl--bleeding-edge-2024.02-1.sha256
-sha256  828e3409f995cc15e7038ede150d6fa8bc50a3d69ef2b98b79db7c935bab336c  riscv32-ilp32d--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--musl--stable-2024.02-1.sha256
-sha256  b758a7576b5ffb62a6453264df53a0b28d417d66fb17add5f8858987f28c0eb3  riscv32-ilp32d--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--bleeding-edge-2024.02-1.sha256
-sha256  f815ecf9dd9b8f633b914e178e633095241bbd18d97b9bca05a66a5ca3990524  riscv64-lp64d--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--stable-2023.11-1.sha256
-sha256  80e84af7ebed4e8e52fc2d17994f7bcb2e7bdc069e2d1f1c4656977cd73d9d5d  riscv64-lp64d--glibc--stable-2023.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--bleeding-edge-2024.02-1.sha256
-sha256  81d567e395637fbc5878d1ee38f99592563ad13df8a2e15d7b6ca5afa9d6a35e  riscv64-lp64d--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--stable-2023.11-1.sha256
-sha256  09522ec60b13766090acaa715402cb11edaa39217642fbd7315fbe37b6032275  riscv64-lp64d--musl--stable-2023.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  ea0a1e380a2e157e4541d4705a5ce744ee4109e732b185052a860ad5aabf509d  riscv64-lp64d--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--stable-2023.11-1.sha256
-sha256  aebb6034d3512e3c29337c368dcf4a1e58756c725032d814047a3635178cb5ad  riscv64-lp64d--uclibc--stable-2023.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--bleeding-edge-2024.02-1.sha256
-sha256  2fa0e05c3c5e219e5456a15c284482604ab11a0a00aba4dbb82350fc60151208  s390x-z13--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--stable-2024.02-1.sha256
-sha256  485d6abeb924810228a6d7c6c503e5f724a049a6e14b150c888b33bb9970e14e  s390x-z13--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--bleeding-edge-2024.02-1.sha256
-sha256  413176d97f73a372d6ace57649e51b6132f2479fe26b113278055c922bac3f44  sh-sh4--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--stable-2024.02-1.sha256
-sha256  1519bf392ca9d29494976f5904d6d683dd74e739eccc09b4e3c90ddd65adadfb  sh-sh4--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--bleeding-edge-2024.02-1.sha256
-sha256  ad71172f0339ea267243af40f047797aa1cac4afdcebf4de93d66b11ed64cd8f  sh-sh4--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--stable-2024.02-1.sha256
-sha256  5ab53c70013fd8f5c5409145f4faa60fdb115c54cb10fe4da07acd7588b46d7d  sh-sh4--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  07a3e55f36b7d7718d369408022bd4795c98e79adacad56839ce3805a560f73d  sh-sh4--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--stable-2024.02-1.sha256
-sha256  de811fc1f294fda4bec6c84131f9320277b87687e04a50200a02d9af3d743ebb  sh-sh4--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--bleeding-edge-2024.02-1.sha256
-sha256  182333d197803146d36df9186cb583ff482efbcf4d5ca1db4791ef7cbe17fa8c  sh-sh4aeb--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--stable-2024.02-1.sha256
-sha256  821a749fe873457740204146b3f70b061ddb572fee6ad63ebbf5e1c5ca1bd608  sh-sh4aeb--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--bleeding-edge-2024.02-1.sha256
-sha256  d2d69a26ce5cd0b4e6ce88789a65a0cdcc9b5c877887703f9277aa93bbd7f82c  sh-sh4aeb--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--stable-2024.02-1.sha256
-sha256  3689491d91cdcb3579fc3105cb2b9a16e95e4c92d881602f0e0f254caf50d1d6  sh-sh4aeb--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--bleeding-edge-2024.02-1.sha256
-sha256  7371c311b20412732451f445f1e28c8b4c8bdc8e164630b23065ba4bf8d483cd  sparc64--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--stable-2024.02-1.sha256
-sha256  b5b8056b85cf24e548de8b66919b1ddf59f3ba77446d23abd86f18f094a06eee  sparc64--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--bleeding-edge-2022.08-2.sha256
-sha256  ccd4110fa574d2323f038394c0603245384002fbe906204db36fe200c9c8f886  sparcv8--uclibc--bleeding-edge-2022.08-2.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--stable-2022.08-1.sha256
-sha256  da3b9f0a936401cbd3cc305b86d3611531391354cc0226a0eeb3ce4ddcc7b7dc  sparcv8--uclibc--stable-2022.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--bleeding-edge-2024.02-1.sha256
-sha256  7aac949737ebfb3f4bccc6a75af79d50cf1fadd9ffbdf21e26c1508dff67f23d  x86-64--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--stable-2024.02-1.sha256
-sha256  19c8e5bc1395636aef1ce82b1fa7a520f12c8b4ea1b66ac2c80ec30dcf32925e  x86-64--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--bleeding-edge-2024.02-1.sha256
-sha256  91bd25e7a649e2f2aae93bebf58b4e9f57fae8daf8bf7e573975348e0bc38890  x86-64--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--stable-2024.02-1.sha256
-sha256  f54778c2e50c4aa990c4b74545bb7018dec12324b89f879981430f5411fd27db  x86-64--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  0ebf73f28a369120b0d33ee6800b9b10cf36851cbed3bcad7828c61a7da69588  x86-64--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--stable-2024.02-1.sha256
-sha256  458d9de771c7c35ecd26de1d473b913bdeb01a78b22107f998dd93bacee0bc96  x86-64--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--bleeding-edge-2024.02-1.sha256
-sha256  cefbe65c027b8a785088f7d690fc1eacef2cd39bd60c8a95cb09d666d6b98bb8  x86-64-v2--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--stable-2024.02-1.sha256
-sha256  772a44754d393b012cf0f04fc3ec6acf29461a352bbc44cd255d926db7e9a0f6  x86-64-v2--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--bleeding-edge-2024.02-1.sha256
-sha256  893453ba045a2035c3b87a3619c9fdf1bc641395bd7c9c56ed59e9f8f7a90d8d  x86-64-v2--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--stable-2024.02-1.sha256
-sha256  b5ec30e722386ea98f0e3ca3d6b3e082e6996fefedcc1b607811eb8451c22de0  x86-64-v2--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  15ffb204fa40aa53dcbf1dcacaf23599d70f8778e21d57cadfb89b98c4a7587f  x86-64-v2--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--stable-2024.02-1.sha256
-sha256  3ff823a12ad3f668f6b3d8d596fe2d44236f1a24563b30ce72f9299ba73e0b14  x86-64-v2--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--bleeding-edge-2024.02-1.sha256
-sha256  27bb18f261a412fa752f1c019ef4a9250653f16229f2ffb41eb584396787c68d  x86-64-v3--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--stable-2024.02-1.sha256
-sha256  5d515f6e4b311d7636a3cf600cd02fde7d0beb0a2f143df4921ff5a61cbaebcb  x86-64-v3--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--bleeding-edge-2024.02-1.sha256
-sha256  5b5d89737faf3998fbd1590a26dc9bd6a56e400b7fd7c2c2065ba4b98bf839eb  x86-64-v3--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--stable-2024.02-1.sha256
-sha256  45b0db10e82fd28ac930446679f5fbd6ce373ce63e8e3d88e4df1b7455c1b100  x86-64-v3--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  08cc939858ef3e4fef17dd7544ea15b6b8af1bc823ab6453479919c7aa2d669f  x86-64-v3--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--stable-2024.02-1.sha256
-sha256  830b80a76fee9d1c4eac1b5d0351c3543bf2ebcc8f47de2163cbe85dec83143d  x86-64-v3--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--bleeding-edge-2024.02-1.sha256
-sha256  dd645f770d95dc0becc6216f3f32f87f6ffcc713ba3b6c53e96e8a3fcfc24e08  x86-64-v4--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--stable-2024.02-1.sha256
-sha256  ed68f8d487f52beb95e5ff80da01b959222f53e089728b63ce38b99f80b597ca  x86-64-v4--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--bleeding-edge-2024.02-1.sha256
-sha256  19b7633ce87c46ca5483149ef5b9e202bf245d8f099d4cc2ec6a1d986fa97827  x86-64-v4--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--stable-2024.02-1.sha256
-sha256  99468cdd4a77c5b28bdaebf7ee09c5cef2e5dd34335929f8fd5c2e661980c838  x86-64-v4--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  d6d72b9150b7f59cf060b63fae73f7656f58043e61c4f3c68478d15947268398  x86-64-v4--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--stable-2024.02-1.sha256
-sha256  ab29371356518583742bb99d6490805d86a7bbdd84d0a6c00fca84afa34cae52  x86-64-v4--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2024.02-1.sha256
-sha256  45cb05f2d1ff7f62131d172f90fae321753396ef477b549ca79a50fba48edba7  x86-64-core-i7--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2024.02-1.sha256
-sha256  ecaa610ca27b5b65bcd198fa9d71635f6cfbbc90e45fc930b40a50860ee054b9  x86-64-core-i7--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--bleeding-edge-2024.02-1.sha256
-sha256  b6eb510561931a7d1c66afabfc1206731473a64fde41093474d6819e085e9d15  x86-64-core-i7--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--stable-2024.02-1.sha256
-sha256  19799b79a953b3356409ab8e17b48804e20dd0452f36b5bf707ae3a82d007fca  x86-64-core-i7--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  ba8c70414f46649e3ea7196c01c911e91a75ac06b7136c21522ae3606025d6af  x86-64-core-i7--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--stable-2024.02-1.sha256
-sha256  7af3cb11a74bd85878be6a0c7922ae4e71d843b49d3874ef2a0821f0f1c08681  x86-64-core-i7--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2024.02-1.sha256
-sha256  f28e0f3035b9fc8f5bd98b584b8d45cb15ae265a084592afdef37639a05c6e08  x86-core2--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--stable-2024.02-1.sha256
-sha256  4278f1d84b1ccf077de319a9ec9ba2feae282a38a2caeca31d67a24c6021454c  x86-core2--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--bleeding-edge-2024.02-1.sha256
-sha256  9a7654eaef4bb646b2deae602ae607d8cb47f574a54f97050380a3bd6792aefc  x86-core2--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--stable-2024.02-1.sha256
-sha256  16efa5faa30893ec1d4e575ee1b33e782288a261a52911686c56f82e7d5eca44  x86-core2--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  5258405863b3bb7cfafefb9107c152e2dbb3d0565384999f41d8b3ab0c96df39  x86-core2--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--stable-2024.02-1.sha256
-sha256  453e8fb81e07093f6c37aa00e8f54768f9ab4ce1bdd38f3d4269c7b7c509fb1a  x86-core2--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2024.02-1.sha256
-sha256  52df822a10c09469ab6231753f306b668163bfdfe492db209b3a06e3a4e7aa05  x86-i686--glibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--stable-2024.02-1.sha256
-sha256  3341c76890fa04873e0cf56b921a54e046d63d8ea8ecf16e82fb66a1b81a9695  x86-i686--glibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--bleeding-edge-2024.02-1.sha256
-sha256  ace16afe9d7728a5210cc9cadc4bf80754f0dc449855e10501d9669f203fc932  x86-i686--musl--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--stable-2024.02-1.sha256
-sha256  e9cfe8d65170dde92759e0e425c425c15439190711fdd66999cdb6f5551653a3  x86-i686--musl--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  510ca03d4d8952bdc91ebc5ac3c9ab5019f519d174071e88f566ae9746098d29  x86-i686--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--stable-2024.02-1.sha256
-sha256  6ffa7ea5d610bfd25d16769130559be1fc1c00dd5b81ebc4ec25d05e5dcd26c2  x86-i686--uclibc--stable-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--bleeding-edge-2024.02-1.sha256
-sha256  a97be06a34db230c0022d544efcf85bcd0b0d4dda86f820f0abbcab1b59d184f  xtensa-lx60--uclibc--bleeding-edge-2024.02-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--stable-2024.02-1.sha256
-sha256  e871ce555353a025b86d905ea3f5131dfbf95340bcda706facad070d82b997c1  xtensa-lx60--uclibc--stable-2024.02-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2024.05-1.sha256
+sha256  4f64a9ecc2817db5a4cbf128fbd0162e9397cb2cf8316e005fc3fb3d16f097ae  aarch64--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2024.05-1.sha256
+sha256  b0fad860eb94b503a56d66ca8b9ba06d2d4826943e37ebd1d7217423f6ea5bb2  aarch64--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--bleeding-edge-2024.05-1.sha256
+sha256  7a2819d883ae1ddfc91b9ce325c972289d4aae0c692936e722120862a73021eb  aarch64--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--stable-2024.05-1.sha256
+sha256  f847da1195325525f3f07eef045ef40c6b48464a37e0f7fea77360dfe0bc1aa1  aarch64--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  f5480ea84fc71d85361de9a0d89ff7e1a9b9640de86db76b4dec6dd099535cdc  aarch64--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--stable-2024.05-1.sha256
+sha256  748de907a7b601490cbc6bdc816d31127fab6937c831b5c5d21d7f70decf15fe  aarch64--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--bleeding-edge-2024.05-1.sha256
+sha256  02f588c6900d33286b89db5a92e60fdf611a47da5d05c1ee644ba14e2630ffca  aarch64be--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--stable-2024.05-1.sha256
+sha256  a44e4b4cc016aded66f00109c1c5f64f881a8b7effc60bae2e84a5936fd3b0e4  aarch64be--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--bleeding-edge-2024.05-1.sha256
+sha256  af4ca347a5b1e725b0e0c7a4bccc9813005a3fbeb7d1127b4e5c4b07cc22eb5e  aarch64be--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--stable-2024.05-1.sha256
+sha256  f31e16c451f151157069d9890f8f8fa759b1188293e083194b4e64867f0da216  aarch64be--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  45a00779ad073ef2edcb4d42db6e74b02e26de639a6f5d3060d42ce0d9160b52  aarch64be--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--stable-2024.05-1.sha256
+sha256  ef200bd2d5d4762a3f5844703d3c7ef683f15189a1a0fe3857c2eaa117fd45c7  aarch64be--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  18a630b725d97b9903f44d487292c891f4994f83334363d0311014664dc8230a  arcle-750d--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--stable-2024.05-1.sha256
+sha256  74b2afe4f915708e81d9b595396ff82fbc841f698a0b78d778a52cf7be668081  arcle-750d--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--bleeding-edge-2024.05-1.sha256
+sha256  ad0c27042c1ef42b1e7ea5a6b2a7e77a82d8ae137d08c2b95d7d4baea60b5472  arcle-hs38--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--stable-2024.05-1.sha256
+sha256  247f590dede487c76579aa6c5233f634c6525cf31430496ae6dcbd0e07e8dc5b  arcle-hs38--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  38578d0503f123d3eb94afda435a7fa170337810c290e433f119f609856098a8  arcle-hs38--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--stable-2024.05-1.sha256
+sha256  982f6c2d3b161e8e07982f6fe846c18245d17b0ed602cddd64ad45c568c06b01  arcle-hs38--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2024.05-1.sha256
+sha256  1466a2c312a340d5314583c4ef3fbf955eaa0c16627712374e1f1d74d9a38505  armv5-eabi--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--stable-2024.05-1.sha256
+sha256  13f2bea0b06fe560fe60d199cd9d3fb1f20e2335bcc79b90c5130c3916a3ed92  armv5-eabi--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--bleeding-edge-2024.05-1.sha256
+sha256  5261ae65d4e454cb9d16a25a6f93f615742a10c64fb7ce08b7ce776c388abbdd  armv5-eabi--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--stable-2024.05-1.sha256
+sha256  9825d9a4515a92d2251aab3228ddbb6258440b0f952b95fcaa94653a4b29c71a  armv5-eabi--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  5dba09b35b3d5cfd3c44b4429bca73f5d9d5eec591810148928b3ceb8ef688ed  armv5-eabi--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--stable-2024.05-1.sha256
+sha256  c0c616d4f7d6702b8991f83a5a3777137f734e1eb610d4a20297eaef299ec59d  armv5-eabi--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--bleeding-edge-2024.05-1.sha256
+sha256  8c531910b5883352c39d84657c4a8052b67a318314273342890abec318159ead  armv6-eabihf--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--stable-2024.05-1.sha256
+sha256  2924afaa0d47e046339fe70bf526db5a19edaa58d87c6758a861ef41e2781368  armv6-eabihf--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--bleeding-edge-2024.05-1.sha256
+sha256  aeba34ea164503511233566148ccfddba3932ffe13f9d22bfa1a3bf2a31c63f7  armv6-eabihf--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--stable-2024.05-1.sha256
+sha256  cc7444189685f9405636568a582395e4e2b95347f8be0e6d63ed4e2791ab9267  armv6-eabihf--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  ba481ea8b2631871cdddc9ff9600cca3e7f4bdd558602ba936563ddd58039f8f  armv6-eabihf--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--stable-2024.05-1.sha256
+sha256  38e3c482368c96f177c164ed098e7022f45adf83d8715cb2f74238a5a7c0622d  armv6-eabihf--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2024.05-1.sha256
+sha256  10703f0184162ea6ebabb84696903154a8eb7b53175e76ccf5ca0a2294fc68ec  armv7-eabihf--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2024.05-1.sha256
+sha256  608263bc9dc3eadf0962ddb1165f1c2291001190f9927dee47d464e26374462c  armv7-eabihf--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--bleeding-edge-2024.05-1.sha256
+sha256  2a8274d28abd4779010dda6b54bfe0d259559181f99908440d39974f2619567a  armv7-eabihf--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--stable-2024.05-1.sha256
+sha256  5b34157a4c9f53064002f12f57c42836cd551c591a4be6a99b3ee201add506aa  armv7-eabihf--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  f36b736c6cea721e743b2a075285d7b4d65e3b20d3b5353503ebf1c5ee509d36  armv7-eabihf--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2024.05-1.sha256
+sha256  eec6e21cf9d36ab2e8b9dbf4e26311d3d152927c72550bfe84872858e63bcaf4  armv7-eabihf--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--bleeding-edge-2024.05-1.sha256
+sha256  664509d1a9abe7a01f6b2274aff9c9f26ec86bae42c601100dd7a2c5930d9d9c  armebv7-eabihf--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--stable-2024.05-1.sha256
+sha256  50ca1e7c8bf78cdc941edf93d0a350d2c6b5b8024b582a57c7815f6e631ba43b  armebv7-eabihf--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--bleeding-edge-2024.05-1.sha256
+sha256  d8dc252c024a031524e56284bcea7b4706146d35fb6b04c5f0461f0bf7a31a8b  armebv7-eabihf--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--stable-2024.05-1.sha256
+sha256  c804e2e963fc21db22a9d4611089e3b207937c63f95a87de62c4e789eff79a56  armebv7-eabihf--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  d81849ea8fe7f8eb4b306712435491479f380ce60e203a83f651df51de7d52e2  armebv7-eabihf--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--stable-2024.05-1.sha256
+sha256  7ad4a602c2055bc3e9b39e64fbef3c14e61b10605d1039db95a64b7efd1f6e7a  armebv7-eabihf--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  fbab243d632e5dcaa56a9468e0a7f6afa52ebc15edb33f70a7060194cff66401  armv7m--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--stable-2024.05-1.sha256
+sha256  9891f5a43d1002a652353064e6543a1371c795938ecb595dd2f47a2d0ecc1e62  armv7m--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--glibc--bleeding-edge-2024.05-1.sha256
+sha256  88d1e108412116778e01bd72f90c6bb06c97e3a846dcc061644eb2a18499dc93  m68k-68xxx--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--glibc--stable-2024.05-1.sha256
+sha256  77f22dcafc78cde84e6441bd450aa3edb628b8f36ef6c1a160c942f38b38e5ea  m68k-68xxx--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--musl--bleeding-edge-2024.05-1.sha256
+sha256  f61aa3160dd75267a0b6018ca198f36ea99510f51d5a70eef8f2ac02d713abb3  m68k-68xxx--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--musl--stable-2024.05-1.sha256
+sha256  4456ec5b09fba57222ec8c3b9cf4d19a118a5dc876a58939e7fd77033af80652  m68k-68xxx--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  9d7b25be2a49f2c059ede1bc87487e0d23251b0f7376e3db9b2c61f0841e9014  m68k-68xxx--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--stable-2024.05-1.sha256
+sha256  92b41ec8da2da233c65ce96ad9db5e849d0d687378c799f774df6efe7c8f0e28  m68k-68xxx--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  6ef31adc06bb53b0b9252bbf7cdc93c22f0d6838dc9f51a4dc6e0fe2016eceff  m68k-coldfire--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--stable-2024.05-1.sha256
+sha256  370953f7c1e3bcf8b4e6849906991019f742fbde8532850aabd4eb3978e4a933  m68k-coldfire--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--bleeding-edge-2024.05-1.sha256
+sha256  f8fe7afda005b6f3fc3a602c6d8d1e1d524b2ebb5452a736351994723a9faf72  microblazebe--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--stable-2024.05-1.sha256
+sha256  7a24a6cd76175d77134a0d02852204c548c9d2722e08ecc02ccf49f4c477792d  microblazebe--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--bleeding-edge-2024.05-1.sha256
+sha256  5e51c0576acc7043d74644fed43b10e0aa75c4025741edcdd3e636d528270973  microblazebe--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--stable-2024.05-1.sha256
+sha256  f1e0d9406fdb211c9f44b71d4d3b4b68ac5dec4e379b24ff8a488f7945b99dfe  microblazebe--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  fb2a4dc7407699c36046f1fc0ff10833805dfb9c8aa4e2c30adcda45de7474f6  microblazebe--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--stable-2024.05-1.sha256
+sha256  17c6aa01b8421961b17eca4950cab8d292aa87d073f325525de1e77c5f7a5546  microblazebe--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--bleeding-edge-2024.05-1.sha256
+sha256  686905d647c24fb1f95dedb95c4a764d263a577cce673ea629d87c1a8986e9c8  microblazeel--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--stable-2024.05-1.sha256
+sha256  2468c298089873e4d86026b84ca68e46b4802413639a55f2db1c6aba181d66d6  microblazeel--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--bleeding-edge-2024.05-1.sha256
+sha256  ef1d35997bea684dfe5ee759b6668c309ee308956a3c82188402f5c42eba92db  microblazeel--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--stable-2024.05-1.sha256
+sha256  72611e45e0a77eac21b04bfae70395b8bcfaf2c969fe51638db48a94ca9030f4  microblazeel--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  bdf72671801ff48b232f12f13de5f3aaf3180a8e93c680ab59a1023aac3ddfd7  microblazeel--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--stable-2024.05-1.sha256
+sha256  49657597e55aa7d771cb4546c1d37d7ab9408b426d8c45f1bf61d90a53322a65  microblazeel--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--bleeding-edge-2024.05-1.sha256
+sha256  550803b9531b5a6c227329484c69e9d70ed08a29a456e9b941c5fe6b68f8258c  mips32--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--stable-2024.05-1.sha256
+sha256  677402719c545e49eb71c3d27a5f495af38f60463b40ed705e24e43a9834c137  mips32--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--bleeding-edge-2024.05-1.sha256
+sha256  28374e4431305b2d99bef9f706e1827390fc71848ce88d274a55c98674948bbf  mips32--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--stable-2024.05-1.sha256
+sha256  f553aec760bfc9f452f1ab071b25b84fd36ed56ab4c75149b351144561b4e0b5  mips32--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  2080fffa0f9b4e9e8e994e855fd3560f3cc1daedfa8382b57138dc3e09c3b69f  mips32--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--stable-2024.05-1.sha256
+sha256  52ed979092edad8100bc0275426e7eccadefa68b908ac35d18d29c385b30e12d  mips32--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--bleeding-edge-2024.05-1.sha256
+sha256  9dbfb7de343fef34e954989cd80ba8856baf771d8563c072cdba7b0a264a3389  mips32el--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--stable-2024.05-1.sha256
+sha256  d0139b6ade7f3b72a5f9c33814696af817661e826c9c501f6cefcab4ac684c8f  mips32el--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--bleeding-edge-2024.05-1.sha256
+sha256  bceda5815e975ff09530e5ba18d673ce4eccbfe42a2bb23c10dfd1a0ab54deb8  mips32el--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--stable-2024.05-1.sha256
+sha256  608b1b2434af563513df21ae0a6ab52af8a07b72a4bda760df946419cdd2645a  mips32el--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  578d18e1ef57b4c616803ce21e6cd0b1d3599aeb017830554c01bb3e11c79a68  mips32el--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--stable-2024.05-1.sha256
+sha256  ae4400a934074a3b1b39fb7ec79fb535da4e65b668f2330ca14576d072f6b13e  mips32el--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--bleeding-edge-2024.05-1.sha256
+sha256  daff6281bea63185811e96d91bf23a79fef4d30ac2da0e9a115f78e9989eefa5  mips32r5el--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--stable-2024.05-1.sha256
+sha256  afb30c73afccebb84b146efc6c654aabd8b92185a26fb1ba357ac0a2ce5f7957  mips32r5el--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--bleeding-edge-2024.05-1.sha256
+sha256  47f1291fa2a95e3ecc67fe4f410e4788bc65880bb1c5e465792c8376ee036448  mips32r5el--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--stable-2024.05-1.sha256
+sha256  6092b5d5e5f814e64038b205155016c3b1d10e3a3079478b4e1b0ab0b533c380  mips32r5el--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  98dcb8efe8f4897c6e7e6088238789c4f42593d4b08739cb7cb8dcd157765887  mips32r5el--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--stable-2024.05-1.sha256
+sha256  61b94dee2f60abd1e6698b283de6c5e2491cb5baf635d255addd5b4e7cc83afa  mips32r5el--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--bleeding-edge-2024.05-1.sha256
+sha256  0b374f870964ec8158beddf478beeec48a4ce09fa25a4a9c51c20a82839b3429  mips32r6el--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--stable-2024.05-1.sha256
+sha256  482cb60a8d0445b961fe1c5282826da9071f17ab37729b9c1c4ce7aabd014c7d  mips32r6el--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--bleeding-edge-2024.05-1.sha256
+sha256  19d6f280f4595a5fd0b43e16e9cd006163d94a96d4377399d93f5736716d79bc  mips32r6el--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--stable-2024.05-1.sha256
+sha256  fd5b48ebbdd220b517f179f609bbd98895c65f3d152eadacc4137e51a9bbcd6f  mips32r6el--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  adf63f7412d82e59de5bd19ea30068d205d7013c312af475d8b45656d20221ec  mips32r6el--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--stable-2024.05-1.sha256
+sha256  b43c05fa3e3157b5cf3e45799dfbba5e305be16b5b80da98972e89de5d737658  mips32r6el--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--bleeding-edge-2024.05-1.sha256
+sha256  d9d39286b9022dcd54dcabecfdc66e54cfc635a517128f005fd0ab1d2cfcc42d  mips64-n32--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--stable-2024.05-1.sha256
+sha256  411d6e399455c032759f71ec0aaba004da4157f462d1192c2accbbff8827fd13  mips64-n32--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--bleeding-edge-2024.05-1.sha256
+sha256  a07cacf4c88056ea612f64c50352e9fa2bb87766760fbae03577c50690f72d15  mips64-n32--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--stable-2024.05-1.sha256
+sha256  c058630e79b53333cca28ee1f34c3bb3b17bf03908a01f5c400a232d490d6a7a  mips64-n32--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  8f571a7f93092743d1d2a59c6e88ed9096c0c44327f0e9b0b8eda97a2aa51c85  mips64-n32--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--stable-2024.05-1.sha256
+sha256  ac0aef32929d8521e8f7201b56d3e006d684e71f59b29b1d40d853d31b07f7f2  mips64-n32--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--bleeding-edge-2024.05-1.sha256
+sha256  fb0a9e12ad0267691174a0c70fe604fe5527945d9997a7329b56e87241c49fcc  mips64el-n32--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--stable-2024.05-1.sha256
+sha256  bc3035338f5874d1d6824fd75a9231d2a126e113b8d4e27f94c57be6795b97e0  mips64el-n32--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--bleeding-edge-2024.05-1.sha256
+sha256  0525423b138f5e8e83babe591ffd8ea9aed6f34f20ee4af5e346479cad6f3dbf  mips64el-n32--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--stable-2024.05-1.sha256
+sha256  d620b75ec5a05c0d76b132200e69c75c308c582696d616036d7b29dae21b730f  mips64el-n32--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  f9afb690787968bb0365130fe5350ccdf2b2618e5ab658d696fab84bac4b09e4  mips64el-n32--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--stable-2024.05-1.sha256
+sha256  b1ce285a91107632ca5492f3e05d3488df314484f0ab8700f5fce5085fb271b4  mips64el-n32--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--bleeding-edge-2024.05-1.sha256
+sha256  fd65b96514a6adf429b31dada2eeaae79a1eb00a21340998a24abe8420fcf06a  mips64r6el-n32--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--stable-2024.05-1.sha256
+sha256  573721a0d53dacc34bf28f7f3e7e46fa79856e600cd515b270366ef7b900351e  mips64r6el-n32--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--bleeding-edge-2024.05-1.sha256
+sha256  e4353c990ea99fb5e39f9c64b6b92e614c0c6cd1760730334b6f2391aa10f3c6  mips64r6el-n32--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--stable-2024.05-1.sha256
+sha256  cce09fc456b592a993a7c8d182cdd1f04397a8160f176d9ac6799d8e2e09cef7  mips64r6el-n32--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  e12b6536fbacb624b0d938345fb29b202c8b174893d0d8fbefde46fbe727c729  mips64r6el-n32--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--stable-2024.05-1.sha256
+sha256  a0db853f4c40d120d22e6762ca4bff64e0c3e3db74ab59950967917aeb9bf330  mips64r6el-n32--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--bleeding-edge-2024.05-1.sha256
+sha256  5d034a538a8613ef324ae96f097c122ed99574ec8707e3274743e4d79efd374c  nios2--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--stable-2024.05-1.sha256
+sha256  db7a12e0b22037f3aad01cd126b5f1bfe7dc514e37f8c484eb587b861f20fbcd  nios2--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--bleeding-edge-2024.05-1.sha256
+sha256  0de17cd13642f71f112d086c1df4b34670440ceb459478a0f3d55007945633ca  openrisc--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--stable-2024.05-1.sha256
+sha256  a6e06a72285ca8dc9974f2060cb79aa85e0a1388553871a7c48785a077cbbe2f  openrisc--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2024.05-1.sha256
+sha256  5765a9fd73d4b2fa8bb4fd0d94b8ee8b88307684182ed62e55e0775ecdcbf09c  openrisc--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2024.05-1.sha256
+sha256  cdc2a9e3f69aa32df36580151d51d359e98147a604745f9927dc0314e5d7dd39  openrisc--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  e79e8c669368cc2dfbccb4f6080491b06e6d2d8851f73e0c849e066821ccbb06  openrisc--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2024.05-1.sha256
+sha256  51527b6a9e2063db756d836e250866783bcdfb40ab0f122d6d65c7401806cc44  openrisc--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2024.05-1.sha256
+sha256  58efcbb6133dcc070332b570ee491840c8cf386a75180e7bf56c403549d61699  powerpc-440fp--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2024.05-1.sha256
+sha256  ebf598b97cd9641bf5993aa3f78288272771ceee21053ced5ac53b1194ebedd3  powerpc-440fp--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2024.05-1.sha256
+sha256  6888a4800d59228fcbd2c843378357619b32b7b8265ebc3b57895e4e92ca1d70  powerpc-440fp--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--stable-2024.05-1.sha256
+sha256  54eb3b651655b426c81ea7453470510a62e97356418f4ca748a35a7c0d225b52  powerpc-440fp--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  f98de4013224c65ecf36b9733236a0beed62782e67e9c4a5259a188e73d8dead  powerpc-440fp--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--stable-2024.05-1.sha256
+sha256  9ecebc59591b81e2d5b502b34ab29fcefd21f4c3343e7695beb2ee894d34dc3d  powerpc-440fp--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--bleeding-edge-2024.05-1.sha256
+sha256  2802aea45aab7231fe9301639beab9f632751edaf26cb49ede65ab45603f9807  powerpc-e300c3--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--stable-2024.05-1.sha256
+sha256  6c975a7293fde77a52f348124049645ee2ceee19e75ab6e0b2364043090a2dff  powerpc-e300c3--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--bleeding-edge-2024.05-1.sha256
+sha256  6689847112fdf6b1be5cd17cf351a1e85ec42a1034993e203efbba2fec011ca1  powerpc-e300c3--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--stable-2024.05-1.sha256
+sha256  60fb6b828e58b5548514fd65c50457d190791191d3a7dcec1fbf77f0028bc240  powerpc-e300c3--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  40ed47b662384ddc480c1cdaf3615d44956f51fc9c389688fe6054f3ebcb1f11  powerpc-e300c3--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--stable-2024.05-1.sha256
+sha256  45c3324fa19f66adc294bfb99c1ea45b1a1adafc2c2431c3ba1f56cd5588952a  powerpc-e300c3--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--bleeding-edge-2024.05-1.sha256
+sha256  86dab3468dd71a4a6677bdf75442297ff9a9e8deb6cd472846f6c73f09eefa16  powerpc-e500mc--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--stable-2024.05-1.sha256
+sha256  365e30fda99630e5bcf04c4913f905640025b90cc9d1a4b17cccfc729827d335  powerpc-e500mc--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--bleeding-edge-2024.05-1.sha256
+sha256  4337db3eae7b0d10057e49f1c01f6ff539de1490d1dde3b1b692306b1cb41533  powerpc-e500mc--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--stable-2024.05-1.sha256
+sha256  3456bca0016d0c3855a644845aa627c25cd61ce763529a6bae712f8d6d9ddd8d  powerpc-e500mc--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  774b1fb431e10c840529521ff2d8a80efaaf04d3d65698e60b3484e3ead85730  powerpc-e500mc--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--stable-2024.05-1.sha256
+sha256  e016795898f13326ee551aa0a21ee77e58e2749065136e162cb88e64aa21ff07  powerpc-e500mc--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--bleeding-edge-2024.05-1.sha256
+sha256  1747006fec4219fa71ac77b98e6b404f9f030140a5f1295465e3ef4391d91687  powerpc64-e5500--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2024.05-1.sha256
+sha256  588b8d77fbc991c2f26b356349cfdcd08d89df0d88477c8adfa00c20d9031ad3  powerpc64-e5500--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--bleeding-edge-2024.05-1.sha256
+sha256  904583088a1690e8e05c469202abf6df8fa719c55871b4a5dd240ba284240155  powerpc64-e6500--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--stable-2024.05-1.sha256
+sha256  dbc8d38479d0b80675cb410f3285d1f77044222c15e8547db59a53b38436b5de  powerpc64-e6500--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--bleeding-edge-2024.05-1.sha256
+sha256  61cbeafa30ff0ecd225f933892a1696b4bcf83abed49fee7ff6e963fcdb9063f  powerpc64-e6500--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--stable-2024.05-1.sha256
+sha256  2ee53f50a60a36f99243d6d9a2c15a7ee1e15384d10773d7f98da941506f1fb5  powerpc64-e6500--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--bleeding-edge-2024.05-1.sha256
+sha256  729c9a302bba3d03e1c834bf3ae8e080c63456d9eba8ecac4c8f481efea8b77e  powerpc64-power8--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--stable-2024.05-1.sha256
+sha256  8dfeb7f1ec38e623c98c125539df6ccc7fad1c057b7ab36d65c2b6426c03b332  powerpc64-power8--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--bleeding-edge-2024.05-1.sha256
+sha256  9cc19d57a1374afbd41624aaa968f01914f884e2fb303f73f90d6e94c23ba451  powerpc64-power8--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--stable-2024.05-1.sha256
+sha256  d5f928ed99dd4f7dae5c4b3d47c0f463a990b7744866d89ba82e08a7ee9f9a8a  powerpc64-power8--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--bleeding-edge-2024.05-1.sha256
+sha256  3b7382684dd77118498b5e502fd90af616c3f6006843d27f538881505cb4a4d7  powerpc64le-power8--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--stable-2024.05-1.sha256
+sha256  8133b74614f880eb8b76730efee77b8fd281c982bfa2791b72c5f836a529530d  powerpc64le-power8--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--bleeding-edge-2024.05-1.sha256
+sha256  8506103888d0ee23a2e3126083e4f05ef18399c7adeb4e68838f864435394409  powerpc64le-power8--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--stable-2024.05-1.sha256
+sha256  62f056b5993f6d1bf2d94a61d01e1d4aaa58906107db3af11ac882c989ed7c1d  powerpc64le-power8--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--bleeding-edge-2024.05-1.sha256
+sha256  944fb2719d8657f1c5ee359046caca25a2080fe3535e99cc9dca78c20973c6c8  riscv32-ilp32d--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--stable-2024.05-1.sha256
+sha256  00112418e6d4b0733019a673b682a39f1ce6300b9448cd840f1194aa4b064192  riscv32-ilp32d--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--musl--bleeding-edge-2024.05-1.sha256
+sha256  deabdc08dc49bebe43e445c015b393cb38ecb806ad04d230da2a5c95ef9f2fda  riscv32-ilp32d--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--musl--stable-2024.05-1.sha256
+sha256  bbf26ec29272814da1eb5eb97339ed36d2dda66655c4c3612951e3cfb2b842ec  riscv32-ilp32d--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  7fb15b36e351bb1d749abec24eb62b106ada56b3483a910352e9a48e0e8138ee  riscv32-ilp32d--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--uclibc--stable-2024.05-1.sha256
+sha256  4c74eb1062805f1e28ccc2aee7c006e55823a780eae84c81d5b58433361b4f11  riscv32-ilp32d--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--bleeding-edge-2024.05-1.sha256
+sha256  a9e41a646d6757e47ab0539171bef54a6c0bf68f191210500875b386ea15444c  riscv64-lp64d--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--stable-2024.05-1.sha256
+sha256  78e16f3def8b2ff3da09c16155f993ac7e4dc1791d0904ada03fcb2e04910aab  riscv64-lp64d--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--bleeding-edge-2024.05-1.sha256
+sha256  0acc030f695f48e29f03f25294ee5b6ebacc8ab93de5ed0c6988e9699c417510  riscv64-lp64d--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--stable-2024.05-1.sha256
+sha256  481c9353467f42d02edf9080954b3c14a75ff7c19ed9e8fbf9cfa67d028587d3  riscv64-lp64d--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  17d5745a3d063ebd94eb7172c2b10d0d157869e3fe46a8d27d0a4ec2da33b071  riscv64-lp64d--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--stable-2024.05-1.sha256
+sha256  1c336b0cc87a1c01a434b3666d4867f033c9f7844b0eb84887d32f309ba9ce6f  riscv64-lp64d--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--bleeding-edge-2024.05-1.sha256
+sha256  3f388a1549601fde95a084a439d8f514694d9819c2a75eaa678ac263b6ea5ccd  s390x-z13--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--stable-2024.05-1.sha256
+sha256  b37ed02693a370f28434c34655c64bcb96dc0d428a92ddbc99feb5608bcf64a1  s390x-z13--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--musl--bleeding-edge-2024.05-1.sha256
+sha256  9bbb6fc607a76c32964208ba2e2e0d09af4cd7f1d0b9511e524363e86147992d  s390x-z13--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--musl--stable-2024.05-1.sha256
+sha256  9dc280763cb2b18ea9417ffaf7fee2e24c9833033e730108138179a9887ef299  s390x-z13--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--bleeding-edge-2024.05-1.sha256
+sha256  f4e6c46deeee5301ea4782b5eb6705da5261b16afe40fcc342a1a7d2430e9061  sh-sh4--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--stable-2024.05-1.sha256
+sha256  6290f90417b194c467cf432d9c012d4321827160407c5b4664a443910a54c7d8  sh-sh4--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--bleeding-edge-2024.05-1.sha256
+sha256  3d6b8fb7c21d83528617eaaec7e078e0eecbfb0c939ea7be5794c287735d644d  sh-sh4--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--stable-2024.05-1.sha256
+sha256  acec95cc0b26cc82de58bd5aee7472511563cb0145ed2f74a72344070216cc39  sh-sh4--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  6b7a3e1048c7679c8ae9be113cd51a8be0b2816502f00bfd006a035753061700  sh-sh4--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--stable-2024.05-1.sha256
+sha256  3433820a3ca8296d5166fbe0d8bcc722536fa9d71b3631667bb5039a61fbc039  sh-sh4--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--bleeding-edge-2024.05-1.sha256
+sha256  cb4d6abb85e3e86d6d0b285d2b4d7ad6ece6483835f8950742e17ff5a2967ee3  sh-sh4aeb--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--stable-2024.05-1.sha256
+sha256  07c14c3c9bdee411bd1d5c04cd2a1ff50dd98231f1fb648f5746b0d2fab81767  sh-sh4aeb--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--bleeding-edge-2024.05-1.sha256
+sha256  1c10d7c73bc61076007bbab909400dfea9cb7c6f9c356c03ef2bbd996b8ba003  sh-sh4aeb--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--stable-2024.05-1.sha256
+sha256  ebcbbff459bdc76f9ee3627b8f8688d922192eafaf1890911d2c7454a4973aec  sh-sh4aeb--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--bleeding-edge-2024.05-1.sha256
+sha256  5bcbc1fb43b8f0240b2f2503c8dfa9a2efa38ea23d2a2f44df4acc5a1288ef9b  sparc64--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--stable-2024.05-1.sha256
+sha256  29d1e6c0d45ab95edf33ff2ee77b27869669f476a23d76fef96f56f8d3cc6234  sparc64--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  c74944737263acbabdbf7b646aa41dd6c96336d2dbbefdeebbba9866e1374a0a  sparcv8--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--stable-2024.05-1.sha256
+sha256  8ec2c84b84a13b854a13802537f0b04848056ebc65f6212202f6d8c8a78d4bc3  sparcv8--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--bleeding-edge-2024.05-1.sha256
+sha256  bc7ce1172602a377b5444d09b349e7d9fa2662b7ca59a95b884a7ea18c4de7c7  x86-64--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--stable-2024.05-1.sha256
+sha256  932823ca9a3e067e7e2a29810a666d20c9cc5bb550de947f6879e38ace1aa955  x86-64--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--bleeding-edge-2024.05-1.sha256
+sha256  2721cb2421ba1f9740a739247da9c12fbebbffeb131998719bc810d7319eb9b9  x86-64--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--stable-2024.05-1.sha256
+sha256  f3cf417d28e7df95bdab632ff837de66ac03145bd0e1dd78cc89aadfa6e31526  x86-64--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  80830735a18239dd644b6aefbecd24437cc593402120b6eba0ff8625306fff3c  x86-64--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--stable-2024.05-1.sha256
+sha256  da3c9a340e5d4c5037f2bc3114d262c5a27e8224df5c9ca6dbf5c5b4740445b4  x86-64--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--bleeding-edge-2024.05-1.sha256
+sha256  809974fbfa1231e87ce40a81c6b2f78dad0cf4b0a61a6e9480a1c453f3983471  x86-64-v2--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--stable-2024.05-1.sha256
+sha256  4db498b45f0a0d85d5810ffe2d9558225f73159d261bfc7d8c466893d2f1ca08  x86-64-v2--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--bleeding-edge-2024.05-1.sha256
+sha256  93e59f4ec983bf600337fc624e292ed86942d6c8f59af34ed8300a45474665f8  x86-64-v2--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--stable-2024.05-1.sha256
+sha256  f3c84a280e6fce53bdc95de1ce697fb354c85a3739c5102198e0930961a5bcc4  x86-64-v2--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  36b00ba714a82b0840165ce5d77931660d7daf571290638504791a71022f3fe5  x86-64-v2--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--stable-2024.05-1.sha256
+sha256  ca1dda638c053ca8a0992f71d02f4ccb54513d523bc3b09ded0017368ac258bb  x86-64-v2--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--bleeding-edge-2024.05-1.sha256
+sha256  18dcd9bebbe8369ffa577dfeae3c3d6622a8b7c022a6f41ce70048c7d41ce518  x86-64-v3--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--stable-2024.05-1.sha256
+sha256  21e08661a702695bfb1fbcbdb4c671e4c8146db2daf92e23e38e501f227584af  x86-64-v3--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--bleeding-edge-2024.05-1.sha256
+sha256  d2470a0001c7a00906752e8523a940a696a1218da7e9dd7b62f8fca3f58fcdda  x86-64-v3--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--stable-2024.05-1.sha256
+sha256  e7f7da14ff1378bb7ec2a4014fa4f4fdc07b089e248e50f60ce930fd9b9fbc0b  x86-64-v3--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  565883663c3e1901c7f8059dc8b55219940ffb464dc815b35801a81597a9b1de  x86-64-v3--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--stable-2024.05-1.sha256
+sha256  6bd8b7ad75da84eb0f4f9da277584e79906c0a24dfa30e908cc20847f37a23fd  x86-64-v3--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--bleeding-edge-2024.05-1.sha256
+sha256  5de99096e454f9fbbefd5e358ee926c1999912c7f154abb0dca081fc38474554  x86-64-v4--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--stable-2024.05-1.sha256
+sha256  b546f055275d333c689dd9e0c05ae63b5b5419b5e79a5784dea898cae8d2e093  x86-64-v4--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--bleeding-edge-2024.05-1.sha256
+sha256  f58bea6df4ab87cad5dcfe95f64a57365bd44a7624f19fb463762de1b41bf452  x86-64-v4--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--stable-2024.05-1.sha256
+sha256  fab47f56200fa54ce76c854f7a048fe61a2b346b87884199bb7e9ac527a86de1  x86-64-v4--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  2806f6e9a586d17b0009cf6b8b4ed351b3a6cefea552890e41ab9b56917c2470  x86-64-v4--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--stable-2024.05-1.sha256
+sha256  38ca4406dc1706153850ce331b82eda97e2badbd09ba033981da1bf66acaee17  x86-64-v4--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2024.05-1.sha256
+sha256  3076f0bd485696a1b8f29683d9330dcc79526cc9328064911548dd66e7bbe84f  x86-64-core-i7--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2024.05-1.sha256
+sha256  c80884040a81a33fdd6a4d3f54d63650dbeea280ee6324664faba094ad93bd74  x86-64-core-i7--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--bleeding-edge-2024.05-1.sha256
+sha256  0a8a2e6f6dfe8207bef3ce7c0445e4b72f57390ca590f6d50f61f03eeb8e2e0e  x86-64-core-i7--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--stable-2024.05-1.sha256
+sha256  da77433e841011e0d8e3c360851e1e4b88996888a749b41067bfd7296e47f1f3  x86-64-core-i7--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  eddf678bfb23dbc2d07157c3371f8c45e8e9f8438ad64b615fa35e94d2a840cc  x86-64-core-i7--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--stable-2024.05-1.sha256
+sha256  4c4a8ec05711f2e902b0cea50b29a6f536a0f184651ebe03fadcd8aa5febe11c  x86-64-core-i7--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2024.05-1.sha256
+sha256  999cc27420b4305e200017d0780759206656cf0d39f20fe4502e4e547c9a432b  x86-core2--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--stable-2024.05-1.sha256
+sha256  8bbff9a34cb5807bd81d46489c115fc4073726db2afab079ffdb7e4b44994b9e  x86-core2--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--bleeding-edge-2024.05-1.sha256
+sha256  583b11a382b536610c73583121500ee8e88ec3942f99090051a272ca0891dfac  x86-core2--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--stable-2024.05-1.sha256
+sha256  c28cb368d67172a6e2d404250cbd5b1be70c1ae4f77e4514a46ac82bf53c030c  x86-core2--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  d73f4119c0afc073fd1273cf1cc787b531b64665fb1dd1a2304de8c0fe4445ac  x86-core2--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--stable-2024.05-1.sha256
+sha256  69fb29808de400fe59dc8c47b60c0e0cb5b65f48cbef09432edfc8cecb25a6b3  x86-core2--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2024.05-1.sha256
+sha256  81115a9b098b86c5ff37f3adac265d55c572fef1936378991995c285d9a65847  x86-i686--glibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--stable-2024.05-1.sha256
+sha256  023e4f03cd212b5545c4c184238693b61b40fa36d257b84546100a92ea2c1d8b  x86-i686--glibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--bleeding-edge-2024.05-1.sha256
+sha256  1fadb2e0195eec06efef94f16339ad1a950789dde618bd17f22fbc7346893584  x86-i686--musl--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--stable-2024.05-1.sha256
+sha256  f16c0f2cff527bdf9753135d5e22dfe81390f3646c34d05d951d23f76fbe06e9  x86-i686--musl--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  b958ab84b59f2993afa5b2aba4b24b42c95826ae9ea01f04cf6b2dfbbb2e8a6d  x86-i686--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--stable-2024.05-1.sha256
+sha256  e240d983717e03a8ea7c5ffba71077b555f05f40694f177e23756d2a47656599  x86-i686--uclibc--stable-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--bleeding-edge-2024.05-1.sha256
+sha256  eec483e97164d82939034c28bf3443e1d3d92f1674b9060d4086b773ac4e6ea0  xtensa-lx60--uclibc--bleeding-edge-2024.05-1.tar.xz
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--stable-2024.05-1.sha256
+sha256  99f275b884895049a2d47812a94953199368da99f4bc2bd39869711006610c0e  xtensa-lx60--uclibc--stable-2024.05-1.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
index 07ae830410..18639db1b3 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
@@ -7,1292 +7,1322 @@
 # This file was auto-generated by support/scripts/gen-bootlin-toolchains
 # Do not edit
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-750d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-750d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-750d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-750d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7m--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7m--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7m--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7m--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-coldfire--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-coldfire--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-coldfire--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-coldfire--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = nios2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = nios2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = nios2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = nios2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e5500--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e5500--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e5500--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e5500--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparc64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparc64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparc64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparc64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-2
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparcv8--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparcv8--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparcv8--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparcv8--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = xtensa-lx60--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = xtensa-lx60--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.02-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = xtensa-lx60--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = xtensa-lx60--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs
 endif
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
