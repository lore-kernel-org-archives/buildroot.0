From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Aug 2009 10:34:34 +0200
Subject: [Buildroot] [git commit] toolchain/gcc: add 4.3.4
Message-ID: <20090805083504.B07F97777E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0ed2f023d0d2b7844a5fca9fc2724240fd310c89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/4.3.4/100-uclibc-conf.patch          |   33 +++++
 toolchain/gcc/4.3.4/104-gnuhurd-uclibc-conf.patch  |   13 ++
 toolchain/gcc/4.3.4/301-missing-execinfo_h.patch   |   11 ++
 toolchain/gcc/4.3.4/302-c99-snprintf.patch         |   13 ++
 .../gcc/4.3.4/305-libmudflap-susv3-legacy.patch    |   49 ++++++++
 toolchain/gcc/4.3.4/810-arm-softfloat-libgcc.patch |   29 +++++
 .../4.3.4/993-arm_insn-opinit-RTX_CODE-fixup.patch |   41 +++++++
 .../gcc/4.3.4/998-gcc-4.3.0-fix-header.00.patch    |   15 +++
 .../gcc/4.3.4/999-4.3.2-armeabi-aapcs-linux.patch  |   18 +++
 .../4.3.4/999-4.3.3-arm-fix-for-bug-37436.patch    |   86 ++++++++++++++
 ...gcc-4.3.0-cris-pragma-pack-warning-remove.patch |   13 ++
 .../powerpc-link-with-math-lib.patch.conditional   |  125 ++++++++++++++++++++
 toolchain/gcc/Config.in                            |    5 +
 13 files changed, 451 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/gcc/4.3.4/100-uclibc-conf.patch
 create mode 100644 toolchain/gcc/4.3.4/104-gnuhurd-uclibc-conf.patch
 create mode 100644 toolchain/gcc/4.3.4/301-missing-execinfo_h.patch
 create mode 100644 toolchain/gcc/4.3.4/302-c99-snprintf.patch
 create mode 100644 toolchain/gcc/4.3.4/305-libmudflap-susv3-legacy.patch
 create mode 100644 toolchain/gcc/4.3.4/810-arm-softfloat-libgcc.patch
 create mode 100644 toolchain/gcc/4.3.4/993-arm_insn-opinit-RTX_CODE-fixup.patch
 create mode 100644 toolchain/gcc/4.3.4/998-gcc-4.3.0-fix-header.00.patch
 create mode 100644 toolchain/gcc/4.3.4/999-4.3.2-armeabi-aapcs-linux.patch
 create mode 100644 toolchain/gcc/4.3.4/999-4.3.3-arm-fix-for-bug-37436.patch
 create mode 100644 toolchain/gcc/4.3.4/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
 create mode 100644 toolchain/gcc/4.3.4/powerpc-link-with-math-lib.patch.conditional

