From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 12:58:35 +0200
Subject: [Buildroot] [git commit] package/gcc: remove version 6.5
Message-ID: <20190804121124.D7A78813D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=983361abef2782cf03029c01bae7f47f050ca3b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc 9.1 is around, gcc 8.3 is the default version, so drop
6.5 in order to reduce the gcc choice.

Keep gcc 5.5 since it still used by beaglebone_qt5_defconfig.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |   7 +
 package/gcc/6.5.0/0001-m68k-coldfire-pr68467.patch |  48 ------
 ...xtensa-don-t-force-PIC-for-uclinux-target.patch |  41 -----
 package/gcc/6.5.0/100-uclibc-conf.patch            |  15 --
 package/gcc/6.5.0/301-missing-execinfo_h.patch     |  13 --
 package/gcc/6.5.0/810-arm-softfloat-libgcc.patch   |  30 ----
 package/gcc/6.5.0/830-arm_unbreak_armv4t.patch     |  15 --
 ...et-70473-Reduce-size-of-Cortex-A8-automat.patch |  69 --------
 package/gcc/6.5.0/860-cilk-wchar.patch             |  56 -------
 package/gcc/6.5.0/890-fix-m68k-compile.patch       |  15 --
 package/gcc/6.5.0/896-microblaze-Revert.patch      |  40 -----
 ...laze-support-DWARF-EH-old-Xilinx-patch-ne.patch | 178 ---------------------
 package/gcc/6.5.0/940-uclinux-enable-threads.patch |  19 ---
 .../941-mips-Add-support-for-mips-r6-musl.patch    |  43 -----
 package/gcc/Config.in.host                         |   9 --
 package/gcc/gcc.hash                               |   2 -
 16 files changed, 7 insertions(+), 593 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index fa7de2d8d3..de05b07c97 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2019.08"
 
+config BR2_GCC_VERSION_6_X
+	bool "gcc 6.x support removed"
+	select BR2_LEGACY
+	help
+	  Support for gcc version 6.x has been removed. The current
+	  default version (8.x or later) has been selected instead.
+
 config BR2_GCC_VERSION_4_9_X
 	bool "gcc 4.9.x support removed"
 	select BR2_LEGACY
