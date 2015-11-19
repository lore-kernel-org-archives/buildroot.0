From: Paul Enman <paul.enman@gmail.com>
Date: Thu, 19 Nov 2015 10:18:07 -0600
Subject: [Buildroot] Allow thumb/thumb2 config with uClibc-ng
Message-ID: <CAEp4hJ0A0fdO66w_r0LB4hBhQVVOZYzy+60vLuidE7H4YZ3Tzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot forces CFLAGS to arm when thumb (and thumb2) and linuxthreads are
selected. These configuration options are important for making a uClibc
toolchain for Cortex-M platforms. Buildroot with current uClibc-ng builds
without error with this patch. Note: UCLIBC_HAS_CONTEXT_FUNCTIONS
(deprecated) option is enabled in the supplied uClibc-ng.config (and not in
the older uClibc 0.9.3x config) and do not compile with thumb ( with error
libc/sysdeps/linux/arm/setcontext.S:63: Error: LR and PC should not both be
in register list -- `ldmia r14,{r14,pc}' ), set this option to disabled
when building for thumb. Using defconfig:

BR2_arm=y
BR2_cortex_m3=y
BR2_ARM_INSTRUCTIONS_THUMB2=y
BR2_PTHREADS_OLD=y
BR2_PACKAGE_HOST_ELF2FLT=y

Signed-off-by: penman <paul.enman@gmail.com>
---
 package/uclibc/uclibc.mk | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index c62a40f..df827d6 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -86,9 +86,16 @@ define UCLIBC_ARM_ABI_CONFIG
        $(call KCONFIG_ENABLE_OPT,CONFIG_ARM_EABI,$(@D)/.config)
 endef

-# Thumb build is broken with threads, build in ARM mode
-ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
-UCLIBC_EXTRA_CFLAGS += -marm
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),y)
+define UCLIBC_ARM_THUMB_CONFIG
+       $(call KCONFIG_ENABLE_OPT,COMPILE_IN_THUMB_MODE,$(@D)/.config)
+       $(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_CONTEXT_FUNCS,$(@D)/.config)
+endef
+else
+define UCLIBC_ARM_THUMB_CONFIG
+       $(call KCONFIG_DISABLE_OPT,COMPILE_IN_THUMB_MODE,$(@D)/.config)
+       $(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_CONTEXT_FUNCS,$(@D)/.config)
+endef
 endif

 ifeq ($(BR2_UCLIBC_ARM_BX),y)
@@ -373,6 +380,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
        $(UCLIBC_ARC_TYPE_CONFIG)
        $(UCLIBC_ARC_PAGE_SIZE_CONFIG)
        $(UCLIBC_ARM_ABI_CONFIG)
+       $(UCLIBC_ARM_THUMB_CONFIG)
        $(UCLIBC_ARM_BX_CONFIG)
        $(UCLIBC_MIPS_ABI_CONFIG)
        $(UCLIBC_MIPS_ISA_CONFIG)
-- 
1.9.1
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151119/a77f8a58/attachment.html>
