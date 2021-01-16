From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2021 09:58:26 +0100
Subject: [Buildroot] [git commit] ARC: Add support for generic HS48 processor
Message-ID: <20210116150346.B40D8870CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aefe5934a4e1525721a1542e3cfef9254d04ab42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the HS48 processor, BR currently builds with -mcpu=hs4x_rel31 which
generates suboptimal code as it inhibits delay slot and back-back ST and so on.

Enable a new variant to build with -mcpu=hs4x for normal codegen.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
[yann.morin.1998 at free.fr:
  - simplify dependencies on MMU page size
  - wrap long lines
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.arc | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index fdfafda31c..f7a6d920b5 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -39,9 +39,14 @@ config BR2_archs38_full
 
 config BR2_archs4x_rel31
 	bool "ARC HS48 rel 31"
+	help
+	   Build for HS48 release 3.1
+
+config BR2_archs4x
+	bool "ARC HS48"
 	help
 	   Latest release of HS48 processor
-	   - Dual- and quad multiply and MC oprations
+	   - Dual and Quad multiply and MAC operations
 	   - Double-precision FPU
 
 endchoice
@@ -49,7 +54,9 @@ endchoice
 # Choice of atomic instructions presence
 config BR2_ARC_ATOMIC_EXT
 	bool "Atomic extension (LLOCK/SCOND instructions)"
-	default y if BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
+	default y if BR2_arc770d
+	default y if BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full
+	default y if BR2_archs4x_rel31 || BR2_archs4x
 
 config BR2_ARCH
 	default "arc"	if BR2_arcle
@@ -70,10 +77,12 @@ config BR2_GCC_TARGET_CPU
 	default "hs38"	 if BR2_archs38_64mpy
 	default "hs38_linux"	 if BR2_archs38_full
 	default "hs4x_rel31"	 if BR2_archs4x_rel31
+	default "hs4x"	 if BR2_archs4x
 
 config BR2_READELF_ARCH_NAME
 	default "ARCompact"	if BR2_arc750d || BR2_arc770d
-	default "ARCv2"		if BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
+	default "ARCv2"		if BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full
+	default "ARCv2"		if BR2_archs4x_rel31 || BR2_archs4x
 
 choice
 	prompt "MMU Page Size"
@@ -93,7 +102,7 @@ choice
 
 config BR2_ARC_PAGE_SIZE_4K
 	bool "4KB"
-	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
+	depends on !BR2_arc750d
 
 config BR2_ARC_PAGE_SIZE_8K
 	bool "8KB"
@@ -103,7 +112,7 @@ config BR2_ARC_PAGE_SIZE_8K
 
 config BR2_ARC_PAGE_SIZE_16K
 	bool "16KB"
-	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
+	depends on !BR2_arc750d
 
 endchoice
 