diff --git a/package/gcc/6.5.0/0001-m68k-coldfire-pr68467.patch b/package/gcc/6.5.0/0001-m68k-coldfire-pr68467.patch
deleted file mode 100644
index afc18a508e..0000000000
--- a/package/gcc/6.5.0/0001-m68k-coldfire-pr68467.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Backport from upstream, see
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68467
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gcc-6.4.0.orig/gcc/config/m68k/m68k.c gcc-6.4.0/gcc/config/m68k/m68k.c
---- gcc-6.4.0.orig/gcc/config/m68k/m68k.c	2016-01-04 15:30:50.652828000 +0100
-+++ gcc-6.4.0/gcc/config/m68k/m68k.c	2018-02-17 19:08:16.313168186 +0100
-@@ -180,6 +180,8 @@
- 			      const_tree, bool);
- static bool m68k_cannot_force_const_mem (machine_mode mode, rtx x);
- static bool m68k_output_addr_const_extra (FILE *, rtx);
-+static machine_mode m68k_promote_function_mode (const_tree, machine_mode,
-+						int *, const_tree, int);
- static void m68k_init_sync_libfuncs (void) ATTRIBUTE_UNUSED;
- 
- /* Initialize the GCC target structure.  */
-@@ -322,6 +324,9 @@
- #undef TARGET_ATOMIC_TEST_AND_SET_TRUEVAL
- #define TARGET_ATOMIC_TEST_AND_SET_TRUEVAL 128
- 
-+#undef TARGET_PROMOTE_FUNCTION_MODE
-+#define TARGET_PROMOTE_FUNCTION_MODE m68k_promote_function_mode
-+
- static const struct attribute_spec m68k_attribute_table[] =
- {
-   /* { name, min_len, max_len, decl_req, type_req, fn_type_req, handler,
-@@ -6524,4 +6529,20 @@
- 	      == m68k_fk_interrupt_handler));
- }
- 
-+/* Implement TARGET_PROMOTE_FUNCTION_MODE.  */
-+
-+static machine_mode
-+m68k_promote_function_mode (const_tree type, machine_mode mode,
-+                            int *punsignedp ATTRIBUTE_UNUSED,
-+                            const_tree fntype ATTRIBUTE_UNUSED,
-+                            int for_return)
-+{
-+  /* Promote libcall arguments narrower than int to match the normal C
-+     ABI (for which promotions are handled via
-+     TARGET_PROMOTE_PROTOTYPES).  */
-+  if (type == NULL_TREE && !for_return && (mode == QImode || mode == HImode))
-+    return SImode;
-+  return mode;
-+}
-+
- #include "gt-m68k.h"
diff --git a/package/gcc/6.5.0/0004-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch b/package/gcc/6.5.0/0004-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch
deleted file mode 100644
index 360947cbb1..0000000000
--- a/package/gcc/6.5.0/0004-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 960a2552f7b418134cdf7a31e96023a3811b98dd Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Sun, 4 Nov 2018 23:55:59 -0800
-Subject: [PATCH] gcc: xtensa: don't force PIC for uclinux target
-
-xtensa-uclinux uses bFLT executable file format that cannot relocate
-fields representing offsets from data to code. C++ objects built as PIC
-use offsets to encode FDE structures. As a result C++ exception handling
-doesn't work correctly on xtensa-uclinux. Don't use PIC by default on
-xtensa-uclinux.
-
-gcc/
-2018-11-05  Max Filippov  <jcmvbkbc@gmail.com>
-
-	* config/xtensa/uclinux.h (XTENSA_ALWAYS_PIC): Change to 0.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: r265823
-
- gcc/config/xtensa/uclinux.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/xtensa/uclinux.h b/gcc/config/xtensa/uclinux.h
-index ba26187c8f7a..c7743df9d97c 100644
---- a/gcc/config/xtensa/uclinux.h
-+++ b/gcc/config/xtensa/uclinux.h
-@@ -59,8 +59,8 @@ along with GCC; see the file COPYING3.  If not see
- #undef LOCAL_LABEL_PREFIX
- #define LOCAL_LABEL_PREFIX	"."
- 
--/* Always enable "-fpic" for Xtensa Linux.  */
--#define XTENSA_ALWAYS_PIC 1
-+/* Don't enable "-fpic" for Xtensa uclinux.  */
-+#define XTENSA_ALWAYS_PIC 0
- 
- #undef TARGET_LIBC_HAS_FUNCTION
- #define TARGET_LIBC_HAS_FUNCTION no_c99_libc_has_function
--- 
-2.11.0
-
diff --git a/package/gcc/6.5.0/100-uclibc-conf.patch b/package/gcc/6.5.0/100-uclibc-conf.patch
deleted file mode 100644
index 73d1f0d3a9..0000000000
--- a/package/gcc/6.5.0/100-uclibc-conf.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Index: b/contrib/regression/objs-gcc.sh
-===================================================================
---- a/contrib/regression/objs-gcc.sh
-+++ b/contrib/regression/objs-gcc.sh
-@@ -106,6 +106,10 @@
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
diff --git a/package/gcc/6.5.0/301-missing-execinfo_h.patch b/package/gcc/6.5.0/301-missing-execinfo_h.patch
deleted file mode 100644
index 2d0e7baa44..0000000000
--- a/package/gcc/6.5.0/301-missing-execinfo_h.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: b/boehm-gc/include/gc.h
-===================================================================
---- a/boehm-gc/include/gc.h
-+++ b/boehm-gc/include/gc.h
-@@ -503,7 +503,7 @@
- #if defined(__linux__) || defined(__GLIBC__)
- # include <features.h>
- # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
--     && !defined(__ia64__)
-+     && !defined(__ia64__) && !defined(__UCLIBC__)
- #   ifndef GC_HAVE_BUILTIN_BACKTRACE
- #     define GC_HAVE_BUILTIN_BACKTRACE
- #   endif
diff --git a/package/gcc/6.5.0/810-arm-softfloat-libgcc.patch b/package/gcc/6.5.0/810-arm-softfloat-libgcc.patch
deleted file mode 100644
index 5efa7fd1bc..0000000000
--- a/package/gcc/6.5.0/810-arm-softfloat-libgcc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Index: b/gcc/config/arm/linux-elf.h
-===================================================================
---- a/gcc/config/arm/linux-elf.h
-+++ b/gcc/config/arm/linux-elf.h
-@@ -60,7 +60,7 @@
-    %{shared:-lc} \
-    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
- 
--#define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
-+#define LIBGCC_SPEC "-lgcc"
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
- 
-Index: b/libgcc/config/arm/t-linux
-===================================================================
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
diff --git a/package/gcc/6.5.0/830-arm_unbreak_armv4t.patch b/package/gcc/6.5.0/830-arm_unbreak_armv4t.patch
deleted file mode 100644
index b730059183..0000000000
--- a/package/gcc/6.5.0/830-arm_unbreak_armv4t.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-http://sourceware.org/ml/crossgcc/2008-05/msg00009.html
-
-Index: b/gcc/config/arm/linux-eabi.h
-===================================================================
---- a/gcc/config/arm/linux-eabi.h
-+++ b/gcc/config/arm/linux-eabi.h
-@@ -45,7 +45,7 @@
-    The ARM10TDMI core is the default for armv5t, so set
-    SUBTARGET_CPU_DEFAULT to achieve this.  */
- #undef  SUBTARGET_CPU_DEFAULT
--#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm10tdmi
-+#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm9tdmi
- 
- /* TARGET_BIG_ENDIAN_DEFAULT is set in
-    config.gcc for big endian configurations.  */
diff --git a/package/gcc/6.5.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch b/package/gcc/6.5.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
deleted file mode 100644
index af9fb1d6b2..0000000000
--- a/package/gcc/6.5.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 07453188b18a2cbe815917dbb893b4ebfdd793b6 Mon Sep 17 00:00:00 2001
-From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Fri, 26 Aug 2016 10:23:20 +0000
-Subject: [PATCH] [ARM] PR target/70473: Reduce size of Cortex-A8 automaton
-
-	PR target/70473
-	* config/arm/cortex-a8-neon.md (cortex_a8_vfp_muld): Reduce
-	reservation duration to 15 cycles.
-	(cortex_a8_vfp_macs): Likewise.
-	(cortex_a8_vfp_macd): Likewise.
-	(cortex_a8_vfp_divs): Likewise.
-	(cortex_a8_vfp_divd): Likewise.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 239772
-138bc75d-0d04-0410-961f-82ee72b054a4
-
-[Backport from gcc upstream commit 79f5d5e3cd5a668d5ecb2b6b0cce80ef5706ac53.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- gcc/config/arm/cortex-a8-neon.md | 14 +++++++++-----
- 1 file changed, 9 insertions(+), 5 deletions(-)
-
-diff --git a/gcc/config/arm/cortex-a8-neon.md b/gcc/config/arm/cortex-a8-neon.md
-index 45f861f..b16c299 100644
---- a/gcc/config/arm/cortex-a8-neon.md
-+++ b/gcc/config/arm/cortex-a8-neon.md
-@@ -357,30 +357,34 @@
-        (eq_attr "type" "fmuls"))
-   "cortex_a8_vfp,cortex_a8_vfplite*11")
- 
-+;; Don't model a reservation for more than 15 cycles as this explodes the
-+;; state space of the automaton for little gain.  It is unlikely that the
-+;; scheduler will find enough instructions to hide the full latency of the
-+;; instructions.
- (define_insn_reservation "cortex_a8_vfp_muld" 17
-   (and (eq_attr "tune" "cortexa8")
-        (eq_attr "type" "fmuld"))
--  "cortex_a8_vfp,cortex_a8_vfplite*16")
-+  "cortex_a8_vfp,cortex_a8_vfplite*15")
- 
- (define_insn_reservation "cortex_a8_vfp_macs" 21
-   (and (eq_attr "tune" "cortexa8")
-        (eq_attr "type" "fmacs,ffmas"))
--  "cortex_a8_vfp,cortex_a8_vfplite*20")
-+  "cortex_a8_vfp,cortex_a8_vfplite*15")
- 
- (define_insn_reservation "cortex_a8_vfp_macd" 26
-   (and (eq_attr "tune" "cortexa8")
-        (eq_attr "type" "fmacd,ffmad"))
--  "cortex_a8_vfp,cortex_a8_vfplite*25")
-+  "cortex_a8_vfp,cortex_a8_vfplite*15")
- 
- (define_insn_reservation "cortex_a8_vfp_divs" 37
-   (and (eq_attr "tune" "cortexa8")
-        (eq_attr "type" "fdivs, fsqrts"))
--  "cortex_a8_vfp,cortex_a8_vfplite*36")
-+  "cortex_a8_vfp,cortex_a8_vfplite*15")
- 
- (define_insn_reservation "cortex_a8_vfp_divd" 65
-   (and (eq_attr "tune" "cortexa8")
-        (eq_attr "type" "fdivd, fsqrtd"))
--  "cortex_a8_vfp,cortex_a8_vfplite*64")
-+  "cortex_a8_vfp,cortex_a8_vfplite*15")
- 
- ;; Comparisons can actually take 7 cycles sometimes instead of four,
- ;; but given all the other instructions lumped into type=ffarith that
--- 
-2.7.4
-
diff --git a/package/gcc/6.5.0/860-cilk-wchar.patch b/package/gcc/6.5.0/860-cilk-wchar.patch
deleted file mode 100644
index 1d9916f554..0000000000
--- a/package/gcc/6.5.0/860-cilk-wchar.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-[PATCH] cilk: fix build without wchar
-
-When building against uClibc with wchar support disabled, WCHAR_MIN and
-WCHAR_MAX are not defined leading to compilation errors.
-
-Fix it by only including the wchar code if available.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- libcilkrts/include/cilk/reducer_min_max.h |    8 ++++++++
- 1 file changed, 8 insertions(+)
-
-Index: b/libcilkrts/include/cilk/reducer_min_max.h
-===================================================================
---- a/libcilkrts/include/cilk/reducer_min_max.h
-+++ b/libcilkrts/include/cilk/reducer_min_max.h
-@@ -3154,7 +3154,9 @@
- CILK_C_REDUCER_MAX_INSTANCE(char,               char,       CHAR_MIN)
- CILK_C_REDUCER_MAX_INSTANCE(unsigned char,      uchar,      0)
- CILK_C_REDUCER_MAX_INSTANCE(signed char,        schar,      SCHAR_MIN)
-+#ifdef WCHAR_MIN
- CILK_C_REDUCER_MAX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
-+#endif
- CILK_C_REDUCER_MAX_INSTANCE(short,              short,      SHRT_MIN)
- CILK_C_REDUCER_MAX_INSTANCE(unsigned short,     ushort,     0)
- CILK_C_REDUCER_MAX_INSTANCE(int,                int,        INT_MIN)
-@@ -3306,7 +3308,9 @@
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(char,               char,       CHAR_MIN)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned char,      uchar,      0)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(signed char,        schar,      SCHAR_MIN)
-+#ifdef WCHAR_MIN
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
-+#endif
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(short,              short,      SHRT_MIN)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned short,     ushort,     0)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(int,                int,        INT_MIN)
-@@ -3432,7 +3436,9 @@
- CILK_C_REDUCER_MIN_INSTANCE(char,               char,       CHAR_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(signed char,        schar,      SCHAR_MAX)
-+#ifdef WCHAR_MAX
- CILK_C_REDUCER_MIN_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
-+#endif
- CILK_C_REDUCER_MIN_INSTANCE(short,              short,      SHRT_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(int,                int,        INT_MAX)
-@@ -3584,7 +3590,9 @@
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(char,               char,       CHAR_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(signed char,        schar,      SCHAR_MAX)
-+#ifdef WCHAR_MAX
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
-+#endif
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(short,              short,      SHRT_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(int,                int,        INT_MAX)
diff --git a/package/gcc/6.5.0/890-fix-m68k-compile.patch b/package/gcc/6.5.0/890-fix-m68k-compile.patch
deleted file mode 100644
index 6e63de0cd1..0000000000
--- a/package/gcc/6.5.0/890-fix-m68k-compile.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-remove unused header, which breaks the toolchain building
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gcc-5.3.0.orig/libgcc/config/m68k/linux-atomic.c gcc-5.3.0/libgcc/config/m68k/linux-atomic.c
---- gcc-5.3.0.orig/libgcc/config/m68k/linux-atomic.c	2015-01-05 13:33:28.000000000 +0100
-+++ gcc-5.3.0/libgcc/config/m68k/linux-atomic.c	2016-03-19 09:25:07.000000000 +0100
-@@ -33,7 +33,6 @@
-    using the kernel helper defined below.  There is no support for
-    64-bit operations yet.  */
- 
--#include <asm/unistd.h>
- #include <stdbool.h>
- 
- #ifndef __NR_atomic_cmpxchg_32
diff --git a/package/gcc/6.5.0/896-microblaze-Revert.patch b/package/gcc/6.5.0/896-microblaze-Revert.patch
deleted file mode 100644
index 7026d0efe1..0000000000
--- a/package/gcc/6.5.0/896-microblaze-Revert.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 707a69dfb56a2976e2b5c010f0e5cb2ac9905a07 Mon Sep 17 00:00:00 2001
-From: eager <eager@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Sat, 27 May 2017 18:29:40 +0000
-Subject: [PATCH] 	Revert: 	2016-01-21  Ajit Agarwal 
- <ajitkum@xilinx.com>
-
-	See https://gcc.gnu.org/ml/gcc/2017-05/msg00221.html.
-
-	* config/microblaze/microblaze.h
-	(FIXED_REGISTERS): Update in macro.
-	(CALL_USED_REGISTERS): Update in macro.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 248540 138bc75d-0d04-0410-961f-82ee72b054a4
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
-index 66e4ef5..2c9ece1 100644
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
-2.1.4
-
diff --git a/package/gcc/6.5.0/897-Make-MicroBlaze-support-DWARF-EH-old-Xilinx-patch-ne.patch b/package/gcc/6.5.0/897-Make-MicroBlaze-support-DWARF-EH-old-Xilinx-patch-ne.patch
deleted file mode 100644
index 1f2dcabede..0000000000
--- a/package/gcc/6.5.0/897-Make-MicroBlaze-support-DWARF-EH-old-Xilinx-patch-ne.patch
+++ /dev/null
@@ -1,178 +0,0 @@
-From 81aab124bc697a87ad492d4cd3380599c0e0747e Mon Sep 17 00:00:00 2001
-From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Fri, 6 Jan 2017 20:54:34 +0000
-Subject: [PATCH] Make MicroBlaze support DWARF EH (old Xilinx patch, needed
- for glibc build).
-
-This patch, taken from
-<https://git.busybox.net/buildroot/tree/package/gcc/5.4.0/840-microblaze-enable-dwarf-eh-support.patch>
-and with a few formatting cleanups and an update for the removal of
-gen_rtx_raw_REG, enables DWARF EH support for MicroBlaze.
-
-This is needed for building glibc with a compiler that includes shared
-libgcc; right now all glibc builds for MicroBlaze are failing with my
-bot for lack of this support.  (It's dubious if we should have glibc
-ports at all where required support is missing in FSF GCC.)
-
-Tested building glibc with build-many-glibcs.py.  I have *not* done
-any other testing or any execution testing for MicroBlaze.
-
-2017-01-06  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
-	    David Holsgrove <david.holsgrove@xilinx.com>
-
-	* common/config/microblaze/microblaze-common.c
-	(TARGET_EXCEPT_UNWIND_INFO): Remove.
-	* config/microblaze/microblaze-protos.h (microblaze_eh_return):
-	New prototype.
-	* config/microblaze/microblaze.c (microblaze_must_save_register)
-	(microblaze_expand_epilogue, microblaze_return_addr): Handle
-	calls_eh_return.
-	(microblaze_eh_return): New function.
-	* config/microblaze/microblaze.h (RETURN_ADDR_OFFSET)
-	(EH_RETURN_DATA_REGNO, MB_EH_STACKADJ_REGNUM)
-	(EH_RETURN_STACKADJ_RTX, ASM_PREFERRED_EH_DATA_FORMAT): New macros.
-	* config/microblaze/microblaze.md (eh_return): New pattern.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 244183 138bc75d-0d04-0410-961f-82ee72b054a4
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- gcc/common/config/microblaze/microblaze-common.c |  3 ---
- gcc/config/microblaze/microblaze-protos.h        |  1 +
- gcc/config/microblaze/microblaze.c               | 27 ++++++++++++++++++++----
- gcc/config/microblaze/microblaze.h               | 16 ++++++++++++++
- gcc/config/microblaze/microblaze.md              | 10 +++++++++
- 6 files changed, 66 insertions(+), 7 deletions(-)
-
-diff --git a/gcc/common/config/microblaze/microblaze-common.c b/gcc/common/config/microblaze/microblaze-common.c
-index 57a3099..4975663 100644
---- a/gcc/common/config/microblaze/microblaze-common.c
-+++ b/gcc/common/config/microblaze/microblaze-common.c
-@@ -37,7 +37,4 @@ static const struct default_options microblaze_option_optimization_table[] =
- #undef  TARGET_OPTION_OPTIMIZATION_TABLE
- #define TARGET_OPTION_OPTIMIZATION_TABLE microblaze_option_optimization_table
- 
--#undef TARGET_EXCEPT_UNWIND_INFO
--#define TARGET_EXCEPT_UNWIND_INFO  sjlj_except_unwind_info
--
- struct gcc_targetm_common targetm_common = TARGETM_COMMON_INITIALIZER;
-diff --git a/gcc/config/microblaze/microblaze-protos.h b/gcc/config/microblaze/microblaze-protos.h
-index 6fb3066..9ba8f2d 100644
---- a/gcc/config/microblaze/microblaze-protos.h
-+++ b/gcc/config/microblaze/microblaze-protos.h
-@@ -57,6 +57,7 @@ extern bool microblaze_tls_referenced_p (rtx);
- extern int symbol_mentioned_p (rtx);
- extern int label_mentioned_p (rtx);
- extern bool microblaze_cannot_force_const_mem (machine_mode, rtx);
-+extern void microblaze_eh_return (rtx op0);
- #endif  /* RTX_CODE */
- 
- /* Declare functions in microblaze-c.c.  */
-diff --git a/gcc/config/microblaze/microblaze.c b/gcc/config/microblaze/microblaze.c
-index 03b70e1..746bef1 100644
---- a/gcc/config/microblaze/microblaze.c
-+++ b/gcc/config/microblaze/microblaze.c
-@@ -1926,6 +1926,10 @@ microblaze_must_save_register (int regno)
-   if (frame_pointer_needed && (regno == HARD_FRAME_POINTER_REGNUM))
-     return 1;
- 
-+  if (crtl->calls_eh_return
-+      && regno == MB_ABI_SUB_RETURN_ADDR_REGNUM)
-+    return 1;
-+
-   if (!crtl->is_leaf)
-     {
-       if (regno == MB_ABI_SUB_RETURN_ADDR_REGNUM)
-@@ -1953,6 +1957,11 @@ microblaze_must_save_register (int regno)
- 	return 1;
-     }
- 
-+  if (crtl->calls_eh_return
-+      && (regno == EH_RETURN_DATA_REGNO (0)
-+          || regno == EH_RETURN_DATA_REGNO (1)))
-+    return 1;
-+
-   return 0;
- }
- 
-@@ -3029,6 +3038,12 @@ microblaze_expand_epilogue (void)
-       emit_insn (gen_addsi3 (stack_pointer_rtx, stack_pointer_rtx, fsiz_rtx));
-     }
- 
-+  if (crtl->calls_eh_return)
-+    emit_insn (gen_addsi3 (stack_pointer_rtx,
-+                           stack_pointer_rtx,
-+                           gen_raw_REG (SImode,
-+					MB_EH_STACKADJ_REGNUM)));
-+
-   emit_jump_insn (gen_return_internal (gen_rtx_REG (Pmode, GP_REG_FIRST +
- 						    MB_ABI_SUB_RETURN_ADDR_REGNUM)));
- }
-@@ -3326,10 +3341,14 @@ microblaze_return_addr (int count, rtx frame ATTRIBUTE_UNUSED)
-   if (count != 0)
-     return NULL_RTX;
- 
--  return gen_rtx_PLUS (Pmode,
--		       get_hard_reg_initial_val (Pmode,
--						 MB_ABI_SUB_RETURN_ADDR_REGNUM),
--		       GEN_INT (8));
-+  return get_hard_reg_initial_val (Pmode,
-+                                   MB_ABI_SUB_RETURN_ADDR_REGNUM);
-+}
-+
-+void
-+microblaze_eh_return (rtx op0)
-+{
-+  emit_insn (gen_movsi (gen_rtx_MEM (Pmode, stack_pointer_rtx), op0));
- }
- 
- /* Queue an .ident string in the queue of top-level asm statements.
-diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
-index 527f4d3..8fdadbf 100644
---- a/gcc/config/microblaze/microblaze.h
-+++ b/gcc/config/microblaze/microblaze.h
-@@ -184,6 +184,22 @@ extern enum pipeline_type microblaze_pipe;
- #define INCOMING_RETURN_ADDR_RTX  			\
-   gen_rtx_REG (Pmode, GP_REG_FIRST + MB_ABI_SUB_RETURN_ADDR_REGNUM)
- 
-+/* Specifies the offset from INCOMING_RETURN_ADDR_RTX and the actual return PC.  */
-+#define RETURN_ADDR_OFFSET (8)
-+
-+/* Describe how we implement __builtin_eh_return.  */
-+#define EH_RETURN_DATA_REGNO(N)					\
-+  (((N) < 2) ? MB_ABI_FIRST_ARG_REGNUM + (N) : INVALID_REGNUM)
-+
-+#define MB_EH_STACKADJ_REGNUM  MB_ABI_INT_RETURN_VAL2_REGNUM
-+#define EH_RETURN_STACKADJ_RTX  gen_rtx_REG (Pmode, MB_EH_STACKADJ_REGNUM)
-+
-+/* Select a format to encode pointers in exception handling data.  CODE
-+   is 0 for data, 1 for code labels, 2 for function pointers.  GLOBAL is
-+   true if the symbol may be affected by dynamic relocations.  */
-+#define ASM_PREFERRED_EH_DATA_FORMAT(CODE,GLOBAL) \
-+  ((flag_pic || GLOBAL) ? DW_EH_PE_aligned : DW_EH_PE_absptr)
-+
- /* Use DWARF 2 debugging information by default.  */
- #define DWARF2_DEBUGGING_INFO
- #define PREFERRED_DEBUGGING_TYPE DWARF2_DEBUG
-diff --git a/gcc/config/microblaze/microblaze.md b/gcc/config/microblaze/microblaze.md
-index 8f83daa..66ebc1e 100644
---- a/gcc/config/microblaze/microblaze.md
-+++ b/gcc/config/microblaze/microblaze.md
-@@ -2324,4 +2324,14 @@
-   (set_attr "mode"      "SI")
-   (set_attr "length"    "4")])
- 
-+; This is used in compiling the unwind routines.
-+(define_expand "eh_return"
-+  [(use (match_operand 0 "general_operand" ""))]
-+  ""
-+  "
-+{
-+  microblaze_eh_return (operands[0]);
-+  DONE;
-+}")
-+
- (include "sync.md")
--- 
-2.1.4
-
diff --git a/package/gcc/6.5.0/940-uclinux-enable-threads.patch b/package/gcc/6.5.0/940-uclinux-enable-threads.patch
deleted file mode 100644
index 5532656725..0000000000
--- a/package/gcc/6.5.0/940-uclinux-enable-threads.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Enable POSIX threads for uClinux targets
-Reported upstream:
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71721
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gcc-6.1.0.orig/gcc/config.gcc gcc-6.1.0/gcc/config.gcc
---- gcc-6.1.0.orig/gcc/config.gcc	2016-04-11 12:14:59.000000000 +0200
-+++ gcc-6.1.0/gcc/config.gcc	2016-07-02 20:04:25.732169982 +0200
-@@ -833,6 +833,9 @@
- *-*-uclinux*)
-   extra_options="$extra_options gnu-user.opt"
-   use_gcc_stdint=wrap
-+  case ${enable_threads} in
-+    "" | yes | posix) thread_file='posix' ;;
-+  esac
-   tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC SINGLE_LIBC"
-   ;;
- *-*-rdos*)
diff --git a/package/gcc/6.5.0/941-mips-Add-support-for-mips-r6-musl.patch b/package/gcc/6.5.0/941-mips-Add-support-for-mips-r6-musl.patch
deleted file mode 100644
index 337d376b75..0000000000
--- a/package/gcc/6.5.0/941-mips-Add-support-for-mips-r6-musl.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 83717065090bb8b954556d1216dd9dc397dc0243 Mon Sep 17 00:00:00 2001
-From: nsz <nsz@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 25 Aug 2016 14:13:02 +0000
-Subject: [PATCH] [mips] Add support for mips*r6-*-musl
-
-gcc/
-	* config/mips/linux.h (MUSL_DYNAMIC_LINKER32): Update.
-	(MUSL_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKERN32): Update.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 239760 138bc75d-0d04-0410-961f-82ee72b054a4
-
-[Vincent: tweak to not patch ChangeLog]
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- gcc/config/mips/linux.h | 9 ++++++---
- 1 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
-index fa253b6..dc51c45 100644
---- a/gcc/config/mips/linux.h
-+++ b/gcc/config/mips/linux.h
-@@ -38,10 +38,13 @@ along with GCC; see the file COPYING3.  If not see
-   "%{mnan=2008:/lib32/ld-uClibc-mipsn8.so.0;:/lib32/ld-uClibc.so.0}"
- 
- #undef MUSL_DYNAMIC_LINKER32
--#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-mips%{EL:el}%{msoft-float:-sf}.so.1"
-+#define MUSL_DYNAMIC_LINKER32 \
-+  "/lib/ld-musl-mips%{mips32r6|mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
- #undef MUSL_DYNAMIC_LINKER64
--#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-mips64%{EL:el}%{msoft-float:-sf}.so.1"
--#define MUSL_DYNAMIC_LINKERN32 "/lib/ld-musl-mipsn32%{EL:el}%{msoft-float:-sf}.so.1"
-+#define MUSL_DYNAMIC_LINKER64 \
-+  "/lib/ld-musl-mips64%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
-+#define MUSL_DYNAMIC_LINKERN32 \
-+  "/lib/ld-musl-mipsn32%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
- 
- #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
- #define GNU_USER_DYNAMIC_LINKERN32 \
--- 
-2.10.0
-
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index d770d9b4b9..cff8134333 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -40,14 +40,6 @@ config BR2_GCC_VERSION_5_X
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC && BR2_powerpc64le)
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
-config BR2_GCC_VERSION_6_X
-	bool "gcc 6.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
-	# Broken or unsupported architectures
-	depends on !BR2_arc
-	depends on !BR2_or1k
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
-
 config BR2_GCC_VERSION_7_X
 	bool "gcc 7.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
