From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Fri, 14 Jul 2017 16:45:45 +0300
Subject: [Buildroot] [PATCH] strace: Bumps version to 4.18.
Message-ID: <20170714134545.13494-1-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps strace package to 4.18 upstream version.

Important notes:
	1)0001-nios2-arch_regs-fix-nios2_sp_ptr-definition.patch has been removed 
	 because it is part of 4.18.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
---
 ...os2-arch_regs-fix-nios2_sp_ptr-definition.patch | 43 ----------------------
 package/strace/strace.hash                         |  4 +-
 package/strace/strace.mk                           |  2 +-
 3 files changed, 3 insertions(+), 46 deletions(-)
 delete mode 100644 package/strace/0001-nios2-arch_regs-fix-nios2_sp_ptr-definition.patch

diff --git a/package/strace/0001-nios2-arch_regs-fix-nios2_sp_ptr-definition.patch b/package/strace/0001-nios2-arch_regs-fix-nios2_sp_ptr-definition.patch
deleted file mode 100644
index 7ba03b57e..000000000
--- a/package/strace/0001-nios2-arch_regs-fix-nios2_sp_ptr-definition.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 8a1f47f7963991e5b039282769d0a798d36f9e45 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 4 Jul 2017 18:06:14 +0200
-Subject: [PATCH] nios2/arch_regs: fix nios2_sp_ptr definition
-
-The patch [1] introduced in strace 1.17s use the old way of accessing
-SP register as defined for kernel headers < 4.0. The kernel headers
-for nios2 have been changed in commit [2].
-
-This patch updates strace to use the new kernel/userspace interface.
-
-Fixes:
-http://autobuild.buildroot.net/results/b9f/b9fc25b82f3280872fe1593ac252a8529ba83576
-
-[1] https://github.com/strace/strace/commit/6117728aacf431a3e3c05761766c776874cc0861
-[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=92d5dd8cd6e2b211d32d8fbc6cf4b7470765a09f
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- linux/nios2/arch_regs.c | 2 +-
- linux/nios2/arch_regs.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/linux/nios2/arch_regs.c b/linux/nios2/arch_regs.c
-index 8a668bc..c18a3aa 100644
---- a/linux/nios2/arch_regs.c
-+++ b/linux/nios2/arch_regs.c
-@@ -1,4 +1,4 @@
- static struct user_pt_regs nios2_regs;
--unsigned long *const nios2_sp_ptr = &nios2_regs.sp;
-+unsigned int *const nios2_sp_ptr = &nios2_regs.regs[PTR_SP];
- # define ARCH_REGS_FOR_GETREGSET nios2_regs
- #define ARCH_PC_REG nios2_regs.regs[PTR_EA]
-diff --git a/linux/nios2/arch_regs.h b/linux/nios2/arch_regs.h
-index 7f344b5..c4230ed 100644
---- a/linux/nios2/arch_regs.h
-+++ b/linux/nios2/arch_regs.h
-@@ -1 +1 @@
--extern unsigned long *const nios2_sp_ptr;
-+extern unsigned int *const nios2_sp_ptr;
--- 
-2.9.4
-
diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index fbd93202b..b5c4c7932 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,3 +1,3 @@
 # From https://sourceforge.net/projects/strace/files/strace/4.17/
-md5	8d7eb10eba68bad83a269197e634b626	strace-4.17.tar.xz
-sha1	a60558a10757e41a39ee9e357d1d03d91d5d94d8	strace-4.17.tar.xz
+md5	3579b3266bb096cebaefbe2cdb1a3a78	strace-4.18.tar.xz
+sha1	ac2e6f746260dd71f6d22920d9ca8f4bfbe708a8	strace-4.18.tar.xz
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 119c9f564..c4c45233c 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.17
+STRACE_VERSION = 4.18
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3-Clause
-- 
2.11.0
