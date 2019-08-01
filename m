From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 1 Aug 2019 11:56:39 +0200
Subject: [Buildroot] [git commit] ARC: Add support for ARC HS38 with Quad
 MAC & FPU
Message-ID: <20190801095711.9FDF3801B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0835675aefb077113f0404374b74a3828f0d430
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We used to build everything for pretty much baseline ARC HS capable
of runnig Linux kernel, which was ARC HS38/48 with MMU and caches.

But there's a fully featured ARC HS with additional support for
 - Dual & quad integer multiply and MAC operations
 - Double-precision floating-point unit

It corresponds to the following ARC HS templates in ARChitect: hs38_slc_full.

In fact existing HSDK board uses exactly this configuration in its SoC
and this is recommended configuration for Linux use-cases.

To make life simpler we have corresponding "-mcpu" and "--with-cpu"
options in ARC GCC port so we're going to use it and get binaries
built accordingly optimized.

And while at it added help message so users may better understand
what they are dealing with.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 arch/Config.in.arc | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 6cddbb961f..f7818e7ebb 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -13,13 +13,30 @@ config BR2_arc770d
 
 config BR2_archs38
 	bool "ARC HS38"
+	help
+	  Generic ARC HS capable of running Linux, i.e. with MMU,
+	  caches and multiplier. Also it corresponds to the default
+	  configuration in older GNU toolchain versions.
+
+	  If you're not sure which version of ARC HS core you  build for
+	  keep this one.
+
+config BR2_archs38_full
+	bool "ARC HS38 with Quad MAC & FPU"
+	help
+	  Fully featured ARC HS with additional support for
+	   - Dual- and quad multiply and MC oprations
+	   - Double-precision FPU
+
+	  It corresponds to "hs38_slc_full" ARC HS template in
+	  ARChitect.
 
 endchoice
 
 # Choice of atomic instructions presence
 config BR2_ARC_ATOMIC_EXT
 	bool "Atomic extension (LLOCK/SCOND instructions)"
-	default y if BR2_arc770d || BR2_archs38
+	default y if BR2_arc770d || BR2_archs38 || BR2_archs38_full
 
 config BR2_ARCH
 	default "arc"	if BR2_arcle
@@ -37,10 +54,11 @@ config BR2_GCC_TARGET_CPU
 	default "arc700" if BR2_arc750d
 	default "arc700" if BR2_arc770d
 	default "archs"	 if BR2_archs38
+	default "hs38_linux"	 if BR2_archs38_full
 
 config BR2_READELF_ARCH_NAME
 	default "ARCompact"	if BR2_arc750d || BR2_arc770d
-	default "ARCv2"		if BR2_archs38
+	default "ARCv2"		if BR2_archs38 || BR2_archs38_full
 
 choice
 	prompt "MMU Page Size"
@@ -60,7 +78,7 @@ choice
 
 config BR2_ARC_PAGE_SIZE_4K
 	bool "4KB"
-	depends on BR2_arc770d || BR2_archs38
+	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_full
 
 config BR2_ARC_PAGE_SIZE_8K
 	bool "8KB"
@@ -70,7 +88,7 @@ config BR2_ARC_PAGE_SIZE_8K
 
 config BR2_ARC_PAGE_SIZE_16K
 	bool "16KB"
-	depends on BR2_arc770d || BR2_archs38
+	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_full
 
 endchoice
 
