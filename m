From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 17 Jul 2015 12:11:42 +0300
Subject: [Buildroot] [PATCH v2] ARC: allow selection of MMU page size
Message-ID: <1437124302-18610-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Modern ARC cores (those sporting MMU of version 3 and 4) allow selection
of different page sizes (4, 8 or 16 kB) during ASIC design creation.
And it's important to build a toolchain with page size setting that matches
hardware.

Otherwise user-space applications will fail on execution due to
unexpected data layout/alignment etc.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---

Changes compared to v1:
 [1] Use upper-case in BR2_ARC_PAGE_SIZE_x
 [2] Updated comments

 arch/Config.in.arc       | 37 +++++++++++++++++++++++++++++++++++++
 package/uclibc/uclibc.mk |  8 ++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index b48a90f..1115d71 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -40,3 +40,40 @@ config BR2_GCC_TARGET_CPU
 	default "arc700" if BR2_arc750d
 	default "arc700" if BR2_arc770d
 	default "archs"	 if BR2_archs38
+
+choice
+	prompt "MMU Page Size"
+	default BR2_ARC_PAGE_SIZE_8K
+	help
+        MMU starting from version 3 (could be found in ARC 770) and now
+        version 4 (could be found in ARC HS38) allows selection of page
+        size during ASIC design creation.
+
+        Following options are available for MMU v3 and v4: 4kB, 8kB and 16 kB.
+
+        Default is 8 kB (that really matches the only page size in MMU v2).
+        It is important to build a toolchain with page size matching the
+        hardware configuration. Otherwise user-space applications will
+        fail at runtime.
+
+config BR2_ARC_PAGE_SIZE_4K
+	bool "4KB"
+	depends on BR2_arc770d || BR2_archs38
+
+config BR2_ARC_PAGE_SIZE_8K
+	bool "8KB"
+    help
+        This is the one and only option available for MMUv2 and default
+        value for MMU v3 and v4.
+
+config BR2_ARC_PAGE_SIZE_16K
+	bool "16KB"
+	depends on BR2_arc770d || BR2_archs38
+
+endchoice
+
+config BR2_ARC_PAGE_SIZE
+	string
+	default "4K" if BR2_ARC_PAGE_SIZE_4K
+	default "8K" if BR2_ARC_PAGE_SIZE_8K
+	default "16K" if BR2_ARC_PAGE_SIZE_16K
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 9dfafad..a2ba230 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -70,6 +70,13 @@ UCLIBC_ARC_TYPE = CONFIG_$(call qstrip,$(BR2_UCLIBC_ARC_TYPE))
 define UCLIBC_ARC_TYPE_CONFIG
 	$(call KCONFIG_ENABLE_OPT,$(UCLIBC_ARC_TYPE),$(@D)/.config)
 endef
+
+UCLIBC_ARC_PAGE_SIZE = CONFIG_ARC_PAGE_SIZE_$(call qstrip,$(BR2_ARC_PAGE_SIZE))
+define UCLIBC_ARC_PAGE_SIZE_CONFIG
+	$(SED) '/CONFIG_ARC_PAGE_SIZE_*/d' $(@D)/.config
+	$(call KCONFIG_ENABLE_OPT,$(UCLIBC_ARC_PAGE_SIZE),$(@D)/.config)
+endef
+
 endif # arc
 
 #
@@ -367,6 +374,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(call KCONFIG_SET_OPT,SHARED_LIB_LOADER_PREFIX,"/lib",$(@D)/.config)
 	$(UCLIBC_MMU_CONFIG)
 	$(UCLIBC_ARC_TYPE_CONFIG)
+	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARM_ABI_CONFIG)
 	$(UCLIBC_ARM_BX_CONFIG)
 	$(UCLIBC_MIPS_ABI_CONFIG)
-- 
2.4.3
