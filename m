From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Apr 2016 23:11:53 +0200
Subject: [Buildroot] [git commit] gcc: add support for gcc 6
Message-ID: <20160427212052.5B4F981E9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=519d83bfa0442439026db4e71e605a5c1347e566
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds the support for gcc 6. This release allows to remove
a large number of our gcc patches, mainly thanks to the Xtensa and
musl related patches being merged upstream.

Patches kept with no changes:

 100-uclibc-conf.patch
 301-missing-execinfo_h.patch
 810-arm-softfloat-libgcc.patch
 830-arm_unbreak_armv4t.patch
 840-microblaze-enable-dwarf-eh-support.patch
 860-cilk-wchar.patch
 890-fix-m68k-compile.patch

Patches dropped because they have been merged upstream, or were
already upstream backports:

 120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch (merged)
 850-libstdcxx-uclibc-c99.patch (merged in a different form, see
 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58393)
 870-xtensa-add-mauto-litpools-option.patch (upstream backport)
 871-xtensa-reimplement-register-spilling.patch (upstream backport)
 872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch (upstream backport)
 873-xtensa-fix-_Unwind_GetCFA.patch (upstream backport)
 874-xtensa-add-uclinux-support.patch (upstream backport)
 900-libitm-fixes-for-musl-support.patch (upstream backport)
 901-fixincludes-update-for-musl-support.patch (upstream backport)
 902-unwind-fix-for-musl.patch (upstream backport)
 903-libstdc++-libgfortran-gthr-workaround-for-musl.patch (upstream backport)
 904-musl-libc-config.patch (upstream backport)
 905-add-musl-support-to-gcc.patch (upstream backport)
 905-add-musl-support-to-gcc.patch (upstream backport)
 906-mips-musl-support.patch (upstream backport)
 907-x86-musl-support.patch (upstream backport)
 908-arm-musl-support.patch (upstream backport)
 909-aarch64-musl-support.patch (upstream backport)

Successfully build-time and run-time tested with
qemu_arm_vexpress_defconfig, using gcc 6.x, both in uClibc and musl
configurations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/6.1.0/100-uclibc-conf.patch            |  15 ++
 package/gcc/6.1.0/301-missing-execinfo_h.patch     |  13 ++
 package/gcc/6.1.0/810-arm-softfloat-libgcc.patch   |  30 ++++
 package/gcc/6.1.0/830-arm_unbreak_armv4t.patch     |  15 ++
 .../840-microblaze-enable-dwarf-eh-support.patch   | 166 +++++++++++++++++++++
 package/gcc/6.1.0/860-cilk-wchar.patch             |  56 +++++++
 package/gcc/6.1.0/890-fix-m68k-compile.patch       |  15 ++
 package/gcc/Config.in.host                         |   9 ++
 package/gcc/gcc.hash                               |   2 +
 toolchain/toolchain-common.in                      |   5 +
 10 files changed, 326 insertions(+)

