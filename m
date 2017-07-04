From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 18:57:15 +0200
Subject: [Buildroot] [git commit] package/strace: fix nios2_sp_ptr definition
Message-ID: <20170704165441.6E7AC81E7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6879dc239b1f9d7ac7e749010a0d5a079b8d2d62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch [1] introduced in strace 1.17 uses the old way of accessing
SP register as defined for kernel headers < 4.0. The kernel headers
for nios2 has been changed in commit [2].

This patch updates strace to use the new kernel/userspace interface.

Fixes:
http://autobuild.buildroot.net/results/b9f/b9fc25b82f3280872fe1593ac252a8529ba83576

[1] https://github.com/strace/strace/commit/6117728aacf431a3e3c05761766c776874cc0861
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=92d5dd8cd6e2b211d32d8fbc6cf4b7470765a09f

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: improve a bit the commit log and patch description.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...os2-arch_regs-fix-nios2_sp_ptr-definition.patch | 43 ++++++++++++++++++++++
 package/strace/Config.in                           |  6 +++
 2 files changed, 49 insertions(+)

diff --git a/package/strace/0001-nios2-arch_regs-fix-nios2_sp_ptr-definition.patch b/package/strace/0001-nios2-arch_regs-fix-nios2_sp_ptr-definition.patch
new file mode 100644
index 0000000..7ba03b5
--- /dev/null
+++ b/package/strace/0001-nios2-arch_regs-fix-nios2_sp_ptr-definition.patch
@@ -0,0 +1,43 @@
+From 8a1f47f7963991e5b039282769d0a798d36f9e45 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Tue, 4 Jul 2017 18:06:14 +0200
+Subject: [PATCH] nios2/arch_regs: fix nios2_sp_ptr definition
+
+The patch [1] introduced in strace 1.17s use the old way of accessing
+SP register as defined for kernel headers < 4.0. The kernel headers
+for nios2 have been changed in commit [2].
+
+This patch updates strace to use the new kernel/userspace interface.
+
+Fixes:
+http://autobuild.buildroot.net/results/b9f/b9fc25b82f3280872fe1593ac252a8529ba83576
+
+[1] https://github.com/strace/strace/commit/6117728aacf431a3e3c05761766c776874cc0861
+[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=92d5dd8cd6e2b211d32d8fbc6cf4b7470765a09f
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ linux/nios2/arch_regs.c | 2 +-
+ linux/nios2/arch_regs.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/linux/nios2/arch_regs.c b/linux/nios2/arch_regs.c
+index 8a668bc..c18a3aa 100644
+--- a/linux/nios2/arch_regs.c
++++ b/linux/nios2/arch_regs.c
+@@ -1,4 +1,4 @@
+ static struct user_pt_regs nios2_regs;
+-unsigned long *const nios2_sp_ptr = &nios2_regs.sp;
++unsigned int *const nios2_sp_ptr = &nios2_regs.regs[PTR_SP];
+ # define ARCH_REGS_FOR_GETREGSET nios2_regs
+ #define ARCH_PC_REG nios2_regs.regs[PTR_EA]
+diff --git a/linux/nios2/arch_regs.h b/linux/nios2/arch_regs.h
+index 7f344b5..c4230ed 100644
+--- a/linux/nios2/arch_regs.h
++++ b/linux/nios2/arch_regs.h
+@@ -1 +1 @@
+-extern unsigned long *const nios2_sp_ptr;
++extern unsigned int *const nios2_sp_ptr;
+-- 
+2.9.4
+
diff --git a/package/strace/Config.in b/package/strace/Config.in
index bbb582a..501c964 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,8 +1,14 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
+	# needs at least kernel headers 4.0 on nios2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0 || !BR2_nios2
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
 	  while it is running.
 
 	  http://sourceforge.net/projects/strace/
+
+comment "strace needs a toolchain w/ headers >= 4.0 on nios2"
+	depends on BR2_nios2
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
