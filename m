From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 22:59:18 +0100
Subject: [Buildroot] [git commit branch/next] gcc: add the real gcc bugfix
 for m68k from upstream
Message-ID: <20180225220011.92A71881F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc73a401be45de4cabb49a55822d3730dc6add37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/4.9.4/0002-m68k-coldfire-pr68467.patch | 48 ++++++++++++++++++++++
 package/gcc/4.9.4/891-fix-m68k-uclinux.patch       | 18 --------
 package/gcc/5.5.0/0001-m68k-coldfire-pr68467.patch | 48 ++++++++++++++++++++++
 package/gcc/5.5.0/891-fix-m68k-uclinux.patch       | 18 --------
 package/gcc/6.4.0/0001-m68k-coldfire-pr68467.patch | 48 ++++++++++++++++++++++
 package/gcc/6.4.0/891-fix-m68k-uclinux.patch       | 18 --------
 package/gcc/7.3.0/0001-m68k-coldfire-pr68467.patch | 48 ++++++++++++++++++++++
 package/gcc/7.3.0/0891-fix-m68k-uclinux.patch      | 30 --------------
 8 files changed, 192 insertions(+), 84 deletions(-)

diff --git a/package/gcc/4.9.4/0002-m68k-coldfire-pr68467.patch b/package/gcc/4.9.4/0002-m68k-coldfire-pr68467.patch
new file mode 100644
index 0000000000..d701ab6878
--- /dev/null
+++ b/package/gcc/4.9.4/0002-m68k-coldfire-pr68467.patch
@@ -0,0 +1,48 @@
+Backport from upstream, see
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68467
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-4.9.4.orig/gcc/config/m68k/m68k.c gcc-4.9.4/gcc/config/m68k/m68k.c
+--- gcc-4.9.4.orig/gcc/config/m68k/m68k.c	2014-02-27 12:10:55.000000000 +0100
++++ gcc-4.9.4/gcc/config/m68k/m68k.c	2018-02-17 21:28:53.430538916 +0100
+@@ -166,6 +166,8 @@
+ 			      const_tree, bool);
+ static bool m68k_cannot_force_const_mem (enum machine_mode mode, rtx x);
+ static bool m68k_output_addr_const_extra (FILE *, rtx);
++static machine_mode m68k_promote_function_mode (const_tree, machine_mode,
++						int *, const_tree, int);
+ static void m68k_init_sync_libfuncs (void) ATTRIBUTE_UNUSED;
+ 
+ /* Initialize the GCC target structure.  */
+@@ -308,6 +310,9 @@
+ #undef TARGET_ATOMIC_TEST_AND_SET_TRUEVAL
+ #define TARGET_ATOMIC_TEST_AND_SET_TRUEVAL 128
+ 
++#undef TARGET_PROMOTE_FUNCTION_MODE
++#define TARGET_PROMOTE_FUNCTION_MODE m68k_promote_function_mode
++
+ static const struct attribute_spec m68k_attribute_table[] =
+ {
+   /* { name, min_len, max_len, decl_req, type_req, fn_type_req, handler,
+@@ -6527,4 +6532,20 @@
+ 	      == m68k_fk_interrupt_handler));
+ }
+ 
++/* Implement TARGET_PROMOTE_FUNCTION_MODE.  */
++
++static machine_mode
++m68k_promote_function_mode (const_tree type, machine_mode mode,
++                            int *punsignedp ATTRIBUTE_UNUSED,
++                            const_tree fntype ATTRIBUTE_UNUSED,
++                            int for_return)
++{
++  /* Promote libcall arguments narrower than int to match the normal C
++     ABI (for which promotions are handled via
++     TARGET_PROMOTE_PROTOTYPES).  */
++  if (type == NULL_TREE && !for_return && (mode == QImode || mode == HImode))
++    return SImode;
++  return mode;
++}
++
+ #include "gt-m68k.h"
diff --git a/package/gcc/4.9.4/891-fix-m68k-uclinux.patch b/package/gcc/4.9.4/891-fix-m68k-uclinux.patch
deleted file mode 100644
index 4347642d67..0000000000
--- a/package/gcc/4.9.4/891-fix-m68k-uclinux.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-avoids internal compiler error while compiling linux-atomic.c
-See here:
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53833
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gcc-4.9.3.orig/libgcc/config.host gcc-4.9.3/libgcc/config.host
---- gcc-4.9.3.orig/libgcc/config.host	2014-03-27 16:40:31.000000000 +0100
-+++ gcc-4.9.3/libgcc/config.host	2016-04-05 16:20:53.422809885 +0200
-@@ -750,7 +750,7 @@
- m68k*-*-openbsd*)
- 	;;
- m68k-*-uclinux*)	# Motorola m68k/ColdFire running uClinux with uClibc
--	tmake_file="$tmake_file m68k/t-floatlib m68k/t-linux"
-+	tmake_file="$tmake_file m68k/t-floatlib"
- 	md_unwind_header=m68k/linux-unwind.h
- 	;;
- m68k-*-linux*)			# Motorola m68k's running GNU/Linux
diff --git a/package/gcc/5.5.0/0001-m68k-coldfire-pr68467.patch b/package/gcc/5.5.0/0001-m68k-coldfire-pr68467.patch
new file mode 100644
index 0000000000..75ad536054
--- /dev/null
+++ b/package/gcc/5.5.0/0001-m68k-coldfire-pr68467.patch
@@ -0,0 +1,48 @@
+Backport from upstream, see
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68467
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-5.5.0.orig/gcc/config/m68k/m68k.c gcc-5.5.0/gcc/config/m68k/m68k.c
+--- gcc-5.5.0.orig/gcc/config/m68k/m68k.c	2015-01-15 14:28:42.000000000 +0100
++++ gcc-5.5.0/gcc/config/m68k/m68k.c	2018-02-17 19:34:33.146309632 +0100
+@@ -196,6 +196,8 @@
+ 			      const_tree, bool);
+ static bool m68k_cannot_force_const_mem (machine_mode mode, rtx x);
+ static bool m68k_output_addr_const_extra (FILE *, rtx);
++static machine_mode m68k_promote_function_mode (const_tree, machine_mode,
++						int *, const_tree, int);
+ static void m68k_init_sync_libfuncs (void) ATTRIBUTE_UNUSED;
+ 
+ /* Initialize the GCC target structure.  */
+@@ -338,6 +340,9 @@
+ #undef TARGET_ATOMIC_TEST_AND_SET_TRUEVAL
+ #define TARGET_ATOMIC_TEST_AND_SET_TRUEVAL 128
+ 
++#undef TARGET_PROMOTE_FUNCTION_MODE
++#define TARGET_PROMOTE_FUNCTION_MODE m68k_promote_function_mode
++
+ static const struct attribute_spec m68k_attribute_table[] =
+ {
+   /* { name, min_len, max_len, decl_req, type_req, fn_type_req, handler,
+@@ -6548,4 +6553,20 @@
+ 	      == m68k_fk_interrupt_handler));
+ }
+ 
++/* Implement TARGET_PROMOTE_FUNCTION_MODE.  */
++
++static machine_mode
++m68k_promote_function_mode (const_tree type, machine_mode mode,
++                            int *punsignedp ATTRIBUTE_UNUSED,
++                            const_tree fntype ATTRIBUTE_UNUSED,
++                            int for_return)
++{
++  /* Promote libcall arguments narrower than int to match the normal C
++     ABI (for which promotions are handled via
++     TARGET_PROMOTE_PROTOTYPES).  */
++  if (type == NULL_TREE && !for_return && (mode == QImode || mode == HImode))
++    return SImode;
++  return mode;
++}
++
+ #include "gt-m68k.h"
diff --git a/package/gcc/5.5.0/891-fix-m68k-uclinux.patch b/package/gcc/5.5.0/891-fix-m68k-uclinux.patch
deleted file mode 100644
index 4e186bd3d3..0000000000
--- a/package/gcc/5.5.0/891-fix-m68k-uclinux.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-avoids internal compiler error while compiling linux-atomic.c
-See here:
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53833
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gcc-5.3.0.orig/libgcc/config.host gcc-5.3.0/libgcc/config.host
---- gcc-5.3.0.orig/libgcc/config.host	2015-10-01 14:01:18.000000000 +0200
-+++ gcc-5.3.0/libgcc/config.host	2016-04-26 21:30:25.353691745 +0200
-@@ -794,7 +794,7 @@
- m68k*-*-openbsd*)
- 	;;
- m68k-*-uclinux*)	# Motorola m68k/ColdFire running uClinux with uClibc
--	tmake_file="$tmake_file m68k/t-floatlib m68k/t-linux"
-+	tmake_file="$tmake_file m68k/t-floatlib"
- 	md_unwind_header=m68k/linux-unwind.h
- 	;;
- m68k-*-linux*)			# Motorola m68k's running GNU/Linux
diff --git a/package/gcc/6.4.0/0001-m68k-coldfire-pr68467.patch b/package/gcc/6.4.0/0001-m68k-coldfire-pr68467.patch
new file mode 100644
index 0000000000..afc18a508e
--- /dev/null
+++ b/package/gcc/6.4.0/0001-m68k-coldfire-pr68467.patch
@@ -0,0 +1,48 @@
+Backport from upstream, see
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68467
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-6.4.0.orig/gcc/config/m68k/m68k.c gcc-6.4.0/gcc/config/m68k/m68k.c
+--- gcc-6.4.0.orig/gcc/config/m68k/m68k.c	2016-01-04 15:30:50.652828000 +0100
++++ gcc-6.4.0/gcc/config/m68k/m68k.c	2018-02-17 19:08:16.313168186 +0100
+@@ -180,6 +180,8 @@
+ 			      const_tree, bool);
+ static bool m68k_cannot_force_const_mem (machine_mode mode, rtx x);
+ static bool m68k_output_addr_const_extra (FILE *, rtx);
++static machine_mode m68k_promote_function_mode (const_tree, machine_mode,
++						int *, const_tree, int);
+ static void m68k_init_sync_libfuncs (void) ATTRIBUTE_UNUSED;
+ 
+ /* Initialize the GCC target structure.  */
+@@ -322,6 +324,9 @@
+ #undef TARGET_ATOMIC_TEST_AND_SET_TRUEVAL
+ #define TARGET_ATOMIC_TEST_AND_SET_TRUEVAL 128
+ 
++#undef TARGET_PROMOTE_FUNCTION_MODE
++#define TARGET_PROMOTE_FUNCTION_MODE m68k_promote_function_mode
++
+ static const struct attribute_spec m68k_attribute_table[] =
+ {
+   /* { name, min_len, max_len, decl_req, type_req, fn_type_req, handler,
+@@ -6524,4 +6529,20 @@
+ 	      == m68k_fk_interrupt_handler));
+ }
+ 
++/* Implement TARGET_PROMOTE_FUNCTION_MODE.  */
++
++static machine_mode
++m68k_promote_function_mode (const_tree type, machine_mode mode,
++                            int *punsignedp ATTRIBUTE_UNUSED,
++                            const_tree fntype ATTRIBUTE_UNUSED,
++                            int for_return)
++{
++  /* Promote libcall arguments narrower than int to match the normal C
++     ABI (for which promotions are handled via
++     TARGET_PROMOTE_PROTOTYPES).  */
++  if (type == NULL_TREE && !for_return && (mode == QImode || mode == HImode))
++    return SImode;
++  return mode;
++}
++
+ #include "gt-m68k.h"
diff --git a/package/gcc/6.4.0/891-fix-m68k-uclinux.patch b/package/gcc/6.4.0/891-fix-m68k-uclinux.patch
deleted file mode 100644
index 754aa74e88..0000000000
--- a/package/gcc/6.4.0/891-fix-m68k-uclinux.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-avoids internal compiler error while compiling linux-atomic.c
-See here:
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53833
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gcc-6.1.0.orig/libgcc/config.host gcc-6.1.0/libgcc/config.host
---- gcc-6.1.0.orig/libgcc/config.host	2016-02-26 21:02:28.000000000 +0100
-+++ gcc-6.1.0/libgcc/config.host	2016-04-29 09:18:40.377989160 +0200
-@@ -812,7 +812,7 @@
- m68k*-*-openbsd*)
- 	;;
- m68k-*-uclinux*)	# Motorola m68k/ColdFire running uClinux with uClibc
--	tmake_file="$tmake_file m68k/t-floatlib m68k/t-linux"
-+	tmake_file="$tmake_file m68k/t-floatlib"
- 	md_unwind_header=m68k/linux-unwind.h
- 	;;
- m68k-*-linux*)			# Motorola m68k's running GNU/Linux
diff --git a/package/gcc/7.3.0/0001-m68k-coldfire-pr68467.patch b/package/gcc/7.3.0/0001-m68k-coldfire-pr68467.patch
new file mode 100644
index 0000000000..629c6496e5
--- /dev/null
+++ b/package/gcc/7.3.0/0001-m68k-coldfire-pr68467.patch
@@ -0,0 +1,48 @@
+Backport from upstream, see
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68467
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-7.2.0.orig/gcc/config/m68k/m68k.c gcc-7.2.0/gcc/config/m68k/m68k.c
+--- gcc-7.2.0.orig/gcc/config/m68k/m68k.c	2017-04-03 22:30:56.274463000 +0000
++++ gcc-7.2.0/gcc/config/m68k/m68k.c	2018-01-27 02:16:53.779367849 +0000
+@@ -182,6 +182,8 @@
+ 			      const_tree, bool);
+ static bool m68k_cannot_force_const_mem (machine_mode mode, rtx x);
+ static bool m68k_output_addr_const_extra (FILE *, rtx);
++static machine_mode m68k_promote_function_mode (const_tree, machine_mode,
++						int *, const_tree, int);
+ static void m68k_init_sync_libfuncs (void) ATTRIBUTE_UNUSED;
+ static enum flt_eval_method
+ m68k_excess_precision (enum excess_precision_type);
+@@ -332,6 +334,9 @@
+ #undef TARGET_ATOMIC_TEST_AND_SET_TRUEVAL
+ #define TARGET_ATOMIC_TEST_AND_SET_TRUEVAL 128
+ 
++#undef TARGET_PROMOTE_FUNCTION_MODE
++#define TARGET_PROMOTE_FUNCTION_MODE m68k_promote_function_mode
++
+ static const struct attribute_spec m68k_attribute_table[] =
+ {
+   /* { name, min_len, max_len, decl_req, type_req, fn_type_req, handler,
+@@ -6571,4 +6576,20 @@
+   return FLT_EVAL_METHOD_UNPREDICTABLE;
+ }
+ 
++/* Implement TARGET_PROMOTE_FUNCTION_MODE.  */
++
++static machine_mode
++m68k_promote_function_mode (const_tree type, machine_mode mode,
++                            int *punsignedp ATTRIBUTE_UNUSED,
++                            const_tree fntype ATTRIBUTE_UNUSED,
++                            int for_return)
++{
++  /* Promote libcall arguments narrower than int to match the normal C
++     ABI (for which promotions are handled via
++     TARGET_PROMOTE_PROTOTYPES).  */
++  if (type == NULL_TREE && !for_return && (mode == QImode || mode == HImode))
++    return SImode;
++  return mode;
++}
++
+ #include "gt-m68k.h"
diff --git a/package/gcc/7.3.0/0891-fix-m68k-uclinux.patch b/package/gcc/7.3.0/0891-fix-m68k-uclinux.patch
deleted file mode 100644
index e84fd92453..0000000000
--- a/package/gcc/7.3.0/0891-fix-m68k-uclinux.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c2773170a1b0e2728f71f2275a99fd177ba2cef4 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Tue, 2 May 2017 23:25:17 +0200
-Subject: [PATCH] fix m68k uclinux avoids internal compiler error while
- compiling linux-atomic.c See here:
- https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53833
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-[Romain: convert to git patch]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- libgcc/config.host | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libgcc/config.host b/libgcc/config.host
-index b279a64..04fe183 100644
---- a/libgcc/config.host
-+++ b/libgcc/config.host
-@@ -820,7 +820,7 @@ m68k*-*-netbsdelf*)
- m68k*-*-openbsd*)
- 	;;
- m68k-*-uclinux*)	# Motorola m68k/ColdFire running uClinux with uClibc
--	tmake_file="$tmake_file m68k/t-floatlib m68k/t-linux"
-+	tmake_file="$tmake_file m68k/t-floatlib"
- 	md_unwind_header=m68k/linux-unwind.h
- 	;;
- m68k-*-linux*)			# Motorola m68k's running GNU/Linux
--- 
-2.9.3
-
