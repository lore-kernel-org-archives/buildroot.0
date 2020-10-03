From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  3 Oct 2020 11:17:04 +0200
Subject: [Buildroot] [PATCH] package/gcc: remove gcc 7.5.0
Message-ID: <20201003091704.1537916-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc 10.2 is around, gcc 9.3 is the default version, so drop
7.5 in order to reduce the gcc choice.

See:
https://gcc.gnu.org/legacy-ml/gcc/2019-11/msg00099.html

The last defconfig using gcc 7 (roseapplepi_defconfig) has been
updated by 9cd065438020582011f393bd71308717b07c5a71.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/7.5.0/0001-uclibc-conf.patch      |  29 --
 .../gcc/7.5.0/0002-arm-softfloat-libgcc.patch |  45 ---
 .../0003-cilk-fix-build-without-wchar.patch   |  64 ----
 ...1-21-Ajit-Agarwal-ajitkum-xilinx.com.patch |  42 ---
 ...PR-target-81497-Fix-arm_acle.h-for-C.patch | 323 ------------------
 ...TRANT-for-RISC-V-when-pthread-is-pas.patch |  31 --
 .../0007-xtensa-fix-PR-target-91880.patch     |  49 ---
 package/gcc/Config.in.host                    |   8 -
 package/gcc/gcc.hash                          |   2 -
 package/gcc/gcc.mk                            |  10 -
 10 files changed, 603 deletions(-)
 delete mode 100644 package/gcc/7.5.0/0001-uclibc-conf.patch
 delete mode 100644 package/gcc/7.5.0/0002-arm-softfloat-libgcc.patch
 delete mode 100644 package/gcc/7.5.0/0003-cilk-fix-build-without-wchar.patch
 delete mode 100644 package/gcc/7.5.0/0004-Revert-2016-01-21-Ajit-Agarwal-ajitkum-xilinx.com.patch
 delete mode 100644 package/gcc/7.5.0/0005-PR-target-81497-Fix-arm_acle.h-for-C.patch
 delete mode 100644 package/gcc/7.5.0/0006-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
 delete mode 100644 package/gcc/7.5.0/0007-xtensa-fix-PR-target-91880.patch

