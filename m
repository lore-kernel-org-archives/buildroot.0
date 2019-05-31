From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:59:57 +0200
Subject: [Buildroot] [git commit] arch/csky: move GCC_TARGET_CPU calculation
 to arch.mk.csky
Message-ID: <20190602201237.7FA448EDA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d26bd58502f024927755950c0ba3f880ca1b50a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Calculating GCC_TARGET_CPU requires combining multiple flags, which
isn't very nicely expressed in Config.in, so let's move this into
arch.mk.csky, similarly to what is done in arch.mk.riscv.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Thomas: rework commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.csky | 11 -----------
 arch/arch.mk.csky   | 24 ++++++++++++++++++++++++
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index 420e831c21..a9d6548d8e 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -33,17 +33,6 @@ config BR2_ARCH
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
index 0000000000..a39fbd43c2
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
+ifeq ($(BR2_CSKY_DSP),y)
+GCC_TARGET_CPU := $(GCC_TARGET_CPU)e
+endif
+
+ifeq ($(BR2_CSKY_FPU),y)
+GCC_TARGET_CPU := $(GCC_TARGET_CPU)f
+endif
+
+endif
