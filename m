From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jun 2015 00:18:17 +0200
Subject: [Buildroot] [git commit] gcc: add support for gcc 5.1
Message-ID: <20150622222745.ED5AF7FAFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4deb2d93c5ab317b6addf4e1e132571ba8dac031
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds support for gcc 5.1 in Buildroot. In terms of gcc
patches, compared to gcc 4.9.x:

 * Kept as is, sometimes after minor adjusments:

   100-uclibc-conf.patch
   301-missing-execinfo_h.patch
   810-arm-softfloat-libgcc.patch
   830-arm_unbreak_armv4t.patch
   840-microblaze-enable-dwarf-eh-support.patch
   850-libstdcxx-uclibc-c99.patch
   860-cilk-wchar.patch

 * Dropped:

   110-pr64896.patch
   111-pr65730.patch

 * Split in multiple parts:

   900-musl-support.patch

   The patches from Crosstool-NG for muls support are used instead of
   one single patch.

 * Renamed:

   910-gcc-poison-system-directories.patch to
   200-gcc-poison-system-directories.patch

   920-libgcc-remove-unistd-header.patch to
   201-libgcc-remove-unistd-header.patch

   Since the 9xx part of the series is now used by the various musl
   related patches.

We have tested the following configurations, with a minimal Busybox
system:

 * ARM, uClibc-ng
 * ARM, glibc
 * ARM, musl
 * x86, uClibc-ng and uClibc 0.9.33.2
 * x86, glibc
 * x86, musl

All of the configurations built fine. All the configurations boot fine
in Qemu, except x86/uClibc (either ng or 0.9.33.2), it segfaults when
running init:

devtmpfs: mounted
Freeing unused kernel memory: 300K (c1389000 - c13d4000)
init[1]: segfault at 0 ip b77708c1 sp bfa9bb0c error 4 in ld-uClibc-0.9.33.2.so[b776c000+6000]
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

We'll give some time for the uClibc developers to fix the problem
before taking other measures in Buildroot to exclude gcc 5.1 from a
x86/uClibc configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/5.1.0/100-uclibc-conf.patch            |   15 +
 .../5.1.0/200-gcc-poison-system-directories.patch  |  207 +++++++++++++
 .../5.1.0/201-libgcc-remove-unistd-header.patch    |   14 +
 package/gcc/5.1.0/301-missing-execinfo_h.patch     |   13 +
 package/gcc/5.1.0/810-arm-softfloat-libgcc.patch   |   30 ++
 package/gcc/5.1.0/830-arm_unbreak_armv4t.patch     |   15 +
 .../840-microblaze-enable-dwarf-eh-support.patch   |  166 ++++++++++
 package/gcc/5.1.0/850-libstdcxx-uclibc-c99.patch   |  273 +++++++++++++++++
 package/gcc/5.1.0/860-cilk-wchar.patch             |   56 ++++
 .../5.1.0/900-libitm-fixes-for-musl-support.patch  |   65 ++++
 .../901-fixincludes-update-for-musl-support.patch  |   32 ++
 package/gcc/5.1.0/902-unwind-fix-for-musl.patch    |   36 +++
 ...dc++-libgfortran-gthr-workaround-for-musl.patch |   80 +++++
 package/gcc/5.1.0/904-musl-libc-config.patch       |  321 ++++++++++++++++++++
 .../gcc/5.1.0/905-add-musl-support-to-gcc.patch    |  130 ++++++++
 package/gcc/5.1.0/906-mips-musl-support.patch      |   37 +++
 package/gcc/5.1.0/907-x86-musl-support.patch       |   45 +++
 package/gcc/5.1.0/908-arm-musl-support.patch       |   45 +++
 package/gcc/5.1.0/909-aarch64-musl-support.patch   |   33 ++
 package/gcc/Config.in.host                         |    8 +
 package/gcc/gcc.hash                               |    2 +
 21 files changed, 1623 insertions(+), 0 deletions(-)

