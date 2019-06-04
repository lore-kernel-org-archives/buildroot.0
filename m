From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Tue,  4 Jun 2019 08:39:27 +0300
Subject: [Buildroot] [PATCH] ARC: Add support for ARC HS48 v3.1 processor
Message-ID: <20190604053927.29319-1-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces recently released significant
update to ARC HS family: ARC HS48.

One of the major ARC HS48 features is dual-issue pipeline
which requires a little bit modified instruction scheduling compared
to single-issue cores (HS38), thus new "-mcpu/--with-cpu=hs4x".

Also to address some peculiarities of early designs based on
HS48 we introduced yet another "-mcpu/--with-cpu=hs4x_rel1" which
we're going to use as well on some of our development boards.

Note, there is a prerequisite patch:
	https://patchwork.ozlabs.org/patch/995220/

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
---
 arch/Config.in.arc | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 69bb1504a9..8e9cd96dd2 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -30,12 +30,21 @@ config BR2_archs38_full
 
 	  It corresponds to "hs38_slc_full" ARC HS template in ARChitect.
 
+
+config BR2_archs4x_rel31
+        bool "ARC HS48 rel 31"
+        help
+	   Latest release of HS48 processor
+           - Dual- and quad multiply and MC oprations
+           - Double-precision FPU
+
+
 endchoice
 
 # Choice of atomic instructions presence
 config BR2_ARC_ATOMIC_EXT
 	bool "Atomic extension (LLOCK/SCOND instructions)"
-	default y if BR2_arc770d || BR2_archs38 || BR2_archs38_full
+	default y if BR2_arc770d || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
 
 config BR2_ARCH
 	default "arc"	if BR2_arcle
@@ -54,10 +63,11 @@ config BR2_GCC_TARGET_CPU
 	default "arc700" if BR2_arc770d
 	default "archs"	 if BR2_archs38
 	default "hs38_linux"	 if BR2_archs38_full
+	default "hs4x_rel31" if BR2_archs4x_rel31
 
 config BR2_READELF_ARCH_NAME
 	default "ARCompact"	if BR2_arc750d || BR2_arc770d
-	default "ARCv2"		if BR2_archs38 || BR2_archs38_full
+	default "ARCv2"		if BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
 
 choice
 	prompt "MMU Page Size"
@@ -77,7 +87,7 @@ choice
 
 config BR2_ARC_PAGE_SIZE_4K
 	bool "4KB"
-	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_full
+	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
 
 config BR2_ARC_PAGE_SIZE_8K
 	bool "8KB"
@@ -87,7 +97,7 @@ config BR2_ARC_PAGE_SIZE_8K
 
 config BR2_ARC_PAGE_SIZE_16K
 	bool "16KB"
-	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_full
+	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
 
 endchoice
 
-- 
2.16.2
