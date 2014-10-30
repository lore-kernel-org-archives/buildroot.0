From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 30 Oct 2014 16:57:28 +0300
Subject: [Buildroot] [PATCH 2/3] uclibc: add explicit setup of ARC-specific
	options
In-Reply-To: <1414677449-15937-1-git-send-email-abrodkin@synopsys.com>
References: <1414677449-15937-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1414677449-15937-3-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As with other architectures for ARC we need to have an ability to set
specific options in uClibc.

In particular this is required for selection of ARC ISA version.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
---
 package/uclibc/Config.in |  6 ++++++
 package/uclibc/uclibc.mk | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index d319ae7..c68558f 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -194,6 +194,12 @@ config BR2_UCLIBC_TARGET_ARCH
 	default i386	   if BR2_i386
 	default x86_64	   if BR2_x86_64
 
+config BR2_UCLIBC_ARC_TYPE
+	string
+	depends on BR2_UCLIBC_TARGET_ARCH = "arc"
+	default ARC_CPU_700	if BR2_arc750d
+	default ARC_CPU_700	if BR2_arc770d
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
