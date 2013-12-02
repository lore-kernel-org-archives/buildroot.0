From: Anton Blanchard <anton@samba.org>
Date: Mon, 2 Dec 2013 17:33:37 +1100
Subject: [Buildroot] [PATCH] strace: Fix build issue with duplicate
 ptrace_peeksiginfo_args definition
Message-ID: <20131202173337.730038ed@kryten>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Backport a patch from upstream to fix a conflict between glibc
headers and recent kernel headers (v3.10 or newer).
    
Signed-off-by: Anton Blanchard <anton@samba.org>
---

Since it would not autoreconf cleanly, I included a separate patch that
made the configure changes. Not sure if the preference is to roll that
into an upstream patch, or to provide it separately.


diff --git a/package/strace/strace-fix-ptrace_peeksiginfo_args.patch b/package/strace/strace-fix-ptrace_peeksiginfo_args.patch
new file mode 100644
index 0000000..13caddc
--- /dev/null
+++ b/package/strace/strace-fix-ptrace_peeksiginfo_args.patch
@@ -0,0 +1,100 @@
+From 0b4060f61f1bb101b5d8d084714b7d2feacdb199 Mon Sep 17 00:00:00 2001
+From: Ali Polatel <alip@exherbo.org>
+Date: Tue, 24 Sep 2013 20:04:32 +0300
+Subject: [PATCH 01/29] Work around conflict between <sys/ptrace.h> and
+ <linux/ptrace.h>
+
+Since glibc-2.18~39 <sys/ptrace.h> defines ptrace_peeksiginfo_args
+which collides with <linux/ptrace.h>.
+
+* configure.ac: Check for `struct ptrace_peeksiginfo_args' in
+<sys/ptrace.h>.
+* process.c: Work around potential conflict between <sys/ptrace.h>
+and <linux/ptrace.h> by redefining ptrace_peeksiginfo_args.
+* signal.c: Likewise.
+* syscall.c: Likewise.
+* util.c: Likewise.
+
+Signed-off-by: Ali Polatel <alip@exherbo.org>
+---
+
+diff --git a/configure.ac b/configure.ac
+index f19e4f2..aa4923a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -257,7 +257,7 @@ AC_CHECK_MEMBERS([struct T_conn_res.QUEUE_ptr,
+ 
+ AC_CHECK_TYPES([struct __old_kernel_stat],,, [#include <asm/stat.h>])
+ 
+-AC_CHECK_TYPES([struct pt_all_user_regs, struct ia64_fpreg],,,
++AC_CHECK_TYPES([struct pt_all_user_regs, struct ia64_fpreg, struct ptrace_peeksiginfo_args],,,
+ 	       [#include <sys/ptrace.h>])
+ 
+ AC_CHECK_TYPES([struct user_desc],,, [#include <asm/ldt.h>])
+diff --git a/process.c b/process.c
+index 1a2181b..59428a4 100644
+--- a/process.c
++++ b/process.c
+@@ -63,7 +63,11 @@
+ # ifdef HAVE_STRUCT_PT_ALL_USER_REGS
+ #  define pt_all_user_regs XXX_pt_all_user_regs
+ # endif
++# ifdef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
++#  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
++# endif
+ # include <linux/ptrace.h>
++# undef ptrace_peeksiginfo_args
+ # undef ia64_fpreg
+ # undef pt_all_user_regs
+ #endif
+diff --git a/signal.c b/signal.c
+index 7fb9abf..3411ddd 100644
+--- a/signal.c
++++ b/signal.c
+@@ -51,7 +51,11 @@
+ # ifdef HAVE_STRUCT_PT_ALL_USER_REGS
+ #  define pt_all_user_regs XXX_pt_all_user_regs
+ # endif
++# ifdef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
++#  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
++# endif
+ # include <linux/ptrace.h>
++# undef ptrace_peeksiginfo_args
+ # undef ia64_fpreg
+ # undef pt_all_user_regs
+ #endif
+diff --git a/syscall.c b/syscall.c
+index 83a95bd..3477dcd 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -48,7 +48,11 @@
+ # ifdef HAVE_STRUCT_PT_ALL_USER_REGS
+ #  define pt_all_user_regs XXX_pt_all_user_regs
+ # endif
++# ifdef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
++#  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
++# endif
+ # include <linux/ptrace.h>
++# undef ptrace_peeksiginfo_args
+ # undef ia64_fpreg
+ # undef pt_all_user_regs
+ #endif
+diff --git a/util.c b/util.c
+index 0dab902..30a7f19 100644
+--- a/util.c
++++ b/util.c
+@@ -55,7 +55,11 @@
+ # ifdef HAVE_STRUCT_PT_ALL_USER_REGS
+ #  define pt_all_user_regs XXX_pt_all_user_regs
+ # endif
++# ifdef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
++#  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
++# endif
+ # include <linux/ptrace.h>
++# undef ptrace_peeksiginfo_args
+ # undef ia64_fpreg
+ # undef pt_all_user_regs
+ #endif
+-- 
+1.8.3.2
+
diff --git a/package/strace/strace-update-configure.patch b/package/strace/strace-update-configure.patch
new file mode 100644
index 0000000..a5890b8
--- /dev/null
+++ b/package/strace/strace-update-configure.patch
@@ -0,0 +1,31 @@
+--- a/configure	2013-12-02 12:31:53.257634249 +1100
++++ b/configure	2013-12-02 12:32:17.726085888 +1100
+@@ -6389,6 +6389,16 @@
+ 
+ 
+ fi
++ac_fn_c_check_type "$LINENO" "struct ptrace_peeksiginfo_args" "ac_cv_type_struct_ptrace_peeksiginfo_args" "#include <sys/ptrace.h>
++"
++if test "x$ac_cv_type_struct_ptrace_peeksiginfo_args" = xyes; then :
++
++cat >>confdefs.h <<_ACEOF
++#define HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS 1
++_ACEOF
++
++
++fi
+ 
+ 
+ ac_fn_c_check_type "$LINENO" "struct user_desc" "ac_cv_type_struct_user_desc" "#include <asm/ldt.h>
+--- a/config.h.in.orig	2013-12-02 12:44:56.795927681 +1100
++++ b/config.h.in	2013-12-02 12:45:07.524122894 +1100
+@@ -253,6 +253,9 @@
+ /* Define to 1 if `msg_control' is a member of `struct msghdr'. */
+ #undef HAVE_STRUCT_MSGHDR_MSG_CONTROL
+ 
++/* Define to 1 if the system has the type `struct ptrace_peeksiginfo_args'. */
++#undef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
++
+ /* Define to 1 if the system has the type `struct pt_all_user_regs'. */
+ #undef HAVE_STRUCT_PT_ALL_USER_REGS
+ 
