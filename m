From: Guo Ren <ren_guo@c-sky.com>
Date: Fri,  3 Mar 2017 09:20:20 +0800
Subject: [Buildroot] [PATCH 1/2] csky: Add new architecture
Message-ID: <1488504021-598-1-git-send-email-ren_guo@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a basic implement for C-SKY, we use pre-build-toolchain from
url, and csky-toolchain open-source is on going.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 DEVELOPERS          |  3 +++
 arch/Config.in      | 12 ++++++++++++
 arch/Config.in.csky | 45 +++++++++++++++++++++++++++++++++++++++++++++
 toolchain/Config.in |  1 +
 4 files changed, 61 insertions(+)
 create mode 100644 arch/Config.in.csky

diff --git a/DEVELOPERS b/DEVELOPERS
index 678a9a9..361f902 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -593,6 +593,9 @@ F:	package/sdl2/
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/liquid-dsp/
 
+N:	Guo Ren <ren_guo@c-sky.com>
+F:	arch/Config.in.csky
+
 N:	Gustavo Zacarias <gustavo@zacarias.com.ar>
 F:	arch/Config.in.powerpc
 F:	board/qemu/
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
diff --git a/toolchain/Config.in b/toolchain/Config.in
index de01585..652c9d8 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -46,6 +46,7 @@ config BR2_TOOLCHAIN_BUILDROOT
 	depends on !BR2_bf607
 	depends on !BR2_bf608
 	depends on !BR2_bf609
+	depends on !BR2_csky
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
-- 
1.9.1