diff --git a/package/gcc/5.1.0/100-uclibc-conf.patch b/package/gcc/5.1.0/100-uclibc-conf.patch
new file mode 100644
index 0000000..73d1f0d
--- /dev/null
+++ b/package/gcc/5.1.0/100-uclibc-conf.patch
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
diff --git a/package/gcc/5.1.0/200-gcc-poison-system-directories.patch b/package/gcc/5.1.0/200-gcc-poison-system-directories.patch
new file mode 100644
index 0000000..f41c0c4
--- /dev/null
+++ b/package/gcc/5.1.0/200-gcc-poison-system-directories.patch
@@ -0,0 +1,207 @@
+From 160397ef3c3331099af028f1b8d3e085b07d88ad Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 08:59:00 +0400
+Subject: [PATCH 16/35] gcc: poison-system-directories
+
+Adapted to Buildroot and gcc 4.9.1 by Thomas Petazzoni, especially the
+addition of the BR_COMPILER_PARANOID_UNSAFE_PATH environment variable.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Upstream-Status: Inappropriate [distribution: codesourcery]
+---
+ gcc/Makefile.in     |    2 +-
+ gcc/common.opt      |    4 ++++
+ gcc/config.in       |    6 ++++++
+ gcc/configure       |   20 ++++++++++++++++++--
+ gcc/configure.ac    |   10 ++++++++++
+ gcc/doc/invoke.texi |    9 +++++++++
+ gcc/gcc.c           |    2 ++
+ gcc/incpath.c       |   19 +++++++++++++++++++
+ 8 files changed, 69 insertions(+), 3 deletions(-)
+
+Index: b/gcc/common.opt
+===================================================================
+--- a/gcc/common.opt
++++ b/gcc/common.opt
+@@ -623,6 +623,10 @@
+ Common Var(warn_return_local_addr) Init(1) Warning
+ Warn about returning a pointer/reference to a local or temporary variable.
+ 
++Wpoison-system-directories
++Common Var(flag_poison_system_directories) Init(1) Warning
++Warn for -I and -L options using system directories if cross compiling
++
+ Wshadow
+ Common Var(warn_shadow) Warning
+ Warn when one local variable shadows another
+Index: b/gcc/config.in
+===================================================================
+--- a/gcc/config.in
++++ b/gcc/config.in
+@@ -168,6 +168,12 @@
+ #endif
+ 
+ 
++/* Define to warn for use of native system header directories */
++#ifndef USED_FOR_TARGET
++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
++#endif
++
++
+ /* Define if you want all operations on RTL (the basic data structure of the
+    optimizer and back end) to be checked for dynamic type safety at runtime.
+    This is quite expensive. */
+Index: b/gcc/configure
+===================================================================
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -932,6 +932,7 @@
+ enable_maintainer_mode
+ enable_link_mutex
+ enable_version_specific_runtime_libs
++enable_poison_system_directories
+ enable_plugin
+ enable_host_shared
+ enable_libquadmath_support
+@@ -1661,6 +1662,8 @@
+   --enable-version-specific-runtime-libs
+                           specify that runtime libraries should be installed
+                           in a compiler-specific directory
++  --enable-poison-system-directories
++                          warn for use of native system header directories
+   --enable-plugin         enable plugin support
+   --enable-host-shared    build host code as shared libraries
+   --disable-libquadmath-support
+@@ -28087,6 +28090,19 @@
+ fi
+ 
+ 
++# Check whether --enable-poison-system-directories was given.
++if test "${enable_poison_system_directories+set}" = set; then :
++  enableval=$enable_poison_system_directories;
++else
++  enable_poison_system_directories=no
++fi
++
++if test "x${enable_poison_system_directories}" = "xyes"; then
++
++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
++
++fi
++
+ # Substitute configuration variables
+ 
+ 
+Index: b/gcc/configure.ac
+===================================================================
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -5571,6 +5571,16 @@
+                 [specify that runtime libraries should be
+                  installed in a compiler-specific directory])])
+ 
++AC_ARG_ENABLE([poison-system-directories],
++             AS_HELP_STRING([--enable-poison-system-directories],
++                            [warn for use of native system header directories]),,
++             [enable_poison_system_directories=no])
++if test "x${enable_poison_system_directories}" = "xyes"; then
++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
++           [1],
++           [Define to warn for use of native system header directories])
++fi
++
+ # Substitute configuration variables
+ AC_SUBST(subdirs)
+ AC_SUBST(srcdir)
+Index: b/gcc/doc/invoke.texi
+===================================================================
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -269,6 +269,7 @@
+ -Woverlength-strings  -Wpacked  -Wpacked-bitfield-compat  -Wpadded @gol
+ -Wparentheses  -Wpedantic-ms-format -Wno-pedantic-ms-format @gol
+ -Wpointer-arith  -Wno-pointer-to-int-cast @gol
++-Wno-poison-system-directories @gol
+ -Wredundant-decls  -Wno-return-local-addr @gol
+ -Wreturn-type  -Wsequence-point  -Wshadow  -Wno-shadow-ivar @gol
+ -Wshift-count-negative -Wshift-count-overflow @gol
+@@ -4432,6 +4433,14 @@
+ most targets, it is made up of code and thus requires the stack to be
+ made executable in order for the program to work properly.
+ 
++ at item -Wno-poison-system-directories
++ at opindex Wno-poison-system-directories
++Do not warn for @option{-I} or @option{-L} options using system
++directories such as @file{/usr/include} when cross compiling.  This
++option is intended for use in chroot environments when such
++directories contain the correct headers and libraries for the target
++system rather than the host.
++
+ @item -Wfloat-equal
+ @opindex Wfloat-equal
+ @opindex Wno-float-equal
+Index: b/gcc/gcc.c
+===================================================================
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -835,6 +835,8 @@
+    "%{fuse-ld=*:-fuse-ld=%*} " LINK_COMPRESS_DEBUG_SPEC \
+    "%X %{o*} %{e*} %{N} %{n} %{r}\
+     %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:%S}} " VTABLE_VERIFICATION_SPEC " \
++    %{Wno-poison-system-directories:--no-poison-system-directories}\
++    %{Werror=poison-system-directories:--error-poison-system-directories}\
+     %{static:} %{L*} %(mfwrap) %(link_libgcc) " SANITIZER_EARLY_SPEC " %o\
+     " CHKP_SPEC " \
+     %{fopenacc|fopenmp|ftree-parallelize-loops=*:%:include(libgomp.spec)%(link_gomp)}\
+@@ -4244,6 +4246,12 @@
+       gcc_assert (!compare_debug_opt);
+     }
+ 
++  temp = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
++  if (temp && strlen(temp) > 0)
++    {
++      save_switch("-Werror=poison-system-directories", 0, NULL, false, true);
++    }
++
+   /* Set up the search paths.  We add directories that we expect to
+      contain GNU Toolchain components before directories specified by
+      the machine description so that we will find GNU components (like
+Index: b/gcc/incpath.c
+===================================================================
+--- a/gcc/incpath.c
++++ b/gcc/incpath.c
+@@ -28,6 +28,7 @@
+ #include "intl.h"
+ #include "incpath.h"
+ #include "cppdefault.h"
++#include "diagnostic-core.h"
+ 
+ /* Microsoft Windows does not natively support inodes.
+    VMS has non-numeric inodes.  */
+@@ -383,6 +384,24 @@
+ 	}
+       fprintf (stderr, _("End of search list.\n"));
+     }
++
++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
++  if (flag_poison_system_directories)
++    {
++       struct cpp_dir *p;
++
++       for (p = heads[QUOTE]; p; p = p->next)
++         {
++          if ((!strncmp (p->name, "/usr/include", 12))
++              || (!strncmp (p->name, "/usr/local/include", 18))
++              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
++            warning (OPT_Wpoison_system_directories,
++                     "include location \"%s\" is unsafe for "
++                     "cross-compilation",
++                     p->name);
++         }
++    }
++#endif
+ }
+ 
+ /* Use given -I paths for #include "..." but not #include <...>, and
diff --git a/package/gcc/5.1.0/201-libgcc-remove-unistd-header.patch b/package/gcc/5.1.0/201-libgcc-remove-unistd-header.patch
new file mode 100644
index 0000000..20d1c06
--- /dev/null
+++ b/package/gcc/5.1.0/201-libgcc-remove-unistd-header.patch
@@ -0,0 +1,14 @@
+Upstream status: In progress
+
+Index: b/libgcc/config/nios2/linux-atomic.c
+===================================================================
+--- a/libgcc/config/nios2/linux-atomic.c
++++ b/libgcc/config/nios2/linux-atomic.c
+@@ -20,7 +20,6 @@
+ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ <http://www.gnu.org/licenses/>.  */
+ 
+-#include <asm/unistd.h>
+ #define EFAULT  14
+ #define EBUSY   16
+ #define ENOSYS  38
diff --git a/package/gcc/5.1.0/301-missing-execinfo_h.patch b/package/gcc/5.1.0/301-missing-execinfo_h.patch
new file mode 100644
index 0000000..2d0e7ba
--- /dev/null
+++ b/package/gcc/5.1.0/301-missing-execinfo_h.patch
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
diff --git a/package/gcc/5.1.0/810-arm-softfloat-libgcc.patch b/package/gcc/5.1.0/810-arm-softfloat-libgcc.patch
new file mode 100644
index 0000000..5efa7fd
--- /dev/null
+++ b/package/gcc/5.1.0/810-arm-softfloat-libgcc.patch
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
diff --git a/package/gcc/5.1.0/830-arm_unbreak_armv4t.patch b/package/gcc/5.1.0/830-arm_unbreak_armv4t.patch
new file mode 100644
index 0000000..b730059
--- /dev/null
+++ b/package/gcc/5.1.0/830-arm_unbreak_armv4t.patch
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
diff --git a/package/gcc/5.1.0/840-microblaze-enable-dwarf-eh-support.patch b/package/gcc/5.1.0/840-microblaze-enable-dwarf-eh-support.patch
new file mode 100644
index 0000000..9d29090
--- /dev/null
+++ b/package/gcc/5.1.0/840-microblaze-enable-dwarf-eh-support.patch
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
diff --git a/package/gcc/5.1.0/850-libstdcxx-uclibc-c99.patch b/package/gcc/5.1.0/850-libstdcxx-uclibc-c99.patch
new file mode 100644
index 0000000..9e97d94
--- /dev/null
+++ b/package/gcc/5.1.0/850-libstdcxx-uclibc-c99.patch
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
diff --git a/package/gcc/5.1.0/860-cilk-wchar.patch b/package/gcc/5.1.0/860-cilk-wchar.patch
new file mode 100644
index 0000000..1d9916f
--- /dev/null
+++ b/package/gcc/5.1.0/860-cilk-wchar.patch
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
diff --git a/package/gcc/5.1.0/900-libitm-fixes-for-musl-support.patch b/package/gcc/5.1.0/900-libitm-fixes-for-musl-support.patch
new file mode 100644
index 0000000..fdf4ee7
--- /dev/null
+++ b/package/gcc/5.1.0/900-libitm-fixes-for-musl-support.patch
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
diff --git a/package/gcc/5.1.0/901-fixincludes-update-for-musl-support.patch b/package/gcc/5.1.0/901-fixincludes-update-for-musl-support.patch
new file mode 100644
index 0000000..13c08d6
--- /dev/null
+++ b/package/gcc/5.1.0/901-fixincludes-update-for-musl-support.patch
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
diff --git a/package/gcc/5.1.0/902-unwind-fix-for-musl.patch b/package/gcc/5.1.0/902-unwind-fix-for-musl.patch
new file mode 100644
index 0000000..ef47054
--- /dev/null
+++ b/package/gcc/5.1.0/902-unwind-fix-for-musl.patch
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
diff --git a/package/gcc/5.1.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch b/package/gcc/5.1.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
new file mode 100644
index 0000000..c852131
--- /dev/null
+++ b/package/gcc/5.1.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
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
diff --git a/package/gcc/5.1.0/904-musl-libc-config.patch b/package/gcc/5.1.0/904-musl-libc-config.patch
new file mode 100644
index 0000000..c4eddb4
--- /dev/null
+++ b/package/gcc/5.1.0/904-musl-libc-config.patch
@@ -0,0 +1,321 @@
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
+@@ -27681,6 +27681,9 @@
+ else
+   gcc_cv_libc_provides_ssp=no
+     case "$target" in
++       *-*-musl*)
++	 # All versions of musl provide stack protector
++	 gcc_cv_libc_provides_ssp=yes;;
+        *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
+       # glibc 2.4 and later provides __stack_chk_fail and
+       # either __stack_chk_guard, or TLS access to stack guard canary.
+@@ -27713,6 +27716,7 @@
+ 	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
+ 	 # simply assert that glibc does provide this, which is true for all
+ 	 # realistically usable GNU/Hurd configurations.
++	 # All supported versions of musl provide it as well
+ 	 gcc_cv_libc_provides_ssp=yes;;
+        *-*-darwin* | *-*-freebsd*)
+ 	 ac_fn_c_check_func "$LINENO" "__stack_chk_fail" "ac_cv_func___stack_chk_fail"
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
+@@ -5199,6 +5199,9 @@
+       gcc_cv_libc_provides_ssp,
+       [gcc_cv_libc_provides_ssp=no
+     case "$target" in
++       *-*-musl*)
++	 # All versions of musl provide stack protector
++	 gcc_cv_libc_provides_ssp=yes;;
+        *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
+       # glibc 2.4 and later provides __stack_chk_fail and
+       # either __stack_chk_guard, or TLS access to stack guard canary.
+@@ -5225,6 +5228,7 @@
+ 	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
+ 	 # simply assert that glibc does provide this, which is true for all
+ 	 # realistically usable GNU/Hurd configurations.
++	 # All supported versions of musl provide it as well
+ 	 gcc_cv_libc_provides_ssp=yes;;
+        *-*-darwin* | *-*-freebsd*)
+ 	 AC_CHECK_FUNC(__stack_chk_fail,[gcc_cv_libc_provides_ssp=yes],
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
diff --git a/package/gcc/5.1.0/905-add-musl-support-to-gcc.patch b/package/gcc/5.1.0/905-add-musl-support-to-gcc.patch
new file mode 100644
index 0000000..92e7436
--- /dev/null
+++ b/package/gcc/5.1.0/905-add-musl-support-to-gcc.patch
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
diff --git a/package/gcc/5.1.0/906-mips-musl-support.patch b/package/gcc/5.1.0/906-mips-musl-support.patch
new file mode 100644
index 0000000..6b473f9
--- /dev/null
+++ b/package/gcc/5.1.0/906-mips-musl-support.patch
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
diff --git a/package/gcc/5.1.0/907-x86-musl-support.patch b/package/gcc/5.1.0/907-x86-musl-support.patch
new file mode 100644
index 0000000..3f2fe5d
--- /dev/null
+++ b/package/gcc/5.1.0/907-x86-musl-support.patch
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
diff --git a/package/gcc/5.1.0/908-arm-musl-support.patch b/package/gcc/5.1.0/908-arm-musl-support.patch
new file mode 100644
index 0000000..906355a
--- /dev/null
+++ b/package/gcc/5.1.0/908-arm-musl-support.patch
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
diff --git a/package/gcc/5.1.0/909-aarch64-musl-support.patch b/package/gcc/5.1.0/909-aarch64-musl-support.patch
new file mode 100644
index 0000000..3d032f5
--- /dev/null
+++ b/package/gcc/5.1.0/909-aarch64-musl-support.patch
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
index cf96c73..578e24f 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -78,6 +78,13 @@ choice
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 
+	config BR2_GCC_VERSION_5_1_X
+		bool "gcc 5.1.x"
+		# Broken or unsupported architectures
+		depends on !BR2_arc
+		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GRAPHITE
+
 endchoice
 
 config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
@@ -90,6 +97,7 @@ config BR2_GCC_VERSION
 	default "4.7.4"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.4"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.2"     if BR2_GCC_VERSION_4_9_X
+	default "5.1.0"     if BR2_GCC_VERSION_5_1_X
 	default "arc-2014.12" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 5eec97f..f7a6c94 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,5 +6,7 @@ sha512  dfcb737073191e628231031a3571ec77ee760a59377630f4a6e4fdfa66f9ddad39fde47e
 sha512  b4c84ebd754c026029d706ef52c4242df4dcadc6a22cc5669b3aa37ac9dc25bc9cd9651fda83fb24dd5d17b1710e6865a35bb6c5cd9b95d0971717453935ae8e  gcc-4.8.4.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.2/sha512.sum
 sha512  e96cba06d572dbe7f382a2b00fd9297dcf9f9219d46a9ad0bd904dc36d5e7db3335e422640b79a27fed6fde91b0731732b94a0e2fbcd47344d6779f8ba1f4f9c  gcc-4.9.2.tar.bz2
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.1.0/sha512.sum
+sha512  30f6a94d3adb25bc51fcaddf32a6c41429f569eeb9ed64330445b1296f99998fbfa03277b375be4f7b2b80f519910ef88e4149db7cd9031e2c61a49f501bde94  gcc-5.1.0.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
 none  xxx  gcc-arc-2014.12.tar.gz
