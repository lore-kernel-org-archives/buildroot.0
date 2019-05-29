From: guoren at kernel.org <guoren@kernel.org>
Date: Wed, 29 May 2019 15:18:39 +0800
Subject: [Buildroot] [PATCH V3 01/10] arch/csky: Use VDSP instead of DSP
In-Reply-To: <1559114328-23357-1-git-send-email-guoren@kernel.org>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
Message-ID: <1559114328-23357-2-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

Use VDSP enhanced instructions Co-processor instead of DSP.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 arch/Config.in.csky | 17 +++--------------
 arch/arch.mk.csky   | 24 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 14 deletions(-)
 create mode 100644 arch/arch.mk.csky

diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index e88e4e2..3817a2d 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -23,9 +23,9 @@ config BR2_CSKY_FPU
 	  Floating-Point Coprocessor or if you don't need FPU support
 	  for your user-space programs.
 
-config BR2_CSKY_DSP
-	bool "Enable DSP enhanced instructions"
-	depends on BR2_ck810 || BR2_ck807
+config BR2_CSKY_VDSP
+	bool "Enable VDSP enhanced instructions Co-processor"
+	depends on BR2_CSKY_FPU
 
 config BR2_ARCH
 	default "csky"
@@ -33,16 +33,5 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "LITTLE"
 
-config BR2_GCC_TARGET_CPU
-	default "ck610"		if (BR2_ck610 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
-	default "ck807"		if (BR2_ck807 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
-	default "ck807e"	if (BR2_ck807 && !BR2_CSKY_FPU &&  BR2_CSKY_DSP)
-	default "ck807f"	if (BR2_ck807 &&  BR2_CSKY_FPU && !BR2_CSKY_DSP)
-	default "ck807ef"	if (BR2_ck807 &&  BR2_CSKY_FPU &&  BR2_CSKY_DSP)
-	default "ck810"		if (BR2_ck810 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
-	default "ck810e"	if (BR2_ck810 && !BR2_CSKY_FPU &&  BR2_CSKY_DSP)
-	default "ck810f"	if (BR2_ck810 &&  BR2_CSKY_FPU && !BR2_CSKY_DSP)
-	default "ck810ef"	if (BR2_ck810 &&  BR2_CSKY_FPU &&  BR2_CSKY_DSP)
-
 config BR2_READELF_ARCH_NAME
 	default "CSKY"
diff --git a/arch/arch.mk.csky b/arch/arch.mk.csky
new file mode 100644
index 0000000..f2c90eb
--- /dev/null
+++ b/arch/arch.mk.csky
@@ -0,0 +1,24 @@
+#
+# Configure the GCC_TARGET_ARCH variable and append the
+# appropriate C-SKY ISA extensions.
+#
+
+ifeq ($(BR2_csky),y)
+
+ifeq ($(BR2_ck610),y)
+GCC_TARGET_CPU := ck610
+else ifeq ($(BR2_ck807),y)
+GCC_TARGET_CPU := ck807
+else ifeq ($(BR2_ck810),y)
+GCC_TARGET_CPU := ck810
+endif
+
+ifeq ($(BR2_CSKY_FPU),y)
+GCC_TARGET_CPU := $(GCC_TARGET_CPU)f
+endif
+
+ifeq ($(BR2_CSKY_VDSP),y)
+GCC_TARGET_CPU := $(GCC_TARGET_CPU)v
+endif
+
+endif
-- 
2.7.4
