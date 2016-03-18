From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Mar 2016 22:08:07 +0100
Subject: [Buildroot] [PATCH v2 05/17] uclibc: remove USE_BX handling
In-Reply-To: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1458335299-27409-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that uClibc is capable of figuring out by itself whether 'bx' can
be used or not, we can simplify the logic in Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in |  5 -----
 package/uclibc/uclibc.mk | 11 -----------
 2 files changed, 16 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 16bf89c..e722908 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -139,11 +139,6 @@ config BR2_UCLIBC_ARC_TYPE
 	default "ARC_CPU_700"	if BR2_arc770d
 	default "ARC_CPU_HS"	if BR2_archs38
 
-config BR2_UCLIBC_ARM_BX
-	bool
-	depends on BR2_UCLIBC_TARGET_ARCH = "arm"
-	default y if (BR2_ARM_CPU_HAS_THUMB || BR2_ARM_CPU_HAS_THUMB2)
-
 config BR2_UCLIBC_MIPS_ABI
 	string
 	depends on BR2_UCLIBC_TARGET_ARCH = "mips"
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 88a4a8c..c981d80 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -80,16 +80,6 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 UCLIBC_EXTRA_CFLAGS += -marm
 endif
 
-ifeq ($(BR2_UCLIBC_ARM_BX),y)
-define UCLIBC_ARM_BX_CONFIG
-	$(call KCONFIG_ENABLE_OPT,USE_BX,$(@D)/.config)
-endef
-else
-define UCLIBC_ARM_BX_CONFIG
-	$(call KCONFIG_DISABLE_OPT,USE_BX,$(@D)/.config)
-endef
-endif
-
 endif # arm
 
 #
@@ -362,7 +352,6 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_ARC_TYPE_CONFIG)
 	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARM_ABI_CONFIG)
-	$(UCLIBC_ARM_BX_CONFIG)
 	$(UCLIBC_MIPS_ABI_CONFIG)
 	$(UCLIBC_MIPS_ISA_CONFIG)
 	$(UCLIBC_SH_TYPE_CONFIG)
-- 
2.6.4
