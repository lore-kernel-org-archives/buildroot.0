From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 30 Apr 2019 18:49:39 +0300
Subject: [Buildroot] [PATCH] package/strace: bump to version 5.0
Message-ID: <39ef9883c366dd8055a3465590f13c6cb7ddcaa6.1556639379.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patches; issues fixed upstream.

Update license file hash due to copyright year update.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-Fix-build-for-no-MMU-targets.patch   | 49 -------------
 .../0002-Fix-build-for-mips-targets.patch     | 68 -------------------
 package/strace/strace.hash                    |  6 +-
 package/strace/strace.mk                      |  2 +-
 4 files changed, 4 insertions(+), 121 deletions(-)
 delete mode 100644 package/strace/0001-Fix-build-for-no-MMU-targets.patch
 delete mode 100644 package/strace/0002-Fix-build-for-mips-targets.patch

diff --git a/package/strace/0001-Fix-build-for-no-MMU-targets.patch b/package/strace/0001-Fix-build-for-no-MMU-targets.patch
deleted file mode 100644
index 1464fb697de8..000000000000
--- a/package/strace/0001-Fix-build-for-no-MMU-targets.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 1b657bf8e2f4bf6f80b969b220900003d7ecbce6 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 8 Jan 2019 18:28:37 +0200
-Subject: [PATCH] Fix build for no-MMU targets
-
-Commit 7488ce9e23f1 ("Check whether PTRACE_GET_SYSCALL_INFO is supported
-by the kernel") added a fork() call in test_ptrace_get_syscall_info()
-which is included in the main strace executable code. Although the
-test_ptrace_get_syscall_info() routine is not called on no-MMU targets,
-the compiler can't optimize it out because it is a global symbol. So
-build for no-MMU targets currently fails:
-
-strace-ptrace_syscall_info.o: In function `test_ptrace_get_syscall_info':
-ptrace_syscall_info.c:(.text+0x1c): undefined reference to `fork'
-
-Make the test_ptrace_get_syscall_info() definition depend on HAVE_FORK
-to fix that.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status:
-https://lists.strace.io/pipermail/strace-devel/2019-January/008596.html
-
- ptrace_syscall_info.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/ptrace_syscall_info.c b/ptrace_syscall_info.c
-index 55eafddf7f71..cc6ce149649e 100644
---- a/ptrace_syscall_info.c
-+++ b/ptrace_syscall_info.c
-@@ -40,6 +40,7 @@ static const unsigned int expected_seccomp_size =
-  * Test that PTRACE_GET_SYSCALL_INFO API is supported by the kernel, and
-  * that the semantics implemented in the kernel matches our expectations.
-  */
-+#ifdef HAVE_FORK
- bool
- test_ptrace_get_syscall_info(void)
- {
-@@ -255,6 +256,7 @@ done:
- 
- 	return ptrace_get_syscall_info_supported;
- }
-+#endif /* HAVE_FORK */
- 
- void
- print_ptrace_syscall_info(struct tcb *tcp, kernel_ulong_t addr,
--- 
-2.20.1
-
diff --git a/package/strace/0002-Fix-build-for-mips-targets.patch b/package/strace/0002-Fix-build-for-mips-targets.patch
deleted file mode 100644
index 430d4071bb55..000000000000
--- a/package/strace/0002-Fix-build-for-mips-targets.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 8150854b5dd030a47f601931daf827ca33bc9bd9 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 8 Jan 2019 19:52:21 +0200
-Subject: [PATCH] Fix build for mips targets
-
-Commit 917c2ccf3a67 ("Refactor stack pointers") removed
-linux/mips/arch_regs.h that defines mips_REG_* macros and struct
-mips_regs. These symbols are referenced in mips code. Restore
-arch_regs.h to fix the build failure:
-
-syscall.c: In function 'decode_syscall_subcall':
-syscall.c:370:7: error: 'mips_REG_SP' undeclared (first use in this function)
-       mips_REG_SP + MAX_ARGS * sizeof(tcp->u_arg[0]),
-	   ^~~~~~~~~~~
-
-[ baruch: drop the Makefile.in hunk to avoid autoreconf ]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status:
-https://lists.strace.io/pipermail/strace-devel/2019-January/008598.html
-
- linux/mips/arch_regs.c |  4 +---
- linux/mips/arch_regs.h | 18 ++++++++++++++++++
- 3 files changed, 20 insertions(+), 3 deletions(-)
- create mode 100644 linux/mips/arch_regs.h
-
-diff --git a/linux/mips/arch_regs.c b/linux/mips/arch_regs.c
-index 0874e31efea4..3ed841ee7c1a 100644
---- a/linux/mips/arch_regs.c
-+++ b/linux/mips/arch_regs.c
-@@ -5,9 +5,7 @@
-  * SPDX-License-Identifier: LGPL-2.1-or-later
-  */
- 
--static struct {
--	uint64_t uregs[38];
--} mips_regs;
-+struct mips_regs mips_regs; /* not static */
- 
- #define REG_V0 2
- #define REG_A0 4
-diff --git a/linux/mips/arch_regs.h b/linux/mips/arch_regs.h
-new file mode 100644
-index 000000000000..6372badce646
---- /dev/null
-+++ b/linux/mips/arch_regs.h
-@@ -0,0 +1,18 @@
-+struct mips_regs {
-+	uint64_t uregs[38];
-+};
-+
-+extern struct mips_regs mips_regs;
-+
-+#define REG_V0 2
-+#define REG_A0 4
-+
-+#define mips_REG_V0 mips_regs.uregs[REG_V0]
-+#define mips_REG_A0 mips_regs.uregs[REG_A0 + 0]
-+#define mips_REG_A1 mips_regs.uregs[REG_A0 + 1]
-+#define mips_REG_A2 mips_regs.uregs[REG_A0 + 2]
-+#define mips_REG_A3 mips_regs.uregs[REG_A0 + 3]
-+#define mips_REG_A4 mips_regs.uregs[REG_A0 + 4]
-+#define mips_REG_A5 mips_regs.uregs[REG_A0 + 5]
-+#define mips_REG_SP mips_regs.uregs[29]
-+#define mips_REG_EPC mips_regs.uregs[34]
--- 
-2.20.1
-
diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index fe58f2391af3..bcd09315f1bf 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/4.26/strace-4.26.tar.xz
-sha256	7c4d2ffeef4f7d1cdc71062ca78d1130eb52f947c2fca82f59f6a1183bfa1e1c	strace-4.26.tar.xz
-sha256	ba6d645dfe0f5e13bf1f117f0595e90076b845fc9aaa1d5778699792bb2d70b2	COPYING
+# https://strace.io/files/5.0/strace-5.0.tar.xz.asc
+sha256	3b7ad77eb2b81dc6078046a9cc56eed5242b67b63748e7fc28f7c2daf4e647da	strace-5.0.tar.xz
+sha256	739b2725197137a04ab48ee6b19da3fdf7e497249e0dedd9f51c11a570401ede	COPYING
 sha256	7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa	LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index afcd5e71f062..0f705a2fb8ae 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.26
+STRACE_VERSION = 5.0
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.20.1