@@ -85,7 +77,6 @@ config BR2_GCC_SUPPORTS_LIBCILKRTS
 config BR2_GCC_VERSION
 	string
 	default "5.5.0"     if BR2_GCC_VERSION_5_X
-	default "6.5.0"     if BR2_GCC_VERSION_6_X
 	default "7.4.0"     if BR2_GCC_VERSION_7_X
 	default "8.3.0"     if BR2_GCC_VERSION_8_X
 	default "9.1.0"     if BR2_GCC_VERSION_9_X
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 9266d3a398..20f5145be6 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -1,7 +1,5 @@
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.5.0/sha512.sum
 sha512  670ff52c2ae12c7852c12987e91798c5aa8bd6daf21f0d6e0cd57a4aa59cc4f06a837fe76426eaa1424cfddca937bed377680700eadc04d76b9180d462364fa1  gcc-5.5.0.tar.xz
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.5.0/sha512.sum
-sha512  ce046f9a50050fd54b870aab764f7db187fe7ea92eb4aaffb7c3689ca623755604e231f2af97ef795f41c406bb80c797dd69957cfdd51dfa2ba60813f72b7eac  gcc-6.5.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.4.0/sha512.sum
 sha512  8864d8e4b97c2e1a4f17422f6e68120172ebefeab97b1757734f7185ca68a6b9a89011c6833c03fa454c17b0ac35b15e1d284881e6971035948ac6100f3aa45e  gcc-7.4.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-8.3.0/sha512.sum
