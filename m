From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Fri,  8 Nov 2019 09:41:11 -0800
Subject: [Buildroot] [PATCH 2/3] arch/config.in.arc: Introduce ARC ISA
 toggle to ease downstream toggles
In-Reply-To: <20191108174112.28183-1-vgupta@synopsys.com>
References: <20191108174112.28183-1-vgupta@synopsys.com>
Message-ID: <20191108174112.28183-3-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/Config.in.arc | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 284951b82cee..dbc608db39c6 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -1,3 +1,18 @@
+choice
+	prompt "Target ISA"
+	default BR2_arcompact
+	depends on BR2_arc
+	help
+	    Specific ARC ISA to use
+
+config BR2_arcompact
+	bool "ARCompact ISA"
+
+config BR2_arcv2
+	bool "ARCv2 ISA"
+
+endchoice
+
 choice
 	prompt "Target CPU"
 	default BR2_arc770d
@@ -7,12 +22,15 @@ choice
 
 config BR2_arc750d
 	bool "ARC 750D"
+	depends on BR2_arcompact
 
 config BR2_arc770d
 	bool "ARC 770D"
+	depends on BR2_arcompact
 
 config BR2_archs
 	bool "ARC HS38"
+	depends on BR2_arcv2
 	help
 	  Generic ARC HS capable of running Linux, i.e. with MMU,
 	  caches and 32-bit multiplier. Also it corresponds to the default
@@ -20,6 +38,7 @@ config BR2_archs
 
 config BR2_archs38
 	bool "ARC HS38 with 64-bit mpy"
+	depends on BR2_arcv2
 	help
 	  Fully featured ARC HS capable of running Linux, i.e. with MMU,
 	  caches and 64-bit multiplier.
@@ -29,6 +48,7 @@ config BR2_archs38
 
 config BR2_archs38_full
 	bool "ARC HS38 with Quad MAC & FPU"
+	depends on BR2_arcv2
 	help
 	  Fully featured ARC HS with additional support for
 	   - Dual- and quad multiply and MC oprations
@@ -39,6 +59,7 @@ config BR2_archs38_full
 
 config BR2_archs4x_rel31
 	bool "ARC HS48 rel 31"
+	depends on BR2_arcv2
 	help
 	   Latest release of HS48 processor
 	   - Dual- and quad multiply and MC oprations
@@ -72,8 +93,8 @@ config BR2_GCC_TARGET_CPU
 	default "hs4x_rel31"	 if BR2_archs4x_rel31
 
 config BR2_READELF_ARCH_NAME
-	default "ARCompact"	if BR2_arc750d || BR2_arc770d
-	default "ARCv2"		if BR2_archs || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
+	default "ARCompact"	if BR2_arcompact
+	default "ARCv2"		if BR2_arcv2
 
 choice
 	prompt "MMU Page Size"
-- 
2.20.1
