From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jul 2014 16:20:39 +0200
Subject: [Buildroot] [git commit] gcc: remove versions 4.3.x and 4.6.x
Message-ID: <20140710150057.DD7539C46A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d10e0805ea3b6f887da6d99ad5047af1d12f33a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those gcc series are old and are not used as the default versions for
any of the architectures we support, so this commit gets rid of them.

The gcc 4.3.x series technically remains used by the LPC32xx
defconfigs we have:

configs/ea3250_defconfig:BR2_GCC_VERSION_4_3_X=y
configs/fdi3250_defconfig:BR2_GCC_VERSION_4_3_X=y
configs/phy3250_defconfig:BR2_GCC_VERSION_4_3_X=y

Back when those defconfigs were introduced, gcc 4.3 was chosen because
it was the only one capable of building a fully working kernel for
those ARM-based platforms. However, the original submitter, Alexandre
Belloni, no longer has access to the hardware platforms, so he is
unable to test if newer gcc versions have fixed the problem. It
certainly doesn't make sense to keep gcc 4.3.x just for those three
boards, so we'll wait for someone actually using those defconfigs to
complain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |   14 ++
 package/gcc/4.3.6/100-uclibc-conf.patch            |   13 --
 package/gcc/4.3.6/104-gnuhurd-uclibc-conf.patch    |   13 --
 package/gcc/4.3.6/301-missing-execinfo_h.patch     |   11 --
 package/gcc/4.3.6/302-c99-snprintf.patch           |   13 --
 .../gcc/4.3.6/305-libmudflap-susv3-legacy.patch    |   49 --------
 package/gcc/4.3.6/810-arm-softfloat-libgcc.patch   |   29 -----
 .../4.3.6/993-arm_insn-opinit-RTX_CODE-fixup.patch |   41 -------
 .../gcc/4.3.6/998-gcc-4.3.0-fix-header.00.patch    |   15 ---
 .../gcc/4.3.6/999-4.3.2-armeabi-aapcs-linux.patch  |   18 ---
 .../4.3.6/999-4.3.3-arm-fix-for-bug-37436.patch    |   86 --------------
 ...gcc-4.3.0-cris-pragma-pack-warning-remove.patch |   13 --
 package/gcc/4.3.6/gcc-43-pr39429.patch             |   24 ----
 .../powerpc-link-with-math-lib.patch.conditional   |  125 --------------------
 package/gcc/4.6.4/100-uclibc-conf.patch            |   13 --
 package/gcc/4.6.4/301-missing-execinfo_h.patch     |   11 --
 package/gcc/4.6.4/302-c99-snprintf.patch           |   13 --
 .../gcc/4.6.4/305-libmudflap-susv3-legacy.patch    |   49 --------
 package/gcc/4.6.4/810-arm-softfloat-libgcc.patch   |   38 ------
 package/gcc/4.6.4/820-arm-unbreak-armv4t.patch     |   14 --
 .../powerpc-link-with-math-lib.patch.conditional   |  125 --------------------
 package/gcc/Config.in.host                         |   16 ---
 22 files changed, 14 insertions(+), 729 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 125ca61..54d1f4e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -156,6 +156,20 @@ config BR2_UCLIBC_VERSION_0_9_32
 	  The 0.9.32 version of uClibc has been removed. Use a newer
 	  version instead.
 
+config BR2_GCC_VERSION_4_3_X
+	bool "gcc 4.3.x has been removed"
+	select BR2_LEGACY
+	help
+	  The 4.3.x version of gcc has been removed. Use a newer
+	  version instead.
+
+config BR2_GCC_VERSION_4_6_X
+	bool "gcc 4.6.x has been removed"
+	select BR2_LEGACY
+	help
+	  The 4.6.x version of gcc has been removed. Use a newer
+	  version instead.
+
 config BR2_PACKAGE_LIBV4L_DECODE_TM6000
 	bool "decode_tm6000"
 	select BR2_PACKAGE_LIBV4L_UTILS
