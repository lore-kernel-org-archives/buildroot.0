From: penman <paul.enman@gmail.com>
Date: Fri,  4 Dec 2015 16:56:35 -0600
Subject: [Buildroot] [PATCH 1/1] [1/1] package/uclibc: Enable compile in
	thumb mode when selected
Message-ID: <1449269795-17864-1-git-send-email-paul.enman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: penman <paul.enman@gmail.com>
---
 package/uclibc/uclibc.mk | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index c62a40f..4f5c605 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -86,9 +86,15 @@ define UCLIBC_ARM_ABI_CONFIG
 	$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_EABI,$(@D)/.config)
 endef
 
-# Thumb build is broken with threads, build in ARM mode
-ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
-UCLIBC_EXTRA_CFLAGS += -marm
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),y)
+define UCLIBC_ARM_THUMB_CONFIG
+	$(call KCONFIG_ENABLE_OPT,COMPILE_IN_THUMB_MODE,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_CONTEXT_FUNCS,$(@D)/.config)
+endef
+else
+define UCLIBC_ARM_THUMB_CONFIG
+	$(call KCONFIG_DISABLE_OPT,COMPILE_IN_THUMB_MODE,$(@D)/.config)
+endef
 endif
 
 ifeq ($(BR2_UCLIBC_ARM_BX),y)
@@ -373,6 +379,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_ARC_TYPE_CONFIG)
 	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARM_ABI_CONFIG)
+	$(UCLIBC_ARM_THUMB_CONFIG)
 	$(UCLIBC_ARM_BX_CONFIG)
 	$(UCLIBC_MIPS_ABI_CONFIG)
 	$(UCLIBC_MIPS_ISA_CONFIG)
-- 
1.9.1
