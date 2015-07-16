From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 16 Jul 2015 22:04:01 +0300
Subject: [Buildroot] [PATCH] ARC: allow selection of MMU page size
Message-ID: <1437073441-11321-1-git-send-email-abrodkin@synopsys.com>
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
c: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arc       | 30 ++++++++++++++++++++++++++++++
 package/uclibc/uclibc.mk |  8 ++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index b48a90f..e960eb8 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -40,3 +40,33 @@ config BR2_GCC_TARGET_CPU
 	default "arc700" if BR2_arc750d
 	default "arc700" if BR2_arc770d
 	default "archs"	 if BR2_archs38
+
+choice
+	prompt "MMU Page Size"
+	default BR2_arc_page_size_8k
+	help
+	    MMU starting from version 3 (could be found in ARC 770) and now
+	    version 4 (could be found in ARC HS38) allows selection of page
+	    size during ASIC design creation. And it's important to build
+	    a toolchain with page size setting that matches hardware.
+	    Otherwise user-space applications will fail on execution due to
+	    unexpected data layout/alignment.
+
+config BR2_arc_page_size_4k
+	bool "4KB"
+	depends on BR2_arc770d || BR2_archs38
+
+config BR2_arc_page_size_8k
+	bool "8KB"
+
+config BR2_arc_page_size_16k
+	bool "16KB"
+	depends on BR2_arc770d || BR2_archs38
+
+endchoice
+
+config BR2_ARC_PAGE_SIZE
+	string
+	default "4K" if BR2_arc_page_size_4k
+	default "8K" if BR2_arc_page_size_8k
+	default "16K" if BR2_arc_page_size_16k
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
