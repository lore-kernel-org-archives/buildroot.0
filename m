From: Cyril Bur <cyrilbur@gmail.com>
Date: Fri, 26 Feb 2016 14:15:48 +1100
Subject: [Buildroot] [PATCH] gcc: Add GCC 5.2.x option
Message-ID: <1456456548-11898-1-git-send-email-cyrilbur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GCC 5.3.x introduces a regression with PowerPC Altivec/VSX code generation.

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69969

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
I'm not sure if this patch is worth the trouble. By the looks of it the GCC
guys are aiming to have a fix in 5.4 and it is unlikely most users are
doing things that would result in them hitting the bug.

 package/gcc/5.2.0/100-uclibc-conf.patch            |  15 ++
 ...gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch |  29 +++
 package/gcc/5.2.0/301-missing-execinfo_h.patch     |  13 +
 package/gcc/5.2.0/810-arm-softfloat-libgcc.patch   |  30 +++
 package/gcc/5.2.0/830-arm_unbreak_armv4t.patch     |  15 ++
 .../840-microblaze-enable-dwarf-eh-support.patch   | 166 ++++++++++++
 package/gcc/5.2.0/850-libstdcxx-uclibc-c99.patch   | 273 +++++++++++++++++++
 package/gcc/5.2.0/860-cilk-wchar.patch             |  56 ++++
 .../870-xtensa-add-mauto-litpools-option.patch     | 290 +++++++++++++++++++++
 .../871-xtensa-reimplement-register-spilling.patch |  76 ++++++
 ...unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch |  31 +++
 .../gcc/5.2.0/873-xtensa-fix-_Unwind_GetCFA.patch  |  40 +++
 .../5.2.0/900-libitm-fixes-for-musl-support.patch  |  65 +++++
 .../901-fixincludes-update-for-musl-support.patch  |  32 +++
 package/gcc/5.2.0/902-unwind-fix-for-musl.patch    |  36 +++
 ...dc++-libgfortran-gthr-workaround-for-musl.patch |  80 ++++++
 package/gcc/5.2.0/904-musl-libc-config.patch       | 285 ++++++++++++++++++++
 .../gcc/5.2.0/905-add-musl-support-to-gcc.patch    | 130 +++++++++
 package/gcc/5.2.0/906-mips-musl-support.patch      |  37 +++
 package/gcc/5.2.0/907-x86-musl-support.patch       |  45 ++++
 package/gcc/5.2.0/908-arm-musl-support.patch       |  45 ++++
 package/gcc/5.2.0/909-aarch64-musl-support.patch   |  33 +++
 package/gcc/Config.in.host                         |   9 +
 package/gcc/gcc.hash                               |   2 +
 24 files changed, 1833 insertions(+)
 create mode 100644 package/gcc/5.2.0/100-uclibc-conf.patch
 create mode 100644 package/gcc/5.2.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
 create mode 100644 package/gcc/5.2.0/301-missing-execinfo_h.patch
 create mode 100644 package/gcc/5.2.0/810-arm-softfloat-libgcc.patch
 create mode 100644 package/gcc/5.2.0/830-arm_unbreak_armv4t.patch
 create mode 100644 package/gcc/5.2.0/840-microblaze-enable-dwarf-eh-support.patch
 create mode 100644 package/gcc/5.2.0/850-libstdcxx-uclibc-c99.patch
 create mode 100644 package/gcc/5.2.0/860-cilk-wchar.patch
 create mode 100644 package/gcc/5.2.0/870-xtensa-add-mauto-litpools-option.patch
 create mode 100644 package/gcc/5.2.0/871-xtensa-reimplement-register-spilling.patch
 create mode 100644 package/gcc/5.2.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
 create mode 100644 package/gcc/5.2.0/873-xtensa-fix-_Unwind_GetCFA.patch
 create mode 100644 package/gcc/5.2.0/900-libitm-fixes-for-musl-support.patch
 create mode 100644 package/gcc/5.2.0/901-fixincludes-update-for-musl-support.patch
 create mode 100644 package/gcc/5.2.0/902-unwind-fix-for-musl.patch
 create mode 100644 package/gcc/5.2.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
 create mode 100644 package/gcc/5.2.0/904-musl-libc-config.patch
 create mode 100644 package/gcc/5.2.0/905-add-musl-support-to-gcc.patch
 create mode 100644 package/gcc/5.2.0/906-mips-musl-support.patch
 create mode 100644 package/gcc/5.2.0/907-x86-musl-support.patch
 create mode 100644 package/gcc/5.2.0/908-arm-musl-support.patch
 create mode 100644 package/gcc/5.2.0/909-aarch64-musl-support.patch

