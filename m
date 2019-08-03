From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 17:30:52 +0200
Subject: [Buildroot] [git commit] ARC: Add support for ARC HS48 v3.1
 processor
Message-ID: <20190803152806.11D7F8D64C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81fed0c7db40436254bd7f21d8e96347e1bf43a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch introduces a recently released significant update to ARC HS
family: ARC HS48.

One of the major ARC HS48 features is dual-issue pipeline which requires a
little bit modified instruction scheduling compared to single-issue cores
(HS38), thus new "-mcpu/--with-cpu=hs4x".

Also to address some peculiarities of early designs based on HS48 we
introduced yet another "-mcpu/--with-cpu=hs4x_rel31" which we're going to use
as well on some of our development boards.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
[Peter: fixup check-package warnings]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.arc | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index f7818e7ebb..c65bb01f1f 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -31,12 +31,19 @@ config BR2_archs38_full
 	  It corresponds to "hs38_slc_full" ARC HS template in
 	  ARChitect.
 
+config BR2_archs4x_rel31
+	bool "ARC HS48 rel 31"
+	help
+	   Latest release of HS48 processor
+	   - Dual- and quad multiply and MC oprations
+	   - Double-precision FPU
+
 endchoice
 
 # Choice of atomic instructions presence
 config BR2_ARC_ATOMIC_EXT
 	bool "Atomic extension (LLOCK/SCOND instructions)"
-	default y if BR2_arc770d || BR2_archs38 || BR2_archs38_full
+	default y if BR2_arc770d || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
 
 config BR2_ARCH
 	default "arc"	if BR2_arcle
@@ -55,10 +62,11 @@ config BR2_GCC_TARGET_CPU
 	default "arc700" if BR2_arc770d
 	default "archs"	 if BR2_archs38
 	default "hs38_linux"	 if BR2_archs38_full
+	default "hs4x_rel31"	 if BR2_archs4x_rel31
 
 config BR2_READELF_ARCH_NAME
 	default "ARCompact"	if BR2_arc750d || BR2_arc770d
-	default "ARCv2"		if BR2_archs38 || BR2_archs38_full
+	default "ARCv2"		if BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
 
 choice
 	prompt "MMU Page Size"
@@ -78,7 +86,7 @@ choice
 
 config BR2_ARC_PAGE_SIZE_4K
 	bool "4KB"
-	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_full
+	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
 
 config BR2_ARC_PAGE_SIZE_8K
 	bool "8KB"
@@ -88,7 +96,7 @@ config BR2_ARC_PAGE_SIZE_8K
 
 config BR2_ARC_PAGE_SIZE_16K
 	bool "16KB"
-	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_full
+	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
 
 endchoice
 
