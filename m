From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Apr 2012 11:13:27 +0200
Subject: [Buildroot] [git commit] toolchain/gcc: add 4.7.x series
Message-ID: <20120415120358.3300D96ABC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4a8ae3e8cc9f5a7b0b4b6f7004c51e661dcc456
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add gcc 4.7.0 to the toolchain options.

[Peter: drop 0001-toolchain-gcc-add-4.7.x-series.txt]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Config.in.arch                              |    1 +
 toolchain/gcc/4.7.0/100-uclibc-conf.patch          |   33 +++++
 toolchain/gcc/4.7.0/200-gcc-pr52734.patch          |  115 ++++++++++++++++++
 toolchain/gcc/4.7.0/301-missing-execinfo_h.patch   |   11 ++
 toolchain/gcc/4.7.0/302-c99-snprintf.patch         |   13 ++
 .../gcc/4.7.0/305-libmudflap-susv3-legacy.patch    |   49 ++++++++
 toolchain/gcc/4.7.0/810-arm-softfloat-libgcc.patch |   25 ++++
 toolchain/gcc/4.7.0/830-arm_unbreak_armv4t.patch   |   13 ++
 .../powerpc-link-with-math-lib.patch.conditional   |  125 ++++++++++++++++++++
 toolchain/gcc/Config.in                            |    5 +
 toolchain/gcc/Config.in.2                          |    2 +-
 toolchain/gcc/gcc-uclibc-4.x.mk                    |   10 ++
 12 files changed, 401 insertions(+), 1 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index a2c0037..f8ab84e 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -221,6 +221,7 @@ config BR2_ARM_EABI
 	bool "EABI"
 config BR2_ARM_OABI
 	bool "OABI"
+	depends on !BR2_GCC_VERSION_4_7_X
 endchoice
 
 choice
