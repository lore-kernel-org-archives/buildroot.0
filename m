From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 23:13:50 +0200
Subject: [Buildroot] [git commit] package/gcc: backport arm acle bugfix 81497
Message-ID: <20180628211117.A11FE83713@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78af2a63625a0893259ceb2f6cfb5b6ab1431419
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The compiler g++ reports an error when the header arm_acle.h is
included from version 7.

This patch backports the bugfix upstreamed [1] for gcc-7 and gcc-8.

Fixes:

	In file included from ../../include/QtCore/5.10.1/QtCore/private/../../../../../src/corelib/tools/qsimd_p.h:333,
	                 from ../../include/QtCore/5.10.1/QtCore/private/qsimd_p.h:1,
	                 from global/qlogging.cpp:58:
	/home/gportay/src/buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/8.1.0/include/arm_acle.h: In function ???void __arm_ldc(unsigned int, unsigned int, const void*)???:
	/home/gportay/src/buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/8.1.0/include/arm_acle.h:48:46: error: invalid conversion from ???const void*??? to ???const int*??? [-fpermissive]
	   return __builtin_arm_ldc (__coproc, __CRd, __p);
                                              ^~~
	<built-in>: note:   initializing argument 3 of ???void __builtin_arm_ldc(unsigned int, unsigned int, const int*)???
	...
	Makefile:196: recipe for target 'sub-corelib-make_first' failed
	make[3]: *** [sub-corelib-make_first] Error 2
	Makefile:48: recipe for target 'sub-src-make_first' failed
	make[2]: *** [sub-src-make_first] Error 2
	package/pkg-generic.mk:229: recipe for target '/home/gportay/src/buildroot/output/build/qt5base-5.10.1/.stamp_built' failed
	make[1]: *** [/home/gportay/src/buildroot/output/build/qt5base-5.10.1/.stamp_built] Error 2
	Makefile:16: recipe for target '_all' failed
	make: *** [_all] Error 2

