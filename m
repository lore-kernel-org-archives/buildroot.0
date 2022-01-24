Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69656C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 23:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 109F24171E;
	Mon, 24 Jan 2022 23:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ip0o2b4uJjc1; Mon, 24 Jan 2022 23:02:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 482DA4173F;
	Mon, 24 Jan 2022 23:02:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAA391BF3EC
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97EC360B06
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DW-D4ssA7noW for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 23:01:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FB3C60B03
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 23:01:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2A6B5240006;
 Mon, 24 Jan 2022 23:01:21 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Tue, 25 Jan 2022 00:01:01 +0100
Message-Id: <20220124230116.203218-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
References: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 03/16]
 toolchain/toolchain-external/toolchain-external-bootlin: update with new
 x86-64 toolchains
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../tests/toolchain/test_external_bootlin.py  | 225 +++++++++
 .../Config.in.options                         | 446 ++++++++++++++++++
 .../toolchain-external-bootlin.hash           |  30 ++
 .../toolchain-external-bootlin.mk             |  90 ++++
 4 files changed, 791 insertions(+)

diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
index 5e908b957e..cf6174303e 100644
--- a/support/testing/tests/toolchain/test_external_bootlin.py
+++ b/support/testing/tests/toolchain/test_external_bootlin.py
@@ -2362,6 +2362,231 @@ class TestExternalToolchainBootlinSparcv8UclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinX8664GlibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinX8664GlibcStable(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinX8664MuslBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinX8664MuslStable(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinX8664UclibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinX8664UclibcStable(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinX8664v2GlibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v2=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinX8664v2MuslBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v2=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinX8664v2UclibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v2=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinX8664v3GlibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v3=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinX8664v3MuslBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v3=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinX8664v3UclibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v3=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinX8664v4GlibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v4=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinX8664v4MuslBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v4=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinX8664v4UclibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v4=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinX8664corei7GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 55b6d4c786..42cad21d71 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -37,6 +37,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_sh && BR2_sh4aeb
 	default y if BR2_sparc64 && BR2_sparc_v9
 	default y if BR2_sparc && BR2_sparc_v8
+	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2
+	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3 && BR2_X86_CPU_HAS_SSE4 && BR2_X86_CPU_HAS_SSE42
+	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3 && BR2_X86_CPU_HAS_SSE4 && BR2_X86_CPU_HAS_SSE42 && BR2_X86_CPU_HAS_AVX && BR2_X86_CPU_HAS_AVX2
+	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3 && BR2_X86_CPU_HAS_SSE4 && BR2_X86_CPU_HAS_SSE42 && BR2_X86_CPU_HAS_AVX && BR2_X86_CPU_HAS_AVX2
 	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3 && BR2_X86_CPU_HAS_SSE4 && BR2_X86_CPU_HAS_SSE42
 	default y if BR2_i386 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3
 	default y if BR2_i386 && !BR2_x86_i486 && !BR2_x86_i586 && !BR2_x86_x1000
@@ -3791,6 +3795,448 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE
 
 	  https://toolchains.bootlin.com/
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE
+	bool "x86-64 glibc bleeding-edge 2021.11-5"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Bootlin toolchain for the x86-64 architecture, using the
+	  glibc C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE
+	bool "x86-64 glibc stable 2021.11-5"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Bootlin toolchain for the x86-64 architecture, using the
+	  glibc C library. This is a stable version, which means it
+	  is using stable and proven versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE
+	bool "x86-64 musl bleeding-edge 2021.11-5"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the x86-64 architecture, using the
+	  musl C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE
+	bool "x86-64 musl stable 2021.11-5"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the x86-64 architecture, using the
+	  musl C library. This is a stable version, which means it is
+	  using stable and proven versions of gcc, gdb and binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE
+	bool "x86-64 uclibc bleeding-edge 2021.11-5"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	help
+	  Bootlin toolchain for the x86-64 architecture, using the
+	  uclibc C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE
+	bool "x86-64 uclibc stable 2021.11-5"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	help
+	  Bootlin toolchain for the x86-64 architecture, using the
+	  uclibc C library. This is a stable version, which means it
+	  is using stable and proven versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
+	bool "x86-64-v2 glibc bleeding-edge 2021.11-5"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Bootlin toolchain for the x86-64-v2 architecture, using the
+	  glibc C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
+	bool "x86-64-v2 musl bleeding-edge 2021.11-5"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the x86-64-v2 architecture, using the
+	  musl C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
+	bool "x86-64-v2 uclibc bleeding-edge 2021.11-5"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	help
+	  Bootlin toolchain for the x86-64-v2 architecture, using the
+	  uclibc C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
+	bool "x86-64-v3 glibc bleeding-edge 2021.11-5"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	depends on BR2_X86_CPU_HAS_AVX
+	depends on BR2_X86_CPU_HAS_AVX2
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Bootlin toolchain for the x86-64-v3 architecture, using the
+	  glibc C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
+	bool "x86-64-v3 musl bleeding-edge 2021.11-5"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	depends on BR2_X86_CPU_HAS_AVX
+	depends on BR2_X86_CPU_HAS_AVX2
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the x86-64-v3 architecture, using the
+	  musl C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
+	bool "x86-64-v3 uclibc bleeding-edge 2021.11-5"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	depends on BR2_X86_CPU_HAS_AVX
+	depends on BR2_X86_CPU_HAS_AVX2
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	help
+	  Bootlin toolchain for the x86-64-v3 architecture, using the
+	  uclibc C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
+	bool "x86-64-v4 glibc bleeding-edge 2021.11-5"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	depends on BR2_X86_CPU_HAS_AVX
+	depends on BR2_X86_CPU_HAS_AVX2
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Bootlin toolchain for the x86-64-v4 architecture, using the
+	  glibc C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
+	bool "x86-64-v4 musl bleeding-edge 2021.11-5"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	depends on BR2_X86_CPU_HAS_AVX
+	depends on BR2_X86_CPU_HAS_AVX2
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the x86-64-v4 architecture, using the
+	  musl C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
+	bool "x86-64-v4 uclibc bleeding-edge 2021.11-5"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	depends on BR2_X86_CPU_HAS_AVX
+	depends on BR2_X86_CPU_HAS_AVX2
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	help
+	  Bootlin toolchain for the x86-64-v4 architecture, using the
+	  uclibc C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
 	bool "x86-64-core-i7 glibc bleeding-edge 2021.11-1"
 	depends on BR2_x86_64
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
index 8819782ac5..6542694033 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
@@ -306,6 +306,36 @@ sha256  0ef307f6c91733ee82ce65801768013f7e6220b605f4e152158cb55b4f983582  sparc6
 sha256  3c85420becb7caa84a9a229483f3f2d7158eb66817acdfa5d5700c3a05436cba  sparcv8--uclibc--bleeding-edge-2021.11-3.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--stable-2021.11-1.sha256
 sha256  f6d35e33338b26e71403b4c6d3944ab561f2a6e9b801ab33fbb401b4722044dd  sparcv8--uclibc--stable-2021.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--bleeding-edge-2021.11-5.sha256
+sha256  024fd8edc91b9bfd643f8cf94e3f3ff2a6457aea654d10ef3516db8c3d94d5f5  x86-64--glibc--bleeding-edge-2021.11-5.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--stable-2021.11-5.sha256
+sha256  6fe812add925493ea0841365f1fb7ca17fd9224bab61a731063f7f12f3a621b0  x86-64--glibc--stable-2021.11-5.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--bleeding-edge-2021.11-5.sha256
+sha256  468e6b73146595923fe87980a30adb54cd78f4c1e2f228e1a2c9bb705ea4243d  x86-64--musl--bleeding-edge-2021.11-5.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--stable-2021.11-5.sha256
+sha256  2943617f6537ca195a66fb9db4a801a5dd1c108741c400d530d558d06908dd75  x86-64--musl--stable-2021.11-5.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--bleeding-edge-2021.11-5.sha256
+sha256  4aa8b8e2806d6fc87ba64ccec0a59b8a2fb5d157cda006d893e3f2264b7f0f10  x86-64--uclibc--bleeding-edge-2021.11-5.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--stable-2021.11-5.sha256
+sha256  e68fd1b23f4a5c5132f2122e4012c17eb24e5179b2ff45bb793a27ac30dd454f  x86-64--uclibc--stable-2021.11-5.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--bleeding-edge-2021.11-5.sha256
+sha256  af20cf98ce937f298e0958e16793bb4c7b08236bc69ab11574a4266cccc3823d  x86-64-v2--glibc--bleeding-edge-2021.11-5.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--bleeding-edge-2021.11-5.sha256
+sha256  17add21a0337d2f7d0d79d1f21db88098c3474920d71f902be46e8995eb86d35  x86-64-v2--musl--bleeding-edge-2021.11-5.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--bleeding-edge-2021.11-5.sha256
+sha256  b3ef49012af9fc9c2c8a44b0a20722be69b518cec5db06e48480291fc28aefe0  x86-64-v2--uclibc--bleeding-edge-2021.11-5.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--bleeding-edge-2021.11-5.sha256
+sha256  244d4afab02b9c54c76385657d26798515331d7d4fa90928315366f31b9cc39e  x86-64-v3--glibc--bleeding-edge-2021.11-5.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--bleeding-edge-2021.11-5.sha256
+sha256  551cff1b6425e2a6ced7b7ad032fba49b43ed095faae38d1842260ac0b5d6dbf  x86-64-v3--musl--bleeding-edge-2021.11-5.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--bleeding-edge-2021.11-5.sha256
+sha256  30188f50adef711b55ac1d5be7218e0d6ee4200ddb8660e4d4971a9cefe22f91  x86-64-v3--uclibc--bleeding-edge-2021.11-5.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--bleeding-edge-2021.11-5.sha256
+sha256  0cd2de7c4103aa8cf47b72dc71146eb3bf7742a18d56c93128340ab3f4175804  x86-64-v4--glibc--bleeding-edge-2021.11-5.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--bleeding-edge-2021.11-5.sha256
+sha256  e159da16459e0f0d06a9a7467d5121202ab95e2fa6bf8abffdc0008c72fe9b07  x86-64-v4--musl--bleeding-edge-2021.11-5.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--bleeding-edge-2021.11-5.sha256
+sha256  984f011d170d3e46322ae4a110c86ebf995598d877f410201b3fb3d86e25dac2  x86-64-v4--uclibc--bleeding-edge-2021.11-5.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2021.11-1.sha256
 sha256  a3dbfcd3347a72ca344ae77882f929615776ea9b1b058eeea0a0915e7db89b69  x86-64-core-i7--glibc--bleeding-edge-2021.11-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2021.11-1.sha256
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
index 64ae44f364..fb19ef2909 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
@@ -924,6 +924,96 @@ TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparcv8--uclibc--stable-$(TOOLCHAIN_EXTERNAL
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE),y)
 TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

