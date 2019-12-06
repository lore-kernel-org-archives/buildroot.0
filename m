From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Fri,  6 Dec 2019 11:39:24 -0800
Subject: [Buildroot] [PATCH 3/3] toolchain/ARC: Enable ability to build with
 upstream gcc/binutils
In-Reply-To: <20191206193924.18777-1-vgupta@synopsys.com>
References: <20191206193924.18777-1-vgupta@synopsys.com>
Message-ID: <20191206193924.18777-4-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While ARC upstream gcc/binutils work, they are still trailing behind
the more up to date code at github. To help expedite this gap, we want
to test the upstreeam versiosn more often, hence this patch. It allows
ARC tools to be built of upstream gcc/binutils.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/Config.in.arc              | 4 ++++
 package/binutils/Config.in.host | 6 +++---
 package/binutils/binutils.mk    | 2 +-
 package/gcc/Config.in.host      | 4 ++--
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index fdfafda31c72..c389ba8b42c9 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -59,6 +59,10 @@ config BR2_arc
 	bool
 	default y if BR2_arcle || BR2_arceb
 
+config BR2_arc_gh
+	bool "ARC github tools"
+	default y if BR2_arc
+
 config BR2_ENDIAN
 	default "LITTLE" if BR2_arcle
 	default "BIG"	 if BR2_arceb
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 514f620086eb..78785878cecc 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,8 +7,8 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_32_X if !BR2_arc && !BR2_csky
-	default BR2_BINUTILS_VERSION_ARC if BR2_arc
+	default BR2_BINUTILS_VERSION_2_32_X if !BR2_arc_gh && !BR2_csky
+	default BR2_BINUTILS_VERSION_ARC if BR2_arc_gh
 	default BR2_BINUTILS_VERSION_CSKY if BR2_csky
 	help
 	  Select the version of binutils you wish to use.
@@ -27,7 +27,7 @@ config BR2_BINUTILS_VERSION_2_33_X
 
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.31)"
-	depends on BR2_arc
+	depends on BR2_arc_gh
 
 config BR2_BINUTILS_VERSION_CSKY
 	bool "binutils csky"
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index ecc78b81e59f..63567db069ab 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 BINUTILS_VERSION = 2.32
 endif
 
-ifeq ($(BR2_arc),y)
+ifeq ($(BR2_arc_gh),y)
 BINUTILS_VERSION = arc-2019.09-rc1
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 92af40b19fc3..d9f4c6cae14b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -2,7 +2,7 @@ comment "GCC Options"
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_ARC if BR2_arc
+	default BR2_GCC_VERSION_ARC if BR2_arc_gh
 	default BR2_GCC_VERSION_CSKY if BR2_csky
 	default BR2_GCC_VERSION_OR1K if BR2_or1k
 	default BR2_GCC_VERSION_8_X
@@ -12,7 +12,7 @@ choice
 config BR2_GCC_VERSION_ARC
 	bool "gcc arc (9.x)"
 	# Only supported architecture
-	depends on BR2_arc
+	depends on BR2_arc_gh
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
 config BR2_GCC_VERSION_CSKY
-- 
2.20.1
