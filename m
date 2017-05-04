From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 22:51:58 +0200
Subject: [Buildroot] [git commit] uclibc: arc: Disable usage of atomic ops
	if hardware has no LLSC
Message-ID: <20170504205353.273AD82897@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64c67e07fa40e1af1a9dbba907a0117765b16c16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since uClibc-ng v1.0.20 we can force libc to either use llock/scond
instructions for atomic ops or if those are missing use kernel-assisted
emulation. By default atomics are used so we disable that feature in
libc if we build for a target without LLSC.

This allows us to build and use NPTL on ARC750 for example which was not
possible before.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index f47b3ec..bbf389e 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -101,6 +101,12 @@ define UCLIBC_ARC_PAGE_SIZE_CONFIG
 	$(call KCONFIG_ENABLE_OPT,$(UCLIBC_ARC_PAGE_SIZE),$(@D)/.config)
 endef
 
+ifeq ($(BR2_ARC_ATOMIC_EXT),)
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