diff --git a/toolchain/gcc/4.7.0/100-uclibc-conf.patch b/toolchain/gcc/4.7.0/100-uclibc-conf.patch
new file mode 100644
index 0000000..cca8c82
--- /dev/null
+++ b/toolchain/gcc/4.7.0/100-uclibc-conf.patch
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
diff --git a/toolchain/gcc/4.7.0/200-gcc-pr52734.patch b/toolchain/gcc/4.7.0/200-gcc-pr52734.patch
new file mode 100644
index 0000000..a1ac601
--- /dev/null
+++ b/toolchain/gcc/4.7.0/200-gcc-pr52734.patch
@@ -0,0 +1,115 @@
+Index: gcc/tree-ssa-tail-merge.c
+===================================================================
+--- a/gcc/tree-ssa-tail-merge.c (revision 185028)
++++ b/gcc/tree-ssa-tail-merge.c (working copy)
+@@ -1123,18 +1123,31 @@ gimple_equal_p (same_succ same_succ, gim
+     }
+ }
+ 
+-/* Let GSI skip backwards over local defs.  */
++/* Let GSI skip backwards over local defs.  Return the earliest vuse in VUSE.
++   Return true in VUSE_ESCAPED if the vuse influenced a SSA_OP_DEF of one of the
++   processed statements.  */
+ 
+ static void
+-gsi_advance_bw_nondebug_nonlocal (gimple_stmt_iterator *gsi)
++gsi_advance_bw_nondebug_nonlocal (gimple_stmt_iterator *gsi, tree *vuse,
++				  bool *vuse_escaped)
+ {
+   gimple stmt;
++  tree lvuse;
+ 
+   while (true)
+     {
+       if (gsi_end_p (*gsi))
+ 	return;
+       stmt = gsi_stmt (*gsi);
++
++      lvuse = gimple_vuse (stmt);
++      if (lvuse != NULL_TREE)
++	{
++	  *vuse = lvuse;
++	  if (!ZERO_SSA_OPERANDS (stmt, SSA_OP_DEF))
++	    *vuse_escaped = true;
++	}
++
+       if (!(is_gimple_assign (stmt) && local_def (gimple_get_lhs (stmt))
+ 	    && !gimple_has_side_effects (stmt)))
+ 	return;
+@@ -1150,9 +1163,11 @@ find_duplicate (same_succ same_succ, bas
+ {
+   gimple_stmt_iterator gsi1 = gsi_last_nondebug_bb (bb1);
+   gimple_stmt_iterator gsi2 = gsi_last_nondebug_bb (bb2);
++  tree vuse1 = NULL_TREE, vuse2 = NULL_TREE;
++  bool vuse_escaped = false;
+ 
+-  gsi_advance_bw_nondebug_nonlocal (&gsi1);
+-  gsi_advance_bw_nondebug_nonlocal (&gsi2);
++  gsi_advance_bw_nondebug_nonlocal (&gsi1, &vuse1, &vuse_escaped);
++  gsi_advance_bw_nondebug_nonlocal (&gsi2, &vuse2, &vuse_escaped);
+ 
+   while (!gsi_end_p (gsi1) && !gsi_end_p (gsi2))
+     {
+@@ -1161,13 +1176,20 @@ find_duplicate (same_succ same_succ, bas
+ 
+       gsi_prev_nondebug (&gsi1);
+       gsi_prev_nondebug (&gsi2);
+-      gsi_advance_bw_nondebug_nonlocal (&gsi1);
+-      gsi_advance_bw_nondebug_nonlocal (&gsi2);
++      gsi_advance_bw_nondebug_nonlocal (&gsi1, &vuse1, &vuse_escaped);
++      gsi_advance_bw_nondebug_nonlocal (&gsi2, &vuse2, &vuse_escaped);
+     }
+ 
+   if (!(gsi_end_p (gsi1) && gsi_end_p (gsi2)))
+     return;
+ 
++  /* If the incoming vuses are not the same, and the vuse escaped into an
++     SSA_OP_DEF, then merging the 2 blocks will change the value of the def,
++     which potentially means the semantics of one of the blocks will be changed.
++     TODO: make this check more precise.  */
++  if (vuse_escaped && vuse1 != vuse2)
++    return;
++
+   if (dump_file)
+     fprintf (dump_file, "find_duplicates: <bb %d> duplicate of <bb %d>\n",
+ 	     bb1->index, bb2->index);
+Index: gcc/testsuite/gcc.dg/pr52734.c
+===================================================================
+--- a/dev/null (new file)
++++ b/gcc/testsuite/gcc.dg/pr52734.c (revision 0)
+@@ -0,0 +1,35 @@
++/* { dg-do run } */
++/* { dg-options "-O2" } */
++
++int bbb = 0;
++
++int __attribute__((noinline,noclone)) aaa(void)
++{
++    ++bbb;
++    return 0;
++}
++
++int __attribute__((noinline,noclone)) ccc(void)
++{
++  int ddd;
++  /* bbb == 0 */
++  if (aaa())
++    return bbb;
++
++  /* bbb == 1 */
++  ddd = bbb;
++  /* bbb == ddd == 1 */
++  if (aaa ())
++    return 0;
++  /* bbb == 2, ddd == 1 */
++
++  return ddd;
++}
++
++int main(void)
++{
++    if (ccc() != 1)
++	__builtin_abort();
++    return 0;
++}
++
diff --git a/toolchain/gcc/4.7.0/301-missing-execinfo_h.patch b/toolchain/gcc/4.7.0/301-missing-execinfo_h.patch
new file mode 100644
index 0000000..0e2092f
--- /dev/null
+++ b/toolchain/gcc/4.7.0/301-missing-execinfo_h.patch
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
diff --git a/toolchain/gcc/4.7.0/302-c99-snprintf.patch b/toolchain/gcc/4.7.0/302-c99-snprintf.patch
new file mode 100644
index 0000000..ba51a0e
--- /dev/null
+++ b/toolchain/gcc/4.7.0/302-c99-snprintf.patch
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
diff --git a/toolchain/gcc/4.7.0/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.7.0/305-libmudflap-susv3-legacy.patch
new file mode 100644
index 0000000..374b1f8
--- /dev/null
+++ b/toolchain/gcc/4.7.0/305-libmudflap-susv3-legacy.patch
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
diff --git a/toolchain/gcc/4.7.0/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.7.0/810-arm-softfloat-libgcc.patch
new file mode 100644
index 0000000..a3d7db0
--- /dev/null
+++ b/toolchain/gcc/4.7.0/810-arm-softfloat-libgcc.patch
@@ -0,0 +1,25 @@
+--- a/gcc/config/arm/linux-elf.h
++++ b/gcc/config/arm/linux-elf.h
+@@ -57,7 +57,7 @@
+    %{shared:-lc} \
+    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
+ 
+-#define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
++#define LIBGCC_SPEC "-lgcc"
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
+ 
+--- a/libgcc/config/arm/t-linux
++++ b/libgcc/config/arm/t-linux
+@@ -1,6 +1,10 @@
+ LIB1ASMSRC = arm/lib1funcs.S
+ LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx _clzsi2 _clzdi2 \
+-	_arm_addsubdf3 _arm_addsubsf3
++	_arm_addsubdf3 _arm_addsubsf3 \
++	_arm_negdf2 _arm_muldivdf3 _arm_cmpdf2 _arm_unorddf2 \
++	_arm_fixdfsi _arm_fixunsdfsi _arm_truncdfsf2 \
++	_arm_negsf2 _arm_muldivsf3 _arm_cmpsf2 _arm_unordsf2 \
++	_arm_fixsfsi _arm_fixunssfsi
+ 
+ # Just for these, we omit the frame pointer since it makes such a big
+ # difference.
diff --git a/toolchain/gcc/4.7.0/830-arm_unbreak_armv4t.patch b/toolchain/gcc/4.7.0/830-arm_unbreak_armv4t.patch
new file mode 100644
index 0000000..37f8f2a
--- /dev/null
+++ b/toolchain/gcc/4.7.0/830-arm_unbreak_armv4t.patch
@@ -0,0 +1,13 @@
+http://sourceware.org/ml/crossgcc/2008-05/msg00009.html
+
+--- a/gcc/config/arm/linux-eabi.h
++++ b/gcc/config/arm/linux-eabi.h
+@@ -45,7 +45,7 @@
+    The ARM10TDMI core is the default for armv5t, so set
+    SUBTARGET_CPU_DEFAULT to achieve this.  */
+ #undef  SUBTARGET_CPU_DEFAULT
+-#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm10tdmi
++#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm9tdmi
+ 
+ /* TARGET_BIG_ENDIAN_DEFAULT is set in
+    config.gcc for big endian configurations.  */
diff --git a/toolchain/gcc/4.7.0/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.7.0/powerpc-link-with-math-lib.patch.conditional
new file mode 100644
index 0000000..7e75e87
--- /dev/null
+++ b/toolchain/gcc/4.7.0/powerpc-link-with-math-lib.patch.conditional
@@ -0,0 +1,125 @@
+http://gcc.gnu.org/ml/gcc-patches/2008-10/msg00269.html
+
+On glibc the libc.so carries a copy of the math function copysignl() but
+on uClibc math functions like copysignl() live in libm. Since libgcc_s
+contains unresolved symbols, any attempt to link against libgcc_s
+without explicitely specifying -lm fails, resulting in a broken
+bootstrap of the compiler.
+
+Forward port to gcc 4.5.1 by Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura gcc-4.5.1.orig/gcc/config/t-slibgcc-elf-ver gcc-4.5.1/gcc/config/t-slibgcc-elf-ver
+--- gcc-4.5.1.orig/gcc/config/t-slibgcc-elf-ver	2010-11-03 14:35:08.644904042 -0300
++++ gcc-4.5.1/gcc/config/t-slibgcc-elf-ver	2010-11-03 14:35:56.332904024 -0300
+@@ -27,7 +27,7 @@
+ SHLIB_OBJS = @shlib_objs@
+ SHLIB_DIR = @multilib_dir@
+ SHLIB_SLIBDIR_QUAL = @shlib_slibdir_qual@
+-SHLIB_LC = -lc
++SHLIB_LC = @libgcc_libm@ -lc
+ SHLIB_MAKE_SOLINK = $(LN_S) $(SHLIB_SONAME) $(SHLIB_DIR)/$(SHLIB_SOLINK)
+ SHLIB_INSTALL_SOLINK = $(LN_S) $(SHLIB_SONAME) \
+ 	$$(DESTDIR)$$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
+diff -Nura gcc-4.5.1.orig/libgcc/Makefile.in gcc-4.5.1/libgcc/Makefile.in
+--- gcc-4.5.1.orig/libgcc/Makefile.in	2010-11-03 14:32:44.272904042 -0300
++++ gcc-4.5.1/libgcc/Makefile.in	2010-11-03 14:37:03.893904042 -0300
+@@ -39,6 +39,7 @@
+ decimal_float = @decimal_float@
+ enable_decimal_float = @enable_decimal_float@
+ fixed_point = @fixed_point@
++LIBGCC_LIBM = @LIBGCC_LIBM@
+ 
+ host_noncanonical = @host_noncanonical@
+ 
+@@ -798,9 +799,10 @@
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
+diff -Nura gcc-4.5.1.orig/libgcc/configure gcc-4.5.1/libgcc/configure
+--- gcc-4.5.1.orig/libgcc/configure	2010-11-03 14:32:44.283904042 -0300
++++ gcc-4.5.1/libgcc/configure	2010-11-03 14:39:48.685904042 -0300
+@@ -557,6 +557,7 @@
+ extra_parts
+ tmake_file
+ set_use_emutls
++LIBGCC_LIBM
+ set_have_cc_tls
+ vis_hide
+ fixed_point
+@@ -3847,6 +3848,37 @@
+   set_use_emutls="-DUSE_EMUTLS"
+ fi
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
++       libgcc_cv_copysignl_lib="-lm"
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
+ 
+ # Conditionalize the makefile for this target machine.
+ tmake_file_=
+diff -Nura gcc-4.5.1.orig/libgcc/configure.ac gcc-4.5.1/libgcc/configure.ac
+--- gcc-4.5.1.orig/libgcc/configure.ac	2010-11-03 14:32:44.735904042 -0300
++++ gcc-4.5.1/libgcc/configure.ac	2010-11-03 14:42:11.278904045 -0300
+@@ -238,6 +238,27 @@
+ fi
+ AC_SUBST(set_have_cc_tls)
+ 
++# On powerpc libgcc_s references copysignl which is a libm function but
++# glibc apparently also provides it via libc as opposed to uClibc where
++# it lives in libm.
++AC_CACHE_CHECK
++  libgcc_cv_copysignl_lib,
++    echo '#include <features.h>' > conftest.c
++    echo 'int the_libc = __UCLIBC__ + __powerpc__;' >> conftest.c
++    libgcc_cv_copysignl_lib="-lc"
++    if AC_TRY_COMMAND(${CC-cc} -S conftest.c -o conftest.s 1>&AS_MESSAGE_LOG_FD)
++    then
++       libgcc_cv_copysignl_lib="-lm"
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
+ # See if we have emulated thread-local storage.
+ GCC_CHECK_EMUTLS
+ set_use_emutls=
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index a4ca054..4bff885 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -30,6 +30,10 @@ choice
 		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		bool "gcc 4.6.x"
 
+	config BR2_GCC_VERSION_4_7_X
+		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		bool "gcc 4.7.x"
+
 	config BR2_GCC_VERSION_SNAP
 		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		bool "gcc snapshot"
@@ -60,6 +64,7 @@ config BR2_GCC_VERSION
 	default "4.4.7"     if BR2_GCC_VERSION_4_4_X
 	default "4.5.3"     if BR2_GCC_VERSION_4_5_X
 	default "4.6.3"     if BR2_GCC_VERSION_4_6_X
+	default "4.7.0"     if BR2_GCC_VERSION_4_7_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/toolchain/gcc/Config.in.2 b/toolchain/gcc/Config.in.2
index c76d125..d060a80 100644
--- a/toolchain/gcc/Config.in.2
+++ b/toolchain/gcc/Config.in.2
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GCC_TARGET
 	depends on BR2_HAVE_DEVFILES && BR2_TOOLCHAIN_BUILDROOT
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_BINUTILS_TARGET
-	select BR2_PACKAGE_MPC if (BR2_GCC_VERSION_4_5_X || BR2_GCC_VERSION_4_6_X || BR2_GCC_VERSION_SNAP)
+	select BR2_PACKAGE_MPC if (BR2_GCC_VERSION_4_5_X || BR2_GCC_VERSION_4_6_X || BR2_GCC_VERSION_4_7_X || BR2_GCC_VERSION_SNAP)
 	select BR2_PACKAGE_MPFR
 	select BR2_PACKAGE_GMP
 	help
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index d9547fb..ae734e8 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -120,6 +120,16 @@ endif
 GCC_HOST_PREREQ += host-mpc
 endif
 
+# GCC 4.7.x prerequisites
+ifeq ($(findstring x4.7.,x$(GCC_VERSION)),x4.7.)
+GCC_WITH_HOST_MPC = --with-mpc=$(HOST_DIR)/usr
+GCC_TARGET_PREREQ += mpc
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+HOST_SOURCE += host-mpc-source
+endif
+GCC_HOST_PREREQ += host-mpc
+endif
+
 # GCC snapshot prerequisites
 # Since we don't know and it can be quite new just ask for everything known
 ifneq ($(GCC_SNAP_DATE),)
