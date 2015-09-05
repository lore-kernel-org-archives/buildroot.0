From: Douglas RAILLARD <public.douglas.raillard@gmail.com>
Date: Sat,  5 Sep 2015 18:33:44 +0200
Subject: [Buildroot] [PATCH 3/3] Fix uClibc build for ARM-nommu
Message-ID: <1441470824-23456-1-git-send-email-public.douglas.raillard@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Use Thumb in uClibc when targeting Thumb(2) in Buildroot
* Disable context functions that are not Thumb ready

Signed-off-by: Douglas RAILLARD <public.douglas.raillard@gmail.com>
---
 package/uclibc/uclibc.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index a2ba230..116efb1 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -94,6 +94,14 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 UCLIBC_EXTRA_CFLAGS += -marm
 endif
 
+# UCLIBC_HAS_CONTEXT_FUNCS is broken with Thumb and Thumb2
+ifeq (y,$(filter y,$(BR2_ARM_INSTRUCTIONS_THUMB) $(BR2_ARM_INSTRUCTIONS_THUMB2)))
+define UCLIBC_ARM_THUMB_CONFIG
+	$(call KCONFIG_ENABLE_OPT,COMPILE_IN_THUMB_MODE,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_CONTEXT_FUNCS,$(@D)/.config)
+endef
+endif
+
 ifeq ($(BR2_UCLIBC_ARM_BX),y)
 define UCLIBC_ARM_BX_CONFIG
 	$(call KCONFIG_ENABLE_OPT,USE_BX,$(@D)/.config)
@@ -376,6 +384,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_ARC_TYPE_CONFIG)
 	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARM_ABI_CONFIG)
+	$(UCLIBC_ARM_THUMB_CONFIG)
 	$(UCLIBC_ARM_BX_CONFIG)
 	$(UCLIBC_MIPS_ABI_CONFIG)
 	$(UCLIBC_MIPS_ISA_CONFIG)
-- 
2.5.1
