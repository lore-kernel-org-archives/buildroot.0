From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 19 Apr 2017 20:48:57 +0300
Subject: [Buildroot] [PATCH] uclibc: arc: Disable usage of atomic ops if
	hardware has no LLSC
Message-ID: <20170419174857.23185-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since uClibc-ng v1.0.20 we may force libc to either use llock/scond
instructions for atomic ops or if those are missing use kernel-assisted
emulation. By defult atomics are used so we disable that feature in libc
if we build for target without LLSC.

This allows us to build and use NPTL on ARC750 for example which was
not possible before.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 45bb6dede..ce7f23f25 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -101,6 +101,12 @@ define UCLIBC_ARC_PAGE_SIZE_CONFIG
 	$(call KCONFIG_ENABLE_OPT,$(UCLIBC_ARC_PAGE_SIZE),$(@D)/.config)
 endef
 
+ifneq ($(BR2_ARC_ATOMIC_EXT),y)
+define UCLIBC_ARC_ATOMICS_CONFIG
+	$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_HAS_ATOMICS,$(@D)/.config)
+endef
+endif
+
 endif # arc
 
 #
@@ -395,6 +401,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_BINFMT_CONFIG)
 	$(UCLIBC_ARC_TYPE_CONFIG)
 	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
+	$(UCLIBC_ARC_ATOMICS_CONFIG)
 	$(UCLIBC_ARM_ABI_CONFIG)
 	$(UCLIBC_ARM_BINFMT_FLAT)
 	$(UCLIBC_ARM_NO_CONTEXT_FUNCS)
-- 
2.11.0
