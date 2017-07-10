From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 10 Jul 2017 16:36:50 +0300
Subject: [Buildroot] [PATCH] ARC: Add support for ARC HS38 with Hardware
	Floating Point
Message-ID: <20170710133650.8692-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 arch/Config.in.arc       | 10 +++++++---
 package/uclibc/Config.in |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 7d341f3136..d0e2286557 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -14,12 +14,15 @@ config BR2_arc770d
 config BR2_archs38
 	bool "ARC HS38"
 
+config BR2_archs38_hf
+	bool "ARC HS38 with hard floating-point"
+
 endchoice
 
 # Choice of atomic instructions presence
 config BR2_ARC_ATOMIC_EXT
 	bool "Atomic extension (LLOCK/SCOND instructions)"
-	default y if BR2_arc770d || BR2_archs38
+	default y if BR2_arc770d || BR2_archs38 || BR2_archs38_hf
 
 config BR2_ARCH
 	default "arc"	if BR2_arcle
@@ -37,6 +40,7 @@ config BR2_GCC_TARGET_CPU
 	default "arc700" if BR2_arc750d
 	default "arc700" if BR2_arc770d
 	default "archs"	 if BR2_archs38
+	default "hs38_linux"	 if BR2_archs38_hf
 
 choice
 	prompt "MMU Page Size"
@@ -56,7 +60,7 @@ choice
 
 config BR2_ARC_PAGE_SIZE_4K
 	bool "4KB"
-	depends on BR2_arc770d || BR2_archs38
+	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_hf
 
 config BR2_ARC_PAGE_SIZE_8K
 	bool "8KB"
@@ -66,7 +70,7 @@ config BR2_ARC_PAGE_SIZE_8K
 
 config BR2_ARC_PAGE_SIZE_16K
 	bool "16KB"
-	depends on BR2_arc770d || BR2_archs38
+	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_hf
 
 endchoice
 
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index fdf007e601..646ae3e0db 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -134,6 +134,7 @@ config BR2_UCLIBC_ARC_TYPE
 	default "ARC_CPU_700"	if BR2_arc750d
 	default "ARC_CPU_700"	if BR2_arc770d
 	default "ARC_CPU_HS"	if BR2_archs38
+	default "ARC_CPU_HS"	if BR2_archs38_hf
 
 config BR2_UCLIBC_MIPS_ABI
 	string
-- 
2.11.0
