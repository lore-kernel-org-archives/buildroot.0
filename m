From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Mar 2016 22:08:10 +0100
Subject: [Buildroot] [PATCH v2 08/17] uclibc: context functions are not
	Thumb-compatible
In-Reply-To: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1458335299-27409-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thumb1 platforms and Thumb2 platforms that support the ARM
instructions set, there is no problem, as the context functions are
built unconditionally in ARM mode.

However, on Thumb2 platforms that only support the Thumb2 instruction
set, the context functions cannot build as the assembler code is not
Thumb-ready. Therefore, those functions must be disabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index e3e45f7..4698132 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -88,6 +88,12 @@ define UCLIBC_ARM_BINFMT_FLAT
 endef
 endif
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB2):$(BR2_ARM_CPU_HAS_ARM),y:)
+define UCLIBC_ARM_NO_CONTEXT_FUNCS
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_CONTEXT_FUNCS,$(@D)/.config)
+endef
+endif
+
 endif # arm
 
 #
@@ -361,6 +367,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARM_ABI_CONFIG)
 	$(UCLIBC_ARM_BINFMT_FLAT)
+	$(UCLIBC_ARM_NO_CONTEXT_FUNCS)
 	$(UCLIBC_MIPS_ABI_CONFIG)
 	$(UCLIBC_MIPS_ISA_CONFIG)
 	$(UCLIBC_SH_TYPE_CONFIG)
-- 
2.6.4