diff --git a/package/gcc/6.1.0/100-uclibc-conf.patch b/package/gcc/6.1.0/100-uclibc-conf.patch
new file mode 100644
index 0000000..73d1f0d
--- /dev/null
+++ b/package/gcc/6.1.0/100-uclibc-conf.patch
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
diff --git a/package/gcc/6.1.0/301-missing-execinfo_h.patch b/package/gcc/6.1.0/301-missing-execinfo_h.patch
new file mode 100644
index 0000000..2d0e7ba
--- /dev/null
+++ b/package/gcc/6.1.0/301-missing-execinfo_h.patch
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
diff --git a/package/gcc/6.1.0/810-arm-softfloat-libgcc.patch b/package/gcc/6.1.0/810-arm-softfloat-libgcc.patch
new file mode 100644
index 0000000..5efa7fd
--- /dev/null
+++ b/package/gcc/6.1.0/810-arm-softfloat-libgcc.patch
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
diff --git a/package/gcc/6.1.0/830-arm_unbreak_armv4t.patch b/package/gcc/6.1.0/830-arm_unbreak_armv4t.patch
new file mode 100644
index 0000000..b730059
--- /dev/null
+++ b/package/gcc/6.1.0/830-arm_unbreak_armv4t.patch
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
diff --git a/package/gcc/6.1.0/840-microblaze-enable-dwarf-eh-support.patch b/package/gcc/6.1.0/840-microblaze-enable-dwarf-eh-support.patch
new file mode 100644
index 0000000..81bf60a
--- /dev/null
+++ b/package/gcc/6.1.0/840-microblaze-enable-dwarf-eh-support.patch
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
+@@ -57,6 +57,7 @@
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
+@@ -1924,6 +1924,11 @@
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
+@@ -1951,6 +1956,13 @@
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
+@@ -3027,6 +3039,12 @@
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
+@@ -3324,10 +3342,13 @@
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
+@@ -2324,4 +2324,15 @@
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
diff --git a/package/gcc/6.1.0/860-cilk-wchar.patch b/package/gcc/6.1.0/860-cilk-wchar.patch
new file mode 100644
index 0000000..1d9916f
--- /dev/null
+++ b/package/gcc/6.1.0/860-cilk-wchar.patch
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
diff --git a/package/gcc/6.1.0/890-fix-m68k-compile.patch b/package/gcc/6.1.0/890-fix-m68k-compile.patch
new file mode 100644
index 0000000..6e63de0
--- /dev/null
+++ b/package/gcc/6.1.0/890-fix-m68k-compile.patch
@@ -0,0 +1,15 @@
+remove unused header, which breaks the toolchain building
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-5.3.0.orig/libgcc/config/m68k/linux-atomic.c gcc-5.3.0/libgcc/config/m68k/linux-atomic.c
+--- gcc-5.3.0.orig/libgcc/config/m68k/linux-atomic.c	2015-01-05 13:33:28.000000000 +0100
++++ gcc-5.3.0/libgcc/config/m68k/linux-atomic.c	2016-03-19 09:25:07.000000000 +0100
+@@ -33,7 +33,6 @@
+    using the kernel helper defined below.  There is no support for
+    64-bit operations yet.  */
+ 
+-#include <asm/unistd.h>
+ #include <stdbool.h>
+ 
+ #ifndef __NR_atomic_cmpxchg_32
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4845708..8cf2d56 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -79,6 +79,14 @@ choice
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
+	config BR2_GCC_VERSION_6_X
+		bool "gcc 6.x"
+		# Broken or unsupported architectures
+		depends on !BR2_arc
+		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GRAPHITE
+		select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+
 endchoice
 
 config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
@@ -91,6 +99,7 @@ config BR2_GCC_VERSION
 	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
 	default "5.3.0"     if BR2_GCC_VERSION_5_X
+	default "6.1.0" if BR2_GCC_VERSION_6_X
 	default "arc-2015.12" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 0ef4e65..8d2feaf 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -8,5 +8,7 @@ sha512  47fdfeca0c0a624cdec9c4ae47137d056c918d5c386d4b96985bb3c8172aba377cb66cbc
 sha512  9ac57377a6975fc7adac704ec81355262b9f537def6955576753b87715470a20ee6a2a3144a79cc8fcba3443f7b44c7337d79d704b522d053f54f79aa6b442df  gcc-4.9.3.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.3.0/sha512.sum
 sha512  d619847383405fd389f5a2d7225f97fedb01f81478dbb8339047ccba7561a5c20045ab500a8744bffd19ea51892ce09fc37f862f2cfcb42de0f0f8cd8f8da37a  gcc-5.3.0.tar.bz2
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.1.0/sha512.sum
+sha512  eeed3e2018b8c012aabce419e8d718fde701e5c3c179b4486c61ba46e5736eecc8fccdd18b01fcd973a42c6ad3116dbbe2ee247fe3757d622d373f93ebaf8d2e  gcc-6.1.0.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
 none  xxx  gcc-arc-2015.12.tar.gz
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 00d73b6..be02484 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -304,10 +304,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "6"	if BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	default "5"	if BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	default "4.9"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	default "4.8"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
