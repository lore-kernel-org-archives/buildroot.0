From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 20 Sep 2010 14:57:49 -0700
Subject: [Buildroot] [PATCH 2/3] m4: bump to 1.4.15
Message-ID: <1285019870-30224-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/m4/m4-1.4.15-00-MB_CUR_MAX.patch        |   13 ++++++++++++
 package/m4/m4-1.4.15-01-spawn-sched_param.patch |   20 +++++++++++++++++++
 package/m4/m4-1.4.8-001-MB_CUR_MAX.patch        |   13 ------------
 package/m4/m4-1.4.9-002-no-wchar.patch          |   24 -----------------------
 package/m4/m4.mk                                |    6 +----
 5 files changed, 34 insertions(+), 42 deletions(-)
 create mode 100644 package/m4/m4-1.4.15-00-MB_CUR_MAX.patch
 create mode 100644 package/m4/m4-1.4.15-01-spawn-sched_param.patch
 delete mode 100644 package/m4/m4-1.4.8-001-MB_CUR_MAX.patch
 delete mode 100644 package/m4/m4-1.4.9-002-no-wchar.patch

diff --git a/package/m4/m4-1.4.15-00-MB_CUR_MAX.patch b/package/m4/m4-1.4.15-00-MB_CUR_MAX.patch
new file mode 100644
index 0000000..fce3673
--- /dev/null
+++ b/package/m4/m4-1.4.15-00-MB_CUR_MAX.patch
@@ -0,0 +1,13 @@
+--- m4-1.4.8.orig/lib/regcomp.c	2006-09-24 06:28:37.000000000 +0200
++++ m4-1.4.8/lib/regcomp.c	2007-01-06 20:53:10.000000000 +0100
+@@ -871,6 +871,10 @@ init_dfa (re_dfa_t *dfa, size_t pat_len)
+   dfa->state_table = calloc (sizeof (struct re_state_table_entry), table_size);
+   dfa->state_hash_mask = table_size - 1;
+ 
++#ifndef MB_CUR_MAX
++#define MB_CUR_MAX (0)
++#endif
++
+   dfa->mb_cur_max = MB_CUR_MAX;
+ #ifdef _LIBC
+   if (dfa->mb_cur_max == 6
diff --git a/package/m4/m4-1.4.15-01-spawn-sched_param.patch b/package/m4/m4-1.4.15-01-spawn-sched_param.patch
new file mode 100644
index 0000000..d43db9f
--- /dev/null
+++ b/package/m4/m4-1.4.15-01-spawn-sched_param.patch
@@ -0,0 +1,20 @@
+"Apparently, glibc's headers expose the full definition of "struct
+sched_param" in cases not required by the standard, and gnulib attempts to
+optimize based on this. uClibc does not share glibc's behavior in this one
+case, but since it defines __GLIBC__, gnulib sees no need for caution."
+
+Per Michael Deutschmann
+
+See http://lists.busybox.net/pipermail/uclibc/2010-March/043721.html
+
+--- bison-2.4.3-orig/lib/spawn.in.h	2010-04-11 11:31:37.000000000 -0700
++++ bison-2.4.3/lib/spawn.in.h	2010-09-18 15:42:05.000000000 -0700
+@@ -31,7 +31,7 @@
+ 
+ /* Get definitions of 'struct sched_param' and 'sigset_t'.
+    But avoid namespace pollution on glibc systems.  */
+-#ifndef __GLIBC__
++#if defined __UCLIBC__ || !defined __GLIBC__
+ # include <sched.h>
+ # include <signal.h>
+ #endif
diff --git a/package/m4/m4-1.4.8-001-MB_CUR_MAX.patch b/package/m4/m4-1.4.8-001-MB_CUR_MAX.patch
deleted file mode 100644
index fce3673..0000000
--- a/package/m4/m4-1.4.8-001-MB_CUR_MAX.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- m4-1.4.8.orig/lib/regcomp.c	2006-09-24 06:28:37.000000000 +0200
-+++ m4-1.4.8/lib/regcomp.c	2007-01-06 20:53:10.000000000 +0100
-@@ -871,6 +871,10 @@ init_dfa (re_dfa_t *dfa, size_t pat_len)
-   dfa->state_table = calloc (sizeof (struct re_state_table_entry), table_size);
-   dfa->state_hash_mask = table_size - 1;
- 
-+#ifndef MB_CUR_MAX
-+#define MB_CUR_MAX (0)
-+#endif
-+
-   dfa->mb_cur_max = MB_CUR_MAX;
- #ifdef _LIBC
-   if (dfa->mb_cur_max == 6
diff --git a/package/m4/m4-1.4.9-002-no-wchar.patch b/package/m4/m4-1.4.9-002-no-wchar.patch
deleted file mode 100644
index 7b67295..0000000
--- a/package/m4/m4-1.4.9-002-no-wchar.patch
+++ /dev/null
@@ -1,24 +0,0 @@
---- m4-1.4.9/lib/printf-args-orig.h	2007-03-23 05:50:53.000000000 -0700
-+++ m4-1.4.9/lib/printf-args.h	2010-09-18 19:09:21.000000000 -0700
-@@ -29,6 +29,9 @@
- /* Get wint_t.  */
- #if HAVE_WINT_T
- # include <wchar.h>
-+# ifndef __UCLIBC_HAS_WCHAR__
-+typedef int wint_t;
-+# endif
- #endif
- 
- /* Get va_list.  */
---- m4-1.4.9/lib/wctype_-orig.h	2010-09-18 19:13:07.000000000 -0700
-+++ m4-1.4.9/lib/wctype_.h	2010-09-18 19:09:21.000000000 -0700
-@@ -39,6 +39,9 @@
- # include <stdio.h>
- # include <time.h>
- # include <wchar.h>
-+# ifndef __UCLIBC_HAS_WCHAR__
-+typedef int wint_t;
-+# endif
- typedef wint_t __wctype_wint_t;
- #else
- typedef int __wctype_wint_t;
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index a0b56c4..da38ce4 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -3,7 +3,7 @@
 # m4
 #
 #############################################################
-M4_VERSION = 1.4.9
+M4_VERSION = 1.4.15
 M4_SOURCE = m4-$(M4_VERSION).tar.bz2
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 
@@ -13,10 +13,6 @@ endif
 
 M4_CONF_ENV = gl_cv_func_gettimeofday_clobber=no
 
-ifneq ($(BR2_USE_WCHAR),y)
-M4_CONF_ENV += gt_cv_c_wchar_t=no gl_cv_absolute_wchar_h=__fpending.h
-endif
-
 HOST_M4_CONF_OPT = --disable-static
 
 $(eval $(call AUTOTARGETS,package,m4))
-- 
1.7.2.3
