From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 29 Oct 2014 15:25:17 +0300
Subject: [Buildroot] [PATCH] arch/arc: add support of ARC HS38 core
Message-ID: <1414585517-5957-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Synopsys has recently announced its new ARC HS38 core that is capable of running
Linux - http://www.synopsys.com/dw/ipdir.php?ds=arc-hs38-processor

ARC HS38 is based on ARCv2 ISA and requires special settings of gcc and libc.
Also in case of HS38 atomic extensions (LLOCK/SCOND instructions) are built-in
by default, so enabling atomic extensions in Buildroot as well.

This commit adds support of the core in buildroot.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <anton.kolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arc       | 20 +++++++++++++++++++-
 package/uclibc/Config.in |  6 ++++++
 package/uclibc/uclibc.mk | 12 ++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index fcb5d7d..1a862d7 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -1,5 +1,22 @@
+# Choise of CPU
+choice
+	prompt "Target CPU"
+	depends on BR2_arc
+	default BR2_arc700
+	help
+	    Specific CPU to use
+
+config BR2_arc700
+	bool "ARC 700"
+
+config BR2_archs
+	bool "ARC HS"
+
+endchoice
+
 # Choise of atomic instructions presence
 config BR2_ARC_ATOMIC_EXT
+	default y if BR2_archs
 	bool "Atomic extension (LLOCK/SCOND instructions)"
 
 config BR2_ARCH_HAS_ATOMICS
@@ -18,4 +35,5 @@ config BR2_ENDIAN
 	default "BIG"	 if BR2_arceb
 
 config BR2_GCC_TARGET_CPU
-	default "arc700"
+	default "arc700" if BR2_arc700
+	default "archs"	 if BR2_archs
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index d319ae7..53ca173 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -194,6 +194,12 @@ config BR2_UCLIBC_TARGET_ARCH
 	default i386	   if BR2_i386
 	default x86_64	   if BR2_x86_64
 
+config BR2_UCLIBC_ARC_TYPE
+	string
+	depends on BR2_UCLIBC_TARGET_ARCH = "arc"
+	default ARC_CPU_700	if BR2_arc700
+	default ARC_CPU_HS	if BR2_archs
+
 config BR2_UCLIBC_ARM_BX
 	bool
 	depends on BR2_UCLIBC_TARGET_ARCH = "arm"
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index b2ecce3..8f990c7 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -57,6 +57,17 @@ UCLIBC_LOCALES = $(foreach locale,$(GENERATE_LOCALE),\
 endif
 
 #
+# ARC definitions
+#
+
+ifeq ($(UCLIBC_TARGET_ARCH),arc)
+UCLIBC_ARC_TYPE = CONFIG_$(call qstrip,$(BR2_UCLIBC_ARC_TYPE))
+define UCLIBC_ARC_TYPE_CONFIG
+	$(call KCONFIG_ENABLE_OPT,$(UCLIBC_ARC_TYPE),$(@D)/.config)
+endef
+endif # arc
+
+#
 # ARM definitions
 #
 
@@ -410,6 +421,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(call KCONFIG_SET_OPT,DEVEL_PREFIX,"/usr",$(@D)/.config)
 	$(call KCONFIG_SET_OPT,SHARED_LIB_LOADER_PREFIX,"/lib",$(@D)/.config)
 	$(UCLIBC_MMU_CONFIG)
+	$(UCLIBC_ARC_TYPE_CONFIG)
 	$(UCLIBC_ARM_ABI_CONFIG)
 	$(UCLIBC_ARM_BX_CONFIG)
 	$(UCLIBC_MIPS_ABI_CONFIG)
-- 
1.9.3