diff --git a/package/gcc/7.5.0/0001-uclibc-conf.patch b/package/gcc/7.5.0/0001-uclibc-conf.patch
deleted file mode 100644
index 29c5c010ed..0000000000
--- a/package/gcc/7.5.0/0001-uclibc-conf.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0ff63500a600b758cd88ebcd048d7150df9ac881 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Tue, 2 May 2017 22:36:15 +0200
-Subject: [PATCH] uclibc-conf
-
-[Romain: convert to git patch]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- contrib/regression/objs-gcc.sh | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/contrib/regression/objs-gcc.sh b/contrib/regression/objs-gcc.sh
-index 60b0497fea2..6dc7eadff36 100755
---- a/contrib/regression/objs-gcc.sh
-+++ b/contrib/regression/objs-gcc.sh
-@@ -106,6 +106,10 @@ if [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-gnu ]
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
--- 
-2.21.0
-
diff --git a/package/gcc/7.5.0/0002-arm-softfloat-libgcc.patch b/package/gcc/7.5.0/0002-arm-softfloat-libgcc.patch
deleted file mode 100644
index c2c3450310..0000000000
--- a/package/gcc/7.5.0/0002-arm-softfloat-libgcc.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 1d0a47a72a1357e4a298d611bd2499e1b72c6f86 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Tue, 2 May 2017 22:46:18 +0200
-Subject: [PATCH] arm softfloat libgcc
-
-[Romain: convert to git patch]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/config/arm/linux-elf.h | 2 +-
- libgcc/config/arm/t-linux  | 7 ++++++-
- 2 files changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
-index 3d62367ae68..dad0b97d39f 100644
---- a/gcc/config/arm/linux-elf.h
-+++ b/gcc/config/arm/linux-elf.h
-@@ -58,7 +58,7 @@
-    %{shared:-lc} \
-    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
- 
--#define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
-+#define LIBGCC_SPEC "-lgcc"
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
- 
-diff --git a/libgcc/config/arm/t-linux b/libgcc/config/arm/t-linux
-index 3d520decafb..e7bc042d4e4 100644
---- a/libgcc/config/arm/t-linux
-+++ b/libgcc/config/arm/t-linux
-@@ -1,6 +1,11 @@
- LIB1ASMSRC = arm/lib1funcs.S
- LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx _clzsi2 _clzdi2 \
--	_ctzsi2 _arm_addsubdf3 _arm_addsubsf3
-+	_ctzsi2 _arm_addsubdf3 _arm_addsubsf3 \
-+	_arm_addsubdf3 _arm_addsubsf3 \
-+	_arm_negdf2 _arm_muldivdf3 _arm_cmpdf2 _arm_unorddf2 \
-+	_arm_fixdfsi _arm_fixunsdfsi _arm_truncdfsf2 \
-+	_arm_negsf2 _arm_muldivsf3 _arm_cmpsf2 _arm_unordsf2 \
-+	_arm_fixsfsi _arm_fixunssfsi
- 
- # Just for these, we omit the frame pointer since it makes such a big
- # difference.
--- 
-2.21.0
-
diff --git a/package/gcc/7.5.0/0003-cilk-fix-build-without-wchar.patch b/package/gcc/7.5.0/0003-cilk-fix-build-without-wchar.patch
deleted file mode 100644
index 7821d06024..0000000000
--- a/package/gcc/7.5.0/0003-cilk-fix-build-without-wchar.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From a605662776a3bd50ebbb84509958cb42f44ec998 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Tue, 2 May 2017 23:21:46 +0200
-Subject: [PATCH] cilk: fix build without wchar
-
-When building against uClibc with wchar support disabled, WCHAR_MIN and
-WCHAR_MAX are not defined leading to compilation errors.
-
-Fix it by only including the wchar code if available.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Romain: convert to git patch]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- libcilkrts/include/cilk/reducer_min_max.h | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/libcilkrts/include/cilk/reducer_min_max.h b/libcilkrts/include/cilk/reducer_min_max.h
-index 641aa823901..4f8e0102b90 100644
---- a/libcilkrts/include/cilk/reducer_min_max.h
-+++ b/libcilkrts/include/cilk/reducer_min_max.h
-@@ -3289,7 +3289,9 @@ __CILKRTS_BEGIN_EXTERN_C
- CILK_C_REDUCER_MAX_INSTANCE(char,               char,       CHAR_MIN)
- CILK_C_REDUCER_MAX_INSTANCE(unsigned char,      uchar,      0)
- CILK_C_REDUCER_MAX_INSTANCE(signed char,        schar,      SCHAR_MIN)
-+#ifdef WCHAR_MIN
- CILK_C_REDUCER_MAX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
-+#endif
- CILK_C_REDUCER_MAX_INSTANCE(short,              short,      SHRT_MIN)
- CILK_C_REDUCER_MAX_INSTANCE(unsigned short,     ushort,     0)
- CILK_C_REDUCER_MAX_INSTANCE(int,                int,        INT_MIN)
-@@ -3441,7 +3443,9 @@ __CILKRTS_BEGIN_EXTERN_C
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(char,               char,       CHAR_MIN)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned char,      uchar,      0)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(signed char,        schar,      SCHAR_MIN)
-+#ifdef WCHAR_MIN
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
-+#endif
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(short,              short,      SHRT_MIN)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned short,     ushort,     0)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(int,                int,        INT_MIN)
-@@ -3567,7 +3571,9 @@ __CILKRTS_BEGIN_EXTERN_C
- CILK_C_REDUCER_MIN_INSTANCE(char,               char,       CHAR_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(signed char,        schar,      SCHAR_MAX)
-+#ifdef WCHAR_MAX
- CILK_C_REDUCER_MIN_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
-+#endif
- CILK_C_REDUCER_MIN_INSTANCE(short,              short,      SHRT_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(int,                int,        INT_MAX)
-@@ -3719,7 +3725,9 @@ __CILKRTS_BEGIN_EXTERN_C
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(char,               char,       CHAR_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(signed char,        schar,      SCHAR_MAX)
-+#ifdef WCHAR_MAX
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
-+#endif
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(short,              short,      SHRT_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(int,                int,        INT_MAX)
--- 
-2.21.0
-
diff --git a/package/gcc/7.5.0/0004-Revert-2016-01-21-Ajit-Agarwal-ajitkum-xilinx.com.patch b/package/gcc/7.5.0/0004-Revert-2016-01-21-Ajit-Agarwal-ajitkum-xilinx.com.patch
deleted file mode 100644
index 0ae6876ee6..0000000000
--- a/package/gcc/7.5.0/0004-Revert-2016-01-21-Ajit-Agarwal-ajitkum-xilinx.com.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 01fb9550fd858e441c3c2f358318af6e28e56181 Mon Sep 17 00:00:00 2001
-From: eager <eager@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Sat, 27 May 2017 18:29:40 +0000
-Subject: [PATCH] Revert: 2016-01-21 Ajit Agarwal <ajitkum@xilinx.com>
-
-	See https://gcc.gnu.org/ml/gcc/2017-05/msg00221.html.
-
-	* config/microblaze/microblaze.h
-	(FIXED_REGISTERS): Update in macro.
-	(CALL_USED_REGISTERS): Update in macro.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 248540 138bc75d-0d04-0410-961f-82ee72b054a4
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/config/microblaze/microblaze.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
-index 66e4ef5c3db..2c9ece1d6c6 100644
---- a/gcc/config/microblaze/microblaze.h
-+++ b/gcc/config/microblaze/microblaze.h
-@@ -269,14 +269,14 @@ extern enum pipeline_type microblaze_pipe;
- #define FIXED_REGISTERS							\
- {									\
-   1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,			\
--  1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,			\
-+  1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,			\
-   1, 1, 1, 1 								\
- }
- 
- #define CALL_USED_REGISTERS						\
- {									\
-   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,			\
--  1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,			\
-+  1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,			\
-   1, 1, 1, 1								\
- }
- #define GP_REG_FIRST    0
--- 
-2.21.0
-
diff --git a/package/gcc/7.5.0/0005-PR-target-81497-Fix-arm_acle.h-for-C.patch b/package/gcc/7.5.0/0005-PR-target-81497-Fix-arm_acle.h-for-C.patch
deleted file mode 100644
index 0c7ab36770..0000000000
--- a/package/gcc/7.5.0/0005-PR-target-81497-Fix-arm_acle.h-for-C.patch
+++ /dev/null
@@ -1,323 +0,0 @@
-From f1c05207166a16d0a6242f2fa642adc439f835a8 Mon Sep 17 00:00:00 2001
-From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Tue, 5 Jun 2018 09:50:16 +0000
-Subject: [PATCH] PR target/81497: Fix arm_acle.h for C++
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When trying to compile something with arm_acle.h using G++ we get a number of nasty errors:
-arm_acle.h:48:49: error: invalid conversion from ?const void*? to ?const int*? [-fpermissive]
-    return __builtin_arm_ldc (__coproc, __CRd, __p);
-
-This is because the intrinsics that are supposed to be void return the "result" of their builtin,
-which is void. C lets that slide but C++ complains.
-
-After fixing that we run into further errors:
-arm_acle.h:48:46: error: invalid conversion from 'const void*' to 'const int*' [-fpermissive]
-    return __builtin_arm_ldc (__coproc, __CRd, __p);
-                                               ^~~
-Because the pointer arguments in these intrinsics are void pointers but the builtin
-expects int pointers. So this patch introduces new qualifiers for void pointers and their
-const-qualified versions and uses that in the specification of these intrinsics.
-
-This gives us the opportunity of creating an arm subdirectory in g++.dg and inaugurates it
-with the first arm-specific C++ tests (in that directory).
-
-	PR target/81497
-	* config/arm/arm-builtins.c (arm_type_qualifiers): Add
-	qualifier_void_pointer and qualifier_const_void_pointer.
-	(arm_ldc_qualifiers, arm_stc_qualifiers): Use the above.
-	(arm_init_builtins): Handle the above.
-	* config/arm/arm_acle.h (__arm_cdp, __arm_ldc, __arm_ldcl, __arm_stc,
-	__arm_stcl, __arm_mcr, __arm_cdp2, __arm_ldc2, __arm_ldcl2, __arm_stc2,
-	__arm_stcl2,__arm_mcr2, __arm_mcrr, __arm_mcrr2): Remove return for
-	void intrinsics.
-
-	* g++.target/arm/arm.exp: New file.
-	* g++.target/arm/pr81497.C: Likewise.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 261191 138bc75d-0d04-0410-961f-82ee72b054a4
-Upstream-Status: Merged (gcc-8-branch)
-Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
-[gportay: drop gcc/{,testsuite/}ChangeLog changes]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/config/arm/arm-builtins.c          | 42 +++++++++++++---------
- gcc/config/arm/arm_acle.h              | 28 +++++++--------
- gcc/testsuite/g++.target/arm/arm.exp   | 50 ++++++++++++++++++++++++++
- gcc/testsuite/g++.target/arm/pr81497.C |  9 +++++
- 4 files changed, 99 insertions(+), 30 deletions(-)
- create mode 100644 gcc/testsuite/g++.target/arm/arm.exp
- create mode 100644 gcc/testsuite/g++.target/arm/pr81497.C
-
-diff --git a/gcc/config/arm/arm-builtins.c b/gcc/config/arm/arm-builtins.c
-index d3b67184362..dd56f13251f 100644
---- a/gcc/config/arm/arm-builtins.c
-+++ b/gcc/config/arm/arm-builtins.c
-@@ -75,7 +75,11 @@ enum arm_type_qualifiers
-   /* Lane indices - must be within range of previous argument = a vector.  */
-   qualifier_lane_index = 0x200,
-   /* Lane indices for single lane structure loads and stores.  */
--  qualifier_struct_load_store_lane_index = 0x400
-+  qualifier_struct_load_store_lane_index = 0x400,
-+  /* A void pointer.  */
-+  qualifier_void_pointer = 0x800,
-+  /* A const void pointer.  */
-+  qualifier_const_void_pointer = 0x802
- };
- 
- /*  The qualifier_internal allows generation of a unary builtin from
-@@ -185,7 +189,7 @@ arm_cdp_qualifiers[SIMD_MAX_BUILTIN_ARGS]
- static enum arm_type_qualifiers
- arm_ldc_qualifiers[SIMD_MAX_BUILTIN_ARGS]
-   = { qualifier_void, qualifier_unsigned_immediate,
--      qualifier_unsigned_immediate, qualifier_const_pointer };
-+      qualifier_unsigned_immediate, qualifier_const_void_pointer };
- #define LDC_QUALIFIERS \
-   (arm_ldc_qualifiers)
- 
-@@ -193,7 +197,7 @@ arm_ldc_qualifiers[SIMD_MAX_BUILTIN_ARGS]
- static enum arm_type_qualifiers
- arm_stc_qualifiers[SIMD_MAX_BUILTIN_ARGS]
-   = { qualifier_void, qualifier_unsigned_immediate,
--      qualifier_unsigned_immediate, qualifier_pointer };
-+      qualifier_unsigned_immediate, qualifier_void_pointer };
- #define STC_QUALIFIERS \
-   (arm_stc_qualifiers)
- 
-@@ -1079,19 +1083,25 @@ arm_init_builtin (unsigned int fcode, arm_builtin_datum *d,
-       if (qualifiers & qualifier_pointer && VECTOR_MODE_P (op_mode))
- 	op_mode = GET_MODE_INNER (op_mode);
- 
--      eltype = arm_simd_builtin_type
--	(op_mode,
--	 (qualifiers & qualifier_unsigned) != 0,
--	 (qualifiers & qualifier_poly) != 0);
--      gcc_assert (eltype != NULL);
--
--      /* Add qualifiers.  */
--      if (qualifiers & qualifier_const)
--	eltype = build_qualified_type (eltype, TYPE_QUAL_CONST);
--
--      if (qualifiers & qualifier_pointer)
--	eltype = build_pointer_type (eltype);
--
-+      /* For void pointers we already have nodes constructed by the midend.  */
-+      if (qualifiers & qualifier_void_pointer)
-+	eltype = qualifiers & qualifier_const
-+		 ? const_ptr_type_node : ptr_type_node;
-+      else
-+	{
-+	  eltype
-+	    = arm_simd_builtin_type (op_mode,
-+				     (qualifiers & qualifier_unsigned) != 0,
-+				     (qualifiers & qualifier_poly) != 0);
-+	  gcc_assert (eltype != NULL);
-+
-+	  /* Add qualifiers.  */
-+	  if (qualifiers & qualifier_const)
-+	    eltype = build_qualified_type (eltype, TYPE_QUAL_CONST);
-+
-+	  if (qualifiers & qualifier_pointer)
-+	    eltype = build_pointer_type (eltype);
-+	}
-       /* If we have reached arg_num == 0, we are at a non-void
- 	 return type.  Otherwise, we are still processing
- 	 arguments.  */
-diff --git a/gcc/config/arm/arm_acle.h b/gcc/config/arm/arm_acle.h
-index 972e28edb86..69c29df4313 100644
---- a/gcc/config/arm/arm_acle.h
-+++ b/gcc/config/arm/arm_acle.h
-@@ -38,35 +38,35 @@ __arm_cdp (const unsigned int __coproc, const unsigned int __opc1,
- 	   const unsigned int __CRd, const unsigned int __CRn,
- 	   const unsigned int __CRm, const unsigned int __opc2)
- {
--  return __builtin_arm_cdp (__coproc, __opc1, __CRd, __CRn, __CRm, __opc2);
-+  __builtin_arm_cdp (__coproc, __opc1, __CRd, __CRn, __CRm, __opc2);
- }
- 
- __extension__ static __inline void __attribute__ ((__always_inline__))
- __arm_ldc (const unsigned int __coproc, const unsigned int __CRd,
- 	   const void * __p)
- {
--  return __builtin_arm_ldc (__coproc, __CRd, __p);
-+  __builtin_arm_ldc (__coproc, __CRd, __p);
- }
- 
- __extension__ static __inline void __attribute__ ((__always_inline__))
- __arm_ldcl (const unsigned int __coproc, const unsigned int __CRd,
- 	    const void * __p)
- {
--  return __builtin_arm_ldcl (__coproc, __CRd, __p);
-+  __builtin_arm_ldcl (__coproc, __CRd, __p);
- }
- 
- __extension__ static __inline void __attribute__ ((__always_inline__))
- __arm_stc (const unsigned int __coproc, const unsigned int __CRd,
- 	   void * __p)
- {
--  return __builtin_arm_stc (__coproc, __CRd, __p);
-+  __builtin_arm_stc (__coproc, __CRd, __p);
- }
- 
- __extension__ static __inline void __attribute__ ((__always_inline__))
- __arm_stcl (const unsigned int __coproc, const unsigned int __CRd,
- 	    void * __p)
- {
--  return __builtin_arm_stcl (__coproc, __CRd, __p);
-+  __builtin_arm_stcl (__coproc, __CRd, __p);
- }
- 
- __extension__ static __inline void __attribute__ ((__always_inline__))
-@@ -74,7 +74,7 @@ __arm_mcr (const unsigned int __coproc, const unsigned int __opc1,
- 	   uint32_t __value, const unsigned int __CRn, const unsigned int __CRm,
- 	   const unsigned int __opc2)
- {
--  return __builtin_arm_mcr (__coproc, __opc1, __value, __CRn, __CRm, __opc2);
-+  __builtin_arm_mcr (__coproc, __opc1, __value, __CRn, __CRm, __opc2);
- }
- 
- __extension__ static __inline uint32_t __attribute__ ((__always_inline__))
-@@ -90,35 +90,35 @@ __arm_cdp2 (const unsigned int __coproc, const unsigned int __opc1,
- 	    const unsigned int __CRd, const unsigned int __CRn,
- 	    const unsigned int __CRm, const unsigned int __opc2)
- {
--  return __builtin_arm_cdp2 (__coproc, __opc1, __CRd, __CRn, __CRm, __opc2);
-+  __builtin_arm_cdp2 (__coproc, __opc1, __CRd, __CRn, __CRm, __opc2);
- }
- 
- __extension__ static __inline void __attribute__ ((__always_inline__))
- __arm_ldc2 (const unsigned int __coproc, const unsigned int __CRd,
- 	    const void * __p)
- {
--  return __builtin_arm_ldc2 (__coproc, __CRd, __p);
-+  __builtin_arm_ldc2 (__coproc, __CRd, __p);
- }
- 
- __extension__ static __inline void __attribute__ ((__always_inline__))
- __arm_ldc2l (const unsigned int __coproc, const unsigned int __CRd,
- 	     const void * __p)
- {
--  return __builtin_arm_ldc2l (__coproc, __CRd, __p);
-+  __builtin_arm_ldc2l (__coproc, __CRd, __p);
- }
- 
- __extension__ static __inline void __attribute__ ((__always_inline__))
- __arm_stc2 (const unsigned int __coproc, const unsigned int __CRd,
- 	    void * __p)
- {
--  return __builtin_arm_stc2 (__coproc, __CRd, __p);
-+  __builtin_arm_stc2 (__coproc, __CRd, __p);
- }
- 
- __extension__ static __inline void __attribute__ ((__always_inline__))
- __arm_stc2l (const unsigned int __coproc, const unsigned int __CRd,
- 	     void * __p)
- {
--  return __builtin_arm_stc2l (__coproc, __CRd, __p);
-+  __builtin_arm_stc2l (__coproc, __CRd, __p);
- }
- 
- __extension__ static __inline void __attribute__ ((__always_inline__))
-@@ -126,7 +126,7 @@ __arm_mcr2 (const unsigned int __coproc, const unsigned int __opc1,
- 	    uint32_t __value, const unsigned int __CRn,
- 	    const unsigned int __CRm, const unsigned int __opc2)
- {
--  return __builtin_arm_mcr2 (__coproc, __opc1, __value, __CRn, __CRm, __opc2);
-+  __builtin_arm_mcr2 (__coproc, __opc1, __value, __CRn, __CRm, __opc2);
- }
- 
- __extension__ static __inline uint32_t __attribute__ ((__always_inline__))
-@@ -143,7 +143,7 @@ __extension__ static __inline void __attribute__ ((__always_inline__))
- __arm_mcrr (const unsigned int __coproc, const unsigned int __opc1,
- 	    uint64_t __value, const unsigned int __CRm)
- {
--  return __builtin_arm_mcrr (__coproc, __opc1, __value, __CRm);
-+  __builtin_arm_mcrr (__coproc, __opc1, __value, __CRm);
- }
- 
- __extension__ static __inline uint64_t __attribute__ ((__always_inline__))
-@@ -159,7 +159,7 @@ __extension__ static __inline void __attribute__ ((__always_inline__))
- __arm_mcrr2 (const unsigned int __coproc, const unsigned int __opc1,
- 	    uint64_t __value, const unsigned int __CRm)
- {
--  return __builtin_arm_mcrr2 (__coproc, __opc1, __value, __CRm);
-+  __builtin_arm_mcrr2 (__coproc, __opc1, __value, __CRm);
- }
- 
- __extension__ static __inline uint64_t __attribute__ ((__always_inline__))
-diff --git a/gcc/testsuite/g++.target/arm/arm.exp b/gcc/testsuite/g++.target/arm/arm.exp
-new file mode 100644
-index 00000000000..1a169d2f220
---- /dev/null
-+++ b/gcc/testsuite/g++.target/arm/arm.exp
-@@ -0,0 +1,50 @@
-+#  Specific regression driver for arm.
-+#  Copyright (C) 2009-2018 Free Software Foundation, Inc.
-+#
-+#  This file is part of GCC.
-+#
-+#  GCC is free software; you can redistribute it and/or modify it
-+#  under the terms of the GNU General Public License as published by
-+#  the Free Software Foundation; either version 3, or (at your option)
-+#  any later version.
-+#
-+#  GCC is distributed in the hope that it will be useful, but
-+#  WITHOUT ANY WARRANTY; without even the implied warranty of
-+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+#  General Public License for more details.
-+#
-+#  You should have received a copy of the GNU General Public License
-+#  along with GCC; see the file COPYING3.  If not see
-+#  <http://www.gnu.org/licenses/>.  */
-+
-+# GCC testsuite that uses the `dg.exp' driver.
-+
-+# Exit immediately if this isn't an arm target.
-+if {![istarget arm*-*-*] } then {
-+  return
-+}
-+
-+# Load support procs.
-+load_lib g++-dg.exp
-+
-+global DEFAULT_CXXFLAGS
-+if ![info exists DEFAULT_CXXFLAGS] then {
-+    set DEFAULT_CXXFLAGS " -pedantic-errors"
-+}
-+
-+
-+global dg_runtest_extra_prunes
-+set dg_runtest_extra_prunes ""
-+lappend dg_runtest_extra_prunes "warning: switch -m(cpu|arch)=.* conflicts with -m(cpu|arch)=.* switch"
-+
-+# Initialize `dg'.
-+dg-init
-+
-+# Main loop.
-+dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/*.C]] \
-+        "" $DEFAULT_CXXFLAGS
-+
-+# All done.
-+set dg_runtest_extra_prunes ""
-+dg-finish
-+
-diff --git a/gcc/testsuite/g++.target/arm/pr81497.C b/gcc/testsuite/g++.target/arm/pr81497.C
-new file mode 100644
-index 00000000000..0519a3a3045
---- /dev/null
-+++ b/gcc/testsuite/g++.target/arm/pr81497.C
-@@ -0,0 +1,9 @@
-+/* { dg-do compile } */
-+/* { dg-require-effective-target arm_thumb2_ok } */
-+
-+#include <arm_acle.h>
-+
-+int main ()
-+{
-+  return 0;
-+}
--- 
-2.21.0
-
diff --git a/package/gcc/7.5.0/0006-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch b/package/gcc/7.5.0/0006-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
deleted file mode 100644
index de0f453348..0000000000
--- a/package/gcc/7.5.0/0006-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 1d78555bfc753039546ce5ca655dece67732e7bd Mon Sep 17 00:00:00 2001
-From: Mark Corbin <mark.corbin@embecosm.com>
-Date: Thu, 22 Nov 2018 12:19:11 +0000
-Subject: [PATCH] gcc: define _REENTRANT for RISC-V when -pthread is passed
-
-The detection of pthread support fails on RISC-V unless _REENTRANT
-is defined. Added the CPP_SPEC definition from gcc 8.1.0 to correct
-this.
-
-Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/config/riscv/linux.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
-index 4b2f7b6e1fd..b00d23ddfa0 100644
---- a/gcc/config/riscv/linux.h
-+++ b/gcc/config/riscv/linux.h
-@@ -47,6 +47,8 @@ along with GCC; see the file COPYING3.  If not see
- 
- #define ICACHE_FLUSH_FUNC "__riscv_flush_icache"
- 
-+#define CPP_SPEC "%{pthread:-D_REENTRANT}"
-+
- #define LINK_SPEC "\
- -melf" XLEN_SPEC "lriscv \
- %{shared} \
--- 
-2.21.0
-
diff --git a/package/gcc/7.5.0/0007-xtensa-fix-PR-target-91880.patch b/package/gcc/7.5.0/0007-xtensa-fix-PR-target-91880.patch
deleted file mode 100644
index e75588bf4e..0000000000
--- a/package/gcc/7.5.0/0007-xtensa-fix-PR-target-91880.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 7c11710230921246156aecc20eb4b6ccaeaaa473 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Tue, 24 Sep 2019 04:15:17 -0700
-Subject: [PATCH] xtensa: fix PR target/91880
-
-Xtensa hwloop_optimize segfaults when zero overhead loop is about to be
-inserted as the first instruction of the function.
-Insert zero overhead loop instruction into new basic block before the
-loop when basic block that precedes the loop is empty.
-
-2019-09-26  Max Filippov  <jcmvbkbc@gmail.com>
-gcc/
-	* config/xtensa/xtensa.c (hwloop_optimize): Insert zero overhead
-	loop instruction into new basic block before the loop when basic
-	block that precedes the loop is empty.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: r276166
-
- gcc/config/xtensa/xtensa.c                 |  5 ++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
-index ee5612441e25..2527468d57db 100644
---- a/gcc/config/xtensa/xtensa.c
-+++ b/gcc/config/xtensa/xtensa.c
-@@ -4174,7 +4174,9 @@ hwloop_optimize (hwloop_info loop)
- 
-   seq = get_insns ();
- 
--  if (!single_succ_p (entry_bb) || vec_safe_length (loop->incoming) > 1)
-+  entry_after = BB_END (entry_bb);
-+  if (!single_succ_p (entry_bb) || vec_safe_length (loop->incoming) > 1
-+      || !entry_after)
-     {
-       basic_block new_bb;
-       edge e;
-@@ -4195,7 +4197,6 @@ hwloop_optimize (hwloop_info loop)
-     }
-   else
-     {
--      entry_after = BB_END (entry_bb);
-       while (DEBUG_INSN_P (entry_after)
-              || (NOTE_P (entry_after)
-                  && NOTE_KIND (entry_after) != NOTE_INSN_BASIC_BLOCK
--- 
-2.11.0
-
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index aee373fcde..f79c234049 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -20,13 +20,6 @@ config BR2_GCC_VERSION_CSKY
 	depends on BR2_csky
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
-config BR2_GCC_VERSION_7_X
-	bool "gcc 7.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
-	# Broken or unsupported architectures
-	depends on !BR2_or1k
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
-
 config BR2_GCC_VERSION_8_X
 	bool "gcc 8.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_9
@@ -82,7 +75,6 @@ config BR2_GCC_SUPPORTS_DLANG
 
 config BR2_GCC_VERSION
 	string
-	default "7.5.0"     if BR2_GCC_VERSION_7_X
 	default "8.4.0"     if BR2_GCC_VERSION_8_X
 	default "9.3.0"     if BR2_GCC_VERSION_9_X
 	default "10.2.0"    if BR2_GCC_VERSION_10_X
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 5f38572beb..671548deed 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -1,5 +1,3 @@
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.5.0/sha512.sum
-sha512  fe716cc19f2e3255d3a8b1b8290777bf769c6d98e6e0b07b81a3d6ad43f8af74cb170dfa18b1555dbfcd3f55ae582b91a286ccef496b9b65c1579902f96a1f60  gcc-7.5.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
 #  From ftp://gcc.gnu.org/pub/gcc/releases/gcc-9.3.0/sha512.sum
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index fe73bb83a8..114c2887a0 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -119,16 +119,6 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --disable-libquadmath
 endif
 
-# Disable libsanitizer due to a build issue with gcc 7.5 and glibc 2.31.
-# It would require to backport the following upstream commit
-# https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=4abc46b51af5751d657764d0c44b8a4aeed06302
-# but it conflict with gcc 7.5 libsanitizer code.
-# Disable libsanitizer since the gcc 7.5 branch is now closed
-# (unmaintained) and it's not a trivial merge.
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_GLIBC)$(BR2_GCC_VERSION_7_X),yy)
-HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
-endif
-
 # libsanitizer requires wordexp, not in default uClibc config. Also
 # doesn't build properly with musl.
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC)$(BR2_TOOLCHAIN_BUILDROOT_MUSL),y)
-- 
2.25.4
