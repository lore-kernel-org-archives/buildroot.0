From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 21:00:07 +0200
Subject: [Buildroot] [PATCH v3 02/10] uclibc: context functions are not
	Thumb-compatible
In-Reply-To: <1459450815-6494-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1459450815-6494-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1459450815-6494-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On platforms that do support the ARM instruction set, there is no
problem, as the context functions are built unconditionally in ARM
mode.

However, on platforms that only support the Thumb instruction set, the
context functions cannot be built since the assembler code is not
Thumb-ready. Therefore, these functions must be disabled on such
platforms. All Thumb1 platforms support ARM instructions, so this is
only relevant for Thumb2-only platforms (i.e., Cortex-M).

Note that some packages require the context functions, so these will
fail to build on these platforms. It is worth mentioning that musl
also doesn't provide the context functions, and those are rarely
used. Affected packages will be handled in later patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index e3e45f7..1ccdfbb 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -88,6 +88,16 @@ define UCLIBC_ARM_BINFMT_FLAT
 endef
 endif
 
+# context functions are written with ARM instructions. Therefore, if
+# we are using a Thumb2-only platform (i.e, Cortex-M), they must be
+# disabled. Thumb1 platforms are not a problem, since they all also
+# support the ARM instructions.
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB2):$(BR2_ARM_CPU_HAS_ARM),y:)
+define UCLIBC_ARM_NO_CONTEXT_FUNCS
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_CONTEXT_FUNCS,$(@D)/.config)
+endef
+endif
+
 endif # arm
 
 #
@@ -361,6 +371,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARM_ABI_CONFIG)
 	$(UCLIBC_ARM_BINFMT_FLAT)
+	$(UCLIBC_ARM_NO_CONTEXT_FUNCS)
 	$(UCLIBC_MIPS_ABI_CONFIG)
 	$(UCLIBC_MIPS_ISA_CONFIG)
 	$(UCLIBC_SH_TYPE_CONFIG)
-- 
2.6.4
