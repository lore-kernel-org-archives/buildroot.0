From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 Apr 2019 14:40:11 +0200
Subject: [Buildroot] [PATCH 4/4] package/jemalloc: bump to version 5.2.0
In-Reply-To: <20190419124011.16721-1-fontaine.fabrice@gmail.com>
References: <20190419124011.16721-1-fontaine.fabrice@gmail.com>
Message-ID: <20190419124011.16721-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add hash for license file
- Support for m68k and nios2 architectures have been added with
  version 5.1.0
- Static library support has been added in version 5.2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jemalloc/Config.in     | 10 ++++++----
 package/jemalloc/jemalloc.hash |  3 ++-
 package/jemalloc/jemalloc.mk   |  2 +-
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
index a320ae721d..2bf762903d 100644
--- a/package/jemalloc/Config.in
+++ b/package/jemalloc/Config.in
@@ -1,19 +1,21 @@
 config BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
 	bool
+	#?see include/jemalloc/internal/quantum.h
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_m68k
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_nios2
 	default y if BR2_or1k
-	default y if BR2_sparc64
 	default y if BR2_powerpc
 	default y if BR2_riscv
 	default y if BR2_sh4 || BR2sh4eb || BR2_sh4a || BR2_sh4aeb
+	default y if BR2_sparc64
 
 config BR2_PACKAGE_JEMALLOC
 	bool "jemalloc"
 	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  This library providing a malloc(3) implementation that
@@ -22,6 +24,6 @@ config BR2_PACKAGE_JEMALLOC
 
 	  http://jemalloc.net/
 
-comment "jemalloc needs a toolchain w/ dynamic library, threads"
+comment "jemalloc needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/jemalloc/jemalloc.hash b/package/jemalloc/jemalloc.hash
index 50ac682839..874c7c858d 100644
--- a/package/jemalloc/jemalloc.hash
+++ b/package/jemalloc/jemalloc.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 4814781d395b0ef093b21a08e8e6e0bd3dab8762f9935bbfb71679b0dea7c3e9  jemalloc-5.0.1.tar.bz2
+sha256 74be9f44a60d2a99398e706baa921e4efde82bf8fd16e5c0643c375c5851e3b4  jemalloc-5.2.0.tar.bz2
+sha256 94aa2caa98c25d942f58b956c71dba6a99ff98fc3a31cbc669fe2a4cd0268b53  COPYING
diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index 1b193189b4..1273f8a72a 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JEMALLOC_VERSION = 5.0.1
+JEMALLOC_VERSION = 5.2.0
 JEMALLOC_SOURCE = jemalloc-$(JEMALLOC_VERSION).tar.bz2
 JEMALLOC_SITE = https://github.com/jemalloc/jemalloc/releases/download/$(JEMALLOC_VERSION)
 JEMALLOC_LICENSE = BSD-2-Clause
-- 
2.20.1
