From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Aug 2009 10:34:34 +0200
Subject: [Buildroot] [git commit] toolchain/gcc: remove deprecated 4.3.1
	version
Message-ID: <20090805083504.8B25B777E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3f9261d05df8e69a6fb121264986d21c3325875e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

People should use the most recent 4.3.x version to get all the bugfixes.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/4.3.1/100-uclibc-conf.patch          |   33 ----
 toolchain/gcc/4.3.1/104-gnuhurd-uclibc-conf.patch  |   13 --
 toolchain/gcc/4.3.1/301-missing-execinfo_h.patch   |   11 --
 toolchain/gcc/4.3.1/302-c99-snprintf.patch         |   13 --
 .../gcc/4.3.1/305-libmudflap-susv3-legacy.patch    |   49 -----
 toolchain/gcc/4.3.1/810-arm-softfloat-libgcc.patch |   29 ---
 .../gcc/4.3.1/901-backport-fix-for-bug-32044.patch |  188 --------------------
 .../4.3.1/993-arm_insn-opinit-RTX_CODE-fixup.patch |   41 -----
 toolchain/gcc/4.3.1/995-short-enums.diff           |   42 -----
 .../gcc/4.3.1/998-gcc-4.3.0-fix-header.00.patch    |   15 --
 ...gcc-4.3.0-cris-pragma-pack-warning-remove.patch |   13 --
 toolchain/gcc/Config.in                            |    6 -
 12 files changed, 0 insertions(+), 453 deletions(-)
 delete mode 100644 toolchain/gcc/4.3.1/100-uclibc-conf.patch
 delete mode 100644 toolchain/gcc/4.3.1/104-gnuhurd-uclibc-conf.patch
 delete mode 100644 toolchain/gcc/4.3.1/301-missing-execinfo_h.patch
 delete mode 100644 toolchain/gcc/4.3.1/302-c99-snprintf.patch
 delete mode 100644 toolchain/gcc/4.3.1/305-libmudflap-susv3-legacy.patch
 delete mode 100644 toolchain/gcc/4.3.1/810-arm-softfloat-libgcc.patch
 delete mode 100644 toolchain/gcc/4.3.1/901-backport-fix-for-bug-32044.patch
 delete mode 100644 toolchain/gcc/4.3.1/993-arm_insn-opinit-RTX_CODE-fixup.patch
 delete mode 100644 toolchain/gcc/4.3.1/995-short-enums.diff
 delete mode 100644 toolchain/gcc/4.3.1/998-gcc-4.3.0-fix-header.00.patch
 delete mode 100644 toolchain/gcc/4.3.1/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch

