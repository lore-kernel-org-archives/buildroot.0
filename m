From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Sep 2014 23:16:00 +0200
Subject: [Buildroot] [git commit] strace: upgrade to 4.9, supports ARC
Message-ID: <20140906212914.C61C69D5F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adc8eec4c31ab96b26d9fa822a97d6ac4b373398
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also get rid of the backport patches which are already present upstream.

Tested on ARC with LFS

[Peter: drop incomplete !LFS patch, depend on BR2_LARGEFILE]
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Cc: arc-linux-dev at synopsys.com
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Anton Blanchard <anton@samba.org>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strace/Config.in                           |    6 +-
 ...strace-01-fix-disabled-largefile-syscalls.patch |   21 ----
 .../strace-02-fix-ptrace_peeksiginfo_args.patch    |  100 --------------------
 package/strace/strace-03-update-configure.patch    |   31 ------
 ...xtensa-sort-values-in-struct_user_offsets.patch |   76 ---------------
 package/strace/strace.mk                           |    2 +-
 6 files changed, 6 insertions(+), 230 deletions(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index ded51ba..ad8d308 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
-	depends on !BR2_arc && !BR2_nios2
+	depends on !BR2_nios2
+	depends on BR2_LARGEFILE
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
 	  while it is running.
 
 	  http://sourceforge.net/projects/strace/
+
+comment "strace needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
diff --git a/package/strace/strace-01-fix-disabled-largefile-syscalls.patch b/package/strace/strace-01-fix-disabled-largefile-syscalls.patch
deleted file mode 100644
index 2117a0e..0000000
--- a/package/strace/strace-01-fix-disabled-largefile-syscalls.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- a/syscall.c
-+++ b/syscall.c
-@@ -125,6 +125,18 @@
- #define NF SYSCALL_NEVER_FAILS
- #define MA MAX_ARGS
- 
-+#ifndef HAVE_STATFS64
-+/*
-+ * Ugly hacks for systems that do not have LFS
-+ */
-+
-+#define sys_truncate64  sys_truncate
-+#define sys_ftruncate64 sys_ftruncate
-+#define sys_getdents64  sys_getdents
-+#define sys_statfs64    sys_statfs
-+#define sys_fstatfs64   sys_fstatfs
-+#endif
-+
- const struct_sysent sysent0[] = {
- #include "syscallent.h"
- };
diff --git a/package/strace/strace-02-fix-ptrace_peeksiginfo_args.patch b/package/strace/strace-02-fix-ptrace_peeksiginfo_args.patch
deleted file mode 100644
index 13caddc..0000000
--- a/package/strace/strace-02-fix-ptrace_peeksiginfo_args.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 0b4060f61f1bb101b5d8d084714b7d2feacdb199 Mon Sep 17 00:00:00 2001
-From: Ali Polatel <alip@exherbo.org>
-Date: Tue, 24 Sep 2013 20:04:32 +0300
-Subject: [PATCH 01/29] Work around conflict between <sys/ptrace.h> and
- <linux/ptrace.h>
-
-Since glibc-2.18~39 <sys/ptrace.h> defines ptrace_peeksiginfo_args
-which collides with <linux/ptrace.h>.
-
-* configure.ac: Check for `struct ptrace_peeksiginfo_args' in
-<sys/ptrace.h>.
-* process.c: Work around potential conflict between <sys/ptrace.h>
-and <linux/ptrace.h> by redefining ptrace_peeksiginfo_args.
-* signal.c: Likewise.
-* syscall.c: Likewise.
-* util.c: Likewise.
-
-Signed-off-by: Ali Polatel <alip@exherbo.org>
----
-
-diff --git a/configure.ac b/configure.ac
-index f19e4f2..aa4923a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -257,7 +257,7 @@ AC_CHECK_MEMBERS([struct T_conn_res.QUEUE_ptr,
- 
- AC_CHECK_TYPES([struct __old_kernel_stat],,, [#include <asm/stat.h>])
- 
--AC_CHECK_TYPES([struct pt_all_user_regs, struct ia64_fpreg],,,
-+AC_CHECK_TYPES([struct pt_all_user_regs, struct ia64_fpreg, struct ptrace_peeksiginfo_args],,,
- 	       [#include <sys/ptrace.h>])
- 
- AC_CHECK_TYPES([struct user_desc],,, [#include <asm/ldt.h>])
-diff --git a/process.c b/process.c
-index 1a2181b..59428a4 100644
---- a/process.c
-+++ b/process.c
-@@ -63,7 +63,11 @@
- # ifdef HAVE_STRUCT_PT_ALL_USER_REGS
- #  define pt_all_user_regs XXX_pt_all_user_regs
- # endif
-+# ifdef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
-+#  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
-+# endif
- # include <linux/ptrace.h>
-+# undef ptrace_peeksiginfo_args
- # undef ia64_fpreg
- # undef pt_all_user_regs
- #endif
-diff --git a/signal.c b/signal.c
-index 7fb9abf..3411ddd 100644
---- a/signal.c
-+++ b/signal.c
-@@ -51,7 +51,11 @@
- # ifdef HAVE_STRUCT_PT_ALL_USER_REGS
- #  define pt_all_user_regs XXX_pt_all_user_regs
- # endif
-+# ifdef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
-+#  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
-+# endif
- # include <linux/ptrace.h>
-+# undef ptrace_peeksiginfo_args
- # undef ia64_fpreg
- # undef pt_all_user_regs
- #endif
-diff --git a/syscall.c b/syscall.c
-index 83a95bd..3477dcd 100644
---- a/syscall.c
-+++ b/syscall.c
-@@ -48,7 +48,11 @@
- # ifdef HAVE_STRUCT_PT_ALL_USER_REGS
- #  define pt_all_user_regs XXX_pt_all_user_regs
- # endif
-+# ifdef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
-+#  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
-+# endif
- # include <linux/ptrace.h>
-+# undef ptrace_peeksiginfo_args
- # undef ia64_fpreg
- # undef pt_all_user_regs
- #endif
-diff --git a/util.c b/util.c
-index 0dab902..30a7f19 100644
---- a/util.c
-+++ b/util.c
-@@ -55,7 +55,11 @@
- # ifdef HAVE_STRUCT_PT_ALL_USER_REGS
- #  define pt_all_user_regs XXX_pt_all_user_regs
- # endif
-+# ifdef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
-+#  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
-+# endif
- # include <linux/ptrace.h>
-+# undef ptrace_peeksiginfo_args
- # undef ia64_fpreg
- # undef pt_all_user_regs
- #endif
--- 
-1.8.3.2
-
diff --git a/package/strace/strace-03-update-configure.patch b/package/strace/strace-03-update-configure.patch
deleted file mode 100644
index a5890b8..0000000
--- a/package/strace/strace-03-update-configure.patch
+++ /dev/null
@@ -1,31 +0,0 @@
---- a/configure	2013-12-02 12:31:53.257634249 +1100
-+++ b/configure	2013-12-02 12:32:17.726085888 +1100
-@@ -6389,6 +6389,16 @@
- 
- 
- fi
-+ac_fn_c_check_type "$LINENO" "struct ptrace_peeksiginfo_args" "ac_cv_type_struct_ptrace_peeksiginfo_args" "#include <sys/ptrace.h>
-+"
-+if test "x$ac_cv_type_struct_ptrace_peeksiginfo_args" = xyes; then :
-+
-+cat >>confdefs.h <<_ACEOF
-+#define HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS 1
-+_ACEOF
-+
-+
-+fi
- 
- 
- ac_fn_c_check_type "$LINENO" "struct user_desc" "ac_cv_type_struct_user_desc" "#include <asm/ldt.h>
---- a/config.h.in.orig	2013-12-02 12:44:56.795927681 +1100
-+++ b/config.h.in	2013-12-02 12:45:07.524122894 +1100
-@@ -253,6 +253,9 @@
- /* Define to 1 if `msg_control' is a member of `struct msghdr'. */
- #undef HAVE_STRUCT_MSGHDR_MSG_CONTROL
- 
-+/* Define to 1 if the system has the type `struct ptrace_peeksiginfo_args'. */
-+#undef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
-+
- /* Define to 1 if the system has the type `struct pt_all_user_regs'. */
- #undef HAVE_STRUCT_PT_ALL_USER_REGS
- 
diff --git a/package/strace/strace-04-xtensa-sort-values-in-struct_user_offsets.patch b/package/strace/strace-04-xtensa-sort-values-in-struct_user_offsets.patch
deleted file mode 100644
index 0ef038d..0000000
--- a/package/strace/strace-04-xtensa-sort-values-in-struct_user_offsets.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 57fac759ca0945f5608ed6a2228c697f8fb67cd6 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Wed, 18 Jun 2014 06:04:06 +0400
-Subject: [PATCH] xtensa: sort values in struct_user_offsets
-
-Otherwise ptrace syscall argument decoding is wrong:
-  ptrace(PTRACE_PEEKUSER, 296, syscall_nr, [0x4048eb]) = 0
-  ptrace(PTRACE_PEEKUSER, 296, syscall_nr, [0x3fa6cd30]) = 0
-  ptrace(PTRACE_PEEKUSER, 296, syscall_nr, [0x8040676d]) = 0
-instead of
-  ptrace(PTRACE_PEEKUSER, 296, pc, [0x4048eb]) = 0
-  ptrace(PTRACE_PEEKUSER, 296, a1, [0x3fa6cd30]) = 0
-  ptrace(PTRACE_PEEKUSER, 296, a0, [0x8040676d]) = 0
-
-* process.c (struct_user_offsets) [XTENSA]: Sort values.
----
-Backported from: 57fac759ca0945f5608ed6a2228c697f8fb67cd6
-
- process.c | 34 +++++++++++++++++-----------------
- 1 file changed, 17 insertions(+), 17 deletions(-)
-
-diff --git a/process.c b/process.c
-index a880f9e..2cd0f01 100644
---- a/process.c
-+++ b/process.c
-@@ -1865,6 +1865,23 @@ const struct xlat struct_user_offsets[] = {
- 	{ 4*33, "sr" },
- #endif
- #ifdef XTENSA
-+	{ REG_A_BASE,           "a0"            },
-+	{ REG_A_BASE+1,         "a1"            },
-+	{ REG_A_BASE+2,         "a2"            },
-+	{ REG_A_BASE+3,         "a3"            },
-+	{ REG_A_BASE+4,         "a4"            },
-+	{ REG_A_BASE+5,         "a5"            },
-+	{ REG_A_BASE+6,         "a6"            },
-+	{ REG_A_BASE+7,         "a7"            },
-+	{ REG_A_BASE+8,         "a8"            },
-+	{ REG_A_BASE+9,         "a9"            },
-+	{ REG_A_BASE+10,        "a10"           },
-+	{ REG_A_BASE+11,        "a11"           },
-+	{ REG_A_BASE+12,        "a12"           },
-+	{ REG_A_BASE+13,        "a13"           },
-+	{ REG_A_BASE+14,        "a14"           },
-+	{ REG_A_BASE+15,        "a15"           },
-+	{ REG_PC,               "pc"            },
- 	{ SYSCALL_NR,           "syscall_nr"    },
- 	{ REG_AR_BASE,          "ar0"           },
- 	{ REG_AR_BASE+1,        "ar1"           },
-@@ -1937,23 +1954,6 @@ const struct xlat struct_user_offsets[] = {
- 	{ REG_WB,               "wb"            },
- 	{ REG_WS,               "ws"            },
- 	{ REG_PS,               "ps"            },
--	{ REG_PC,               "pc"            },
--	{ REG_A_BASE,           "a0"            },
--	{ REG_A_BASE+1,         "a1"            },
--	{ REG_A_BASE+2,         "a2"            },
--	{ REG_A_BASE+3,         "a3"            },
--	{ REG_A_BASE+4,         "a4"            },
--	{ REG_A_BASE+5,         "a5"            },
--	{ REG_A_BASE+6,         "a6"            },
--	{ REG_A_BASE+7,         "a7"            },
--	{ REG_A_BASE+8,         "a8"            },
--	{ REG_A_BASE+9,         "a9"            },
--	{ REG_A_BASE+10,        "a10"           },
--	{ REG_A_BASE+11,        "a11"           },
--	{ REG_A_BASE+12,        "a12"           },
--	{ REG_A_BASE+13,        "a13"           },
--	{ REG_A_BASE+14,        "a14"           },
--	{ REG_A_BASE+15,        "a15"           },
- #endif
- 
- 	/* Other fields in "struct user" */
--- 
-1.8.1.4
-
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 9addbb6..2ac3b17 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.8
+STRACE_VERSION = 4.9
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3c