diff --git a/package/gcc/4.3.6/100-uclibc-conf.patch b/package/gcc/4.3.6/100-uclibc-conf.patch
deleted file mode 100644
index 6bad179..0000000
--- a/package/gcc/4.3.6/100-uclibc-conf.patch
+++ /dev/null
@@ -1,13 +0,0 @@
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
diff --git a/package/gcc/4.3.6/104-gnuhurd-uclibc-conf.patch b/package/gcc/4.3.6/104-gnuhurd-uclibc-conf.patch
deleted file mode 100644
index c04dd9f..0000000
--- a/package/gcc/4.3.6/104-gnuhurd-uclibc-conf.patch
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
diff --git a/package/gcc/4.3.6/301-missing-execinfo_h.patch b/package/gcc/4.3.6/301-missing-execinfo_h.patch
deleted file mode 100644
index 0e2092f..0000000
--- a/package/gcc/4.3.6/301-missing-execinfo_h.patch
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
diff --git a/package/gcc/4.3.6/302-c99-snprintf.patch b/package/gcc/4.3.6/302-c99-snprintf.patch
deleted file mode 100644
index ba51a0e..0000000
--- a/package/gcc/4.3.6/302-c99-snprintf.patch
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
diff --git a/package/gcc/4.3.6/305-libmudflap-susv3-legacy.patch b/package/gcc/4.3.6/305-libmudflap-susv3-legacy.patch
deleted file mode 100644
index 374b1f8..0000000
--- a/package/gcc/4.3.6/305-libmudflap-susv3-legacy.patch
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
diff --git a/package/gcc/4.3.6/810-arm-softfloat-libgcc.patch b/package/gcc/4.3.6/810-arm-softfloat-libgcc.patch
deleted file mode 100644
index 1639c39..0000000
--- a/package/gcc/4.3.6/810-arm-softfloat-libgcc.patch
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
diff --git a/package/gcc/4.3.6/993-arm_insn-opinit-RTX_CODE-fixup.patch b/package/gcc/4.3.6/993-arm_insn-opinit-RTX_CODE-fixup.patch
deleted file mode 100644
index 69f0c37..0000000
--- a/package/gcc/4.3.6/993-arm_insn-opinit-RTX_CODE-fixup.patch
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
diff --git a/package/gcc/4.3.6/998-gcc-4.3.0-fix-header.00.patch b/package/gcc/4.3.6/998-gcc-4.3.0-fix-header.00.patch
deleted file mode 100644
index 7fe59d2..0000000
--- a/package/gcc/4.3.6/998-gcc-4.3.0-fix-header.00.patch
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
diff --git a/package/gcc/4.3.6/999-4.3.2-armeabi-aapcs-linux.patch b/package/gcc/4.3.6/999-4.3.2-armeabi-aapcs-linux.patch
deleted file mode 100644
index f4b1c9c..0000000
--- a/package/gcc/4.3.6/999-4.3.2-armeabi-aapcs-linux.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-\\\\ followup of PR34205; trying to use aapcs-linux
-\\ gcc/ChangeLog
-\\
-\\ 2008-09-18  Bernhard Reutner-Fischer  <aldot@>
-\\
-\\ * config.gcc (arm*-*-*): Add aapcs-linux to supported ABIs.
-\\
---- gcc-4.3.2.orig/gcc/config.gcc	2008-09-18 20:33:55.000000000 +0200
-+++ gcc-4.3.2/gcc/config.gcc	2008-09-18 21:38:52.000000000 +0200
-@@ -2921,7 +2921,7 @@
- 
- 		case "$with_abi" in
- 		"" \
--		| apcs-gnu | atpcs | aapcs | iwmmxt )
-+		| apcs-gnu | atpcs | aapcs | iwmmxt | aapcs-linux )
- 			#OK
- 			;;
- 		*)
diff --git a/package/gcc/4.3.6/999-4.3.3-arm-fix-for-bug-37436.patch b/package/gcc/4.3.6/999-4.3.3-arm-fix-for-bug-37436.patch
deleted file mode 100644
index 99a016f..0000000
--- a/package/gcc/4.3.6/999-4.3.3-arm-fix-for-bug-37436.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-gcc svn 142778:
-
-PR target/37436
-* arm.c (arm_legitimate_index): Only accept addresses that are in
-canonical form.
-* predicates.md (arm_reg_or_extendqisi_mem_op): New predicate.
-* arm.md (extendqihi2): Use arm_reg_or_extendqisi_mem_op predicate
-for operand1.
-(extendqisi2): Likewise.
-(arm_extendqisi, arm_extendqisi_v6): Use arm_extendqisi_mem_op
-predicate for operand1.
-
-diff -Nura gcc-4.3.3.orig/gcc/config/arm/arm.c gcc-4.3.3/gcc/config/arm/arm.c
---- gcc-4.3.3.orig/gcc/config/arm/arm.c	2008-06-11 07:52:55.000000000 -0300
-+++ gcc-4.3.3/gcc/config/arm/arm.c	2009-05-21 16:06:45.000000000 -0300
-@@ -3769,6 +3769,7 @@
-       rtx xop1 = XEXP (x, 1);
- 
-       return ((arm_address_register_rtx_p (xop0, strict_p)
-+	       && GET_CODE(xop1) == CONST_INT
- 	       && arm_legitimate_index_p (mode, xop1, outer, strict_p))
- 	      || (arm_address_register_rtx_p (xop1, strict_p)
- 		  && arm_legitimate_index_p (mode, xop0, outer, strict_p)));
-diff -Nura gcc-4.3.3.orig/gcc/config/arm/arm.md gcc-4.3.3/gcc/config/arm/arm.md
---- gcc-4.3.3.orig/gcc/config/arm/arm.md	2007-09-04 01:44:47.000000000 -0300
-+++ gcc-4.3.3/gcc/config/arm/arm.md	2009-05-21 16:06:45.000000000 -0300
-@@ -4199,7 +4199,7 @@
- 
- (define_expand "extendqihi2"
-   [(set (match_dup 2)
--	(ashift:SI (match_operand:QI 1 "general_operand" "")
-+	(ashift:SI (match_operand:QI 1 "arm_reg_or_extendqisi_mem_op" "")
- 		   (const_int 24)))
-    (set (match_operand:HI 0 "s_register_operand" "")
- 	(ashiftrt:SI (match_dup 2)
-@@ -4224,7 +4224,7 @@
- 
- (define_insn "*arm_extendqihi_insn"
-   [(set (match_operand:HI 0 "s_register_operand" "=r")
--	(sign_extend:HI (match_operand:QI 1 "memory_operand" "Uq")))]
-+	(sign_extend:HI (match_operand:QI 1 "arm_extendqisi_mem_op" "Uq")))]
-   "TARGET_ARM && arm_arch4"
-   "ldr%(sb%)\\t%0, %1"
-   [(set_attr "type" "load_byte")
-@@ -4235,7 +4235,7 @@
- 
- (define_expand "extendqisi2"
-   [(set (match_dup 2)
--	(ashift:SI (match_operand:QI 1 "general_operand" "")
-+	(ashift:SI (match_operand:QI 1 "arm_reg_or_extendqisi_mem_op" "")
- 		   (const_int 24)))
-    (set (match_operand:SI 0 "s_register_operand" "")
- 	(ashiftrt:SI (match_dup 2)
-@@ -4267,7 +4267,7 @@
- 
- (define_insn "*arm_extendqisi"
-   [(set (match_operand:SI 0 "s_register_operand" "=r")
--	(sign_extend:SI (match_operand:QI 1 "memory_operand" "Uq")))]
-+	(sign_extend:SI (match_operand:QI 1 "arm_extendqisi_mem_op" "Uq")))]
-   "TARGET_ARM && arm_arch4 && !arm_arch6"
-   "ldr%(sb%)\\t%0, %1"
-   [(set_attr "type" "load_byte")
-@@ -4278,7 +4278,8 @@
- 
- (define_insn "*arm_extendqisi_v6"
-   [(set (match_operand:SI 0 "s_register_operand" "=r,r")
--	(sign_extend:SI (match_operand:QI 1 "nonimmediate_operand" "r,Uq")))]
-+	(sign_extend:SI
-+	 (match_operand:QI 1 "arm_reg_or_extendqisi_mem_op" "r,Uq")))]
-   "TARGET_ARM && arm_arch6"
-   "@
-    sxtb%?\\t%0, %1
-diff -Nura gcc-4.3.3.orig/gcc/config/arm/predicates.md gcc-4.3.3/gcc/config/arm/predicates.md
---- gcc-4.3.3.orig/gcc/config/arm/predicates.md	2007-08-02 07:49:31.000000000 -0300
-+++ gcc-4.3.3/gcc/config/arm/predicates.md	2009-05-21 16:06:45.000000000 -0300
-@@ -234,6 +234,10 @@
-        (match_test "arm_legitimate_address_p (mode, XEXP (op, 0), SIGN_EXTEND,
- 					      0)")))
- 
-+(define_special_predicate "arm_reg_or_extendqisi_mem_op"
-+  (ior (match_operand 0 "arm_extendqisi_mem_op")
-+       (match_operand 0 "s_register_operand")))
-+
- (define_predicate "power_of_two_operand"
-   (match_code "const_int")
- {
diff --git a/package/gcc/4.3.6/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch b/package/gcc/4.3.6/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
deleted file mode 100644
index dcf01f2..0000000
--- a/package/gcc/4.3.6/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
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
diff --git a/package/gcc/4.3.6/gcc-43-pr39429.patch b/package/gcc/4.3.6/gcc-43-pr39429.patch
deleted file mode 100644
index 4e1dc9e..0000000
--- a/package/gcc/4.3.6/gcc-43-pr39429.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From: Michael Olbrich <m.olbrich@pengutronix.de>
-Subject: Fix: compiler create bad asm codes.
-
-See http://gcc.gnu.org/bugzilla/show_bug.cgi?id=39429 for details.
-
-Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
-
----
- gcc/config/arm/arm.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: b/gcc/config/arm/arm.c
-===================================================================
---- a/gcc/config/arm/arm.c
-+++ b/gcc/config/arm/arm.c
-@@ -6838,7 +6838,7 @@ adjacent_mem_locations (rtx a, rtx b)
-       /* Don't accept any offset that will require multiple
- 	 instructions to handle, since this would cause the
- 	 arith_adjacentmem pattern to output an overlong sequence.  */
--      if (!const_ok_for_op (PLUS, val0) || !const_ok_for_op (PLUS, val1))
-+      if (!const_ok_for_op (val0, PLUS) || !const_ok_for_op (val1, PLUS))
- 	return 0;
- 
-       /* Don't allow an eliminable register: register elimination can make
diff --git a/package/gcc/4.3.6/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.3.6/powerpc-link-with-math-lib.patch.conditional
deleted file mode 100644
index 9d01eba..0000000
--- a/package/gcc/4.3.6/powerpc-link-with-math-lib.patch.conditional
+++ /dev/null
@@ -1,125 +0,0 @@
-See: http://gcc.gnu.org/ml/gcc-patches/2008-10/msg00237.html
-Patch by: Bernhard Reutner-Fischer
-
---- gcc-4.3.3/gcc/config/t-slibgcc-elf-ver	2005-02-20 00:44:10.000000000 +1300
-+++ gcc-4.3.3-p/gcc/config/t-slibgcc-elf-ver	2009-05-06 07:05:50.000000000 +1200
-@@ -9,7 +9,7 @@
- SHLIB_OBJS = @shlib_objs@
- SHLIB_DIR = @multilib_dir@
- SHLIB_SLIBDIR_QUAL = @shlib_slibdir_qual@
--SHLIB_LC = -lc
-+SHLIB_LC = @libgcc_libm@ -lc
- 
- SHLIB_LINK = $(GCC_FOR_TARGET) $(LIBGCC2_CFLAGS) -shared -nodefaultlibs \
- 	-Wl,--soname=$(SHLIB_SONAME) \
---- gcc-4.3.3/libgcc/configure	2008-11-21 06:09:53.000000000 +1300
-+++ gcc-4.3.3-p/libgcc/configure	2009-05-06 07:05:50.000000000 +1200
-@@ -272,7 +272,7 @@
- PACKAGE_BUGREPORT=''
- 
- ac_unique_file="static-object.mk"
--ac_subst_vars='SHELL PATH_SEPARATOR PACKAGE_NAME PACKAGE_TARNAME PACKAGE_VERSION PACKAGE_STRING PACKAGE_BUGREPORT exec_prefix prefix program_transform_name bindir sbindir libexecdir datadir sysconfdir sharedstatedir localstatedir libdir includedir oldincludedir infodir mandir build_alias host_alias target_alias DEFS ECHO_C ECHO_N ECHO_T LIBS libgcc_topdir enable_shared slibdir INSTALL_PROGRAM INSTALL_SCRIPT INSTALL_DATA AWK build build_cpu build_vendor build_os host host_cpu host_vendor host_os host_noncanonical build_libsubdir build_subdir host_subdir target_subdir AR ac_ct_AR LIPO ac_ct_LIPO NM ac_ct_NM RANLIB ac_ct_RANLIB STRIP ac_ct_STRIP LN_S CC CFLAGS LDFLAGS CPPFLAGS ac_ct_CC EXEEXT OBJEXT CPP decimal_float enable_decimal_float fixed_point vis_hide set_have_cc_tls tmake_file extra_parts asm_hidden_op LIBOBJS LTLIBOBJS'
-+ac_subst_vars='SHELL PATH_SEPARATOR PACKAGE_NAME PACKAGE_TARNAME PACKAGE_VERSION PACKAGE_STRING PACKAGE_BUGREPORT exec_prefix prefix program_transform_name bindir sbindir libexecdir datadir sysconfdir sharedstatedir localstatedir libdir includedir oldincludedir infodir mandir build_alias host_alias target_alias DEFS ECHO_C ECHO_N ECHO_T LIBS libgcc_topdir enable_shared slibdir INSTALL_PROGRAM INSTALL_SCRIPT INSTALL_DATA AWK build build_cpu build_vendor build_os host host_cpu host_vendor host_os host_noncanonical build_libsubdir build_subdir host_subdir target_subdir AR ac_ct_AR LIPO ac_ct_LIPO NM ac_ct_NM RANLIB ac_ct_RANLIB STRIP ac_ct_STRIP LN_S CC CFLAGS LDFLAGS CPPFLAGS ac_ct_CC EXEEXT OBJEXT CPP decimal_float enable_decimal_float fixed_point vis_hide set_have_cc_tls LIBGCC_LIBM tmake_file extra_parts asm_hidden_op LIBOBJS LTLIBOBJS'
- ac_subst_files=''
- 
- # Initialize some variables set by options.
-@@ -3505,6 +3505,39 @@
- fi
- 
- 
-+# On powerpc libgcc_s references copysignl which is a libm function but
-+# glibc apparently also provides it via libc as opposed to uClibc where
-+# it lives in libm.
-+echo "$as_me:$LINENO: checking for library containing copysignl" >&5
-+echo $ECHO_N "checking for library containing copysignl... $ECHO_C" >&6
-+if test "${libgcc_cv_copysignl_lib+set}" = set; then
-+  echo $ECHO_N "(cached) $ECHO_C" >&6
-+else
-+
-+    echo '#include <features.h>' > conftest.c
-+    echo 'int the_libc = __UCLIBC__ + __powerpc__;' >> conftest.c
-+    libgcc_cv_copysignl_lib="-lc"
-+    if { ac_try='${CC-cc} -S conftest.c -o conftest.s 1>&5'
-+  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); }; }
-+    then
-+	libgcc_cv_copysignl_lib="-lm"
-+    fi
-+    rm -f conftest.*
-+
-+fi
-+echo "$as_me:$LINENO: result: $libgcc_cv_copysignl_lib" >&5
-+echo "${ECHO_T}$libgcc_cv_copysignl_lib" >&6
-+
-+case /${libgcc_cv_copysignl_lib}/ in
-+  /-lm/) LIBGCC_LIBM="$LIBGCC_LIBM -lm" ;;
-+  *) LIBGCC_LIBM= ;;
-+esac
-+
-+
- # Conditionalize the makefile for this target machine.
- tmake_file_=
- for f in ${tmake_file}
-@@ -4225,6 +4258,7 @@
- s, at fixed_point@,$fixed_point,;t t
- s, at vis_hide@,$vis_hide,;t t
- s, at set_have_cc_tls@,$set_have_cc_tls,;t t
-+s, at LIBGCC_LIBM@,$LIBGCC_LIBM,;t t
- s, at tmake_file@,$tmake_file,;t t
- s, at extra_parts@,$extra_parts,;t t
- s, at asm_hidden_op@,$asm_hidden_op,;t t
---- gcc-4.3.3/libgcc/configure.ac	2008-11-21 06:09:53.000000000 +1300
-+++ gcc-4.3.3-p/libgcc/configure.ac	2009-05-06 07:05:50.000000000 +1200
-@@ -207,6 +207,27 @@
- fi
- AC_SUBST(set_have_cc_tls)
- 
-+# On powerpc libgcc_s references copysignl which is a libm function but
-+# glibc apparently also provides it via libc as opposed to uClibc where
-+# it lives in libm.
-+AC_CACHE_CHECK([for library containing copysignl],
-+  libgcc_cv_copysignl_lib, [
-+    echo '#include <features.h>' > conftest.c
-+    echo 'int the_libc = __UCLIBC__ + __powerpc__;' >> conftest.c
-+    libgcc_cv_copysignl_lib="-lc"
-+    if AC_TRY_COMMAND(${CC-cc} -S conftest.c -o conftest.s 1>&AS_MESSAGE_LOG_FD)
-+    then
-+	libgcc_cv_copysignl_lib="-lm"
-+    fi
-+    rm -f conftest.*
-+  ])
-+
-+case /${libgcc_cv_copysignl_lib}/ in
-+  /-lm/) LIBGCC_LIBM="$LIBGCC_LIBM -lm" ;;
-+  *) LIBGCC_LIBM= ;;
-+esac
-+AC_SUBST(LIBGCC_LIBM)
-+
- # Conditionalize the makefile for this target machine.
- tmake_file_=
- for f in ${tmake_file}
---- gcc-4.3.3/libgcc/Makefile.in	2008-06-17 21:32:34.000000000 +1200
-+++ gcc-4.3.3-p/libgcc/Makefile.in	2009-05-06 07:05:50.000000000 +1200
-@@ -40,6 +40,7 @@
- decimal_float = @decimal_float@
- enable_decimal_float = @enable_decimal_float@
- fixed_point = @fixed_point@
-+LIBGCC_LIBM = @LIBGCC_LIBM@
- 
- host_noncanonical = @host_noncanonical@
- 
-@@ -738,9 +739,10 @@
- 		@multilib_dir@,$(MULTIDIR),$(subst \
- 		@shlib_objs@,$(objects),$(subst \
- 		@shlib_base_name@,libgcc_s,$(subst \
-+		@libgcc_libm@,$(LIBGCC_LIBM),$(subst \
- 		@shlib_map_file@,$(mapfile),$(subst \
- 		@shlib_slibdir_qual@,$(MULTIOSSUBDIR),$(subst \
--		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK))))))))
-+		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK)))))))))
- 
- libunwind$(SHLIB_EXT): $(libunwind-s-objects) $(extra-parts)
- 	# @multilib_flags@ is still needed because this may use
diff --git a/package/gcc/4.6.4/100-uclibc-conf.patch b/package/gcc/4.6.4/100-uclibc-conf.patch
deleted file mode 100644
index 6bad179..0000000
--- a/package/gcc/4.6.4/100-uclibc-conf.patch
+++ /dev/null
@@ -1,13 +0,0 @@
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
diff --git a/package/gcc/4.6.4/301-missing-execinfo_h.patch b/package/gcc/4.6.4/301-missing-execinfo_h.patch
deleted file mode 100644
index 0e2092f..0000000
--- a/package/gcc/4.6.4/301-missing-execinfo_h.patch
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
diff --git a/package/gcc/4.6.4/302-c99-snprintf.patch b/package/gcc/4.6.4/302-c99-snprintf.patch
deleted file mode 100644
index ba51a0e..0000000
--- a/package/gcc/4.6.4/302-c99-snprintf.patch
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
diff --git a/package/gcc/4.6.4/305-libmudflap-susv3-legacy.patch b/package/gcc/4.6.4/305-libmudflap-susv3-legacy.patch
deleted file mode 100644
index 374b1f8..0000000
--- a/package/gcc/4.6.4/305-libmudflap-susv3-legacy.patch
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
diff --git a/package/gcc/4.6.4/810-arm-softfloat-libgcc.patch b/package/gcc/4.6.4/810-arm-softfloat-libgcc.patch
deleted file mode 100644
index e6a30a3..0000000
--- a/package/gcc/4.6.4/810-arm-softfloat-libgcc.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-[PATCH] add the correct symbols to libgcc for uclibc arm softfloat
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- gcc/config/arm/linux-elf.h |    2 +-
- gcc/config/arm/t-linux     |    6 +++++-
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-Index: gcc-4.4.0/gcc/config/arm/t-linux
-===================================================================
---- gcc-4.4.0.orig/gcc/config/arm/t-linux
-+++ gcc-4.4.0/gcc/config/arm/t-linux
-@@ -4,7 +4,11 @@
- 
- LIB1ASMSRC = arm/lib1funcs.asm
- LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx _clzsi2 _clzdi2 \
--	_arm_addsubdf3 _arm_addsubsf3
-+	_arm_addsubdf3 _arm_addsubsf3 \
-+	_arm_negdf2 _arm_muldivdf3 _arm_cmpdf2 _arm_unorddf2 \
-+	_arm_fixdfsi _arm_fixunsdfsi _arm_truncdfsf2 \
-+	_arm_negsf2 _arm_muldivsf3 _arm_cmpsf2 _arm_unordsf2 \
-+	_arm_fixsfsi _arm_fixunssfsi
- 
- # MULTILIB_OPTIONS = mhard-float/msoft-float
- # MULTILIB_DIRNAMES = hard-float soft-float
-Index: gcc-4.4.0/gcc/config/arm/linux-elf.h
-===================================================================
---- gcc-4.4.0.orig/gcc/config/arm/linux-elf.h
-+++ gcc-4.4.0/gcc/config/arm/linux-elf.h
-@@ -60,7 +60,7 @@
-    %{shared:-lc} \
-    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
- 
--#define LIBGCC_SPEC "%{msoft-float:-lfloat} %{mfloat-abi=soft*:-lfloat} -lgcc"
-+#define LIBGCC_SPEC "-lgcc"
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
- 
diff --git a/package/gcc/4.6.4/820-arm-unbreak-armv4t.patch b/package/gcc/4.6.4/820-arm-unbreak-armv4t.patch
deleted file mode 100644
index 8651afc..0000000
--- a/package/gcc/4.6.4/820-arm-unbreak-armv4t.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-http://sourceware.org/ml/crossgcc/2008-05/msg00009.html
-
-diff -Nura gcc-4.5.1.orig/gcc/config/arm/linux-eabi.h gcc-4.5.1/gcc/config/arm/linux-eabi.h
---- gcc-4.5.1.orig/gcc/config/arm/linux-eabi.h	2009-10-30 17:03:09.000000000 -0300
-+++ gcc-4.5.1/gcc/config/arm/linux-eabi.h	2010-11-02 15:38:25.792208500 -0300
-@@ -44,7 +44,7 @@
-    The ARM10TDMI core is the default for armv5t, so set
-    SUBTARGET_CPU_DEFAULT to achieve this.  */
- #undef  SUBTARGET_CPU_DEFAULT
--#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm10tdmi
-+#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm9tdmi
- 
- /* TARGET_BIG_ENDIAN_DEFAULT is set in
-    config.gcc for big endian configurations.  */
diff --git a/package/gcc/4.6.4/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.6.4/powerpc-link-with-math-lib.patch.conditional
deleted file mode 100644
index 7e75e87..0000000
--- a/package/gcc/4.6.4/powerpc-link-with-math-lib.patch.conditional
+++ /dev/null
@@ -1,125 +0,0 @@
-http://gcc.gnu.org/ml/gcc-patches/2008-10/msg00269.html
-
-On glibc the libc.so carries a copy of the math function copysignl() but
-on uClibc math functions like copysignl() live in libm. Since libgcc_s
-contains unresolved symbols, any attempt to link against libgcc_s
-without explicitely specifying -lm fails, resulting in a broken
-bootstrap of the compiler.
-
-Forward port to gcc 4.5.1 by Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura gcc-4.5.1.orig/gcc/config/t-slibgcc-elf-ver gcc-4.5.1/gcc/config/t-slibgcc-elf-ver
---- gcc-4.5.1.orig/gcc/config/t-slibgcc-elf-ver	2010-11-03 14:35:08.644904042 -0300
-+++ gcc-4.5.1/gcc/config/t-slibgcc-elf-ver	2010-11-03 14:35:56.332904024 -0300
-@@ -27,7 +27,7 @@
- SHLIB_OBJS = @shlib_objs@
- SHLIB_DIR = @multilib_dir@
- SHLIB_SLIBDIR_QUAL = @shlib_slibdir_qual@
--SHLIB_LC = -lc
-+SHLIB_LC = @libgcc_libm@ -lc
- SHLIB_MAKE_SOLINK = $(LN_S) $(SHLIB_SONAME) $(SHLIB_DIR)/$(SHLIB_SOLINK)
- SHLIB_INSTALL_SOLINK = $(LN_S) $(SHLIB_SONAME) \
- 	$$(DESTDIR)$$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
-diff -Nura gcc-4.5.1.orig/libgcc/Makefile.in gcc-4.5.1/libgcc/Makefile.in
---- gcc-4.5.1.orig/libgcc/Makefile.in	2010-11-03 14:32:44.272904042 -0300
-+++ gcc-4.5.1/libgcc/Makefile.in	2010-11-03 14:37:03.893904042 -0300
-@@ -39,6 +39,7 @@
- decimal_float = @decimal_float@
- enable_decimal_float = @enable_decimal_float@
- fixed_point = @fixed_point@
-+LIBGCC_LIBM = @LIBGCC_LIBM@
- 
- host_noncanonical = @host_noncanonical@
- 
-@@ -798,9 +799,10 @@
- 		@multilib_dir@,$(MULTIDIR),$(subst \
- 		@shlib_objs@,$(objects),$(subst \
- 		@shlib_base_name@,libgcc_s,$(subst \
-+		@libgcc_libm@,$(LIBGCC_LIBM),$(subst \
- 		@shlib_map_file@,$(mapfile),$(subst \
- 		@shlib_slibdir_qual@,$(MULTIOSSUBDIR),$(subst \
--		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK))))))))
-+		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK)))))))))
- 
- libunwind$(SHLIB_EXT): $(libunwind-s-objects) $(extra-parts)
- 	# @multilib_flags@ is still needed because this may use
-diff -Nura gcc-4.5.1.orig/libgcc/configure gcc-4.5.1/libgcc/configure
---- gcc-4.5.1.orig/libgcc/configure	2010-11-03 14:32:44.283904042 -0300
-+++ gcc-4.5.1/libgcc/configure	2010-11-03 14:39:48.685904042 -0300
-@@ -557,6 +557,7 @@
- extra_parts
- tmake_file
- set_use_emutls
-+LIBGCC_LIBM
- set_have_cc_tls
- vis_hide
- fixed_point
-@@ -3847,6 +3848,37 @@
-   set_use_emutls="-DUSE_EMUTLS"
- fi
- 
-+# On powerpc libgcc_s references copysignl which is a libm function but
-+# glibc apparently also provides it via libc as opposed to uClibc where
-+# it lives in libm.
-+echo "$as_me:$LINENO: checking for library containing copysignl" >&5
-+echo $ECHO_N "checking for library containing copysignl... $ECHO_C" >&6
-+if test "${libgcc_cv_copysignl_lib+set}" = set; then
-+  echo $ECHO_N "(cached) $ECHO_C" >&6
-+else
-+
-+    echo '#include <features.h>' > conftest.c
-+    echo 'int the_libc = __UCLIBC__ + __powerpc__;' >> conftest.c
-+    libgcc_cv_copysignl_lib="-lc"
-+    if { ac_try='${CC-cc} -S conftest.c -o conftest.s 1>&5'
-+  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); }; }
-+    then
-+       libgcc_cv_copysignl_lib="-lm"
-+    fi
-+    rm -f conftest.*
-+
-+fi
-+echo "$as_me:$LINENO: result: $libgcc_cv_copysignl_lib" >&5
-+echo "${ECHO_T}$libgcc_cv_copysignl_lib" >&6
-+
-+case /${libgcc_cv_copysignl_lib}/ in
-+  /-lm/) LIBGCC_LIBM="$LIBGCC_LIBM -lm" ;;
-+  *) LIBGCC_LIBM= ;;
-+esac
- 
- # Conditionalize the makefile for this target machine.
- tmake_file_=
-diff -Nura gcc-4.5.1.orig/libgcc/configure.ac gcc-4.5.1/libgcc/configure.ac
---- gcc-4.5.1.orig/libgcc/configure.ac	2010-11-03 14:32:44.735904042 -0300
-+++ gcc-4.5.1/libgcc/configure.ac	2010-11-03 14:42:11.278904045 -0300
-@@ -238,6 +238,27 @@
- fi
- AC_SUBST(set_have_cc_tls)
- 
-+# On powerpc libgcc_s references copysignl which is a libm function but
-+# glibc apparently also provides it via libc as opposed to uClibc where
-+# it lives in libm.
-+AC_CACHE_CHECK
-+  libgcc_cv_copysignl_lib,
-+    echo '#include <features.h>' > conftest.c
-+    echo 'int the_libc = __UCLIBC__ + __powerpc__;' >> conftest.c
-+    libgcc_cv_copysignl_lib="-lc"
-+    if AC_TRY_COMMAND(${CC-cc} -S conftest.c -o conftest.s 1>&AS_MESSAGE_LOG_FD)
-+    then
-+       libgcc_cv_copysignl_lib="-lm"
-+    fi
-+    rm -f conftest.*
-+  ])
-+
-+case /${libgcc_cv_copysignl_lib}/ in
-+  /-lm/) LIBGCC_LIBM="$LIBGCC_LIBM -lm" ;;
-+  *) LIBGCC_LIBM= ;;
-+esac
-+AC_SUBST(LIBGCC_LIBM)
-+
- # See if we have emulated thread-local storage.
- GCC_CHECK_EMUTLS
- set_use_emutls=
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index fde1b90..8ec587c 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -22,13 +22,6 @@ choice
 		depends on BR2_avr32
 		bool "gcc 4.2.2-avr32-2.1.5"
 