diff --git a/package/gcc/5.2.0/100-uclibc-conf.patch b/package/gcc/5.2.0/100-uclibc-conf.patch
new file mode 100644
index 0000000..73d1f0d
--- /dev/null
+++ b/package/gcc/5.2.0/100-uclibc-conf.patch
@@ -0,0 +1,15 @@
+Index: b/contrib/regression/objs-gcc.sh
+===================================================================
+--- a/contrib/regression/objs-gcc.sh
++++ b/contrib/regression/objs-gcc.sh
+@@ -106,6 +106,10 @@
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
diff --git a/package/gcc/5.2.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch b/package/gcc/5.2.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
new file mode 100644
index 0000000..c11ad35
--- /dev/null
+++ b/package/gcc/5.2.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
@@ -0,0 +1,29 @@
+From 9bf6066d588632dab9f78932df15b5b4140f31f3 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Fri, 6 Nov 2015 14:27:23 +0100
+Subject: [PATCH] gcc/config.gcc: fix typo for powerpc e6500 cpu_is_64bit
+
+Otherwise it is not recognized as a 64-bit powerpc and gcc will not generate
+64-bit binaries by default.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gcc/config.gcc | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config.gcc b/gcc/config.gcc
+index 4a7cbd2..9cc765e 100644
+--- a/gcc/config.gcc
++++ b/gcc/config.gcc
+@@ -439,7 +439,7 @@ powerpc*-*-*)
+ 	cpu_type=rs6000
+ 	extra_headers="ppc-asm.h altivec.h spe.h ppu_intrinsics.h paired.h spu2vmx.h vec_types.h si2vmx.h htmintrin.h htmxlintrin.h"
+ 	case x$with_cpu in
+-	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[345678]|xpower6x|xrs64a|xcell|xa2|xe500mc64|xe5500|Xe6500)
++	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[345678]|xpower6x|xrs64a|xcell|xa2|xe500mc64|xe5500|xe6500)
+ 		cpu_is_64bit=yes
+ 		;;
+ 	esac
+-- 
+2.6.2
+
diff --git a/package/gcc/5.2.0/301-missing-execinfo_h.patch b/package/gcc/5.2.0/301-missing-execinfo_h.patch
new file mode 100644
index 0000000..2d0e7ba
--- /dev/null
+++ b/package/gcc/5.2.0/301-missing-execinfo_h.patch
@@ -0,0 +1,13 @@
+Index: b/boehm-gc/include/gc.h
+===================================================================
+--- a/boehm-gc/include/gc.h
++++ b/boehm-gc/include/gc.h
+@@ -503,7 +503,7 @@
+ #if defined(__linux__) || defined(__GLIBC__)
+ # include <features.h>
+ # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
+-     && !defined(__ia64__)
++     && !defined(__ia64__) && !defined(__UCLIBC__)
+ #   ifndef GC_HAVE_BUILTIN_BACKTRACE
+ #     define GC_HAVE_BUILTIN_BACKTRACE
+ #   endif
diff --git a/package/gcc/5.2.0/810-arm-softfloat-libgcc.patch b/package/gcc/5.2.0/810-arm-softfloat-libgcc.patch
new file mode 100644
index 0000000..5efa7fd
--- /dev/null
+++ b/package/gcc/5.2.0/810-arm-softfloat-libgcc.patch
@@ -0,0 +1,30 @@
+Index: b/gcc/config/arm/linux-elf.h
+===================================================================
+--- a/gcc/config/arm/linux-elf.h
++++ b/gcc/config/arm/linux-elf.h
+@@ -60,7 +60,7 @@
+    %{shared:-lc} \
+    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
+ 
+-#define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
++#define LIBGCC_SPEC "-lgcc"
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
+ 
+Index: b/libgcc/config/arm/t-linux
+===================================================================
+--- a/libgcc/config/arm/t-linux
++++ b/libgcc/config/arm/t-linux
+@@ -1,6 +1,11 @@
+ LIB1ASMSRC = arm/lib1funcs.S
+ LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx _clzsi2 _clzdi2 \
+-	_ctzsi2 _arm_addsubdf3 _arm_addsubsf3
++	_ctzsi2 _arm_addsubdf3 _arm_addsubsf3 \
++	_arm_addsubdf3 _arm_addsubsf3 \
++	_arm_negdf2 _arm_muldivdf3 _arm_cmpdf2 _arm_unorddf2 \
++	_arm_fixdfsi _arm_fixunsdfsi _arm_truncdfsf2 \
++	_arm_negsf2 _arm_muldivsf3 _arm_cmpsf2 _arm_unordsf2 \
++	_arm_fixsfsi _arm_fixunssfsi
+ 
+ # Just for these, we omit the frame pointer since it makes such a big
+ # difference.
diff --git a/package/gcc/5.2.0/830-arm_unbreak_armv4t.patch b/package/gcc/5.2.0/830-arm_unbreak_armv4t.patch
new file mode 100644
index 0000000..b730059
--- /dev/null
+++ b/package/gcc/5.2.0/830-arm_unbreak_armv4t.patch
@@ -0,0 +1,15 @@
+http://sourceware.org/ml/crossgcc/2008-05/msg00009.html
+
+Index: b/gcc/config/arm/linux-eabi.h
+===================================================================
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
diff --git a/package/gcc/5.2.0/840-microblaze-enable-dwarf-eh-support.patch b/package/gcc/5.2.0/840-microblaze-enable-dwarf-eh-support.patch
new file mode 100644
index 0000000..9d29090
--- /dev/null
+++ b/package/gcc/5.2.0/840-microblaze-enable-dwarf-eh-support.patch
@@ -0,0 +1,166 @@
+Fetched from Xilinx gcc git at https://github.com/Xilinx/gcc
+
+From 23c35173490ac2d6348a668dfc9c1a6eb62171f2 Mon Sep 17 00:00:00 2001
+From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
+Date: Mon, 18 Jun 2012 20:18:13 +0200
+Subject: [PATCH] [Patch, microblaze]: Enable DWARF exception handling support.
+
+Changelog
+
+2013-03-18  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+            David Holsgrove <david.holsgrove@xilinx.com>
+
+ * common/config/microblaze/microblaze-common.c: Remove
+   TARGET_EXCEPT_UNWIND_INFO definition.
+ * config/microblaze/microblaze-protos.h: Add
+   microblaze_eh_return prototype.
+ * gcc/config/microblaze/microblaze.c: (microblaze_must_save_register,
+   microblaze_expand_epilogue, microblaze_return_addr): Handle
+   calls_eh_return
+   (microblaze_eh_return): New function.
+ * gcc/config/microblaze/microblaze.h: Define RETURN_ADDR_OFFSET,
+   EH_RETURN_DATA_REGNO, MB_EH_STACKADJ_REGNUM, EH_RETURN_STACKADJ_RTX,
+   ASM_PREFERRED_EH_DATA_FORMAT
+ * gcc/config/microblaze/microblaze.md: Define eh_return pattern.
+
+Signed-off-by: David Holsgrove <david.holsgrove@xilinx.com>
+Signed-off-by: Edgar E. Iglesias <edgar.iglesias@gmail.com>
+---
+ gcc/common/config/microblaze/microblaze-common.c |  3 ---
+ gcc/config/microblaze/microblaze-protos.h        |  1 +
+ gcc/config/microblaze/microblaze.c               | 29 ++++++++++++++++++++----
+ gcc/config/microblaze/microblaze.h               | 15 ++++++++++++
+ gcc/config/microblaze/microblaze.md              | 11 +++++++++
+ 5 files changed, 52 insertions(+), 7 deletions(-)
+
+Index: b/gcc/common/config/microblaze/microblaze-common.c
+===================================================================
+--- a/gcc/common/config/microblaze/microblaze-common.c
++++ b/gcc/common/config/microblaze/microblaze-common.c
+@@ -37,7 +37,4 @@
+ #undef  TARGET_OPTION_OPTIMIZATION_TABLE
+ #define TARGET_OPTION_OPTIMIZATION_TABLE microblaze_option_optimization_table
+ 
+-#undef TARGET_EXCEPT_UNWIND_INFO
+-#define TARGET_EXCEPT_UNWIND_INFO  sjlj_except_unwind_info
+-
+ struct gcc_targetm_common targetm_common = TARGETM_COMMON_INITIALIZER;
+Index: b/gcc/config/microblaze/microblaze-protos.h
+===================================================================
+--- a/gcc/config/microblaze/microblaze-protos.h
++++ b/gcc/config/microblaze/microblaze-protos.h
+@@ -56,6 +56,7 @@
+ extern int symbol_mentioned_p (rtx);
+ extern int label_mentioned_p (rtx);
+ extern bool microblaze_cannot_force_const_mem (machine_mode, rtx);
++extern void microblaze_eh_return (rtx op0);
+ #endif  /* RTX_CODE */
+ 
+ /* Declare functions in microblaze-c.c.  */
+Index: b/gcc/config/microblaze/microblaze.c
+===================================================================
+--- a/gcc/config/microblaze/microblaze.c
++++ b/gcc/config/microblaze/microblaze.c
+@@ -1959,6 +1959,11 @@
+   if (frame_pointer_needed && (regno == HARD_FRAME_POINTER_REGNUM))
+     return 1;
+ 
++  if (crtl->calls_eh_return
++      && regno == MB_ABI_SUB_RETURN_ADDR_REGNUM) {
++    return 1;
++  }
++
+   if (!crtl->is_leaf)
+     {
+       if (regno == MB_ABI_SUB_RETURN_ADDR_REGNUM)
+@@ -1986,6 +1991,13 @@
+ 	return 1;
+     }
+ 
++  if (crtl->calls_eh_return
++      && (regno == EH_RETURN_DATA_REGNO (0)
++          || regno == EH_RETURN_DATA_REGNO (1)))
++    {
++      return 1;
++    }
++
+   return 0;
+ }
+ 
+@@ -3067,6 +3079,12 @@
+       emit_insn (gen_addsi3 (stack_pointer_rtx, stack_pointer_rtx, fsiz_rtx));
+     }
+ 
++  if (crtl->calls_eh_return)
++    emit_insn (gen_addsi3 (stack_pointer_rtx,
++                           stack_pointer_rtx,
++                           gen_rtx_raw_REG (SImode,
++                                            MB_EH_STACKADJ_REGNUM)));
++
+   emit_jump_insn (gen_return_internal (gen_rtx_REG (Pmode, GP_REG_FIRST +
+ 						    MB_ABI_SUB_RETURN_ADDR_REGNUM)));
+ }
+@@ -3364,10 +3382,13 @@
+   if (count != 0)
+     return NULL_RTX;
+ 
+-  return gen_rtx_PLUS (Pmode,
+-		       get_hard_reg_initial_val (Pmode,
+-						 MB_ABI_SUB_RETURN_ADDR_REGNUM),
+-		       GEN_INT (8));
++  return get_hard_reg_initial_val (Pmode,
++                                   MB_ABI_SUB_RETURN_ADDR_REGNUM);
++}
++
++void microblaze_eh_return (rtx op0)
++{
++  emit_insn (gen_movsi(gen_rtx_MEM(Pmode, stack_pointer_rtx), op0));
+ }
+ 
+ /* Queue an .ident string in the queue of top-level asm statements.
+Index: b/gcc/config/microblaze/microblaze.h
+===================================================================
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -184,6 +184,21 @@
+ #define INCOMING_RETURN_ADDR_RTX  			\
+   gen_rtx_REG (VOIDmode, GP_REG_FIRST + MB_ABI_SUB_RETURN_ADDR_REGNUM)
+ 
++/* Specifies the offset from INCOMING_RETURN_ADDR_RTX and the actual return PC.  */
++#define RETURN_ADDR_OFFSET (8)
++
++/* Describe how we implement __builtin_eh_return.  */
++#define EH_RETURN_DATA_REGNO(N) (((N) < 2) ? MB_ABI_FIRST_ARG_REGNUM + (N) : INVALID_REGNUM)
++
++#define MB_EH_STACKADJ_REGNUM  MB_ABI_INT_RETURN_VAL2_REGNUM
++#define EH_RETURN_STACKADJ_RTX  gen_rtx_REG (Pmode, MB_EH_STACKADJ_REGNUM)
++
++/* Select a format to encode pointers in exception handling data.  CODE
++   is 0 for data, 1 for code labels, 2 for function pointers.  GLOBAL is
++   true if the symbol may be affected by dynamic relocations.  */
++#define ASM_PREFERRED_EH_DATA_FORMAT(CODE,GLOBAL) \
++  ((flag_pic || GLOBAL) ? DW_EH_PE_aligned : DW_EH_PE_absptr)
++
+ /* Use DWARF 2 debugging information by default.  */
+ #define DWARF2_DEBUGGING_INFO
+ #define PREFERRED_DEBUGGING_TYPE DWARF2_DEBUG
+Index: b/gcc/config/microblaze/microblaze.md
+===================================================================
+--- a/gcc/config/microblaze/microblaze.md
++++ b/gcc/config/microblaze/microblaze.md
+@@ -2272,4 +2272,15 @@
+   (set_attr "mode"      "SI")
+   (set_attr "length"    "4")])
+ 
++; This is used in compiling the unwind routines.
++(define_expand "eh_return"
++  [(use (match_operand 0 "general_operand" ""))]
++  ""
++  "
++{
++  microblaze_eh_return(operands[0]);
++  DONE;
++}")
++
+ (include "sync.md")
++
diff --git a/package/gcc/5.2.0/850-libstdcxx-uclibc-c99.patch b/package/gcc/5.2.0/850-libstdcxx-uclibc-c99.patch
new file mode 100644
index 0000000..9e97d94
--- /dev/null
+++ b/package/gcc/5.2.0/850-libstdcxx-uclibc-c99.patch
@@ -0,0 +1,273 @@
+Allow C99-depending features of libstdc++ with uClibc
+
+The libstdc++ code is fairly restrictive on how it checks for C99
+compatibility: it requires *complete* C99 support to enable certain
+features. For example, uClibc provides a good number of C99 features,
+but not C99 complex number support. For this reason, libstdc++
+completely disables many the standard C++ methods that can in fact
+work because uClibc provides the necessary functions.
+
+This patch is similar and highly inspired from
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58393, but implemented in
+a way that doesn't involve changing the configure.ac script, as
+autoreconfiguring gcc is complicated. It simply relies on the fact
+that uClibc defines the __UCLIBC__ definition.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/libstdc++-v3/config/locale/generic/c_locale.h
+===================================================================
+--- a/libstdc++-v3/config/locale/generic/c_locale.h
++++ b/libstdc++-v3/config/locale/generic/c_locale.h
+@@ -70,7 +70,7 @@
+     __builtin_va_list __args;
+     __builtin_va_start(__args, __fmt);
+ 
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
+ #else
+     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
+Index: b/libstdc++-v3/config/locale/gnu/c_locale.h
+===================================================================
+--- a/libstdc++-v3/config/locale/gnu/c_locale.h
++++ b/libstdc++-v3/config/locale/gnu/c_locale.h
+@@ -88,7 +88,7 @@
+     __builtin_va_list __args;
+     __builtin_va_start(__args, __fmt);
+ 
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
+ #else
+     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
+Index: b/libstdc++-v3/include/bits/basic_string.h
+===================================================================
+--- a/libstdc++-v3/include/bits/basic_string.h
++++ b/libstdc++-v3/include/bits/basic_string.h
+@@ -5239,7 +5239,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if __cplusplus >= 201103L && defined(_GLIBCXX_USE_C99)
++#if __cplusplus >= 201103L && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__))
+ 
+ #include <ext/string_conversions.h>
+ 
+Index: b/libstdc++-v3/include/bits/locale_facets.tcc
+===================================================================
+--- a/libstdc++-v3/include/bits/locale_facets.tcc
++++ b/libstdc++-v3/include/bits/locale_facets.tcc
+@@ -992,7 +992,7 @@
+ 	char __fbuf[16];
+ 	__num_base::_S_format_float(__io, __fbuf, __mod);
+ 
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 	// Precision is always used except for hexfloat format.
+ 	const bool __use_prec =
+ 	  (__io.flags() & ios_base::floatfield) != ios_base::floatfield;
+Index: b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
+===================================================================
+--- a/libstdc++-v3/include/bits/locale_facets_nonio.tcc
++++ b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
+@@ -578,7 +578,7 @@
+     {
+       const locale __loc = __io.getloc();
+       const ctype<_CharT>& __ctype = use_facet<ctype<_CharT> >(__loc);
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+       // First try a buffer perhaps big enough.
+       int __cs_size = 64;
+       char* __cs = static_cast<char*>(__builtin_alloca(__cs_size));
+Index: b/libstdc++-v3/include/c_compatibility/math.h
+===================================================================
+--- a/libstdc++-v3/include/c_compatibility/math.h
++++ b/libstdc++-v3/include/c_compatibility/math.h
+@@ -56,7 +56,7 @@
+ using std::floor;
+ using std::fmod;
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ using std::fpclassify;
+ using std::isfinite;
+ using std::isinf;
+Index: b/libstdc++-v3/include/c_compatibility/wchar.h
+===================================================================
+--- a/libstdc++-v3/include/c_compatibility/wchar.h
++++ b/libstdc++-v3/include/c_compatibility/wchar.h
+@@ -103,7 +103,7 @@
+ using std::wmemset;
+ using std::wcsftime;
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ using std::wcstold;
+ using std::wcstoll;
+ using std::wcstoull;
+Index: b/libstdc++-v3/include/c_global/cstdlib
+===================================================================
+--- a/libstdc++-v3/include/c_global/cstdlib
++++ b/libstdc++-v3/include/c_global/cstdlib
+@@ -195,7 +195,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef _Exit
+ #undef llabs
+Index: b/libstdc++-v3/include/c_global/cwchar
+===================================================================
+--- a/libstdc++-v3/include/c_global/cwchar
++++ b/libstdc++-v3/include/c_global/cwchar
+@@ -232,7 +232,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef wcstold
+ #undef wcstoll
+@@ -289,7 +289,7 @@
+   using std::vwscanf;
+ #endif
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+   using std::wcstold;
+   using std::wcstoll;
+   using std::wcstoull;
+Index: b/libstdc++-v3/include/c_std/cstdio
+===================================================================
+--- a/libstdc++-v3/include/c_std/cstdio
++++ b/libstdc++-v3/include/c_std/cstdio
+@@ -144,7 +144,7 @@
+   using ::vsprintf;
+ } // namespace std
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef snprintf
+ #undef vfscanf
+Index: b/libstdc++-v3/include/c_std/cstdlib
+===================================================================
+--- a/libstdc++-v3/include/c_std/cstdlib
++++ b/libstdc++-v3/include/c_std/cstdlib
+@@ -192,7 +192,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef _Exit
+ #undef llabs
+Index: b/libstdc++-v3/include/c_std/cwchar
+===================================================================
+--- a/libstdc++-v3/include/c_std/cwchar
++++ b/libstdc++-v3/include/c_std/cwchar
+@@ -228,7 +228,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef wcstold
+ #undef wcstoll
+Index: b/libstdc++-v3/include/ext/vstring.h
+===================================================================
+--- a/libstdc++-v3/include/ext/vstring.h
++++ b/libstdc++-v3/include/ext/vstring.h
+@@ -2680,7 +2680,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if ((__cplusplus >= 201103L) && defined(_GLIBCXX_USE_C99))
++#if ((__cplusplus >= 201103L) && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)))
+ 
+ #include <ext/string_conversions.h>
+ 
+Index: b/libstdc++-v3/include/tr1/cstdio
+===================================================================
+--- a/libstdc++-v3/include/tr1/cstdio
++++ b/libstdc++-v3/include/tr1/cstdio
+@@ -33,7 +33,7 @@
+ 
+ #include <cstdio>
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ namespace std _GLIBCXX_VISIBILITY(default)
+ {
+Index: b/libstdc++-v3/include/tr1/cstdlib
+===================================================================
+--- a/libstdc++-v3/include/tr1/cstdlib
++++ b/libstdc++-v3/include/tr1/cstdlib
+@@ -35,7 +35,7 @@
+ 
+ #if _GLIBCXX_HOSTED
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ namespace std _GLIBCXX_VISIBILITY(default)
+ {
+Index: b/libstdc++-v3/include/tr1/cwchar
+===================================================================
+--- a/libstdc++-v3/include/tr1/cwchar
++++ b/libstdc++-v3/include/tr1/cwchar
+@@ -52,7 +52,7 @@
+   using std::vwscanf;
+ #endif
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+   using std::wcstold;
+   using std::wcstoll;
+   using std::wcstoull;
+Index: b/libstdc++-v3/include/tr1/stdlib.h
+===================================================================
+--- a/libstdc++-v3/include/tr1/stdlib.h
++++ b/libstdc++-v3/include/tr1/stdlib.h
+@@ -33,7 +33,7 @@
+ 
+ #if _GLIBCXX_HOSTED
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ using std::tr1::atoll;
+ using std::tr1::strtoll;
+Index: b/libstdc++-v3/src/c++11/debug.cc
+===================================================================
+--- a/libstdc++-v3/src/c++11/debug.cc
++++ b/libstdc++-v3/src/c++11/debug.cc
+@@ -788,7 +788,7 @@
+ 				     int __n __attribute__ ((__unused__)), 
+ 				     const char* __fmt, _Tp __s) const throw ()
+     {
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+       std::snprintf(__buf, __n, __fmt, __s);
+ #else
+       std::sprintf(__buf, __fmt, __s);
+Index: b/libstdc++-v3/include/c_global/cstdio
+===================================================================
+--- a/libstdc++-v3/include/c_global/cstdio
++++ b/libstdc++-v3/include/c_global/cstdio
+@@ -146,7 +146,7 @@
+   using ::vsprintf;
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef snprintf
+ #undef vfscanf
diff --git a/package/gcc/5.2.0/860-cilk-wchar.patch b/package/gcc/5.2.0/860-cilk-wchar.patch
new file mode 100644
index 0000000..1d9916f
--- /dev/null
+++ b/package/gcc/5.2.0/860-cilk-wchar.patch
@@ -0,0 +1,56 @@
+[PATCH] cilk: fix build without wchar
+
+When building against uClibc with wchar support disabled, WCHAR_MIN and
+WCHAR_MAX are not defined leading to compilation errors.
+
+Fix it by only including the wchar code if available.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ libcilkrts/include/cilk/reducer_min_max.h |    8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+Index: b/libcilkrts/include/cilk/reducer_min_max.h
+===================================================================
+--- a/libcilkrts/include/cilk/reducer_min_max.h
++++ b/libcilkrts/include/cilk/reducer_min_max.h
+@@ -3154,7 +3154,9 @@
+ CILK_C_REDUCER_MAX_INSTANCE(char,               char,       CHAR_MIN)
+ CILK_C_REDUCER_MAX_INSTANCE(unsigned char,      uchar,      0)
+ CILK_C_REDUCER_MAX_INSTANCE(signed char,        schar,      SCHAR_MIN)
++#ifdef WCHAR_MIN
+ CILK_C_REDUCER_MAX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
++#endif
+ CILK_C_REDUCER_MAX_INSTANCE(short,              short,      SHRT_MIN)
+ CILK_C_REDUCER_MAX_INSTANCE(unsigned short,     ushort,     0)
+ CILK_C_REDUCER_MAX_INSTANCE(int,                int,        INT_MIN)
+@@ -3306,7 +3308,9 @@
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(char,               char,       CHAR_MIN)
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned char,      uchar,      0)
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(signed char,        schar,      SCHAR_MIN)
++#ifdef WCHAR_MIN
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
++#endif
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(short,              short,      SHRT_MIN)
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned short,     ushort,     0)
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(int,                int,        INT_MIN)
+@@ -3432,7 +3436,9 @@
+ CILK_C_REDUCER_MIN_INSTANCE(char,               char,       CHAR_MAX)
+ CILK_C_REDUCER_MIN_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
+ CILK_C_REDUCER_MIN_INSTANCE(signed char,        schar,      SCHAR_MAX)
++#ifdef WCHAR_MAX
+ CILK_C_REDUCER_MIN_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
++#endif
+ CILK_C_REDUCER_MIN_INSTANCE(short,              short,      SHRT_MAX)
+ CILK_C_REDUCER_MIN_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
+ CILK_C_REDUCER_MIN_INSTANCE(int,                int,        INT_MAX)
+@@ -3584,7 +3590,9 @@
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(char,               char,       CHAR_MAX)
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(signed char,        schar,      SCHAR_MAX)
++#ifdef WCHAR_MAX
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
++#endif
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(short,              short,      SHRT_MAX)
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(int,                int,        INT_MAX)
diff --git a/package/gcc/5.2.0/870-xtensa-add-mauto-litpools-option.patch b/package/gcc/5.2.0/870-xtensa-add-mauto-litpools-option.patch
new file mode 100644
index 0000000..aa1376c
--- /dev/null
+++ b/package/gcc/5.2.0/870-xtensa-add-mauto-litpools-option.patch
@@ -0,0 +1,290 @@
+From 6d852ffb43b111a39162135c95249e749c4e285b Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Thu, 6 Aug 2015 01:16:02 +0300
+Subject: [PATCH] xtensa: add -mauto-litpools option
+
+With support from assembler this option allows compiling huge functions,
+where single literal pool at the beginning of a function may not be
+reachable by L32R instructions at its end.
+
+Currently assembler --auto-litpools option cannot deal with literals
+used from multiple locations separated by more than 256 KBytes of code.
+Don't turn constants into literals, instead use MOVI instruction to load
+them into registers and let the assembler turn them into literals as
+necessary.
+
+2015-08-12  Max Filippov  <jcmvbkbc@gmail.com>
+gcc/
+	* config/xtensa/constraints.md (define_constraint "Y"): New
+	constraint.
+	* config/xtensa/elf.h (ASM_SPEC): Add m(no-)auto-litpools.
+	* config/xtensa/linux.h (ASM_SPEC): Likewise.
+	* config/xtensa/predicates.md (move_operand): Match constants
+	and symbols in the presence of TARGET_AUTO_LITPOOLS.
+	* config/xtensa/xtensa.c (xtensa_valid_move): Don't allow
+	immediate references to TLS data.
+	(xtensa_emit_move_sequence): Don't force constants to memory in
+	the presence of TARGET_AUTO_LITPOOLS.
+	(print_operand): Add 'y' format, same as default, but capable of
+	printing SF mode constants as well.
+	* config/xtensa/xtensa.md (movsi_internal, movhi_internal)
+	(movsf_internal): Add movi pattern that loads literal.
+	(movsf, movdf): Don't force constants to memory in the presence
+	of TARGET_AUTO_LITPOOLS.
+	(movdf_internal): Add 'Y' constraint.
+	* config/xtensa/xtensa.opt (mauto-litpools): New option.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r226828
+Changes to ChangeLogs and documentation are dropped.
+
+ gcc/config/xtensa/constraints.md |  5 +++++
+ gcc/config/xtensa/elf.h          |  4 +++-
+ gcc/config/xtensa/linux.h        |  4 +++-
+ gcc/config/xtensa/predicates.md  |  3 ++-
+ gcc/config/xtensa/xtensa.c       | 19 ++++++++++++++++++-
+ gcc/config/xtensa/xtensa.md      | 35 +++++++++++++++++++----------------
+ gcc/config/xtensa/xtensa.opt     |  4 ++++
+ 7 files changed, 54 insertions(+), 20 deletions(-)
+
+diff --git a/gcc/config/xtensa/constraints.md b/gcc/config/xtensa/constraints.md
+index 30f4c1f..773d4f9 100644
+--- a/gcc/config/xtensa/constraints.md
++++ b/gcc/config/xtensa/constraints.md
+@@ -111,6 +111,11 @@
+  (and (match_code "const_int")
+       (match_test "xtensa_mask_immediate (ival)")))
+ 
++(define_constraint "Y"
++ "A constant that can be used in relaxed MOVI instructions."
++ (and (match_code "const_int,const_double,const,symbol_ref,label_ref")
++      (match_test "TARGET_AUTO_LITPOOLS")))
++
+ ;; Memory constraints.  Do not use define_memory_constraint here.  Doing so
+ ;; causes reload to force some constants into the constant pool, but since
+ ;; the Xtensa constant pool can only be accessed with L32R instructions, it
+diff --git a/gcc/config/xtensa/elf.h b/gcc/config/xtensa/elf.h
+index e59bede..12056f7 100644
+--- a/gcc/config/xtensa/elf.h
++++ b/gcc/config/xtensa/elf.h
+@@ -48,7 +48,9 @@ along with GCC; see the file COPYING3.  If not see
+   %{mtarget-align:--target-align} \
+   %{mno-target-align:--no-target-align} \
+   %{mlongcalls:--longcalls} \
+-  %{mno-longcalls:--no-longcalls}"
++  %{mno-longcalls:--no-longcalls} \
++  %{mauto-litpools:--auto-litpools} \
++  %{mno-auto-litpools:--no-auto-litpools}"
+ 
+ #undef LIB_SPEC
+ #define LIB_SPEC "-lc -lsim -lc -lhandlers-sim -lhal"
+diff --git a/gcc/config/xtensa/linux.h b/gcc/config/xtensa/linux.h
+index 675aacf..5b0243a 100644
+--- a/gcc/config/xtensa/linux.h
++++ b/gcc/config/xtensa/linux.h
+@@ -42,7 +42,9 @@ along with GCC; see the file COPYING3.  If not see
+   %{mtarget-align:--target-align} \
+   %{mno-target-align:--no-target-align} \
+   %{mlongcalls:--longcalls} \
+-  %{mno-longcalls:--no-longcalls}"
++  %{mno-longcalls:--no-longcalls} \
++  %{mauto-litpools:--auto-litpools} \
++  %{mno-auto-litpools:--no-auto-litpools}"
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
+ 
+diff --git a/gcc/config/xtensa/predicates.md b/gcc/config/xtensa/predicates.md
+index e02209e..d7dfa11 100644
+--- a/gcc/config/xtensa/predicates.md
++++ b/gcc/config/xtensa/predicates.md
+@@ -142,7 +142,8 @@
+ 	       (match_test "GET_MODE_CLASS (mode) == MODE_INT
+ 			    && xtensa_simm12b (INTVAL (op))"))
+ 	  (and (match_code "const_int,const_double,const,symbol_ref,label_ref")
+-	       (match_test "TARGET_CONST16 && CONSTANT_P (op)
++	       (match_test "(TARGET_CONST16 || TARGET_AUTO_LITPOOLS)
++			    && CONSTANT_P (op)
+ 			    && GET_MODE_SIZE (mode) % UNITS_PER_WORD == 0")))))
+ 
+ ;; Accept the floating point constant 1 in the appropriate mode.
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index eb039ba..206ff80 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -501,6 +501,9 @@ xtensa_valid_move (machine_mode mode, rtx *operands)
+     {
+       int dst_regnum = xt_true_regnum (operands[0]);
+ 
++      if (xtensa_tls_referenced_p (operands[1]))
++	return FALSE;
++
+       /* The stack pointer can only be assigned with a MOVSP opcode.  */
+       if (dst_regnum == STACK_POINTER_REGNUM)
+ 	return !TARGET_WINDOWED_ABI
+@@ -1069,7 +1072,7 @@ xtensa_emit_move_sequence (rtx *operands, machine_mode mode)
+ 	  return 1;
+ 	}
+ 
+-      if (! TARGET_CONST16)
++      if (! TARGET_AUTO_LITPOOLS && ! TARGET_CONST16)
+ 	{
+ 	  src = force_const_mem (SImode, src);
+ 	  operands[1] = src;
+@@ -2449,6 +2452,20 @@ print_operand (FILE *file, rtx x, int letter)
+ 	}
+       break;
+ 
++    case 'y':
++      if (GET_CODE (x) == CONST_DOUBLE &&
++	  GET_MODE (x) == SFmode)
++	{
++	  REAL_VALUE_TYPE r;
++	  long l;
++	  REAL_VALUE_FROM_CONST_DOUBLE (r, x);
++	  REAL_VALUE_TO_TARGET_SINGLE (r, l);
++	  fprintf (file, "0x%08lx", l);
++	  break;
++	}
++
++      /* fall through */
++
+     default:
+       if (GET_CODE (x) == REG || GET_CODE (x) == SUBREG)
+ 	fprintf (file, "%s", reg_names[xt_true_regnum (x)]);
+diff --git a/gcc/config/xtensa/xtensa.md b/gcc/config/xtensa/xtensa.md
+index 6d84384..0e673a3 100644
+--- a/gcc/config/xtensa/xtensa.md
++++ b/gcc/config/xtensa/xtensa.md
+@@ -761,8 +761,8 @@
+ })
+ 
+ (define_insn "movsi_internal"
+-  [(set (match_operand:SI 0 "nonimmed_operand" "=D,D,D,D,R,R,a,q,a,W,a,a,U,*a,*A")
+-	(match_operand:SI 1 "move_operand" "M,D,d,R,D,d,r,r,I,i,T,U,r,*A,*r"))]
++  [(set (match_operand:SI 0 "nonimmed_operand" "=D,D,D,D,R,R,a,q,a,a,W,a,a,U,*a,*A")
++	(match_operand:SI 1 "move_operand" "M,D,d,R,D,d,r,r,I,Y,i,T,U,r,*A,*r"))]
+   "xtensa_valid_move (SImode, operands)"
+   "@
+    movi.n\t%0, %x1
+@@ -774,15 +774,16 @@
+    mov\t%0, %1
+    movsp\t%0, %1
+    movi\t%0, %x1
++   movi\t%0, %1
+    const16\t%0, %t1\;const16\t%0, %b1
+    %v1l32r\t%0, %1
+    %v1l32i\t%0, %1
+    %v0s32i\t%1, %0
+    rsr\t%0, ACCLO
+    wsr\t%1, ACCLO"
+-  [(set_attr "type" "move,move,move,load,store,store,move,move,move,move,load,load,store,rsr,wsr")
++  [(set_attr "type" "move,move,move,load,store,store,move,move,move,move,move,load,load,store,rsr,wsr")
+    (set_attr "mode"	"SI")
+-   (set_attr "length"	"2,2,2,2,2,2,3,3,3,6,3,3,3,3,3")])
++   (set_attr "length"	"2,2,2,2,2,2,3,3,3,3,6,3,3,3,3,3")])
+ 
+ ;; 16-bit Integer moves
+ 
+@@ -796,21 +797,22 @@
+ })
+ 
+ (define_insn "movhi_internal"
+-  [(set (match_operand:HI 0 "nonimmed_operand" "=D,D,a,a,a,U,*a,*A")
+-	(match_operand:HI 1 "move_operand" "M,d,r,I,U,r,*A,*r"))]
++  [(set (match_operand:HI 0 "nonimmed_operand" "=D,D,a,a,a,a,U,*a,*A")
++	(match_operand:HI 1 "move_operand" "M,d,r,I,Y,U,r,*A,*r"))]
+   "xtensa_valid_move (HImode, operands)"
+   "@
+    movi.n\t%0, %x1
+    mov.n\t%0, %1
+    mov\t%0, %1
+    movi\t%0, %x1
++   movi\t%0, %1
+    %v1l16ui\t%0, %1
+    %v0s16i\t%1, %0
+    rsr\t%0, ACCLO
+    wsr\t%1, ACCLO"
+-  [(set_attr "type"	"move,move,move,move,load,store,rsr,wsr")
++  [(set_attr "type"	"move,move,move,move,move,load,store,rsr,wsr")
+    (set_attr "mode"	"HI")
+-   (set_attr "length"	"2,2,3,3,3,3,3,3")])
++   (set_attr "length"	"2,2,3,3,3,3,3,3,3")])
+ 
+ ;; 8-bit Integer moves
+ 
+@@ -881,7 +883,7 @@
+ 	(match_operand:SF 1 "general_operand" ""))]
+   ""
+ {
+-  if (!TARGET_CONST16 && CONSTANT_P (operands[1]))
++  if (!TARGET_CONST16 && !TARGET_AUTO_LITPOOLS && CONSTANT_P (operands[1]))
+     operands[1] = force_const_mem (SFmode, operands[1]);
+ 
+   if ((!register_operand (operands[0], SFmode)
+@@ -896,8 +898,8 @@
+ })
+ 
+ (define_insn "movsf_internal"
+-  [(set (match_operand:SF 0 "nonimmed_operand" "=f,f,U,D,D,R,a,f,a,W,a,a,U")
+-	(match_operand:SF 1 "move_operand" "f,U,f,d,R,d,r,r,f,iF,T,U,r"))]
++  [(set (match_operand:SF 0 "nonimmed_operand" "=f,f,U,D,D,R,a,f,a,a,W,a,a,U")
++	(match_operand:SF 1 "move_operand" "f,U,f,d,R,d,r,r,f,Y,iF,T,U,r"))]
+   "((register_operand (operands[0], SFmode)
+      || register_operand (operands[1], SFmode))
+     && !(FP_REG_P (xt_true_regnum (operands[0]))
+@@ -912,13 +914,14 @@
+    mov\t%0, %1
+    wfr\t%0, %1
+    rfr\t%0, %1
++   movi\t%0, %y1
+    const16\t%0, %t1\;const16\t%0, %b1
+    %v1l32r\t%0, %1
+    %v1l32i\t%0, %1
+    %v0s32i\t%1, %0"
+-  [(set_attr "type"	"farith,fload,fstore,move,load,store,move,farith,farith,move,load,load,store")
++  [(set_attr "type"	"farith,fload,fstore,move,load,store,move,farith,farith,move,move,load,load,store")
+    (set_attr "mode"	"SF")
+-   (set_attr "length"	"3,3,3,2,2,2,3,3,3,6,3,3,3")])
++   (set_attr "length"	"3,3,3,2,2,2,3,3,3,3,6,3,3,3")])
+ 
+ (define_insn "*lsiu"
+   [(set (match_operand:SF 0 "register_operand" "=f")
+@@ -991,7 +994,7 @@
+ 	(match_operand:DF 1 "general_operand" ""))]
+   ""
+ {
+-  if (CONSTANT_P (operands[1]) && !TARGET_CONST16)
++  if (CONSTANT_P (operands[1]) && !TARGET_CONST16 && !TARGET_AUTO_LITPOOLS)
+     operands[1] = force_const_mem (DFmode, operands[1]);
+ 
+   if (!register_operand (operands[0], DFmode)
+@@ -1002,8 +1005,8 @@
+ })
+ 
+ (define_insn_and_split "movdf_internal"
+-  [(set (match_operand:DF 0 "nonimmed_operand" "=a,W,a,a,U")
+-	(match_operand:DF 1 "move_operand" "r,iF,T,U,r"))]
++  [(set (match_operand:DF 0 "nonimmed_operand" "=a,a,W,a,a,U")
++	(match_operand:DF 1 "move_operand" "r,Y,iF,T,U,r"))]
+   "register_operand (operands[0], DFmode)
+    || register_operand (operands[1], DFmode)"
+   "#"
+diff --git a/gcc/config/xtensa/xtensa.opt b/gcc/config/xtensa/xtensa.opt
+index 2fd6cee..21c6e96 100644
+--- a/gcc/config/xtensa/xtensa.opt
++++ b/gcc/config/xtensa/xtensa.opt
+@@ -38,6 +38,10 @@ mtext-section-literals
+ Target
+ Intersperse literal pools with code in the text section
+ 
++mauto-litpools
++Target Report Mask(AUTO_LITPOOLS)
++Relax literals in assembler and place them automatically in the text section
++
+ mserialize-volatile
+ Target Report Mask(SERIALIZE_VOLATILE)
+ -mno-serialize-volatile	Do not serialize volatile memory references with MEMW instructions
+-- 
+1.8.1.4
+
diff --git a/package/gcc/5.2.0/871-xtensa-reimplement-register-spilling.patch b/package/gcc/5.2.0/871-xtensa-reimplement-register-spilling.patch
new file mode 100644
index 0000000..4056f8b
--- /dev/null
+++ b/package/gcc/5.2.0/871-xtensa-reimplement-register-spilling.patch
@@ -0,0 +1,76 @@
+From 40507bf199440082ed69b777986d50c31efe2520 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Mon, 10 Aug 2015 21:35:20 +0300
+Subject: [PATCH 1/3] xtensa: reimplement register spilling
+
+Spilling windowed registers in userspace is much easier, more portable,
+less error-prone and equally effective as in kernel. Now that register
+spilling syscall is considered obsolete in the xtensa linux kernel
+replace it with CALL12 followed by series of ENTRY in libgcc.
+
+2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
+libgcc/
+	* config/xtensa/lib2funcs.S (__xtensa_libgcc_window_spill): Use
+	CALL12 followed by series of ENTRY to spill windowed registers.
+	(__xtensa_nonlocal_goto): Call __xtensa_libgcc_window_spill
+	instead of making linux spill syscall.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r226962
+
+ libgcc/config/xtensa/lib2funcs.S | 30 +++++++++++++++++++++++-------
+ 1 file changed, 23 insertions(+), 7 deletions(-)
+
+diff --git a/libgcc/config/xtensa/lib2funcs.S b/libgcc/config/xtensa/lib2funcs.S
+index 4d451c8..ef0703f 100644
+--- a/libgcc/config/xtensa/lib2funcs.S
++++ b/libgcc/config/xtensa/lib2funcs.S
+@@ -34,10 +34,29 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ 	.global	__xtensa_libgcc_window_spill
+ 	.type	__xtensa_libgcc_window_spill, at function
+ __xtensa_libgcc_window_spill:
+-	entry	sp, 32
+-	movi	a2, 0
+-	syscall
++	entry	sp, 48
++#if XCHAL_NUM_AREGS > 16
++	call12	1f
++	retw
++	.align	4
++1:
++	.rept	(XCHAL_NUM_AREGS - 24) / 12
++	_entry	sp, 48
++	mov	a12, a0
++	.endr
++	_entry	sp, 16
++#if XCHAL_NUM_AREGS % 12 == 0
++	mov	a4, a4
++#elif XCHAL_NUM_AREGS % 12 == 4
++	mov	a8, a8
++#elif XCHAL_NUM_AREGS % 12 == 8
++	mov	a12, a12
++#endif
+ 	retw
++#else
++	mov	a8, a8
++	retw
++#endif
+ 	.size	__xtensa_libgcc_window_spill, .-__xtensa_libgcc_window_spill
+ #endif
+ 
+@@ -61,10 +80,7 @@ __xtensa_nonlocal_goto:
+ 	entry	sp, 32
+ 
+ 	/* Flush registers.  */
+-	mov	a5, a2
+-	movi	a2, 0
+-	syscall
+-	mov	a2, a5
++	call8	__xtensa_libgcc_window_spill
+ 
+ 	/* Because the save area for a0-a3 is stored one frame below
+ 	   the one identified by a2, the only way to restore those
+-- 
+1.8.1.4
+
diff --git a/package/gcc/5.2.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch b/package/gcc/5.2.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
new file mode 100644
index 0000000..9707f68
--- /dev/null
+++ b/package/gcc/5.2.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
@@ -0,0 +1,31 @@
+From 7d7a85f75ba218df4a4226e95865fc8fa561cb86 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Fri, 14 Aug 2015 02:45:02 +0300
+Subject: [PATCH 2/3] xtensa: use unwind-dw2-fde-dip instead of unwind-dw2-fde
+
+This allows having exception cleanup code in binaries that don't
+register their unwind tables.
+
+2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
+libgcc/
+	* config/xtensa/t-windowed (LIB2ADDEH): Replace unwind-dw2-fde
+	with unwind-dw2-fde-dip.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r226963
+
+ libgcc/config/xtensa/t-windowed | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgcc/config/xtensa/t-windowed b/libgcc/config/xtensa/t-windowed
+index 7d9e9db..a99156c 100644
+--- a/libgcc/config/xtensa/t-windowed
++++ b/libgcc/config/xtensa/t-windowed
+@@ -1,2 +1,2 @@
+ LIB2ADDEH = $(srcdir)/config/xtensa/unwind-dw2-xtensa.c \
+-   $(srcdir)/unwind-dw2-fde.c $(srcdir)/unwind-sjlj.c $(srcdir)/unwind-c.c
++   $(srcdir)/unwind-dw2-fde-dip.c $(srcdir)/unwind-sjlj.c $(srcdir)/unwind-c.c
+-- 
+1.8.1.4
+
diff --git a/package/gcc/5.2.0/873-xtensa-fix-_Unwind_GetCFA.patch b/package/gcc/5.2.0/873-xtensa-fix-_Unwind_GetCFA.patch
new file mode 100644
index 0000000..2d8eb7c
--- /dev/null
+++ b/package/gcc/5.2.0/873-xtensa-fix-_Unwind_GetCFA.patch
@@ -0,0 +1,40 @@
+From b33905dc310f475ddbde4c9fb7230724b2068a2b Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sat, 15 Aug 2015 05:12:11 +0300
+Subject: [PATCH 3/3] xtensa: fix _Unwind_GetCFA
+
+Returning context->cfa in _Unwind_GetCFA makes CFA point one stack frame
+higher than what was actually used by code at context->ra. This results
+in invalid CFA value in signal frames and premature unwinding completion
+in forced unwinding used by uClibc NPTL thread cancellation.
+Returning context->sp from _Unwind_GetCFA makes all CFA values valid and
+matching code that used them.
+
+2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
+libgcc/
+	* config/xtensa/unwind-dw2-xtensa.c (_Unwind_GetCFA): Return
+	context->sp instead of context->cfa.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r226964
+
+ libgcc/config/xtensa/unwind-dw2-xtensa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgcc/config/xtensa/unwind-dw2-xtensa.c b/libgcc/config/xtensa/unwind-dw2-xtensa.c
+index 82b0e63..8e579c7 100644
+--- a/libgcc/config/xtensa/unwind-dw2-xtensa.c
++++ b/libgcc/config/xtensa/unwind-dw2-xtensa.c
+@@ -130,7 +130,7 @@ _Unwind_GetGR (struct _Unwind_Context *context, int index)
+ _Unwind_Word
+ _Unwind_GetCFA (struct _Unwind_Context *context)
+ {
+-  return (_Unwind_Ptr) context->cfa;
++  return (_Unwind_Ptr) context->sp;
+ }
+ 
+ /* Overwrite the saved value for register INDEX in CONTEXT with VAL.  */
+-- 
+1.8.1.4
+
diff --git a/package/gcc/5.2.0/900-libitm-fixes-for-musl-support.patch b/package/gcc/5.2.0/900-libitm-fixes-for-musl-support.patch
new file mode 100644
index 0000000..fdf4ee7
--- /dev/null
+++ b/package/gcc/5.2.0/900-libitm-fixes-for-musl-support.patch
@@ -0,0 +1,65 @@
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 22 Apr 2015 14:11:25 +0000 (+0000)
+Subject: libitm fixes for musl support
+X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=e53a4d49c3d03ab8eaddb073cf972c1c46d75338
+
+libitm fixes for musl support
+
+On behalf of Szabolcs.Nagy at arm.com
+
+2015-04-22  Gregor Richards  <gregor.richards@uwaterloo.ca>
+
+       * config/arm/hwcap.cc: Use fcntl.h instead of sys/fcntl.h.
+       * config/linux/x86/tls.h: Only use __GLIBC_PREREQ if defined.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 222325 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+
+Index: b/libitm/config/arm/hwcap.cc
+===================================================================
+--- a/libitm/config/arm/hwcap.cc
++++ b/libitm/config/arm/hwcap.cc
+@@ -40,7 +40,7 @@
+ 
+ #ifdef __linux__
+ #include <unistd.h>
+-#include <sys/fcntl.h>
++#include <fcntl.h>
+ #include <elf.h>
+ 
+ static void __attribute__((constructor))
+Index: b/libitm/config/linux/x86/tls.h
+===================================================================
+--- a/libitm/config/linux/x86/tls.h
++++ b/libitm/config/linux/x86/tls.h
+@@ -25,16 +25,19 @@
+ #ifndef LIBITM_X86_TLS_H
+ #define LIBITM_X86_TLS_H 1
+ 
+-#if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 10)
++#if defined(__GLIBC_PREREQ)
++#if __GLIBC_PREREQ(2, 10)
+ /* Use slots in the TCB head rather than __thread lookups.
+    GLIBC has reserved words 10 through 13 for TM.  */
+ #define HAVE_ARCH_GTM_THREAD 1
+ #define HAVE_ARCH_GTM_THREAD_DISP 1
+ #endif
++#endif
+ 
+ #include "config/generic/tls.h"
+ 
+-#if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 10)
++#if defined(__GLIBC_PREREQ)
++#if __GLIBC_PREREQ(2, 10)
+ namespace GTM HIDDEN {
+ 
+ #ifdef __x86_64__
+@@ -101,5 +104,6 @@
+ 
+ } // namespace GTM
+ #endif /* >= GLIBC 2.10 */
++#endif
+ 
+ #endif // LIBITM_X86_TLS_H
diff --git a/package/gcc/5.2.0/901-fixincludes-update-for-musl-support.patch b/package/gcc/5.2.0/901-fixincludes-update-for-musl-support.patch
new file mode 100644
index 0000000..13c08d6
--- /dev/null
+++ b/package/gcc/5.2.0/901-fixincludes-update-for-musl-support.patch
@@ -0,0 +1,32 @@
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 22 Apr 2015 14:18:16 +0000 (+0000)
+Subject: fixincludes update for musl support
+X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=2dc727de2e87c2756a514cbb43cea23c99deaa3d
+
+fixincludes update for musl support
+
+On behalf of Szabolcs.Nagy at arm.com
+
+2015-04-22  Gregor Richards  <gregor.richards@uwaterloo.ca>
+
+	* mkfixinc.sh: Add *-musl* with no fixes.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 222327 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+
+Index: b/fixincludes/mkfixinc.sh
+===================================================================
+--- a/fixincludes/mkfixinc.sh
++++ b/fixincludes/mkfixinc.sh
+@@ -19,7 +19,8 @@
+     powerpc-*-eabi*    | \
+     powerpc-*-rtems*   | \
+     powerpcle-*-eabisim* | \
+-    powerpcle-*-eabi* )
++    powerpcle-*-eabi* | \
++    *-musl* )
+ 	#  IF there is no include fixing,
+ 	#  THEN create a no-op fixer and exit
+ 	(echo "#! /bin/sh" ; echo "exit 0" ) > ${target}
diff --git a/package/gcc/5.2.0/902-unwind-fix-for-musl.patch b/package/gcc/5.2.0/902-unwind-fix-for-musl.patch
new file mode 100644
index 0000000..ef47054
--- /dev/null
+++ b/package/gcc/5.2.0/902-unwind-fix-for-musl.patch
@@ -0,0 +1,36 @@
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 22 Apr 2015 14:20:01 +0000 (+0000)
+Subject: unwind fix for musl
+X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=a2e31d0681d8a47389b8a3552622fbd9827bcef4
+
+unwind fix for musl
+
+On behalf of szabolcs.nagy at arm.com
+
+2015-04-22  Gregor Richards  <gregor.richards@uwaterloo.ca>
+	    Szabolcs Nagy  <szabolcs.nagy@arm.com>
+
+	* unwind-dw2-fde-dip.c (USE_PT_GNU_EH_FRAME): Define it on
+	Linux if target provides dl_iterate_phdr.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 222328 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+
+Index: b/libgcc/unwind-dw2-fde-dip.c
+===================================================================
+--- a/libgcc/unwind-dw2-fde-dip.c
++++ b/libgcc/unwind-dw2-fde-dip.c
+@@ -59,6 +59,12 @@
+ 
+ #if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR) \
+     && defined(TARGET_DL_ITERATE_PHDR) \
++    && defined(__linux__)
++# define USE_PT_GNU_EH_FRAME
++#endif
++
++#if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR) \
++    && defined(TARGET_DL_ITERATE_PHDR) \
+     && (defined(__DragonFly__) || defined(__FreeBSD__))
+ # define ElfW __ElfN
+ # define USE_PT_GNU_EH_FRAME
diff --git a/package/gcc/5.2.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch b/package/gcc/5.2.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
new file mode 100644
index 0000000..c852131
--- /dev/null
+++ b/package/gcc/5.2.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
@@ -0,0 +1,80 @@
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 22 Apr 2015 14:24:11 +0000 (+0000)
+Subject: libstdc++, libgfortran gthr workaround for musl
+X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=1e5f711c11cb80ce609db9e9c1d8b2da0f7b5b61
+
+libstdc++, libgfortran gthr workaround for musl
+
+On behalf of szabolcs.nagy at arm.com
+
+[libstdc++-v3/]
+2015-04-22  Szabolcs Nagy  <szabolcs.nagy@arm.com>
+
+	* config/os/generic/os_defines.h (_GLIBCXX_GTHREAD_USE_WEAK): Define.
+	* configure.host (os_include_dir): Set to "os/generic" for linux-musl*.
+
+[libgfortran/]
+2015-04-22  Szabolcs Nagy  <szabolcs.nagy@arm.com>
+
+	* acinclude.m4 (GTHREAD_USE_WEAK): Define as 0 for *-*-musl*.
+	* configure: Regenerate.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 222329 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+
+Index: b/libgfortran/acinclude.m4
+===================================================================
+--- a/libgfortran/acinclude.m4
++++ b/libgfortran/acinclude.m4
+@@ -100,7 +100,7 @@
+ 	      [Define to 1 if the target supports #pragma weak])
+   fi
+   case "$host" in
+-    *-*-darwin* | *-*-hpux* | *-*-cygwin* | *-*-mingw* )
++    *-*-darwin* | *-*-hpux* | *-*-cygwin* | *-*-mingw* | *-*-musl* )
+       AC_DEFINE(GTHREAD_USE_WEAK, 0,
+ 		[Define to 0 if the target shouldn't use #pragma weak])
+       ;;
+Index: b/libgfortran/configure
+===================================================================
+--- a/libgfortran/configure
++++ b/libgfortran/configure
+@@ -26447,7 +26447,7 @@
+ 
+   fi
+   case "$host" in
+-    *-*-darwin* | *-*-hpux* | *-*-cygwin* | *-*-mingw* )
++    *-*-darwin* | *-*-hpux* | *-*-cygwin* | *-*-mingw* | *-*-musl* )
+ 
+ $as_echo "#define GTHREAD_USE_WEAK 0" >>confdefs.h
+ 
+Index: b/libstdc++-v3/config/os/generic/os_defines.h
+===================================================================
+--- a/libstdc++-v3/config/os/generic/os_defines.h
++++ b/libstdc++-v3/config/os/generic/os_defines.h
+@@ -33,4 +33,9 @@
+ // System-specific #define, typedefs, corrections, etc, go here.  This
+ // file will come before all others.
+ 
++// Disable the weak reference logic in gthr.h for os/generic because it
++// is broken on every platform unless there is implementation specific
++// workaround in gthr-posix.h and at link-time for static linking.
++#define _GLIBCXX_GTHREAD_USE_WEAK 0
++
+ #endif
+Index: b/libstdc++-v3/configure.host
+===================================================================
+--- a/libstdc++-v3/configure.host
++++ b/libstdc++-v3/configure.host
+@@ -271,6 +271,9 @@
+   freebsd*)
+     os_include_dir="os/bsd/freebsd"
+     ;;
++  linux-musl*)
++    os_include_dir="os/generic"
++    ;;
+   gnu* | linux* | kfreebsd*-gnu | knetbsd*-gnu)
+     if [ "$uclibc" = "yes" ]; then
+       os_include_dir="os/uclibc"
diff --git a/package/gcc/5.2.0/904-musl-libc-config.patch b/package/gcc/5.2.0/904-musl-libc-config.patch
new file mode 100644
index 0000000..8549140
--- /dev/null
+++ b/package/gcc/5.2.0/904-musl-libc-config.patch
@@ -0,0 +1,285 @@
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 8 May 2015 08:25:47 +0000 (+0000)
+Subject: [PATCH 2/13] musl libc config
+X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=a9173ceabaf29c16f8ef226fbf98af373a4b2ceb
+
+[PATCH 2/13] musl libc config
+
+2015-05-08  Gregor Richards  <gregor.richards@uwaterloo.ca>
+	    Szabolcs Nagy  <szabolcs.nagy@arm.com>
+
+	* config.gcc (LIBC_MUSL): New tm_defines macro.
+	* config/linux.h (OPTION_MUSL): Define.
+	(MUSL_DYNAMIC_LINKER, MUSL_DYNAMIC_LINKER32,)
+	(MUSL_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKERX32,)
+	(INCLUDE_DEFAULTS_MUSL_GPP, INCLUDE_DEFAULTS_MUSL_LOCAL,)
+	(INCLUDE_DEFAULTS_MUSL_PREFIX, INCLUDE_DEFAULTS_MUSL_CROSS,)
+	(INCLUDE_DEFAULTS_MUSL_TOOL, INCLUDE_DEFAULTS_MUSL_NATIVE): Define.
+	* config/linux.opt (mmusl): New option.
+	* doc/invoke.texi (GNU/Linux Options): Document -mmusl.
+	* configure.ac (gcc_cv_libc_provides_ssp): Add *-*-musl*.
+	(gcc_cv_target_dl_iterate_phdr): Add *-linux-musl*.
+	* configure: Regenerate.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 222904 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+
+Index: b/gcc/config.gcc
+===================================================================
+--- a/gcc/config.gcc
++++ b/gcc/config.gcc
+@@ -575,7 +575,7 @@
+ esac
+ 
+ # Common C libraries.
+-tm_defines="$tm_defines LIBC_GLIBC=1 LIBC_UCLIBC=2 LIBC_BIONIC=3"
++tm_defines="$tm_defines LIBC_GLIBC=1 LIBC_UCLIBC=2 LIBC_BIONIC=3 LIBC_MUSL=4"
+ 
+ # 32-bit x86 processors supported by --with-arch=.  Each processor
+ # MUST be separated by exactly one space.
+@@ -720,6 +720,9 @@
+     *-*-*uclibc*)
+       tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC"
+       ;;
++    *-*-*musl*)
++      tm_defines="$tm_defines DEFAULT_LIBC=LIBC_MUSL"
++      ;;
+     *)
+       tm_defines="$tm_defines DEFAULT_LIBC=LIBC_GLIBC"
+       ;;
+Index: b/gcc/config/linux.h
+===================================================================
+--- a/gcc/config/linux.h
++++ b/gcc/config/linux.h
+@@ -32,10 +32,12 @@
+ #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
+ #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
+ #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
++#define OPTION_MUSL   (DEFAULT_LIBC == LIBC_MUSL)
+ #else
+ #define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
+ #define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
+ #define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
++#define OPTION_MUSL   (linux_libc == LIBC_MUSL)
+ #endif
+ 
+ #define GNU_USER_TARGET_OS_CPP_BUILTINS()			\
+@@ -50,21 +52,25 @@
+     } while (0)
+ 
+ /* Determine which dynamic linker to use depending on whether GLIBC or
+-   uClibc or Bionic is the default C library and whether
+-   -muclibc or -mglibc or -mbionic has been passed to change the default.  */
++   uClibc or Bionic or musl is the default C library and whether
++   -muclibc or -mglibc or -mbionic or -mmusl has been passed to change
++   the default.  */
+ 
+-#define CHOOSE_DYNAMIC_LINKER1(LIBC1, LIBC2, LIBC3, LD1, LD2, LD3)	\
+-  "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:" LD1 "}}"
++#define CHOOSE_DYNAMIC_LINKER1(LIBC1, LIBC2, LIBC3, LIBC4, LD1, LD2, LD3, LD4)	\
++  "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:%{" LIBC4 ":" LD4 ";:" LD1 "}}}"
+ 
+ #if DEFAULT_LIBC == LIBC_GLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
+-  CHOOSE_DYNAMIC_LINKER1 ("mglibc", "muclibc", "mbionic", G, U, B)
++#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
++  CHOOSE_DYNAMIC_LINKER1 ("mglibc", "muclibc", "mbionic", "mmusl", G, U, B, M)
+ #elif DEFAULT_LIBC == LIBC_UCLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
+-  CHOOSE_DYNAMIC_LINKER1 ("muclibc", "mglibc", "mbionic", U, G, B)
++#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
++  CHOOSE_DYNAMIC_LINKER1 ("muclibc", "mglibc", "mbionic", "mmusl", U, G, B, M)
+ #elif DEFAULT_LIBC == LIBC_BIONIC
+-#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
+-  CHOOSE_DYNAMIC_LINKER1 ("mbionic", "mglibc", "muclibc", B, G, U)
++#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
++  CHOOSE_DYNAMIC_LINKER1 ("mbionic", "mglibc", "muclibc", "mmusl", B, G, U, M)
++#elif DEFAULT_LIBC == LIBC_MUSL
++#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
++  CHOOSE_DYNAMIC_LINKER1 ("mmusl", "mglibc", "muclibc", "mbionic", M, G, U, B)
+ #else
+ #error "Unsupported DEFAULT_LIBC"
+ #endif /* DEFAULT_LIBC */
+@@ -81,24 +87,100 @@
+ #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
+ #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
+ #define BIONIC_DYNAMIC_LINKERX32 "/system/bin/linkerx32"
++/* Should be redefined for each target that supports musl.  */
++#define MUSL_DYNAMIC_LINKER "/dev/null"
++#define MUSL_DYNAMIC_LINKER32 "/dev/null"
++#define MUSL_DYNAMIC_LINKER64 "/dev/null"
++#define MUSL_DYNAMIC_LINKERX32 "/dev/null"
+ 
+ #define GNU_USER_DYNAMIC_LINKER						\
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER,	\
+-			 BIONIC_DYNAMIC_LINKER)
++			 BIONIC_DYNAMIC_LINKER, MUSL_DYNAMIC_LINKER)
+ #define GNU_USER_DYNAMIC_LINKER32					\
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_LINKER32, \
+-			 BIONIC_DYNAMIC_LINKER32)
++			 BIONIC_DYNAMIC_LINKER32, MUSL_DYNAMIC_LINKER32)
+ #define GNU_USER_DYNAMIC_LINKER64					\
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_LINKER64, \
+-			 BIONIC_DYNAMIC_LINKER64)
++			 BIONIC_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKER64)
+ #define GNU_USER_DYNAMIC_LINKERX32					\
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERX32, UCLIBC_DYNAMIC_LINKERX32, \
+-			 BIONIC_DYNAMIC_LINKERX32)
++			 BIONIC_DYNAMIC_LINKERX32, MUSL_DYNAMIC_LINKERX32)
+ 
+ /* Whether we have Bionic libc runtime */
+ #undef TARGET_HAS_BIONIC
+ #define TARGET_HAS_BIONIC (OPTION_BIONIC)
+ 
++/* musl avoids problematic includes by rearranging the include directories.
++ * Unfortunately, this is mostly duplicated from cppdefault.c */
++#if DEFAULT_LIBC == LIBC_MUSL
++#define INCLUDE_DEFAULTS_MUSL_GPP			\
++    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,		\
++      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },		\
++    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,		\
++      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },		\
++    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,	\
++      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
++
++#ifdef LOCAL_INCLUDE_DIR
++#define INCLUDE_DEFAULTS_MUSL_LOCAL			\
++    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },		\
++    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
++#else
++#define INCLUDE_DEFAULTS_MUSL_LOCAL
++#endif
++
++#ifdef PREFIX_INCLUDE_DIR
++#define INCLUDE_DEFAULTS_MUSL_PREFIX			\
++    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0},
++#else
++#define INCLUDE_DEFAULTS_MUSL_PREFIX
++#endif
++
++#ifdef CROSS_INCLUDE_DIR
++#define INCLUDE_DEFAULTS_MUSL_CROSS			\
++    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0},
++#else
++#define INCLUDE_DEFAULTS_MUSL_CROSS
++#endif
++
++#ifdef TOOL_INCLUDE_DIR
++#define INCLUDE_DEFAULTS_MUSL_TOOL			\
++    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0},
++#else
++#define INCLUDE_DEFAULTS_MUSL_TOOL
++#endif
++
++#ifdef NATIVE_SYSTEM_HEADER_DIR
++#define INCLUDE_DEFAULTS_MUSL_NATIVE			\
++    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
++    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 0 },
++#else
++#define INCLUDE_DEFAULTS_MUSL_NATIVE
++#endif
++
++#if defined (CROSS_DIRECTORY_STRUCTURE) && !defined (TARGET_SYSTEM_ROOT)
++# undef INCLUDE_DEFAULTS_MUSL_LOCAL
++# define INCLUDE_DEFAULTS_MUSL_LOCAL
++# undef INCLUDE_DEFAULTS_MUSL_NATIVE
++# define INCLUDE_DEFAULTS_MUSL_NATIVE
++#else
++# undef INCLUDE_DEFAULTS_MUSL_CROSS
++# define INCLUDE_DEFAULTS_MUSL_CROSS
++#endif
++
++#undef INCLUDE_DEFAULTS
++#define INCLUDE_DEFAULTS				\
++  {							\
++    INCLUDE_DEFAULTS_MUSL_GPP				\
++    INCLUDE_DEFAULTS_MUSL_PREFIX			\
++    INCLUDE_DEFAULTS_MUSL_CROSS				\
++    INCLUDE_DEFAULTS_MUSL_TOOL				\
++    INCLUDE_DEFAULTS_MUSL_NATIVE			\
++    { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
++    { 0, 0, 0, 0, 0, 0 }				\
++  }
++#endif
++
+ #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
+ /* This is a *uclinux* target.  We don't define below macros to normal linux
+    versions, because doing so would require *uclinux* targets to include
+Index: b/gcc/config/linux.opt
+===================================================================
+--- a/gcc/config/linux.opt
++++ b/gcc/config/linux.opt
+@@ -28,5 +28,9 @@
+ Use GNU C library
+ 
+ muclibc
+-Target Report RejectNegative Var(linux_libc,LIBC_UCLIBC) Negative(mbionic)
++Target Report RejectNegative Var(linux_libc,LIBC_UCLIBC) Negative(mmusl)
+ Use uClibc C library
++
++mmusl
++Target Report RejectNegative Var(linux_libc,LIBC_MUSL) Negative(mbionic)
++Use musl C library
+Index: b/gcc/configure
+===================================================================
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -27809,6 +27813,9 @@
+       gcc_cv_target_dl_iterate_phdr=no
+     fi
+     ;;
++  *-linux-musl*)
++    gcc_cv_target_dl_iterate_phdr=yes
++    ;;
+ esac
+ 
+ if test x$gcc_cv_target_dl_iterate_phdr = xyes; then
+Index: b/gcc/configure.ac
+===================================================================
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -5298,6 +5302,9 @@
+       gcc_cv_target_dl_iterate_phdr=no
+     fi
+     ;;
++  *-linux-musl*)
++    gcc_cv_target_dl_iterate_phdr=yes
++    ;;
+ esac
+ GCC_TARGET_TEMPLATE([TARGET_DL_ITERATE_PHDR])
+ if test x$gcc_cv_target_dl_iterate_phdr = xyes; then
+Index: b/gcc/doc/invoke.texi
+===================================================================
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -667,7 +667,7 @@
+ -mcpu=@var{cpu}}
+ 
+ @emph{GNU/Linux Options}
+- at gccoptlist{-mglibc -muclibc -mbionic -mandroid @gol
++ at gccoptlist{-mglibc -muclibc -mmusl -mbionic -mandroid @gol
+ -tno-android-cc -tno-android-ld}
+ 
+ @emph{H8/300 Options}
+@@ -15324,13 +15324,19 @@
+ @item -mglibc
+ @opindex mglibc
+ Use the GNU C library.  This is the default except
+-on @samp{*-*-linux-*uclibc*} and @samp{*-*-linux-*android*} targets.
++on @samp{*-*-linux-*uclibc*}, @samp{*-*-linux-*musl*} and
++ at samp{*-*-linux-*android*} targets.
+ 
+ @item -muclibc
+ @opindex muclibc
+ Use uClibc C library.  This is the default on
+ @samp{*-*-linux-*uclibc*} targets.
+ 
++ at item -mmusl
++ at opindex mmusl
++Use the musl C library.  This is the default on
++ at samp{*-*-linux-*musl*} targets.
++
+ @item -mbionic
+ @opindex mbionic
+ Use Bionic C library.  This is the default on
diff --git a/package/gcc/5.2.0/905-add-musl-support-to-gcc.patch b/package/gcc/5.2.0/905-add-musl-support-to-gcc.patch
new file mode 100644
index 0000000..92e7436
--- /dev/null
+++ b/package/gcc/5.2.0/905-add-musl-support-to-gcc.patch
@@ -0,0 +1,130 @@
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 8 May 2015 08:30:40 +0000 (+0000)
+Subject: [PATCH 0/13] Add musl support to GCC
+X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=f2d678afa5b8385d763b93772d73d6bf80a9739e
+
+[PATCH 0/13] Add musl support to GCC
+
+2015-05-08  Szabolcs Nagy  <szabolcs.nagy@arm.com>
+
+	* config/glibc-stdint.h (OPTION_MUSL): Define.
+	(INT_FAST16_TYPE, INT_FAST32_TYPE, UINT_FAST16_TYPE, UINT_FAST32_TYPE):
+	Change the definition based on OPTION_MUSL for 64 bit targets.
+	* config/linux.h (OPTION_MUSL): Redefine.
+	* config/alpha/linux.h (OPTION_MUSL): Redefine.
+	* config/rs6000/linux.h (OPTION_MUSL): Redefine.
+	* config/rs6000/linux64.h (OPTION_MUSL): Redefine.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 222905 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+
+Index: b/gcc/config/alpha/linux.h
+===================================================================
+--- a/gcc/config/alpha/linux.h
++++ b/gcc/config/alpha/linux.h
+@@ -61,10 +61,14 @@
+ #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
+ #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
+ #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
++#undef OPTION_MUSL
++#define OPTION_MUSL   (DEFAULT_LIBC == LIBC_MUSL)
+ #else
+ #define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
+ #define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
+ #define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
++#undef OPTION_MUSL
++#define OPTION_MUSL   (linux_libc == LIBC_MUSL)
+ #endif
+ 
+ /* Determine what functions are present at the runtime;
+Index: b/gcc/config/glibc-stdint.h
+===================================================================
+--- a/gcc/config/glibc-stdint.h
++++ b/gcc/config/glibc-stdint.h
+@@ -22,6 +22,12 @@
+ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ <http://www.gnu.org/licenses/>.  */
+ 
++/* Systems using musl libc should use this header and make sure
++   OPTION_MUSL is defined correctly before using the TYPE macros. */
++#ifndef OPTION_MUSL
++#define OPTION_MUSL 0
++#endif
++
+ #define SIG_ATOMIC_TYPE "int"
+ 
+ #define INT8_TYPE "signed char"
+@@ -43,12 +49,12 @@
+ #define UINT_LEAST64_TYPE (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "long long unsigned int")
+ 
+ #define INT_FAST8_TYPE "signed char"
+-#define INT_FAST16_TYPE (LONG_TYPE_SIZE == 64 ? "long int" : "int")
+-#define INT_FAST32_TYPE (LONG_TYPE_SIZE == 64 ? "long int" : "int")
++#define INT_FAST16_TYPE (LONG_TYPE_SIZE == 64 && !OPTION_MUSL ? "long int" : "int")
++#define INT_FAST32_TYPE (LONG_TYPE_SIZE == 64 && !OPTION_MUSL ? "long int" : "int")
+ #define INT_FAST64_TYPE (LONG_TYPE_SIZE == 64 ? "long int" : "long long int")
+ #define UINT_FAST8_TYPE "unsigned char"
+-#define UINT_FAST16_TYPE (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "unsigned int")
+-#define UINT_FAST32_TYPE (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "unsigned int")
++#define UINT_FAST16_TYPE (LONG_TYPE_SIZE == 64 && !OPTION_MUSL ? "long unsigned int" : "unsigned int")
++#define UINT_FAST32_TYPE (LONG_TYPE_SIZE == 64 && !OPTION_MUSL ? "long unsigned int" : "unsigned int")
+ #define UINT_FAST64_TYPE (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "long long unsigned int")
+ 
+ #define INTPTR_TYPE (LONG_TYPE_SIZE == 64 ? "long int" : "int")
+Index: b/gcc/config/linux.h
+===================================================================
+--- a/gcc/config/linux.h
++++ b/gcc/config/linux.h
+@@ -32,11 +32,13 @@
+ #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
+ #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
+ #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
++#undef OPTION_MUSL
+ #define OPTION_MUSL   (DEFAULT_LIBC == LIBC_MUSL)
+ #else
+ #define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
+ #define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
+ #define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
++#undef OPTION_MUSL
+ #define OPTION_MUSL   (linux_libc == LIBC_MUSL)
+ #endif
+ 
+Index: b/gcc/config/rs6000/linux.h
+===================================================================
+--- a/gcc/config/rs6000/linux.h
++++ b/gcc/config/rs6000/linux.h
+@@ -30,10 +30,14 @@
+ #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
+ #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
+ #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
++#undef OPTION_MUSL
++#define OPTION_MUSL   (DEFAULT_LIBC == LIBC_MUSL)
+ #else
+ #define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
+ #define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
+ #define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
++#undef OPTION_MUSL
++#define OPTION_MUSL   (linux_libc == LIBC_MUSL)
+ #endif
+ 
+ /* Determine what functions are present at the runtime;
+Index: b/gcc/config/rs6000/linux64.h
+===================================================================
+--- a/gcc/config/rs6000/linux64.h
++++ b/gcc/config/rs6000/linux64.h
+@@ -299,10 +299,14 @@
+ #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
+ #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
+ #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
++#undef OPTION_MUSL
++#define OPTION_MUSL   (DEFAULT_LIBC == LIBC_MUSL)
+ #else
+ #define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
+ #define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
+ #define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
++#undef OPTION_MUSL
++#define OPTION_MUSL   (linux_libc == LIBC_MUSL)
+ #endif
+ 
+ /* Determine what functions are present at the runtime;
diff --git a/package/gcc/5.2.0/906-mips-musl-support.patch b/package/gcc/5.2.0/906-mips-musl-support.patch
new file mode 100644
index 0000000..6b473f9
--- /dev/null
+++ b/package/gcc/5.2.0/906-mips-musl-support.patch
@@ -0,0 +1,37 @@
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 8 May 2015 15:16:50 +0000 (+0000)
+Subject: [PATCH 6/13] mips musl support
+X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=2550b6a866c887472b587bef87d433c51cf1ebc8
+
+[PATCH 6/13] mips musl support
+
+2015-05-08  Gregor Richards  <gregor.richards@uwaterloo.ca>
+	    Szabolcs Nagy  <szabolcs.nagy@arm.com>
+
+	* config/mips/linux.h (MUSL_DYNAMIC_LINKER32): Define.
+	(MUSL_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKERN32): Define.
+	(GNU_USER_DYNAMIC_LINKERN32): Update.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 222915 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+
+Index: b/gcc/config/mips/linux.h
+===================================================================
+--- a/gcc/config/mips/linux.h
++++ b/gcc/config/mips/linux.h
+@@ -37,7 +37,13 @@
+ #define UCLIBC_DYNAMIC_LINKERN32 \
+   "%{mnan=2008:/lib32/ld-uClibc-mipsn8.so.0;:/lib32/ld-uClibc.so.0}"
+ 
++#undef MUSL_DYNAMIC_LINKER32
++#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-mips%{EL:el}%{msoft-float:-sf}.so.1"
++#undef MUSL_DYNAMIC_LINKER64
++#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-mips64%{EL:el}%{msoft-float:-sf}.so.1"
++#define MUSL_DYNAMIC_LINKERN32 "/lib/ld-musl-mipsn32%{EL:el}%{msoft-float:-sf}.so.1"
++
+ #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
+ #define GNU_USER_DYNAMIC_LINKERN32 \
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, UCLIBC_DYNAMIC_LINKERN32, \
+-                         BIONIC_DYNAMIC_LINKERN32)
++                         BIONIC_DYNAMIC_LINKERN32, MUSL_DYNAMIC_LINKERN32)
diff --git a/package/gcc/5.2.0/907-x86-musl-support.patch b/package/gcc/5.2.0/907-x86-musl-support.patch
new file mode 100644
index 0000000..3f2fe5d
--- /dev/null
+++ b/package/gcc/5.2.0/907-x86-musl-support.patch
@@ -0,0 +1,45 @@
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 15 May 2015 13:20:01 +0000 (+0000)
+Subject: [PATCH 9/13] x86 musl support
+X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=5551c8d927c17f60837f15f8dfe46f945ba3fa9c
+
+[PATCH 9/13] x86 musl support
+
+On behalf of Szabolcs Nagy.
+
+2015-05-15  Gregor Richards  <gregor.richards@uwaterloo.ca>
+
+	* config/i386/linux.h (MUSL_DYNAMIC_LINKER): Define.
+	* config/i386/linux64.h (MUSL_DYNAMIC_LINKER32): Define.
+	(MUSL_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKERX32): Define.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 223218 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+
+Index: b/gcc/config/i386/linux.h
+===================================================================
+--- a/gcc/config/i386/linux.h
++++ b/gcc/config/i386/linux.h
+@@ -21,3 +21,6 @@
+ 
+ #define GNU_USER_LINK_EMULATION "elf_i386"
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
++
++#undef MUSL_DYNAMIC_LINKER
++#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
+Index: b/gcc/config/i386/linux64.h
+===================================================================
+--- a/gcc/config/i386/linux64.h
++++ b/gcc/config/i386/linux64.h
+@@ -30,3 +30,10 @@
+ #define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
+ #define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
+ #define GLIBC_DYNAMIC_LINKERX32 "/libx32/ld-linux-x32.so.2"
++
++#undef MUSL_DYNAMIC_LINKER32
++#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
++#undef MUSL_DYNAMIC_LINKER64
++#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-x86_64.so.1"
++#undef MUSL_DYNAMIC_LINKERX32
++#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
diff --git a/package/gcc/5.2.0/908-arm-musl-support.patch b/package/gcc/5.2.0/908-arm-musl-support.patch
new file mode 100644
index 0000000..906355a
--- /dev/null
+++ b/package/gcc/5.2.0/908-arm-musl-support.patch
@@ -0,0 +1,45 @@
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 27 May 2015 13:17:11 +0000 (+0000)
+Subject: [PATCH 4/13] arm musl support
+X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=de799bd087ab9a179768fea75bd195a31d3432a4
+
+[PATCH 4/13] arm musl support
+
+On behalf of szabolcs.nagy at arm.com
+
+2015-05-27  Gregor Richards  <gregor.richards@uwaterloo.ca>
+
+	* config/arm/linux-eabi.h (MUSL_DYNAMIC_LINKER): Define.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 223749 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+
+Index: b/gcc/config/arm/linux-eabi.h
+===================================================================
+--- a/gcc/config/arm/linux-eabi.h
++++ b/gcc/config/arm/linux-eabi.h
+@@ -77,6 +77,23 @@
+     %{mfloat-abi=soft*:" GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "} \
+     %{!mfloat-abi=*:" GLIBC_DYNAMIC_LINKER_DEFAULT "}"
+ 
++/* For ARM musl currently supports four dynamic linkers:
++   - ld-musl-arm.so.1 - for the EABI-derived soft-float ABI
++   - ld-musl-armhf.so.1 - for the EABI-derived hard-float ABI
++   - ld-musl-armeb.so.1 - for the EABI-derived soft-float ABI, EB
++   - ld-musl-armebhf.so.1 - for the EABI-derived hard-float ABI, EB
++   musl does not support the legacy OABI mode.
++   All the dynamic linkers live in /lib.
++   We default to soft-float, EL. */
++#undef  MUSL_DYNAMIC_LINKER
++#if TARGET_BIG_ENDIAN_DEFAULT
++#define MUSL_DYNAMIC_LINKER_E "%{mlittle-endian:;:eb}"
++#else
++#define MUSL_DYNAMIC_LINKER_E "%{mbig-endian:eb}"
++#endif
++#define MUSL_DYNAMIC_LINKER \
++  "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}.so.1"
++
+ /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
+    use the GNU/Linux version, not the generic BPABI version.  */
+ #undef  LINK_SPEC
diff --git a/package/gcc/5.2.0/909-aarch64-musl-support.patch b/package/gcc/5.2.0/909-aarch64-musl-support.patch
new file mode 100644
index 0000000..3d032f5
--- /dev/null
+++ b/package/gcc/5.2.0/909-aarch64-musl-support.patch
@@ -0,0 +1,33 @@
+From: jgreenhalgh <jgreenhalgh@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 27 May 2015 16:46:39 +0000 (+0000)
+Subject: [PATCH 3/13] aarch64 musl support
+X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=b3ff21cf0531be91bc3fb8200296a7633090ec78
+
+[PATCH 3/13] aarch64 musl support
+
+gcc/Changelog:
+
+2015-05-27  Gregor Richards  <gregor.richards@uwaterloo.ca>
+	    Szabolcs Nagy  <szabolcs.nagy@arm.com>
+
+	* config/aarch64/aarch64-linux.h (MUSL_DYNAMIC_LINKER): Define.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 223766 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+
+Index: b/gcc/config/aarch64/aarch64-linux.h
+===================================================================
+--- a/gcc/config/aarch64/aarch64-linux.h
++++ b/gcc/config/aarch64/aarch64-linux.h
+@@ -23,6 +23,9 @@
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
+ 
++#undef MUSL_DYNAMIC_LINKER
++#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
++
+ #undef  ASAN_CC1_SPEC
+ #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
+ 
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index cad6896..3afb79e 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -93,6 +93,14 @@ choice
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
+	config BR2_GCC_VERSION_5_2_X
+		bool "gcc 5.2.x"
+		# Broken or unsupported architectures
+		depends on !BR2_arc
+		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GRAPHITE
+		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
 	config BR2_GCC_VERSION_5_X
 		bool "gcc 5.x"
 		# Broken or unsupported architectures
@@ -113,6 +121,7 @@ config BR2_GCC_VERSION
 	default "4.7.4"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
+	default "5.2.0"     if BR2_GCC_VERSION_5_2_X
 	default "5.3.0"     if BR2_GCC_VERSION_5_X
 	default "arc-2015.12" if BR2_GCC_VERSION_4_8_ARC
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 0ef4e65..201408f 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,6 +6,8 @@ sha512  dfcb737073191e628231031a3571ec77ee760a59377630f4a6e4fdfa66f9ddad39fde47e
 sha512  47fdfeca0c0a624cdec9c4ae47137d056c918d5c386d4b96985bb3c8172aba377cb66cbcc30e80832fd244a7d98f562c20198056915c70cfef0977545073a8ea  gcc-4.8.5.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.3/sha512.sum
 sha512  9ac57377a6975fc7adac704ec81355262b9f537def6955576753b87715470a20ee6a2a3144a79cc8fcba3443f7b44c7337d79d704b522d053f54f79aa6b442df  gcc-4.9.3.tar.bz2
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.2.0/sha512.sum
+sha512	844120349ec04465dcea52d8ec747f1cbbc9d76a39fe3d8ef5e6b93614e63d718862d60d0a1c1cbf59ffc7815562287d0a2e536a6b220cebcd0b8de4ba35e715  gcc-5.2.0.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.3.0/sha512.sum
 sha512  d619847383405fd389f5a2d7225f97fedb01f81478dbb8339047ccba7561a5c20045ab500a8744bffd19ea51892ce09fc37f862f2cfcb42de0f0f8cd8f8da37a  gcc-5.3.0.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
-- 
2.7.1