diff --git a/toolchain/gcc/4.3.1/100-uclibc-conf.patch b/toolchain/gcc/4.3.1/100-uclibc-conf.patch
deleted file mode 100644
index cca8c82..0000000
--- a/toolchain/gcc/4.3.1/100-uclibc-conf.patch
+++ /dev/null
@@ -1,33 +0,0 @@
---- gcc/gcc/config/--- gcc/contrib/regression/objs-gcc.sh
-+++ gcc/contrib/regression/objs-gcc.sh
-@@ -105,6 +105,10 @@
-  then
-   make all-gdb all-dejagnu all-ld || exit 1
-   make install-gdb install-dejagnu install-ld || exit 1
-+elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
-+ then
-+  make all-gdb all-dejagnu all-ld || exit 1
-+  make install-gdb install-dejagnu install-ld || exit 1
- elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
-   make bootstrap || exit 1
-   make install || exit 1
---- gcc/libjava/classpath/ltconfig
-+++ gcc/libjava/classpath/ltconfig
-@@ -603,7 +603,7 @@
- 
- # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
- case $host_os in
--linux-gnu*) ;;
-+linux-gnu*|linux-uclibc*) ;;
- linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
- esac
- 
-@@ -1251,7 +1251,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   version_type=linux
-   need_lib_prefix=no
-   need_version=no
diff --git a/toolchain/gcc/4.3.1/104-gnuhurd-uclibc-conf.patch b/toolchain/gcc/4.3.1/104-gnuhurd-uclibc-conf.patch
deleted file mode 100644
index c04dd9f..0000000
--- a/toolchain/gcc/4.3.1/104-gnuhurd-uclibc-conf.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff -rdup gcc-4.2.1.oorig/gcc/config.gcc gcc-4.2.1/gcc/config.gcc
---- gcc-4.2.1.oorig/gcc/config.gcc	2007-10-01 11:52:52.000000000 +0200
-+++ gcc-4.2.1/gcc/config.gcc	2007-10-01 13:22:12.000000000 +0200
-@@ -494,6 +494,9 @@ case ${target} in
-     alpha*)
-       tm_file="${cpu_type}/${cpu_type}.h alpha/elf.h alpha/linux.h alpha/linux-elf.h gnu.h ${tm_file}"
-       ;;
-+    i[34567]86-*hurd*-*)
-+      tm_file="${cpu_type}/${cpu_type}.h i386/unix.h i386/att.h dbxelf.h elfos.h svr4.h i386/gnu.h gnu.h ${tm_file}"
-+      ;;
-     i[34567]86-*-*)
-       tm_file="${cpu_type}/${cpu_type}.h i386/unix.h i386/att.h dbxelf.h elfos.h svr4.h linux.h i386/linux.h gnu.h ${tm_file}"
-       ;;
diff --git a/toolchain/gcc/4.3.1/301-missing-execinfo_h.patch b/toolchain/gcc/4.3.1/301-missing-execinfo_h.patch
deleted file mode 100644
index 0e2092f..0000000
--- a/toolchain/gcc/4.3.1/301-missing-execinfo_h.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- gcc-4.0.0/boehm-gc/include/gc.h-orig	2005-04-28 22:28:57.000000000 -0500
-+++ gcc-4.0.0/boehm-gc/include/gc.h	2005-04-28 22:30:38.000000000 -0500
-@@ -500,7 +500,7 @@
- #ifdef __linux__
- # include <features.h>
- # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
--     && !defined(__ia64__)
-+     && !defined(__ia64__) && !defined(__UCLIBC__)
- #   ifndef GC_HAVE_BUILTIN_BACKTRACE
- #     define GC_HAVE_BUILTIN_BACKTRACE
- #   endif
diff --git a/toolchain/gcc/4.3.1/302-c99-snprintf.patch b/toolchain/gcc/4.3.1/302-c99-snprintf.patch
deleted file mode 100644
index ba51a0e..0000000
--- a/toolchain/gcc/4.3.1/302-c99-snprintf.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: gcc-4.3.0/libstdc++-v3/include/c_global/cstdio
-===================================================================
---- gcc-4.3.0/libstdc++-v3/include/c_global/cstdio	(revision 129202)
-+++ gcc-4.3.0/libstdc++-v3/include/c_global/cstdio	(working copy)
-@@ -144,7 +144,7 @@
- 
- _GLIBCXX_END_NAMESPACE
- 
--#if _GLIBCXX_USE_C99
-+#if _GLIBCXX_USE_C99 || defined __UCLIBC__
- 
- #undef snprintf
- #undef vfscanf
diff --git a/toolchain/gcc/4.3.1/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.3.1/305-libmudflap-susv3-legacy.patch
deleted file mode 100644
index 374b1f8..0000000
--- a/toolchain/gcc/4.3.1/305-libmudflap-susv3-legacy.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Index: gcc-4.2/libmudflap/mf-hooks2.c
-===================================================================
---- gcc-4.2/libmudflap/mf-hooks2.c	(revision 119834)
-+++ gcc-4.2/libmudflap/mf-hooks2.c	(working copy)
-@@ -427,7 +427,7 @@
- {
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s, n, __MF_CHECK_WRITE, "bzero region");
--  bzero (s, n);
-+  memset (s, 0, n);
- }
- 
- 
-@@ -437,7 +437,7 @@
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(src, n, __MF_CHECK_READ, "bcopy src");
-   MF_VALIDATE_EXTENT(dest, n, __MF_CHECK_WRITE, "bcopy dest");
--  bcopy (src, dest, n);
-+  memmove (dest, src, n);
- }
- 
- 
-@@ -447,7 +447,7 @@
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s1, n, __MF_CHECK_READ, "bcmp 1st arg");
-   MF_VALIDATE_EXTENT(s2, n, __MF_CHECK_READ, "bcmp 2nd arg");
--  return bcmp (s1, s2, n);
-+  return n == 0 ? 0 : memcmp (s1, s2, n);
- }
- 
- 
-@@ -456,7 +456,7 @@
-   size_t n = strlen (s);
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "index region");
--  return index (s, c);
-+  return strchr (s, c);
- }
- 
- 
-@@ -465,7 +465,7 @@
-   size_t n = strlen (s);
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "rindex region");
--  return rindex (s, c);
-+  return strrchr (s, c);
- }
- 
- /* XXX:  stpcpy, memccpy */
diff --git a/toolchain/gcc/4.3.1/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.3.1/810-arm-softfloat-libgcc.patch
deleted file mode 100644
index 1639c39..0000000
--- a/toolchain/gcc/4.3.1/810-arm-softfloat-libgcc.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Index: gcc-4.3.0/gcc/config/arm/t-linux
-===================================================================
---- gcc-4.3.0/gcc/config/arm/t-linux	(revision 129896)
-+++ gcc-4.3.0/gcc/config/arm/t-linux	(working copy)
-@@ -3,7 +3,10 @@
- TARGET_LIBGCC2_CFLAGS = -fomit-frame-pointer -fPIC
- 
- LIB1ASMSRC = arm/lib1funcs.asm
--LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx
-+LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx \
-+      _negdf2 _addsubdf3 _muldivdf3 _cmpdf2 _unorddf2 _fixdfsi _fixunsdfsi \
-+      _truncdfsf2 _negsf2 _addsubsf3 _muldivsf3 _cmpsf2 _unordsf2 \
-+      _fixsfsi _fixunssfsi _floatdidf _floatundidf _floatdisf _floatundisf
- 
- # MULTILIB_OPTIONS = mhard-float/msoft-float
- # MULTILIB_DIRNAMES = hard-float soft-float
-Index: gcc-4.3.0/gcc/config/arm/linux-elf.h
-===================================================================
---- gcc-4.3.0/gcc/config/arm/linux-elf.h	(revision 129896)
-+++ gcc-4.3.0/gcc/config/arm/linux-elf.h	(working copy)
-@@ -48,7 +62,7 @@
-    %{shared:-lc} \
-    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
- 
--#define LIBGCC_SPEC "%{msoft-float:-lfloat} %{mfloat-abi=soft*:-lfloat} -lgcc"
-+#define LIBGCC_SPEC "-lgcc"
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
- 
diff --git a/toolchain/gcc/4.3.1/901-backport-fix-for-bug-32044.patch b/toolchain/gcc/4.3.1/901-backport-fix-for-bug-32044.patch
deleted file mode 100644
index 9337bf9..0000000
--- a/toolchain/gcc/4.3.1/901-backport-fix-for-bug-32044.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-Index: gcc-4.3.2/gcc/tree-scalar-evolution.c
-===================================================================
---- gcc-4.3.2.orig/gcc/tree-scalar-evolution.c	2009-01-28 10:14:37.000000000 +0100
-+++ gcc-4.3.2/gcc/tree-scalar-evolution.c	2009-01-28 10:17:50.000000000 +0100
-@@ -2716,6 +2716,50 @@
-   scalar_evolution_info = NULL;
- }
- 
-+/* Returns true if the expression EXPR is considered to be too expensive
-+   for scev_const_prop.  */
-+
-+bool
-+expression_expensive_p (tree expr)
-+{
-+  enum tree_code code;
-+
-+  if (is_gimple_val (expr))
-+    return false;
-+
-+  code = TREE_CODE (expr);
-+  if (code == TRUNC_DIV_EXPR
-+      || code == CEIL_DIV_EXPR
-+      || code == FLOOR_DIV_EXPR
-+      || code == ROUND_DIV_EXPR
-+      || code == TRUNC_MOD_EXPR
-+      || code == CEIL_MOD_EXPR
-+      || code == FLOOR_MOD_EXPR
-+      || code == ROUND_MOD_EXPR
-+      || code == EXACT_DIV_EXPR)
-+    {
-+      /* Division by power of two is usually cheap, so we allow it.
-+	 Forbid anything else.  */
-+      if (!integer_pow2p (TREE_OPERAND (expr, 1)))
-+	return true;
-+    }
-+
-+  switch (TREE_CODE_CLASS (code))
-+    {
-+    case tcc_binary:
-+    case tcc_comparison:
-+      if (expression_expensive_p (TREE_OPERAND (expr, 1)))
-+	return true;
-+
-+      /* Fallthru.  */
-+    case tcc_unary:
-+      return expression_expensive_p (TREE_OPERAND (expr, 0));
-+
-+    default:
-+      return true;
-+    }
-+}
-+
- /* Replace ssa names for that scev can prove they are constant by the
-    appropriate constants.  Also perform final value replacement in loops,
-    in case the replacement expressions are cheap.
-@@ -2802,12 +2846,6 @@
- 	continue;
- 
-       niter = number_of_latch_executions (loop);
--      /* We used to check here whether the computation of NITER is expensive,
--	 and avoided final value elimination if that is the case.  The problem
--	 is that it is hard to evaluate whether the expression is too
--	 expensive, as we do not know what optimization opportunities the
--	 the elimination of the final value may reveal.  Therefore, we now
--	 eliminate the final values of induction variables unconditionally.  */
-       if (niter == chrec_dont_know)
- 	continue;
- 
-@@ -2838,7 +2876,15 @@
- 	      /* Moving the computation from the loop may prolong life range
- 		 of some ssa names, which may cause problems if they appear
- 		 on abnormal edges.  */
--	      || contains_abnormal_ssa_name_p (def))
-+	      || contains_abnormal_ssa_name_p (def)
-+	      /* Do not emit expensive expressions.  The rationale is that
-+		 when someone writes a code like
-+
-+		 while (n > 45) n -= 45;
-+
-+		 he probably knows that n is not large, and does not want it
-+		 to be turned into n %= 45.  */
-+	      || expression_expensive_p (def))
- 	    continue;
- 
- 	  /* Eliminate the PHI node and replace it by a computation outside
-Index: gcc-4.3.2/gcc/tree-scalar-evolution.h
-===================================================================
---- gcc-4.3.2.orig/gcc/tree-scalar-evolution.h	2009-01-28 10:22:47.000000000 +0100
-+++ gcc-4.3.2/gcc/tree-scalar-evolution.h	2009-01-28 10:23:10.000000000 +0100
-@@ -35,6 +35,7 @@
- extern void scev_analysis (void);
- unsigned int scev_const_prop (void);
- 
-+bool expression_expensive_p (tree);
- extern bool simple_iv (struct loop *, tree, tree, affine_iv *, bool);
- 
- /* Returns the loop of the polynomial chrec CHREC.  */
-Index: gcc-4.3.2/gcc/testsuite/gcc.dg/pr34027-1.c
-===================================================================
---- gcc-4.3.2.orig/gcc/testsuite/gcc.dg/pr34027-1.c	2009-01-28 10:24:09.000000000 +0100
-+++ gcc-4.3.2/gcc/testsuite/gcc.dg/pr34027-1.c	2009-01-28 10:24:43.000000000 +0100
-@@ -8,5 +8,9 @@
-   return ns;
- }
- 
--/* { dg-final { scan-tree-dump "ns % 10000" "optimized" } } */
-+/* This test was originally introduced to test that we transform
-+   to ns % 10000.  See the discussion of PR 32044 why we do not do
-+   that anymore.  */
-+/* { dg-final { scan-tree-dump-times "%" 0 "optimized" } } */
-+/* { dg-final { scan-tree-dump-times "/" 0 "optimized" } } */
- /* { dg-final { cleanup-tree-dump "optimized" } } */
-Index: gcc-4.3.2/gcc/testsuite/gcc.dg/tree-ssa/pr32044.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ gcc-4.3.2/gcc/testsuite/gcc.dg/tree-ssa/pr32044.c	2009-01-28 10:25:50.000000000 +0100
-@@ -0,0 +1,55 @@
-+/* { dg-do compile } */
-+/* { dg-options "-O2 -fdump-tree-empty -fdump-tree-final_cleanup" } */
-+
-+int foo (int n)
-+{
-+  while (n >= 45)
-+    n -= 45;
-+
-+  return n;
-+}
-+
-+int bar (int n)
-+{
-+  while (n >= 64)
-+    n -= 64;
-+
-+  return n;
-+}
-+
-+int bla (int n)
-+{
-+  int i = 0;
-+
-+  while (n >= 45)
-+    {
-+      i++;
-+      n -= 45;
-+    }
-+
-+  return i;
-+}
-+
-+int baz (int n)
-+{
-+  int i = 0;
-+
-+  while (n >= 64)
-+    {
-+      i++;
-+      n -= 64;
-+    }
-+
-+  return i;
-+}
-+
-+/* The loops computing division/modulo by 64 should be eliminated.  */
-+/* { dg-final { scan-tree-dump-times "Removing empty loop" 2 "empty" } } */
-+
-+/* There should be no division/modulo in the final dump (division and modulo
-+   by 64 are done using bit operations).  */
-+/* { dg-final { scan-tree-dump-times "/" 0 "final_cleanup" } } */
-+/* { dg-final { scan-tree-dump-times "%" 0 "final_cleanup" } } */
-+
-+/* { dg-final { cleanup-tree-dump "empty" } } */
-+/* { dg-final { cleanup-tree-dump "final_cleanup" } } */
-Index: gcc-4.3.2/gcc/tree-ssa-loop-ivopts.c
-===================================================================
---- gcc-4.3.2.orig/gcc/tree-ssa-loop-ivopts.c	2009-01-28 10:26:04.000000000 +0100
-+++ gcc-4.3.2/gcc/tree-ssa-loop-ivopts.c	2009-01-28 10:27:09.000000000 +0100
-@@ -3778,7 +3778,12 @@
-     return false;
- 
-   cand_value_at (loop, cand, use->stmt, nit, &bnd);
-+
-   *bound = aff_combination_to_tree (&bnd);
-+  /* It is unlikely that computing the number of iterations using division
-+     would be more profitable than keeping the original induction variable.  */
-+  if (expression_expensive_p (*bound))
-+    return false;
-   return true;
- }
diff --git a/toolchain/gcc/4.3.1/993-arm_insn-opinit-RTX_CODE-fixup.patch b/toolchain/gcc/4.3.1/993-arm_insn-opinit-RTX_CODE-fixup.patch
deleted file mode 100644
index 69f0c37..0000000
--- a/toolchain/gcc/4.3.1/993-arm_insn-opinit-RTX_CODE-fixup.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-gcc/ChangeLog
-2007-11-27  Bernhard Fischer  <>
-
-	* config/arm/arm-protos.h (arm_vector_mode_supported_p,
-	arm_hard_regno_mode_ok, const_ok_for_arm): Do not hide non-rtx related
-	function prototypes in RTX_CODE.
-	* genopinit.c: Include tm_p.h.
-
-Index: gcc-4.3.0/gcc/config/arm/arm-protos.h
-===================================================================
---- gcc-4.3.0/gcc/config/arm/arm-protos.h	(revision 130463)
-+++ gcc-4.3.0/gcc/config/arm/arm-protos.h	(working copy)
-@@ -40,15 +40,14 @@
- 							       unsigned int);
- extern unsigned int arm_dbx_register_number (unsigned int);
- extern void arm_output_fn_unwind (FILE *, bool);
--  
- 
- #ifdef TREE_CODE
- extern int arm_return_in_memory (const_tree);
- #endif
--#ifdef RTX_CODE
- extern bool arm_vector_mode_supported_p (enum machine_mode);
- extern int arm_hard_regno_mode_ok (unsigned int, enum machine_mode);
- extern int const_ok_for_arm (HOST_WIDE_INT);
-+#ifdef RTX_CODE
- extern int arm_split_constant (RTX_CODE, enum machine_mode, rtx,
- 			       HOST_WIDE_INT, rtx, rtx, int);
- extern RTX_CODE arm_canonicalize_comparison (RTX_CODE, enum machine_mode,
-Index: gcc-4.3.0/gcc/genopinit.c
-===================================================================
---- gcc-4.3.0/gcc/genopinit.c	(revision 130463)
-+++ gcc-4.3.0/gcc/genopinit.c	(working copy)
-@@ -486,6 +486,7 @@
-   printf ("#include \"expr.h\"\n");
-   printf ("#include \"optabs.h\"\n");
-   printf ("#include \"reload.h\"\n\n");
-+  printf ("#include \"tm_p.h\"\n\n");
- 
-   printf ("void\ninit_all_optabs (void)\n{\n");
- 
diff --git a/toolchain/gcc/4.3.1/995-short-enums.diff b/toolchain/gcc/4.3.1/995-short-enums.diff
deleted file mode 100644
index 03c470c..0000000
--- a/toolchain/gcc/4.3.1/995-short-enums.diff
+++ /dev/null
@@ -1,42 +0,0 @@
-see gcc PR34205
-Index: gcc-4.3.0/gcc/tree.h
-===================================================================
---- gcc-4.3.0/gcc/tree.h	(revision 130511)
-+++ gcc-4.3.0/gcc/tree.h	(working copy)
-@@ -38,6 +38,7 @@
- 
-   LAST_AND_UNUSED_TREE_CODE	/* A convenient way to get a value for
- 				   NUM_TREE_CODES.  */
-+  ,__LAST_AND_UNUSED_TREE_CODE=32767 /* Force 16bit width.  */
- };
- 
- #undef DEFTREECODE
-Index: gcc-4.3.0/gcc/rtl.h
-===================================================================
---- gcc-4.3.0/gcc/rtl.h	(revision 130511)
-+++ gcc-4.3.0/gcc/rtl.h	(working copy)
-@@ -48,9 +48,11 @@
- #include "rtl.def"		/* rtl expressions are documented here */
- #undef DEF_RTL_EXPR
- 
--  LAST_AND_UNUSED_RTX_CODE};	/* A convenient way to get a value for
-+  LAST_AND_UNUSED_RTX_CODE	/* A convenient way to get a value for
- 				   NUM_RTX_CODE.
- 				   Assumes default enum value assignment.  */
-+  ,__LAST_AND_UNUSED_RTX_CODE=32767 /* Force 16bit width.  */
-+};
- 
- #define NUM_RTX_CODE ((int) LAST_AND_UNUSED_RTX_CODE)
- 				/* The cast here, saves many elsewhere.  */
-Index: gcc-4.3.0/gcc/c-common.h
-===================================================================
---- gcc-4.3.0/gcc/c-common.h	(revision 130511)
-+++ gcc-4.3.0/gcc/c-common.h	(working copy)
-@@ -125,6 +125,7 @@
-   RID_LAST_AT = RID_AT_IMPLEMENTATION,
-   RID_FIRST_PQ = RID_IN,
-   RID_LAST_PQ = RID_ONEWAY
-+  ,__LAST_AND_UNUSED_RID=32767 /* Force 16bit width.  */
- };
- 
- #define OBJC_IS_AT_KEYWORD(rid) \
diff --git a/toolchain/gcc/4.3.1/998-gcc-4.3.0-fix-header.00.patch b/toolchain/gcc/4.3.1/998-gcc-4.3.0-fix-header.00.patch
deleted file mode 100644
index 7fe59d2..0000000
--- a/toolchain/gcc/4.3.1/998-gcc-4.3.0-fix-header.00.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-\\\\
-\\ gcc PR33200
-Index: gcc-4.3.0/gcc/config.gcc
-===================================================================
---- gcc-4.3.0/gcc/config.gcc	(revision 131628)
-+++ gcc-4.3.0/gcc/config.gcc	(working copy)
-@@ -2302,7 +2305,7 @@ sh-*-symbianelf* | sh[12346l]*-*-symbian
- 	if test x${enable_incomplete_targets} = xyes ; then
- 		tm_defines="$tm_defines SUPPORT_SH1=1 SUPPORT_SH2E=1 SUPPORT_SH4=1 SUPPORT_SH4_SINGLE=1 SUPPORT_SH2A=1 SUPPORT_SH2A_SINGLE=1 SUPPORT_SH5_32MEDIA=1 SUPPORT_SH5_32MEDIA_NOFPU=1 SUPPORT_SH5_64MEDIA=1 SUPPORT_SH5_64MEDIA_NOFPU=1"
- 	fi
--	use_fixproto=yes
-+	# XXX: why? use_fixproto=yes
- 	;;
- sh-*-rtemscoff*)
- 	tmake_file="sh/t-sh t-rtems sh/t-rtems"
diff --git a/toolchain/gcc/4.3.1/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch b/toolchain/gcc/4.3.1/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
deleted file mode 100644
index dcf01f2..0000000
--- a/toolchain/gcc/4.3.1/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff -urN gcc-4.3.1.orig/gcc/config/cris/cris.h gcc-4.3.1/gcc/config/cris/cris.h
---- gcc-4.3.1.orig/gcc/config/cris/cris.h	2008-02-22 12:11:01.000000000 +0100
-+++ gcc-4.3.1/gcc/config/cris/cris.h	2008-07-02 10:42:42.000000000 +0200
-@@ -1529,9 +1529,6 @@
- 
- #define NO_IMPLICIT_EXTERN_C
- 
--/* No specific purpose other than warningless compatibility.  */
--#define HANDLE_PRAGMA_PACK_PUSH_POP 1
--
- /*
-  * Local variables:
-  * eval: (c-set-style "gnu")
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 76e7f78..ac37dd1 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -47,11 +47,6 @@ choice
 		depends on BR2_RECENT || BR2_DEPRECATED
 		bool "gcc 4.2.4"
 
-	config BR2_GCC_VERSION_4_3_1
-		depends on !BR2_avr32 && !BR2_nios2
-		depends on BR2_DEPRECATED
-		bool "gcc 4.3.1"
-
 	config BR2_GCC_VERSION_4_3_2
 		depends on !BR2_avr32 && !BR2_nios2
 		depends on BR2_RECENT || BR2_DEPRECATED
@@ -102,7 +97,6 @@ config BR2_GCC_VERSION
 	default "4.2.2"     if BR2_GCC_VERSION_4_2_2
 	default "4.2.3"     if BR2_GCC_VERSION_4_2_3
 	default "4.2.4"     if BR2_GCC_VERSION_4_2_4
-	default "4.3.1"     if BR2_GCC_VERSION_4_3_1
 	default "4.3.2"     if BR2_GCC_VERSION_4_3_2
 	default "4.3.3"     if BR2_GCC_VERSION_4_3_3
 	default "4.4.1"     if BR2_GCC_VERSION_4_4_X
-- 
1.6.3.3
