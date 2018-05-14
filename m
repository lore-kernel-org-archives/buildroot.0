From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 14 May 2018 20:43:15 +0300
Subject: [Buildroot] [PATCH] uclibc: ARC: Don't mess with CPU selection
Message-ID: <20180514174315.15432-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since uClibc-ng commit cde74b83f9b2 "ARC: remove special CFLAGS/LDFLAGS handling"
i.e. starting v1.0.23 CONFIG_ARC_CPU_xx options are not used.

Instead uClibc relies on toolchain defaults or build-system CFLAGS
for selection of ARC-specific code (i.e. distinguishes between
ARCompact and ARCv2 ISAs).

So we drop corresponding quirks from Buildroot as well.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/Config.in | 7 -------
 package/uclibc/uclibc.mk | 6 ------
 2 files changed, 13 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 0747cc8d7c..a566881852 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -106,13 +106,6 @@ config BR2_UCLIBC_TARGET_ARCH
 	default "i386"	   if BR2_i386
 	default "x86_64"   if BR2_x86_64
 
-config BR2_UCLIBC_ARC_TYPE
-	string
-	default "ARC_CPU_700"	if BR2_arc750d
-	default "ARC_CPU_700"	if BR2_arc770d
-	default "ARC_CPU_HS"	if BR2_archs38
-	depends on BR2_UCLIBC_TARGET_ARCH = "arc"
-
 config BR2_UCLIBC_MIPS_ABI
 	string
 	default "O32" if BR2_MIPS_OABI32
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 7de9219873..bb44da28b4 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -82,11 +82,6 @@ endif
 #
 
 ifeq ($(UCLIBC_TARGET_ARCH),arc)
-UCLIBC_ARC_TYPE = CONFIG_$(call qstrip,$(BR2_UCLIBC_ARC_TYPE))
-define UCLIBC_ARC_TYPE_CONFIG
-	$(call KCONFIG_ENABLE_OPT,$(UCLIBC_ARC_TYPE),$(@D)/.config)
-endef
-
 UCLIBC_ARC_PAGE_SIZE = CONFIG_ARC_PAGE_SIZE_$(call qstrip,$(BR2_ARC_PAGE_SIZE))
 define UCLIBC_ARC_PAGE_SIZE_CONFIG
 	$(SED) '/CONFIG_ARC_PAGE_SIZE_*/d' $(@D)/.config
@@ -387,7 +382,6 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(call KCONFIG_SET_OPT,SHARED_LIB_LOADER_PREFIX,"/lib",$(@D)/.config)
 	$(UCLIBC_MMU_CONFIG)
 	$(UCLIBC_BINFMT_CONFIG)
-	$(UCLIBC_ARC_TYPE_CONFIG)
 	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARC_ATOMICS_CONFIG)
 	$(UCLIBC_ARM_ABI_CONFIG)
-- 
2.16.2
