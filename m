From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Apr 2016 10:20:37 +0200
Subject: [Buildroot] [git commit] uclibc: context functions are not
	Thumb-compatible
Message-ID: <20160408123252.438FB7FC21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=696db774843ec02c10c756a39e4aee6c29de7f78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The context functions in uClibc unconditionally use the classic ARM
instruction set.

On platforms that do support the ARM instruction set, there is no problem -
However, on platforms that only support the Thumb instruction set, the
context functions cannot be built since the assembler code is not
Thumb-ready. Therefore, these functions must be disabled on such
platforms. All Thumb1 platforms support ARM instructions, so this is
only relevant for Thumb2-only platforms (i.e., Cortex-M).

Note that some packages require the context functions, so these will
fail to build on these platforms. It is worth mentioning that musl
also doesn't provide the context functions, and those are rarely
used. Affected packages will be handled in later patches.

[Peter: slightly reworded]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