-	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4 && !BR2_powerpc64le
-		depends on !BR2_ARM_EABIHF
-		bool "gcc 4.3.x"
-		# musl patches only for gcc 4.7+
-		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
-
 	config BR2_GCC_VERSION_4_4_X
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4 && !BR2_powerpc64le
 		bool "gcc 4.4.x"
@@ -48,13 +41,6 @@ choice
 		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
 		bool "gcc 4.5.x"
 
-	config BR2_GCC_VERSION_4_6_X
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4 && !BR2_powerpc64le
-		select BR2_GCC_NEEDS_MPC
-		# musl patches only for gcc 4.7+
-		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
-		bool "gcc 4.6.x"
-
 	config BR2_GCC_VERSION_4_7_X
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4 && !BR2_powerpc64le
 		select BR2_GCC_NEEDS_MPC
@@ -107,10 +93,8 @@ config BR2_GCC_SNAP_DATE
 config BR2_GCC_VERSION
 	string
 	default "4.2.2-avr32-2.1.5" if BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
-	default "4.3.6"     if BR2_GCC_VERSION_4_3_X
 	default "4.4.7"     if BR2_GCC_VERSION_4_4_X
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
-	default "4.6.4"     if BR2_GCC_VERSION_4_6_X
 	default "4.7.4"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.3"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.0"     if BR2_GCC_VERSION_4_9_X