diff --git a/toolchain/gcc/4.3.4/100-uclibc-conf.patch b/toolchain/gcc/4.3.4/100-uclibc-conf.patch
new file mode 100644
index 0000000..cca8c82
--- /dev/null
+++ b/toolchain/gcc/4.3.4/100-uclibc-conf.patch
@@ -0,0 +1,33 @@
+--- gcc/gcc/config/--- gcc/contrib/regression/objs-gcc.sh
++++ gcc/contrib/regression/objs-gcc.sh
+@@ -105,6 +105,10 @@
+  then
+   make all-gdb all-dejagnu all-ld || exit 1
+   make install-gdb install-dejagnu install-ld || exit 1
++elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
++ then
++  make all-gdb all-dejagnu all-ld || exit 1
++  make install-gdb install-dejagnu install-ld || exit 1
+ elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
+   make bootstrap || exit 1
+   make install || exit 1
+--- gcc/libjava/classpath/ltconfig
++++ gcc/libjava/classpath/ltconfig
+@@ -603,7 +603,7 @@
+ 
+ # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
+ case $host_os in
+-linux-gnu*) ;;
++linux-gnu*|linux-uclibc*) ;;
+ linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
+ esac
+ 
+@@ -1251,7 +1251,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux*)
+   version_type=linux
+   need_lib_prefix=no
+   need_version=no
diff --git a/toolchain/gcc/4.3.4/104-gnuhurd-uclibc-conf.patch b/toolchain/gcc/4.3.4/104-gnuhurd-uclibc-conf.patch
new file mode 100644
index 0000000..c04dd9f
--- /dev/null
+++ b/toolchain/gcc/4.3.4/104-gnuhurd-uclibc-conf.patch
@@ -0,0 +1,13 @@
+diff -rdup gcc-4.2.1.oorig/gcc/config.gcc gcc-4.2.1/gcc/config.gcc
+--- gcc-4.2.1.oorig/gcc/config.gcc	2007-10-01 11:52:52.000000000 +0200
++++ gcc-4.2.1/gcc/config.gcc	2007-10-01 13:22:12.000000000 +0200
+@@ -494,6 +494,9 @@ case ${target} in
+     alpha*)
+       tm_file="${cpu_type}/${cpu_type}.h alpha/elf.h alpha/linux.h alpha/linux-elf.h gnu.h ${tm_file}"
+       ;;
++    i[34567]86-*hurd*-*)
++      tm_file="${cpu_type}/${cpu_type}.h i386/unix.h i386/att.h dbxelf.h elfos.h svr4.h i386/gnu.h gnu.h ${tm_file}"
++      ;;
+     i[34567]86-*-*)
+       tm_file="${cpu_type}/${cpu_type}.h i386/unix.h i386/att.h dbxelf.h elfos.h svr4.h linux.h i386/linux.h gnu.h ${tm_file}"
+       ;;
diff --git a/toolchain/gcc/4.3.4/301-missing-execinfo_h.patch b/toolchain/gcc/4.3.4/301-missing-execinfo_h.patch
new file mode 100644
index 0000000..0e2092f
--- /dev/null
+++ b/toolchain/gcc/4.3.4/301-missing-execinfo_h.patch
@@ -0,0 +1,11 @@
+--- gcc-4.0.0/boehm-gc/include/gc.h-orig	2005-04-28 22:28:57.000000000 -0500
++++ gcc-4.0.0/boehm-gc/include/gc.h	2005-04-28 22:30:38.000000000 -0500
+@@ -500,7 +500,7 @@
+ #ifdef __linux__
+ # include <features.h>
+ # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
+-     && !defined(__ia64__)
++     && !defined(__ia64__) && !defined(__UCLIBC__)
+ #   ifndef GC_HAVE_BUILTIN_BACKTRACE
+ #     define GC_HAVE_BUILTIN_BACKTRACE
+ #   endif
diff --git a/toolchain/gcc/4.3.4/302-c99-snprintf.patch b/toolchain/gcc/4.3.4/302-c99-snprintf.patch
new file mode 100644
index 0000000..ba51a0e
--- /dev/null
+++ b/toolchain/gcc/4.3.4/302-c99-snprintf.patch
@@ -0,0 +1,13 @@
+Index: gcc-4.3.0/libstdc++-v3/include/c_global/cstdio
+===================================================================
+--- gcc-4.3.0/libstdc++-v3/include/c_global/cstdio	(revision 129202)
++++ gcc-4.3.0/libstdc++-v3/include/c_global/cstdio	(working copy)
+@@ -144,7 +144,7 @@
+ 
+ _GLIBCXX_END_NAMESPACE
+ 
+-#if _GLIBCXX_USE_C99
++#if _GLIBCXX_USE_C99 || defined __UCLIBC__
+ 
+ #undef snprintf
+ #undef vfscanf
diff --git a/toolchain/gcc/4.3.4/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.3.4/305-libmudflap-susv3-legacy.patch
new file mode 100644
index 0000000..374b1f8
--- /dev/null
+++ b/toolchain/gcc/4.3.4/305-libmudflap-susv3-legacy.patch
@@ -0,0 +1,49 @@
+Index: gcc-4.2/libmudflap/mf-hooks2.c
+===================================================================
+--- gcc-4.2/libmudflap/mf-hooks2.c	(revision 119834)
++++ gcc-4.2/libmudflap/mf-hooks2.c	(working copy)
+@@ -427,7 +427,7 @@
+ {
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, n, __MF_CHECK_WRITE, "bzero region");
+-  bzero (s, n);
++  memset (s, 0, n);
+ }
+ 
+ 
+@@ -437,7 +437,7 @@
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(src, n, __MF_CHECK_READ, "bcopy src");
+   MF_VALIDATE_EXTENT(dest, n, __MF_CHECK_WRITE, "bcopy dest");
+-  bcopy (src, dest, n);
++  memmove (dest, src, n);
+ }
+ 
+ 
+@@ -447,7 +447,7 @@
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s1, n, __MF_CHECK_READ, "bcmp 1st arg");
+   MF_VALIDATE_EXTENT(s2, n, __MF_CHECK_READ, "bcmp 2nd arg");
+-  return bcmp (s1, s2, n);
++  return n == 0 ? 0 : memcmp (s1, s2, n);
+ }
+ 
+ 
+@@ -456,7 +456,7 @@
+   size_t n = strlen (s);
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "index region");
+-  return index (s, c);
++  return strchr (s, c);
+ }
+ 
+ 
+@@ -465,7 +465,7 @@
+   size_t n = strlen (s);
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "rindex region");
+-  return rindex (s, c);
++  return strrchr (s, c);
+ }
+ 
+ /* XXX:  stpcpy, memccpy */
diff --git a/toolchain/gcc/4.3.4/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.3.4/810-arm-softfloat-libgcc.patch
new file mode 100644
index 0000000..1639c39
--- /dev/null
+++ b/toolchain/gcc/4.3.4/810-arm-softfloat-libgcc.patch
@@ -0,0 +1,29 @@
+Index: gcc-4.3.0/gcc/config/arm/t-linux
+===================================================================
+--- gcc-4.3.0/gcc/config/arm/t-linux	(revision 129896)
++++ gcc-4.3.0/gcc/config/arm/t-linux	(working copy)
+@@ -3,7 +3,10 @@
+ TARGET_LIBGCC2_CFLAGS = -fomit-frame-pointer -fPIC
+ 
+ LIB1ASMSRC = arm/lib1funcs.asm
+-LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx
++LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx \
++      _negdf2 _addsubdf3 _muldivdf3 _cmpdf2 _unorddf2 _fixdfsi _fixunsdfsi \
++      _truncdfsf2 _negsf2 _addsubsf3 _muldivsf3 _cmpsf2 _unordsf2 \
++      _fixsfsi _fixunssfsi _floatdidf _floatundidf _floatdisf _floatundisf
+ 
+ # MULTILIB_OPTIONS = mhard-float/msoft-float
+ # MULTILIB_DIRNAMES = hard-float soft-float
+Index: gcc-4.3.0/gcc/config/arm/linux-elf.h
+===================================================================
+--- gcc-4.3.0/gcc/config/arm/linux-elf.h	(revision 129896)
++++ gcc-4.3.0/gcc/config/arm/linux-elf.h	(working copy)
+@@ -48,7 +62,7 @@
+    %{shared:-lc} \
+    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
+ 
+-#define LIBGCC_SPEC "%{msoft-float:-lfloat} %{mfloat-abi=soft*:-lfloat} -lgcc"
++#define LIBGCC_SPEC "-lgcc"
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
+ 
diff --git a/toolchain/gcc/4.3.4/993-arm_insn-opinit-RTX_CODE-fixup.patch b/toolchain/gcc/4.3.4/993-arm_insn-opinit-RTX_CODE-fixup.patch
new file mode 100644
index 0000000..69f0c37
--- /dev/null
+++ b/toolchain/gcc/4.3.4/993-arm_insn-opinit-RTX_CODE-fixup.patch
@@ -0,0 +1,41 @@
+gcc/ChangeLog
+2007-11-27  Bernhard Fischer  <>
+
+	* config/arm/arm-protos.h (arm_vector_mode_supported_p,
+	arm_hard_regno_mode_ok, const_ok_for_arm): Do not hide non-rtx related
+	function prototypes in RTX_CODE.
+	* genopinit.c: Include tm_p.h.
+
+Index: gcc-4.3.0/gcc/config/arm/arm-protos.h
+===================================================================
+--- gcc-4.3.0/gcc/config/arm/arm-protos.h	(revision 130463)
++++ gcc-4.3.0/gcc/config/arm/arm-protos.h	(working copy)
+@@ -40,15 +40,14 @@
+ 							       unsigned int);
+ extern unsigned int arm_dbx_register_number (unsigned int);
+ extern void arm_output_fn_unwind (FILE *, bool);
+-  
+ 
+ #ifdef TREE_CODE
+ extern int arm_return_in_memory (const_tree);
+ #endif
+-#ifdef RTX_CODE
+ extern bool arm_vector_mode_supported_p (enum machine_mode);
+ extern int arm_hard_regno_mode_ok (unsigned int, enum machine_mode);
+ extern int const_ok_for_arm (HOST_WIDE_INT);
++#ifdef RTX_CODE
+ extern int arm_split_constant (RTX_CODE, enum machine_mode, rtx,
+ 			       HOST_WIDE_INT, rtx, rtx, int);
+ extern RTX_CODE arm_canonicalize_comparison (RTX_CODE, enum machine_mode,
+Index: gcc-4.3.0/gcc/genopinit.c
+===================================================================
+--- gcc-4.3.0/gcc/genopinit.c	(revision 130463)
++++ gcc-4.3.0/gcc/genopinit.c	(working copy)
+@@ -486,6 +486,7 @@
+   printf ("#include \"expr.h\"\n");
+   printf ("#include \"optabs.h\"\n");
+   printf ("#include \"reload.h\"\n\n");
++  printf ("#include \"tm_p.h\"\n\n");
+ 
+   printf ("void\ninit_all_optabs (void)\n{\n");
+ 
diff --git a/toolchain/gcc/4.3.4/998-gcc-4.3.0-fix-header.00.patch b/toolchain/gcc/4.3.4/998-gcc-4.3.0-fix-header.00.patch
new file mode 100644
index 0000000..7fe59d2
--- /dev/null
+++ b/toolchain/gcc/4.3.4/998-gcc-4.3.0-fix-header.00.patch
@@ -0,0 +1,15 @@
+\\\\
+\\ gcc PR33200
+Index: gcc-4.3.0/gcc/config.gcc
+===================================================================
+--- gcc-4.3.0/gcc/config.gcc	(revision 131628)
++++ gcc-4.3.0/gcc/config.gcc	(working copy)
+@@ -2302,7 +2305,7 @@ sh-*-symbianelf* | sh[12346l]*-*-symbian
+ 	if test x${enable_incomplete_targets} = xyes ; then
+ 		tm_defines="$tm_defines SUPPORT_SH1=1 SUPPORT_SH2E=1 SUPPORT_SH4=1 SUPPORT_SH4_SINGLE=1 SUPPORT_SH2A=1 SUPPORT_SH2A_SINGLE=1 SUPPORT_SH5_32MEDIA=1 SUPPORT_SH5_32MEDIA_NOFPU=1 SUPPORT_SH5_64MEDIA=1 SUPPORT_SH5_64MEDIA_NOFPU=1"
+ 	fi
+-	use_fixproto=yes
++	# XXX: why? use_fixproto=yes
+ 	;;
+ sh-*-rtemscoff*)
+ 	tmake_file="sh/t-sh t-rtems sh/t-rtems"
diff --git a/toolchain/gcc/4.3.4/999-4.3.2-armeabi-aapcs-linux.patch b/toolchain/gcc/4.3.4/999-4.3.2-armeabi-aapcs-linux.patch
new file mode 100644
index 0000000..f4b1c9c
--- /dev/null
+++ b/toolchain/gcc/4.3.4/999-4.3.2-armeabi-aapcs-linux.patch
@@ -0,0 +1,18 @@
+\\\\ followup of PR34205; trying to use aapcs-linux
+\\ gcc/ChangeLog
+\\
+\\ 2008-09-18  Bernhard Reutner-Fischer  <aldot@>
+\\
+\\ * config.gcc (arm*-*-*): Add aapcs-linux to supported ABIs.
+\\
+--- gcc-4.3.2.orig/gcc/config.gcc	2008-09-18 20:33:55.000000000 +0200
++++ gcc-4.3.2/gcc/config.gcc	2008-09-18 21:38:52.000000000 +0200
+@@ -2921,7 +2921,7 @@
+ 
+ 		case "$with_abi" in
+ 		"" \
+-		| apcs-gnu | atpcs | aapcs | iwmmxt )
++		| apcs-gnu | atpcs | aapcs | iwmmxt | aapcs-linux )
+ 			#OK
+ 			;;
+ 		*)
diff --git a/toolchain/gcc/4.3.4/999-4.3.3-arm-fix-for-bug-37436.patch b/toolchain/gcc/4.3.4/999-4.3.3-arm-fix-for-bug-37436.patch
new file mode 100644
index 0000000..99a016f
--- /dev/null
+++ b/toolchain/gcc/4.3.4/999-4.3.3-arm-fix-for-bug-37436.patch
@@ -0,0 +1,86 @@
+gcc svn 142778:
+
+PR target/37436
+* arm.c (arm_legitimate_index): Only accept addresses that are in
+canonical form.
+* predicates.md (arm_reg_or_extendqisi_mem_op): New predicate.
+* arm.md (extendqihi2): Use arm_reg_or_extendqisi_mem_op predicate
+for operand1.
+(extendqisi2): Likewise.
+(arm_extendqisi, arm_extendqisi_v6): Use arm_extendqisi_mem_op
+predicate for operand1.
+
+diff -Nura gcc-4.3.3.orig/gcc/config/arm/arm.c gcc-4.3.3/gcc/config/arm/arm.c
+--- gcc-4.3.3.orig/gcc/config/arm/arm.c	2008-06-11 07:52:55.000000000 -0300
++++ gcc-4.3.3/gcc/config/arm/arm.c	2009-05-21 16:06:45.000000000 -0300
+@@ -3769,6 +3769,7 @@
+       rtx xop1 = XEXP (x, 1);
+ 
+       return ((arm_address_register_rtx_p (xop0, strict_p)
++	       && GET_CODE(xop1) == CONST_INT
+ 	       && arm_legitimate_index_p (mode, xop1, outer, strict_p))
+ 	      || (arm_address_register_rtx_p (xop1, strict_p)
+ 		  && arm_legitimate_index_p (mode, xop0, outer, strict_p)));
+diff -Nura gcc-4.3.3.orig/gcc/config/arm/arm.md gcc-4.3.3/gcc/config/arm/arm.md
+--- gcc-4.3.3.orig/gcc/config/arm/arm.md	2007-09-04 01:44:47.000000000 -0300
++++ gcc-4.3.3/gcc/config/arm/arm.md	2009-05-21 16:06:45.000000000 -0300
+@@ -4199,7 +4199,7 @@
+ 
+ (define_expand "extendqihi2"
+   [(set (match_dup 2)
+-	(ashift:SI (match_operand:QI 1 "general_operand" "")
++	(ashift:SI (match_operand:QI 1 "arm_reg_or_extendqisi_mem_op" "")
+ 		   (const_int 24)))
+    (set (match_operand:HI 0 "s_register_operand" "")
+ 	(ashiftrt:SI (match_dup 2)
+@@ -4224,7 +4224,7 @@
+ 
+ (define_insn "*arm_extendqihi_insn"
+   [(set (match_operand:HI 0 "s_register_operand" "=r")
+-	(sign_extend:HI (match_operand:QI 1 "memory_operand" "Uq")))]
++	(sign_extend:HI (match_operand:QI 1 "arm_extendqisi_mem_op" "Uq")))]
+   "TARGET_ARM && arm_arch4"
+   "ldr%(sb%)\\t%0, %1"
+   [(set_attr "type" "load_byte")
+@@ -4235,7 +4235,7 @@
+ 
+ (define_expand "extendqisi2"
+   [(set (match_dup 2)
+-	(ashift:SI (match_operand:QI 1 "general_operand" "")
++	(ashift:SI (match_operand:QI 1 "arm_reg_or_extendqisi_mem_op" "")
+ 		   (const_int 24)))
+    (set (match_operand:SI 0 "s_register_operand" "")
+ 	(ashiftrt:SI (match_dup 2)
+@@ -4267,7 +4267,7 @@
+ 
+ (define_insn "*arm_extendqisi"
+   [(set (match_operand:SI 0 "s_register_operand" "=r")
+-	(sign_extend:SI (match_operand:QI 1 "memory_operand" "Uq")))]
++	(sign_extend:SI (match_operand:QI 1 "arm_extendqisi_mem_op" "Uq")))]
+   "TARGET_ARM && arm_arch4 && !arm_arch6"
+   "ldr%(sb%)\\t%0, %1"
+   [(set_attr "type" "load_byte")
+@@ -4278,7 +4278,8 @@
+ 
+ (define_insn "*arm_extendqisi_v6"
+   [(set (match_operand:SI 0 "s_register_operand" "=r,r")
+-	(sign_extend:SI (match_operand:QI 1 "nonimmediate_operand" "r,Uq")))]
++	(sign_extend:SI
++	 (match_operand:QI 1 "arm_reg_or_extendqisi_mem_op" "r,Uq")))]
+   "TARGET_ARM && arm_arch6"
+   "@
+    sxtb%?\\t%0, %1
+diff -Nura gcc-4.3.3.orig/gcc/config/arm/predicates.md gcc-4.3.3/gcc/config/arm/predicates.md
+--- gcc-4.3.3.orig/gcc/config/arm/predicates.md	2007-08-02 07:49:31.000000000 -0300
++++ gcc-4.3.3/gcc/config/arm/predicates.md	2009-05-21 16:06:45.000000000 -0300
+@@ -234,6 +234,10 @@
+        (match_test "arm_legitimate_address_p (mode, XEXP (op, 0), SIGN_EXTEND,
+ 					      0)")))
+ 
++(define_special_predicate "arm_reg_or_extendqisi_mem_op"
++  (ior (match_operand 0 "arm_extendqisi_mem_op")
++       (match_operand 0 "s_register_operand")))
++
+ (define_predicate "power_of_two_operand"
+   (match_code "const_int")
+ {
diff --git a/toolchain/gcc/4.3.4/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch b/toolchain/gcc/4.3.4/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
new file mode 100644
index 0000000..dcf01f2
--- /dev/null
+++ b/toolchain/gcc/4.3.4/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
@@ -0,0 +1,13 @@
+diff -urN gcc-4.3.1.orig/gcc/config/cris/cris.h gcc-4.3.1/gcc/config/cris/cris.h
+--- gcc-4.3.1.orig/gcc/config/cris/cris.h	2008-02-22 12:11:01.000000000 +0100
++++ gcc-4.3.1/gcc/config/cris/cris.h	2008-07-02 10:42:42.000000000 +0200
+@@ -1529,9 +1529,6 @@
+ 
+ #define NO_IMPLICIT_EXTERN_C
+ 
+-/* No specific purpose other than warningless compatibility.  */
+-#define HANDLE_PRAGMA_PACK_PUSH_POP 1
+-
+ /*
+  * Local variables:
+  * eval: (c-set-style "gnu")
diff --git a/toolchain/gcc/4.3.4/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.3.4/powerpc-link-with-math-lib.patch.conditional
new file mode 100644
index 0000000..9d01eba
--- /dev/null
+++ b/toolchain/gcc/4.3.4/powerpc-link-with-math-lib.patch.conditional
@@ -0,0 +1,125 @@
+See: http://gcc.gnu.org/ml/gcc-patches/2008-10/msg00237.html
+Patch by: Bernhard Reutner-Fischer
+
+--- gcc-4.3.3/gcc/config/t-slibgcc-elf-ver	2005-02-20 00:44:10.000000000 +1300
++++ gcc-4.3.3-p/gcc/config/t-slibgcc-elf-ver	2009-05-06 07:05:50.000000000 +1200
+@@ -9,7 +9,7 @@
+ SHLIB_OBJS = @shlib_objs@
+ SHLIB_DIR = @multilib_dir@
+ SHLIB_SLIBDIR_QUAL = @shlib_slibdir_qual@
+-SHLIB_LC = -lc
++SHLIB_LC = @libgcc_libm@ -lc
+ 
+ SHLIB_LINK = $(GCC_FOR_TARGET) $(LIBGCC2_CFLAGS) -shared -nodefaultlibs \
+ 	-Wl,--soname=$(SHLIB_SONAME) \
+--- gcc-4.3.3/libgcc/configure	2008-11-21 06:09:53.000000000 +1300
++++ gcc-4.3.3-p/libgcc/configure	2009-05-06 07:05:50.000000000 +1200
+@@ -272,7 +272,7 @@
+ PACKAGE_BUGREPORT=''
+ 
+ ac_unique_file="static-object.mk"
+-ac_subst_vars='SHELL PATH_SEPARATOR PACKAGE_NAME PACKAGE_TARNAME PACKAGE_VERSION PACKAGE_STRING PACKAGE_BUGREPORT exec_prefix prefix program_transform_name bindir sbindir libexecdir datadir sysconfdir sharedstatedir localstatedir libdir includedir oldincludedir infodir mandir build_alias host_alias target_alias DEFS ECHO_C ECHO_N ECHO_T LIBS libgcc_topdir enable_shared slibdir INSTALL_PROGRAM INSTALL_SCRIPT INSTALL_DATA AWK build build_cpu build_vendor build_os host host_cpu host_vendor host_os host_noncanonical build_libsubdir build_subdir host_subdir target_subdir AR ac_ct_AR LIPO ac_ct_LIPO NM ac_ct_NM RANLIB ac_ct_RANLIB STRIP ac_ct_STRIP LN_S CC CFLAGS LDFLAGS CPPFLAGS ac_ct_CC EXEEXT OBJEXT CPP decimal_float enable_decimal_float fixed_point vis_hide set_have_cc_tls tmake_file extra_parts asm_hidden_op LIBOBJS LTLIBOBJS'
++ac_subst_vars='SHELL PATH_SEPARATOR PACKAGE_NAME PACKAGE_TARNAME PACKAGE_VERSION PACKAGE_STRING PACKAGE_BUGREPORT exec_prefix prefix program_transform_name bindir sbindir libexecdir datadir sysconfdir sharedstatedir localstatedir libdir includedir oldincludedir infodir mandir build_alias host_alias target_alias DEFS ECHO_C ECHO_N ECHO_T LIBS libgcc_topdir enable_shared slibdir INSTALL_PROGRAM INSTALL_SCRIPT INSTALL_DATA AWK build build_cpu build_vendor build_os host host_cpu host_vendor host_os host_noncanonical build_libsubdir build_subdir host_subdir target_subdir AR ac_ct_AR LIPO ac_ct_LIPO NM ac_ct_NM RANLIB ac_ct_RANLIB STRIP ac_ct_STRIP LN_S CC CFLAGS LDFLAGS CPPFLAGS ac_ct_CC EXEEXT OBJEXT CPP decimal_float enable_decimal_float fixed_point vis_hide set_have_cc_tls LIBGCC_LIBM tmake_file extra_parts asm_hidden_op LIBOBJS LTLIBOBJS'
+ ac_subst_files=''
+ 
+ # Initialize some variables set by options.
+@@ -3505,6 +3505,39 @@
+ fi
+ 
+ 
++# On powerpc libgcc_s references copysignl which is a libm function but
++# glibc apparently also provides it via libc as opposed to uClibc where
++# it lives in libm.
++echo "$as_me:$LINENO: checking for library containing copysignl" >&5
++echo $ECHO_N "checking for library containing copysignl... $ECHO_C" >&6
++if test "${libgcc_cv_copysignl_lib+set}" = set; then
++  echo $ECHO_N "(cached) $ECHO_C" >&6
++else
++
++    echo '#include <features.h>' > conftest.c
++    echo 'int the_libc = __UCLIBC__ + __powerpc__;' >> conftest.c
++    libgcc_cv_copysignl_lib="-lc"
++    if { ac_try='${CC-cc} -S conftest.c -o conftest.s 1>&5'
++  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
++  (eval $ac_try) 2>&5
++  ac_status=$?
++  echo "$as_me:$LINENO: \$? = $ac_status" >&5
++  (exit $ac_status); }; }
++    then
++	libgcc_cv_copysignl_lib="-lm"
++    fi
++    rm -f conftest.*
++
++fi
++echo "$as_me:$LINENO: result: $libgcc_cv_copysignl_lib" >&5
++echo "${ECHO_T}$libgcc_cv_copysignl_lib" >&6
++
++case /${libgcc_cv_copysignl_lib}/ in
++  /-lm/) LIBGCC_LIBM="$LIBGCC_LIBM -lm" ;;
++  *) LIBGCC_LIBM= ;;
++esac
++
++
+ # Conditionalize the makefile for this target machine.
+ tmake_file_=
+ for f in ${tmake_file}
+@@ -4225,6 +4258,7 @@
+ s, at fixed_point@,$fixed_point,;t t
+ s, at vis_hide@,$vis_hide,;t t
+ s, at set_have_cc_tls@,$set_have_cc_tls,;t t
++s, at LIBGCC_LIBM@,$LIBGCC_LIBM,;t t
+ s, at tmake_file@,$tmake_file,;t t
+ s, at extra_parts@,$extra_parts,;t t
+ s, at asm_hidden_op@,$asm_hidden_op,;t t
+--- gcc-4.3.3/libgcc/configure.ac	2008-11-21 06:09:53.000000000 +1300
++++ gcc-4.3.3-p/libgcc/configure.ac	2009-05-06 07:05:50.000000000 +1200
+@@ -207,6 +207,27 @@
+ fi
+ AC_SUBST(set_have_cc_tls)
+ 
++# On powerpc libgcc_s references copysignl which is a libm function but
++# glibc apparently also provides it via libc as opposed to uClibc where
++# it lives in libm.
++AC_CACHE_CHECK([for library containing copysignl],
++  libgcc_cv_copysignl_lib, [
++    echo '#include <features.h>' > conftest.c
++    echo 'int the_libc = __UCLIBC__ + __powerpc__;' >> conftest.c
++    libgcc_cv_copysignl_lib="-lc"
++    if AC_TRY_COMMAND(${CC-cc} -S conftest.c -o conftest.s 1>&AS_MESSAGE_LOG_FD)
++    then
++	libgcc_cv_copysignl_lib="-lm"
++    fi
++    rm -f conftest.*
++  ])
++
++case /${libgcc_cv_copysignl_lib}/ in
++  /-lm/) LIBGCC_LIBM="$LIBGCC_LIBM -lm" ;;
++  *) LIBGCC_LIBM= ;;
++esac
++AC_SUBST(LIBGCC_LIBM)
++
+ # Conditionalize the makefile for this target machine.
+ tmake_file_=
+ for f in ${tmake_file}
+--- gcc-4.3.3/libgcc/Makefile.in	2008-06-17 21:32:34.000000000 +1200
++++ gcc-4.3.3-p/libgcc/Makefile.in	2009-05-06 07:05:50.000000000 +1200
+@@ -40,6 +40,7 @@
+ decimal_float = @decimal_float@
+ enable_decimal_float = @enable_decimal_float@
+ fixed_point = @fixed_point@
++LIBGCC_LIBM = @LIBGCC_LIBM@
+ 
+ host_noncanonical = @host_noncanonical@
+ 
+@@ -738,9 +739,10 @@
+ 		@multilib_dir@,$(MULTIDIR),$(subst \
+ 		@shlib_objs@,$(objects),$(subst \
+ 		@shlib_base_name@,libgcc_s,$(subst \
++		@libgcc_libm@,$(LIBGCC_LIBM),$(subst \
+ 		@shlib_map_file@,$(mapfile),$(subst \
+ 		@shlib_slibdir_qual@,$(MULTIOSSUBDIR),$(subst \
+-		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK))))))))
++		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK)))))))))
+ 
+ libunwind$(SHLIB_EXT): $(libunwind-s-objects) $(extra-parts)
+ 	# @multilib_flags@ is still needed because this may use
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index ac37dd1..8246a95 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -56,6 +56,10 @@ choice
 		depends on !BR2_avr32 && !BR2_nios2
 		bool "gcc 4.3.3"
 
+	config BR2_GCC_VERSION_4_3_4
+		depends on !BR2_avr32 && !BR2_nios2
+		bool "gcc 4.3.4"
+
 	config BR2_GCC_VERSION_4_4_X
 		depends on !BR2_avr32 && !BR2_nios2
 		bool "gcc 4.4.x"
@@ -99,6 +103,7 @@ config BR2_GCC_VERSION
 	default "4.2.4"     if BR2_GCC_VERSION_4_2_4
 	default "4.3.2"     if BR2_GCC_VERSION_4_3_2
 	default "4.3.3"     if BR2_GCC_VERSION_4_3_3
+	default "4.3.4"     if BR2_GCC_VERSION_4_3_4
 	default "4.4.1"     if BR2_GCC_VERSION_4_4_X
 	default "4.3"       if BR2_GCC_VERSION_4_3
 
-- 
1.6.3.3
