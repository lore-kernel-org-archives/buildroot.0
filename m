From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Nov 2014 22:22:44 +0100
Subject: [Buildroot] [git commit] uclibc: add explicit setup of ARC-specific
	options
Message-ID: <20141102212605.22EBDB2E14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=530e074f9709804b784304c21733b567c7dffbc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As with other architectures for ARC we need to have an ability to set
specific options in uClibc.

In particular this is required for selection of ARC ISA version.

[Peter: string type, so must be in quotes as noted by Yann]
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/Config.in |    6 ++++++
 package/uclibc/uclibc.mk |   12 ++++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index d319ae7..0aaefa3 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -194,6 +194,12 @@ config BR2_UCLIBC_TARGET_ARCH
 	default i386	   if BR2_i386
 	default x86_64	   if BR2_x86_64
 
+config BR2_UCLIBC_ARC_TYPE
+	string
+	depends on BR2_UCLIBC_TARGET_ARCH = "arc"
+	default "ARC_CPU_700"	if BR2_arc750d
+	default "ARC_CPU_700"	if BR2_arc770d
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
