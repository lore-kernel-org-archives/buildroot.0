From: guoren at kernel.org <guoren@kernel.org>
Date: Tue,  7 May 2019 17:47:20 +0800
Subject: [Buildroot] [PATCH 1/3] arch/csky: Add ck860 and vdsp compiler
 options
Message-ID: <1557222442-8484-1-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

The ck860 is C-SKY abiv2 cpu series and it could support SMP and vdsp
instructions set. Add the compiler options for them.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 arch/Config.in.csky | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index e88e4e2..bbff600 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -13,19 +13,26 @@ config BR2_ck807
 config BR2_ck810
 	bool "ck810"
 
+config BR2_ck860
+	bool "ck860"
+
 endchoice
 
 config BR2_CSKY_FPU
 	bool "Enable FPU coprocessor"
-	depends on BR2_ck810 || BR2_ck807
+	depends on BR2_ck807 || BR2_ck810 || BR2_ck860
 	help
 	  You can say N here if your C-SKY CPU doesn't have a
 	  Floating-Point Coprocessor or if you don't need FPU support
 	  for your user-space programs.
 
-config BR2_CSKY_DSP
-	bool "Enable DSP enhanced instructions"
-	depends on BR2_ck810 || BR2_ck807
+config BR2_CSKY_VDSP
+	bool "Enable VDSP 3.0 enhanced instructions Co-processor"
+	depends on BR2_ck860
+
+config BR2_GCC_TARGET_FLOAT_ABI
+	default "soft"		if !BR2_CSKY_FPU
+	default "hard"		if BR2_CSKY_FPU
 
 config BR2_ARCH
 	default "csky"
@@ -34,15 +41,15 @@ config BR2_ENDIAN
 	default "LITTLE"
 
 config BR2_GCC_TARGET_CPU
-	default "ck610"		if (BR2_ck610 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
-	default "ck807"		if (BR2_ck807 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
-	default "ck807e"	if (BR2_ck807 && !BR2_CSKY_FPU &&  BR2_CSKY_DSP)
-	default "ck807f"	if (BR2_ck807 &&  BR2_CSKY_FPU && !BR2_CSKY_DSP)
-	default "ck807ef"	if (BR2_ck807 &&  BR2_CSKY_FPU &&  BR2_CSKY_DSP)
-	default "ck810"		if (BR2_ck810 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
-	default "ck810e"	if (BR2_ck810 && !BR2_CSKY_FPU &&  BR2_CSKY_DSP)
-	default "ck810f"	if (BR2_ck810 &&  BR2_CSKY_FPU && !BR2_CSKY_DSP)
-	default "ck810ef"	if (BR2_ck810 &&  BR2_CSKY_FPU &&  BR2_CSKY_DSP)
+	default "ck610"		if (BR2_ck610 && !BR2_CSKY_FPU && !BR2_CSKY_VDSP)
+	default "ck807"		if (BR2_ck807 && !BR2_CSKY_FPU && !BR2_CSKY_VDSP)
+	default "ck807f"	if (BR2_ck807 &&  BR2_CSKY_FPU && !BR2_CSKY_VDSP)
+	default "ck810"		if (BR2_ck810 && !BR2_CSKY_FPU && !BR2_CSKY_VDSP)
+	default "ck810f"	if (BR2_ck810 &&  BR2_CSKY_FPU && !BR2_CSKY_VDSP)
+	default "ck860"		if (BR2_ck860 && !BR2_CSKY_FPU && !BR2_CSKY_VDSP)
+	default "ck860f"	if (BR2_ck860 &&  BR2_CSKY_FPU && !BR2_CSKY_VDSP)
+	default "ck860v"	if (BR2_ck860 && !BR2_CSKY_FPU &&  BR2_CSKY_VDSP)
+	default "ck860fv"	if (BR2_ck860 &&  BR2_CSKY_FPU &&  BR2_CSKY_VDSP)
 
 config BR2_READELF_ARCH_NAME
 	default "CSKY"
-- 
2.7.4