[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81497

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch | 324 +++++++++++++++++++++
 ...-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch | 305 +++++++++++++++++++
 2 files changed, 629 insertions(+)

diff --git a/package/gcc/7.3.0/1000-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch b/package/gcc/7.3.0/1000-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch
new file mode 100644
index 0000000000..37acc8b651
--- /dev/null
+++ b/package/gcc/7.3.0/1000-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch
@@ -0,0 +1,324 @@
+From 1a259ac3e39bf87e6e6a5eface8b0ebc6b2a0dfe Mon Sep 17 00:00:00 2001
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 5 Jun 2018 09:50:16 +0000
+Subject: [PATCH] [arm] PR target/81497: Fix arm_acle.h for C++
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf-8
+Content-Transfer-Encoding: 8bit
+
+When trying to compile something with arm_acle.h using G++ we get a number of nasty errors:
+arm_acle.h:48:49: error: invalid conversion from ???const void*??? to ???const int*??? [-fpermissive]
+    return __builtin_arm_ldc (__coproc, __CRd, __p);
+
+This is because the intrinsics that are supposed to be void return the "result" of their builtin,
+which is void. C lets that slide but C++ complains.
+
+After fixing that we run into further errors:
+arm_acle.h:48:46: error: invalid conversion from 'const void*' to 'const int*' [-fpermissive]
+    return __builtin_arm_ldc (__coproc, __CRd, __p);
+                                               ^~~
+Because the pointer arguments in these intrinsics are void pointers but the builtin
+expects int pointers. So this patch introduces new qualifiers for void pointers and their
+const-qualified versions and uses that in the specification of these intrinsics.
+
+This gives us the opportunity of creating an arm subdirectory in g++.dg and inaugurates it
+with the first arm-specific C++ tests (in that directory).
+
+
+	PR target/81497
+	* config/arm/arm-builtins.c (arm_type_qualifiers): Add
+	qualifier_void_pointer and qualifier_const_void_pointer.
+	(arm_ldc_qualifiers, arm_stc_qualifiers): Use the above.
+	(arm_init_builtins): Handle the above.
+	* config/arm/arm_acle.h (__arm_cdp, __arm_ldc, __arm_ldcl, __arm_stc,
+	__arm_stcl, __arm_mcr, __arm_cdp2, __arm_ldc2, __arm_ldcl2, __arm_stc2,
+	__arm_stcl2,__arm_mcr2, __arm_mcrr, __arm_mcrr2): Remove return for
+	void intrinsics.
+
+	* g++.target/arm/arm.exp: New file.
+	* g++.target/arm/pr81497.C: Likewise.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 261191 138bc75d-0d04-0410-961f-82ee72b054a4
+Upstream-Status: Merged (gcc-8-branch)
+Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
+[gportay: drop gcc/{,testsuite/}ChangeLog changes]
+---
+ gcc/config/arm/arm-builtins.c          | 42 +++++++++++++---------
+ gcc/config/arm/arm_acle.h              | 28 +++++++--------
+ gcc/testsuite/g++.target/arm/arm.exp   | 50 ++++++++++++++++++++++++++
+ gcc/testsuite/g++.target/arm/pr81497.C |  9 +++++
+ 4 files changed, 99 insertions(+), 30 deletions(-)
+ create mode 100644 gcc/testsuite/g++.target/arm/arm.exp
+ create mode 100644 gcc/testsuite/g++.target/arm/pr81497.C
+
+diff --git a/gcc/config/arm/arm-builtins.c b/gcc/config/arm/arm-builtins.c
+index 7fde7a04672..183a7b907f6 100644
+--- a/gcc/config/arm/arm-builtins.c
++++ b/gcc/config/arm/arm-builtins.c
+@@ -78,7 +78,11 @@ enum arm_type_qualifiers
+   /* Lane indices - must be within range of previous argument = a vector.  */
+   qualifier_lane_index = 0x200,
+   /* Lane indices for single lane structure loads and stores.  */
+-  qualifier_struct_load_store_lane_index = 0x400
++  qualifier_struct_load_store_lane_index = 0x400,
++  /* A void pointer.  */
++  qualifier_void_pointer = 0x800,
++  /* A const void pointer.  */
++  qualifier_const_void_pointer = 0x802
+ };
+ 
+ /*  The qualifier_internal allows generation of a unary builtin from
+@@ -202,7 +206,7 @@ arm_cdp_qualifiers[SIMD_MAX_BUILTIN_ARGS]
+ static enum arm_type_qualifiers
+ arm_ldc_qualifiers[SIMD_MAX_BUILTIN_ARGS]
+   = { qualifier_void, qualifier_unsigned_immediate,
+-      qualifier_unsigned_immediate, qualifier_const_pointer };
++      qualifier_unsigned_immediate, qualifier_const_void_pointer };
+ #define LDC_QUALIFIERS \
+   (arm_ldc_qualifiers)
+ 
+@@ -210,7 +214,7 @@ arm_ldc_qualifiers[SIMD_MAX_BUILTIN_ARGS]
+ static enum arm_type_qualifiers
+ arm_stc_qualifiers[SIMD_MAX_BUILTIN_ARGS]
+   = { qualifier_void, qualifier_unsigned_immediate,
+-      qualifier_unsigned_immediate, qualifier_pointer };
++      qualifier_unsigned_immediate, qualifier_void_pointer };
+ #define STC_QUALIFIERS \
+   (arm_stc_qualifiers)
+ 
+@@ -1095,19 +1099,25 @@ arm_init_builtin (unsigned int fcode, arm_builtin_datum *d,
+       if (qualifiers & qualifier_pointer && VECTOR_MODE_P (op_mode))
+ 	op_mode = GET_MODE_INNER (op_mode);
+ 
+-      eltype = arm_simd_builtin_type
+-	(op_mode,
+-	 (qualifiers & qualifier_unsigned) != 0,
+-	 (qualifiers & qualifier_poly) != 0);
+-      gcc_assert (eltype != NULL);
+-
+-      /* Add qualifiers.  */
+-      if (qualifiers & qualifier_const)
+-	eltype = build_qualified_type (eltype, TYPE_QUAL_CONST);
+-
+-      if (qualifiers & qualifier_pointer)
+-	eltype = build_pointer_type (eltype);
+-
++      /* For void pointers we already have nodes constructed by the midend.  */
++      if (qualifiers & qualifier_void_pointer)
++	eltype = qualifiers & qualifier_const
++		 ? const_ptr_type_node : ptr_type_node;
++      else
++	{
++	  eltype
++	    = arm_simd_builtin_type (op_mode,
++				     (qualifiers & qualifier_unsigned) != 0,
++				     (qualifiers & qualifier_poly) != 0);
++	  gcc_assert (eltype != NULL);
++
++	  /* Add qualifiers.  */
++	  if (qualifiers & qualifier_const)
++	    eltype = build_qualified_type (eltype, TYPE_QUAL_CONST);
++
++	  if (qualifiers & qualifier_pointer)
++	    eltype = build_pointer_type (eltype);
++	}
+       /* If we have reached arg_num == 0, we are at a non-void
+ 	 return type.  Otherwise, we are still processing
+ 	 arguments.  */
+diff --git a/gcc/config/arm/arm_acle.h b/gcc/config/arm/arm_acle.h
+index 9a2f0ba30dc..c0f6ea2d156 100644
+--- a/gcc/config/arm/arm_acle.h
++++ b/gcc/config/arm/arm_acle.h
+@@ -38,35 +38,35 @@ __arm_cdp (const unsigned int __coproc, const unsigned int __opc1,
+ 	   const unsigned int __CRd, const unsigned int __CRn,
+ 	   const unsigned int __CRm, const unsigned int __opc2)
+ {
+-  return __builtin_arm_cdp (__coproc, __opc1, __CRd, __CRn, __CRm, __opc2);
++  __builtin_arm_cdp (__coproc, __opc1, __CRd, __CRn, __CRm, __opc2);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_ldc (const unsigned int __coproc, const unsigned int __CRd,
+ 	   const void * __p)
+ {
+-  return __builtin_arm_ldc (__coproc, __CRd, __p);
++  __builtin_arm_ldc (__coproc, __CRd, __p);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_ldcl (const unsigned int __coproc, const unsigned int __CRd,
+ 	    const void * __p)
+ {
+-  return __builtin_arm_ldcl (__coproc, __CRd, __p);
++  __builtin_arm_ldcl (__coproc, __CRd, __p);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_stc (const unsigned int __coproc, const unsigned int __CRd,
+ 	   void * __p)
+ {
+-  return __builtin_arm_stc (__coproc, __CRd, __p);
++  __builtin_arm_stc (__coproc, __CRd, __p);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_stcl (const unsigned int __coproc, const unsigned int __CRd,
+ 	    void * __p)
+ {
+-  return __builtin_arm_stcl (__coproc, __CRd, __p);
++  __builtin_arm_stcl (__coproc, __CRd, __p);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+@@ -74,7 +74,7 @@ __arm_mcr (const unsigned int __coproc, const unsigned int __opc1,
+ 	   uint32_t __value, const unsigned int __CRn, const unsigned int __CRm,
+ 	   const unsigned int __opc2)
+ {
+-  return __builtin_arm_mcr (__coproc, __opc1, __value, __CRn, __CRm, __opc2);
++  __builtin_arm_mcr (__coproc, __opc1, __value, __CRn, __CRm, __opc2);
+ }
+ 
+ __extension__ static __inline uint32_t __attribute__ ((__always_inline__))
+@@ -90,35 +90,35 @@ __arm_cdp2 (const unsigned int __coproc, const unsigned int __opc1,
+ 	    const unsigned int __CRd, const unsigned int __CRn,
+ 	    const unsigned int __CRm, const unsigned int __opc2)
+ {
+-  return __builtin_arm_cdp2 (__coproc, __opc1, __CRd, __CRn, __CRm, __opc2);
++  __builtin_arm_cdp2 (__coproc, __opc1, __CRd, __CRn, __CRm, __opc2);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_ldc2 (const unsigned int __coproc, const unsigned int __CRd,
+ 	    const void * __p)
+ {
+-  return __builtin_arm_ldc2 (__coproc, __CRd, __p);
++  __builtin_arm_ldc2 (__coproc, __CRd, __p);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_ldc2l (const unsigned int __coproc, const unsigned int __CRd,
+ 	     const void * __p)
+ {
+-  return __builtin_arm_ldc2l (__coproc, __CRd, __p);
++  __builtin_arm_ldc2l (__coproc, __CRd, __p);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_stc2 (const unsigned int __coproc, const unsigned int __CRd,
+ 	    void * __p)
+ {
+-  return __builtin_arm_stc2 (__coproc, __CRd, __p);
++  __builtin_arm_stc2 (__coproc, __CRd, __p);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_stc2l (const unsigned int __coproc, const unsigned int __CRd,
+ 	     void * __p)
+ {
+-  return __builtin_arm_stc2l (__coproc, __CRd, __p);
++  __builtin_arm_stc2l (__coproc, __CRd, __p);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+@@ -126,7 +126,7 @@ __arm_mcr2 (const unsigned int __coproc, const unsigned int __opc1,
+ 	    uint32_t __value, const unsigned int __CRn,
+ 	    const unsigned int __CRm, const unsigned int __opc2)
+ {
+-  return __builtin_arm_mcr2 (__coproc, __opc1, __value, __CRn, __CRm, __opc2);
++  __builtin_arm_mcr2 (__coproc, __opc1, __value, __CRn, __CRm, __opc2);
+ }
+ 
+ __extension__ static __inline uint32_t __attribute__ ((__always_inline__))
+@@ -143,7 +143,7 @@ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_mcrr (const unsigned int __coproc, const unsigned int __opc1,
+ 	    uint64_t __value, const unsigned int __CRm)
+ {
+-  return __builtin_arm_mcrr (__coproc, __opc1, __value, __CRm);
++  __builtin_arm_mcrr (__coproc, __opc1, __value, __CRm);
+ }
+ 
+ __extension__ static __inline uint64_t __attribute__ ((__always_inline__))
+@@ -159,7 +159,7 @@ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_mcrr2 (const unsigned int __coproc, const unsigned int __opc1,
+ 	    uint64_t __value, const unsigned int __CRm)
+ {
+-  return __builtin_arm_mcrr2 (__coproc, __opc1, __value, __CRm);
++  __builtin_arm_mcrr2 (__coproc, __opc1, __value, __CRm);
+ }
+ 
+ __extension__ static __inline uint64_t __attribute__ ((__always_inline__))
+diff --git a/gcc/testsuite/g++.target/arm/arm.exp b/gcc/testsuite/g++.target/arm/arm.exp
+new file mode 100644
+index 00000000000..1a169d2f220
+--- /dev/null
++++ b/gcc/testsuite/g++.target/arm/arm.exp
+@@ -0,0 +1,50 @@
++#  Specific regression driver for arm.
++#  Copyright (C) 2009-2018 Free Software Foundation, Inc.
++#
++#  This file is part of GCC.
++#
++#  GCC is free software; you can redistribute it and/or modify it
++#  under the terms of the GNU General Public License as published by
++#  the Free Software Foundation; either version 3, or (at your option)
++#  any later version.
++#
++#  GCC is distributed in the hope that it will be useful, but
++#  WITHOUT ANY WARRANTY; without even the implied warranty of
++#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++#  General Public License for more details.
++#
++#  You should have received a copy of the GNU General Public License
++#  along with GCC; see the file COPYING3.  If not see
++#  <http://www.gnu.org/licenses/>.  */
++
++# GCC testsuite that uses the `dg.exp' driver.
++
++# Exit immediately if this isn't an arm target.
++if {![istarget arm*-*-*] } then {
++  return
++}
++
++# Load support procs.
++load_lib g++-dg.exp
++
++global DEFAULT_CXXFLAGS
++if ![info exists DEFAULT_CXXFLAGS] then {
++    set DEFAULT_CXXFLAGS " -pedantic-errors"
++}
++
++
++global dg_runtest_extra_prunes
++set dg_runtest_extra_prunes ""
++lappend dg_runtest_extra_prunes "warning: switch -m(cpu|arch)=.* conflicts with -m(cpu|arch)=.* switch"
++
++# Initialize `dg'.
++dg-init
++
++# Main loop.
++dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/*.C]] \
++        "" $DEFAULT_CXXFLAGS
++
++# All done.
++set dg_runtest_extra_prunes ""
++dg-finish
++
+diff --git a/gcc/testsuite/g++.target/arm/pr81497.C b/gcc/testsuite/g++.target/arm/pr81497.C
+new file mode 100644
+index 00000000000..0519a3a3045
+--- /dev/null
++++ b/gcc/testsuite/g++.target/arm/pr81497.C
+@@ -0,0 +1,9 @@
++/* { dg-do compile } */
++/* { dg-require-effective-target arm_thumb2_ok } */
++
++#include <arm_acle.h>
++
++int main ()
++{
++  return 0;
++}
+-- 
+2.17.1
+
diff --git a/package/gcc/8.1.0/0005-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch b/package/gcc/8.1.0/0005-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch
new file mode 100644
index 0000000000..a383fb18f9
--- /dev/null
+++ b/package/gcc/8.1.0/0005-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch
@@ -0,0 +1,305 @@
+From 4f147efb77e565d28a23c493986b57e2de15443e Mon Sep 17 00:00:00 2001
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 8 Jun 2018 08:18:43 +0000
+Subject: [PATCH] [arm] PR target/81497: Fix arm_acle.h for C++
+
+	Backport from mainline
+	2018-06-05  Kyrylo Tkachov  <kyrylo.tkachov@arm.com>
+
+	PR target/81497
+	* config/arm/arm-builtins.c (arm_type_qualifiers): Add
+	qualifier_void_pointer and qualifier_const_void_pointer.
+	(arm_ldc_qualifiers, arm_stc_qualifiers): Use the above.
+	(arm_init_builtins): Handle the above.
+	* config/arm/arm_acle.h (__arm_cdp, __arm_ldc, __arm_ldcl, __arm_stc,
+	__arm_stcl, __arm_mcr, __arm_cdp2, __arm_ldc2, __arm_ldcl2, __arm_stc2,
+	__arm_stcl2,__arm_mcr2, __arm_mcrr, __arm_mcrr2): Remove return for
+	void intrinsics.
+
+	* g++.target/arm/arm.exp: New file.
+	* g++.target/arm/pr81497.C: Likewise.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch at 261305 138bc75d-0d04-0410-961f-82ee72b054a4
+Upstream-Status: Backport (gcc-8-branch)
+Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
+[gportay: drop gcc/{,testsuite/}ChangeLog changes]
+---
+ gcc/config/arm/arm-builtins.c          | 42 +++++++++++++---------
+ gcc/config/arm/arm_acle.h              | 28 +++++++--------
+ gcc/testsuite/g++.target/arm/arm.exp   | 50 ++++++++++++++++++++++++++
+ gcc/testsuite/g++.target/arm/pr81497.C |  9 +++++
+ 4 files changed, 99 insertions(+), 30 deletions(-)
+ create mode 100644 gcc/testsuite/g++.target/arm/arm.exp
+ create mode 100644 gcc/testsuite/g++.target/arm/pr81497.C
+
+diff --git a/gcc/config/arm/arm-builtins.c b/gcc/config/arm/arm-builtins.c
+index 7fde7a04672..183a7b907f6 100644
+--- a/gcc/config/arm/arm-builtins.c
++++ b/gcc/config/arm/arm-builtins.c
+@@ -78,7 +78,11 @@ enum arm_type_qualifiers
+   /* Lane indices - must be within range of previous argument = a vector.  */
+   qualifier_lane_index = 0x200,
+   /* Lane indices for single lane structure loads and stores.  */
+-  qualifier_struct_load_store_lane_index = 0x400
++  qualifier_struct_load_store_lane_index = 0x400,
++  /* A void pointer.  */
++  qualifier_void_pointer = 0x800,
++  /* A const void pointer.  */
++  qualifier_const_void_pointer = 0x802
+ };
+ 
+ /*  The qualifier_internal allows generation of a unary builtin from
+@@ -202,7 +206,7 @@ arm_cdp_qualifiers[SIMD_MAX_BUILTIN_ARGS]
+ static enum arm_type_qualifiers
+ arm_ldc_qualifiers[SIMD_MAX_BUILTIN_ARGS]
+   = { qualifier_void, qualifier_unsigned_immediate,
+-      qualifier_unsigned_immediate, qualifier_const_pointer };
++      qualifier_unsigned_immediate, qualifier_const_void_pointer };
+ #define LDC_QUALIFIERS \
+   (arm_ldc_qualifiers)
+ 
+@@ -210,7 +214,7 @@ arm_ldc_qualifiers[SIMD_MAX_BUILTIN_ARGS]
+ static enum arm_type_qualifiers
+ arm_stc_qualifiers[SIMD_MAX_BUILTIN_ARGS]
+   = { qualifier_void, qualifier_unsigned_immediate,
+-      qualifier_unsigned_immediate, qualifier_pointer };
++      qualifier_unsigned_immediate, qualifier_void_pointer };
+ #define STC_QUALIFIERS \
+   (arm_stc_qualifiers)
+ 
+@@ -1095,19 +1099,25 @@ arm_init_builtin (unsigned int fcode, arm_builtin_datum *d,
+       if (qualifiers & qualifier_pointer && VECTOR_MODE_P (op_mode))
+ 	op_mode = GET_MODE_INNER (op_mode);
+ 
+-      eltype = arm_simd_builtin_type
+-	(op_mode,
+-	 (qualifiers & qualifier_unsigned) != 0,
+-	 (qualifiers & qualifier_poly) != 0);
+-      gcc_assert (eltype != NULL);
+-
+-      /* Add qualifiers.  */
+-      if (qualifiers & qualifier_const)
+-	eltype = build_qualified_type (eltype, TYPE_QUAL_CONST);
+-
+-      if (qualifiers & qualifier_pointer)
+-	eltype = build_pointer_type (eltype);
+-
++      /* For void pointers we already have nodes constructed by the midend.  */
++      if (qualifiers & qualifier_void_pointer)
++	eltype = qualifiers & qualifier_const
++		 ? const_ptr_type_node : ptr_type_node;
++      else
++	{
++	  eltype
++	    = arm_simd_builtin_type (op_mode,
++				     (qualifiers & qualifier_unsigned) != 0,
++				     (qualifiers & qualifier_poly) != 0);
++	  gcc_assert (eltype != NULL);
++
++	  /* Add qualifiers.  */
++	  if (qualifiers & qualifier_const)
++	    eltype = build_qualified_type (eltype, TYPE_QUAL_CONST);
++
++	  if (qualifiers & qualifier_pointer)
++	    eltype = build_pointer_type (eltype);
++	}
+       /* If we have reached arg_num == 0, we are at a non-void
+ 	 return type.  Otherwise, we are still processing
+ 	 arguments.  */
+diff --git a/gcc/config/arm/arm_acle.h b/gcc/config/arm/arm_acle.h
+index 9a2f0ba30dc..c0f6ea2d156 100644
+--- a/gcc/config/arm/arm_acle.h
++++ b/gcc/config/arm/arm_acle.h
+@@ -38,35 +38,35 @@ __arm_cdp (const unsigned int __coproc, const unsigned int __opc1,
+ 	   const unsigned int __CRd, const unsigned int __CRn,
+ 	   const unsigned int __CRm, const unsigned int __opc2)
+ {
+-  return __builtin_arm_cdp (__coproc, __opc1, __CRd, __CRn, __CRm, __opc2);
++  __builtin_arm_cdp (__coproc, __opc1, __CRd, __CRn, __CRm, __opc2);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_ldc (const unsigned int __coproc, const unsigned int __CRd,
+ 	   const void * __p)
+ {
+-  return __builtin_arm_ldc (__coproc, __CRd, __p);
++  __builtin_arm_ldc (__coproc, __CRd, __p);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_ldcl (const unsigned int __coproc, const unsigned int __CRd,
+ 	    const void * __p)
+ {
+-  return __builtin_arm_ldcl (__coproc, __CRd, __p);
++  __builtin_arm_ldcl (__coproc, __CRd, __p);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_stc (const unsigned int __coproc, const unsigned int __CRd,
+ 	   void * __p)
+ {
+-  return __builtin_arm_stc (__coproc, __CRd, __p);
++  __builtin_arm_stc (__coproc, __CRd, __p);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_stcl (const unsigned int __coproc, const unsigned int __CRd,
+ 	    void * __p)
+ {
+-  return __builtin_arm_stcl (__coproc, __CRd, __p);
++  __builtin_arm_stcl (__coproc, __CRd, __p);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+@@ -74,7 +74,7 @@ __arm_mcr (const unsigned int __coproc, const unsigned int __opc1,
+ 	   uint32_t __value, const unsigned int __CRn, const unsigned int __CRm,
+ 	   const unsigned int __opc2)
+ {
+-  return __builtin_arm_mcr (__coproc, __opc1, __value, __CRn, __CRm, __opc2);
++  __builtin_arm_mcr (__coproc, __opc1, __value, __CRn, __CRm, __opc2);
+ }
+ 
+ __extension__ static __inline uint32_t __attribute__ ((__always_inline__))
+@@ -90,35 +90,35 @@ __arm_cdp2 (const unsigned int __coproc, const unsigned int __opc1,
+ 	    const unsigned int __CRd, const unsigned int __CRn,
+ 	    const unsigned int __CRm, const unsigned int __opc2)
+ {
+-  return __builtin_arm_cdp2 (__coproc, __opc1, __CRd, __CRn, __CRm, __opc2);
++  __builtin_arm_cdp2 (__coproc, __opc1, __CRd, __CRn, __CRm, __opc2);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_ldc2 (const unsigned int __coproc, const unsigned int __CRd,
+ 	    const void * __p)
+ {
+-  return __builtin_arm_ldc2 (__coproc, __CRd, __p);
++  __builtin_arm_ldc2 (__coproc, __CRd, __p);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_ldc2l (const unsigned int __coproc, const unsigned int __CRd,
+ 	     const void * __p)
+ {
+-  return __builtin_arm_ldc2l (__coproc, __CRd, __p);
++  __builtin_arm_ldc2l (__coproc, __CRd, __p);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_stc2 (const unsigned int __coproc, const unsigned int __CRd,
+ 	    void * __p)
+ {
+-  return __builtin_arm_stc2 (__coproc, __CRd, __p);
++  __builtin_arm_stc2 (__coproc, __CRd, __p);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_stc2l (const unsigned int __coproc, const unsigned int __CRd,
+ 	     void * __p)
+ {
+-  return __builtin_arm_stc2l (__coproc, __CRd, __p);
++  __builtin_arm_stc2l (__coproc, __CRd, __p);
+ }
+ 
+ __extension__ static __inline void __attribute__ ((__always_inline__))
+@@ -126,7 +126,7 @@ __arm_mcr2 (const unsigned int __coproc, const unsigned int __opc1,
+ 	    uint32_t __value, const unsigned int __CRn,
+ 	    const unsigned int __CRm, const unsigned int __opc2)
+ {
+-  return __builtin_arm_mcr2 (__coproc, __opc1, __value, __CRn, __CRm, __opc2);
++  __builtin_arm_mcr2 (__coproc, __opc1, __value, __CRn, __CRm, __opc2);
+ }
+ 
+ __extension__ static __inline uint32_t __attribute__ ((__always_inline__))
+@@ -143,7 +143,7 @@ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_mcrr (const unsigned int __coproc, const unsigned int __opc1,
+ 	    uint64_t __value, const unsigned int __CRm)
+ {
+-  return __builtin_arm_mcrr (__coproc, __opc1, __value, __CRm);
++  __builtin_arm_mcrr (__coproc, __opc1, __value, __CRm);
+ }
+ 
+ __extension__ static __inline uint64_t __attribute__ ((__always_inline__))
+@@ -159,7 +159,7 @@ __extension__ static __inline void __attribute__ ((__always_inline__))
+ __arm_mcrr2 (const unsigned int __coproc, const unsigned int __opc1,
+ 	    uint64_t __value, const unsigned int __CRm)
+ {
+-  return __builtin_arm_mcrr2 (__coproc, __opc1, __value, __CRm);
++  __builtin_arm_mcrr2 (__coproc, __opc1, __value, __CRm);
+ }
+ 
+ __extension__ static __inline uint64_t __attribute__ ((__always_inline__))
+diff --git a/gcc/testsuite/g++.target/arm/arm.exp b/gcc/testsuite/g++.target/arm/arm.exp
+new file mode 100644
+index 00000000000..1a169d2f220
+--- /dev/null
++++ b/gcc/testsuite/g++.target/arm/arm.exp
+@@ -0,0 +1,50 @@
++#  Specific regression driver for arm.
++#  Copyright (C) 2009-2018 Free Software Foundation, Inc.
++#
++#  This file is part of GCC.
++#
++#  GCC is free software; you can redistribute it and/or modify it
++#  under the terms of the GNU General Public License as published by
++#  the Free Software Foundation; either version 3, or (at your option)
++#  any later version.
++#
++#  GCC is distributed in the hope that it will be useful, but
++#  WITHOUT ANY WARRANTY; without even the implied warranty of
++#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++#  General Public License for more details.
++#
++#  You should have received a copy of the GNU General Public License
++#  along with GCC; see the file COPYING3.  If not see
++#  <http://www.gnu.org/licenses/>.  */
++
++# GCC testsuite that uses the `dg.exp' driver.
++
++# Exit immediately if this isn't an arm target.
++if {![istarget arm*-*-*] } then {
++  return
++}
++
++# Load support procs.
++load_lib g++-dg.exp
++
++global DEFAULT_CXXFLAGS
++if ![info exists DEFAULT_CXXFLAGS] then {
++    set DEFAULT_CXXFLAGS " -pedantic-errors"
++}
++
++
++global dg_runtest_extra_prunes
++set dg_runtest_extra_prunes ""
++lappend dg_runtest_extra_prunes "warning: switch -m(cpu|arch)=.* conflicts with -m(cpu|arch)=.* switch"
++
++# Initialize `dg'.
++dg-init
++
++# Main loop.
++dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/*.C]] \
++        "" $DEFAULT_CXXFLAGS
++
++# All done.
++set dg_runtest_extra_prunes ""
++dg-finish
++
+diff --git a/gcc/testsuite/g++.target/arm/pr81497.C b/gcc/testsuite/g++.target/arm/pr81497.C
+new file mode 100644
+index 00000000000..0519a3a3045
+--- /dev/null
++++ b/gcc/testsuite/g++.target/arm/pr81497.C
+@@ -0,0 +1,9 @@
++/* { dg-do compile } */
++/* { dg-require-effective-target arm_thumb2_ok } */
++
++#include <arm_acle.h>
++
++int main ()
++{
++  return 0;
++}
+-- 
+2.17.1
+
