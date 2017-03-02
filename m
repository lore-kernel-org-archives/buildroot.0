From: Guo Ren <ren_guo@c-sky.com>
Date: Thu,  2 Mar 2017 21:03:50 +0800
Subject: [Buildroot] [PATCH 3/3] csky: Add new architecture
In-Reply-To: <1488459830-18097-1-git-send-email-ren_guo@c-sky.com>
References: <1488459830-18097-1-git-send-email-ren_guo@c-sky.com>
Message-ID: <1488459830-18097-3-git-send-email-ren_guo@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a basic implement for C-SKY, we use pre-build-toolchain from
url, and csky-toolchain open-source is on going.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 DEVELOPERS          |  1 +
 arch/Config.in      | 12 ++++++++++++
 arch/Config.in.csky | 45 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 arch/Config.in.csky

diff --git a/DEVELOPERS b/DEVELOPERS
index 6495a9e..cd4402f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -593,6 +593,7 @@ N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/liquid-dsp/
 
 N:	Guo Ren <ren_guo@c-sky.com>
+F:	arch/Config.in.csky
 F:	board/csky
 F:	configs/csky_*
 
diff --git a/arch/Config.in b/arch/Config.in
index 7149b2c..65a33fb 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -85,6 +85,14 @@ config BR2_bfin
 	  http://www.analog.com/
 	  http://en.wikipedia.org/wiki/Blackfin
 
+config BR2_csky
+	bool "csky"
+	select BR2_ARCH_HAS_MMU_MANDATORY
+	help
+	  csky is processor IP from china.
+	  http://www.c-sky.com/
+	  http://www.github.com/c-sky
+
 config BR2_i386
 	bool "i386"
 	select BR2_ARCH_HAS_MMU_MANDATORY
@@ -369,6 +377,10 @@ if BR2_bfin
 source "arch/Config.in.bfin"
 endif
 
+if BR2_csky
+source "arch/Config.in.csky"
+endif
+
 if BR2_m68k
 source "arch/Config.in.m68k"
 endif
diff --git a/arch/Config.in.csky b/arch/Config.in.csky
new file mode 100644
index 0000000..6e086fb
--- /dev/null
+++ b/arch/Config.in.csky
@@ -0,0 +1,45 @@
+choice
+	prompt "Target Architecture Variant"
+	default BR2_ck610
+	help
+	  Specific CPU variant to use
+
+config BR2_ck610
+	bool "ck610"
+
+config BR2_ck807
+	bool "ck807"
+
+config BR2_ck810
+	bool "ck810"
+
+endchoice
+
+config BR2_CSKY_FPU
+	bool "Enable FPU coprocessor"
+	depends on BR2_ck810 || BR2_ck807
+	help
+	  You can say N here if you C-SKY CPU don't have Floating-Point
+	  Coprocessor or the user program need not to support FPU.
+
+config BR2_CSKY_DSP
+	bool "Enable DSP enhanced instruction"
+	depends on BR2_ck810 || BR2_ck807
+
+config BR2_ARCH
+	default "csky"
+
+config BR2_ENDIAN
+	default "LITTLE"
+
+config BR2_GCC_TARGET_CPU
+	default "ck610"		if (BR2_ck610 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
+	default "ck807"		if (BR2_ck807 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
+	default "ck807e"	if (BR2_ck807 && !BR2_CSKY_FPU &&  BR2_CSKY_DSP)
+	default "ck807f"	if (BR2_ck807 &&  BR2_CSKY_FPU && !BR2_CSKY_DSP)
+	default "ck807ef"	if (BR2_ck807 &&  BR2_CSKY_FPU &&  BR2_CSKY_DSP)
+	default "ck810"		if (BR2_ck810 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
+	default "ck810e"	if (BR2_ck810 && !BR2_CSKY_FPU &&  BR2_CSKY_DSP)
+	default "ck810f"	if (BR2_ck810 &&  BR2_CSKY_FPU && !BR2_CSKY_DSP)
+	default "ck810ef"	if (BR2_ck810 &&  BR2_CSKY_FPU &&  BR2_CSKY_DSP)
+
-- 
1.9.1
