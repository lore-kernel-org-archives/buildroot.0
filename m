From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 10:37:36 +0100
Subject: [Buildroot] [PATCH v3 1/3] gdb: convert to the package
	infrastructure
In-Reply-To: <1364117858-6626-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364117858-6626-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364117858-6626-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit converts gdb to the package infrastructure, and therefore
moves it from toolchain/gdb to package/gdb.

The target package is now visible in "Package selection for the
target" => "Debugging, profiling and benchmark". The main option,
"gdb", forcefully selects the "gdbserver" sub-option by
default. Another sub-option, "full debugger" allows to install the
complete gdb on the target. When this option is enabled, then
"gdbserver" is no longer forcefully selected. This ensures that at
least gdbserver or the full debugger gets built/installed, so that the
package is not a no-op.

The host debugger is still enabled through a configuration option in
"Toolchain". It is now visible regardless of the toolchain type (it
used to be hidden for External Toolchains). The configuration options
relative to the host debugger are now in package/gdb/Config.in.host,
similar to how we have package/binutils/Config.in.host.

Since gdb is now a proper package, it is no longer allowed to 'select
BR2_PTHREADS_DEBUG' to ensure thread debugging is available when
needed. Instead, it now 'depends on
BR2_TOOLCHAIN_HAS_THREADS_DEBUG'. This option, in turn, is select by
the different toolchain backends when appropriate. The
'BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED' option is removed, since
we no longer need to know when it is allowed to 'select
BR2_PTHREADS_DEBUG'. Also, the 'BR2_PTHREADS_DEBUG' option is moved to
appear right below the thread implementation selection (in the case of
the Buildroot toolchain backend).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes from v1 to v2:

 * Fixup the help text of BR2_PACKAGE_GDB to mention in which menu the
   cross-gdb can be enable, and the fact that external toolchains
   often provide their own pre-built versions of cross-gdb and
   gdbserver. Suggested by Arnout.

 * No longer 'select BR2_PTHREAD_DEBUG' from the gdb package. As
   Arnout noticed, now that gdb is a normal package, it should not
   forcefully select a toolchain configuration option. Instead, it
   should depend on it being available. This allows to remove the
   BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED option: we now only have
   the BR2_TOOLCHAIN_HAS_THREADS_DEBUG, which gets selected by the
   various toolchain backends when appropriate, and the gdb package
   depends on it.

 * Factorize the definition of GDB_SITE. Suggested by Arnout.

 * Add a small comment that explains why we remove /usr/share/gdb from
   the target. Suggested by Arnout.
---
 Config.in.legacy                                   |    9 +
 package/Config.in                                  |    1 +
 package/gdb/6.6a/100-uclibc-conf.patch             |   82 +++++
 .../gdb/6.6a/600-fix-compile-flag-mismatch.patch   |   69 +++++
 package/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch      |  238 +++++++++++++++
 package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch   |  314 ++++++++++++++++++++
 package/gdb/7.4.1/05_all_readline-headers.patch    |   42 +++
 package/gdb/7.4.1/xtensa-asm-ptrace-h.patch        |   22 ++
 package/gdb/7.4.1/xtensa-gdb-regsize.patch         |   19 ++
 package/gdb/Config.in                              |   40 +++
 package/gdb/Config.in.host                         |   56 ++++
 package/gdb/gdb.mk                                 |  101 +++++++
 toolchain/Config.in                                |    2 -
 toolchain/gdb/6.6a/100-uclibc-conf.patch           |   82 -----
 .../gdb/6.6a/600-fix-compile-flag-mismatch.patch   |   69 -----
 toolchain/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch    |  238 ---------------
 toolchain/gdb/7.4.1/00_all_ptrace_setsiginfo.patch |  314 --------------------
 toolchain/gdb/7.4.1/05_all_readline-headers.patch  |   42 ---
 toolchain/gdb/7.4.1/xtensa-asm-ptrace-h.patch      |   22 --
 toolchain/gdb/7.4.1/xtensa-gdb-regsize.patch       |   19 --
 toolchain/gdb/Config.in                            |   99 ------
 toolchain/gdb/gdb.mk                               |  234 ---------------
 toolchain/toolchain-buildroot.mk                   |    1 -
 toolchain/toolchain-buildroot/Config.in.2          |    7 +
 toolchain/toolchain-common.in                      |    7 +-
 toolchain/toolchain-crosstool-ng.mk                |    1 -
 toolchain/toolchain-crosstool-ng/Config.in         |    3 +
 toolchain/toolchain-external.mk                    |    1 -
 toolchain/toolchain-external/Config.in             |    7 +
 toolchain/uClibc/Config.in                         |    6 -
 30 files changed, 1011 insertions(+), 1136 deletions(-)
 create mode 100644 package/gdb/6.6a/100-uclibc-conf.patch
 create mode 100644 package/gdb/6.6a/600-fix-compile-flag-mismatch.patch
 create mode 100644 package/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
 create mode 100644 package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
 create mode 100644 package/gdb/7.4.1/05_all_readline-headers.patch
 create mode 100644 package/gdb/7.4.1/xtensa-asm-ptrace-h.patch
 create mode 100644 package/gdb/7.4.1/xtensa-gdb-regsize.patch
 create mode 100644 package/gdb/Config.in
 create mode 100644 package/gdb/Config.in.host
 create mode 100644 package/gdb/gdb.mk
 delete mode 100644 toolchain/gdb/6.6a/100-uclibc-conf.patch
 delete mode 100644 toolchain/gdb/6.6a/600-fix-compile-flag-mismatch.patch
 delete mode 100644 toolchain/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
 delete mode 100644 toolchain/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
 delete mode 100644 toolchain/gdb/7.4.1/05_all_readline-headers.patch
 delete mode 100644 toolchain/gdb/7.4.1/xtensa-asm-ptrace-h.patch
 delete mode 100644 toolchain/gdb/7.4.1/xtensa-gdb-regsize.patch
 delete mode 100644 toolchain/gdb/Config.in
 delete mode 100644 toolchain/gdb/gdb.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 43e2afe..2bdef1f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -67,6 +67,15 @@ config BR2_PACKAGE_GDISK_SGDISK
 	help
 	  The option has been renamed BR2_PACKAGE_GPTFDISK_SGDISK.
 
+config BR2_PACKAGE_GDB_HOST
+	bool "gdb for the host option has been renamed"
+	select BR2_PACKAGE_HOST_GDB
+	select BR2_LEGACY
+	help
+	  Due to the conversion of gdb to the package infrastructure,
+	  the BR2_PACKAGE_GDB_HOST option has been renamed
+	  BR2_PACKAGE_HOST_GDB.
+
 #
 # Legacy options since 2012.11
 #
diff --git a/package/Config.in b/package/Config.in
index 94e279b..2cfb4b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -22,6 +22,7 @@ source "package/cache-calibrator/Config.in"
 source "package/dhrystone/Config.in"
 source "package/dstat/Config.in"
 source "package/dmalloc/Config.in"
+source "package/gdb/Config.in"
 source "package/kexec/Config.in"
 source "package/latencytop/Config.in"
 source "package/lmbench/Config.in"
diff --git a/package/gdb/6.6a/100-uclibc-conf.patch b/package/gdb/6.6a/100-uclibc-conf.patch
new file mode 100644
index 0000000..a790b6f
--- /dev/null
+++ b/package/gdb/6.6a/100-uclibc-conf.patch
@@ -0,0 +1,82 @@
+diff -rNdup gdb-6.6.orig/bfd/configure gdb-6.6/bfd/configure
+--- gdb-6.6.orig/bfd/configure	2006-10-25 08:49:20.000000000 +0200
++++ gdb-6.6/bfd/configure	2007-05-14 10:35:50.000000000 +0200
+@@ -3579,6 +3579,11 @@ linux-gnu*)
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+ 
++linux-uclibc*)
++  lt_cv_deplibs_check_method=pass_all
++  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
++  ;;
++
+ netbsd* | knetbsd*-gnu)
+   if echo __ELF__ | $CC -E - | grep __ELF__ > /dev/null; then
+     lt_cv_deplibs_check_method='match_pattern /lib[^/\.]+\.so\.[0-9]+\.[0-9]+$'
+diff -rNdup gdb-6.6.orig/libtool.m4 gdb-6.6/libtool.m4
+--- gdb-6.6.orig/libtool.m4	2005-12-27 17:37:57.000000000 +0100
++++ gdb-6.6/libtool.m4	2007-05-14 10:35:50.000000000 +0200
+@@ -751,6 +751,11 @@ netbsd* | knetbsd*-gnu)
+   fi
+   ;;
+ 
++linux-uclibc*)
++  lt_cv_deplibs_check_method=pass_all
++  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
++  ;;
++
+ newsos6)
+   [lt_cv_deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [ML]SB (executable|dynamic lib)']
+   lt_cv_file_magic_cmd=/usr/bin/file
+diff -rNdup gdb-6.6.orig/ltconfig gdb-6.6/ltconfig
+--- gdb-6.6.orig/ltconfig	2006-07-04 22:31:03.000000000 +0200
++++ gdb-6.6/ltconfig	2007-05-14 10:35:50.000000000 +0200
+@@ -602,7 +602,7 @@ host_os=`echo $host | sed 's/^\([^-]*\)-
+ 
+ # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
+ case $host_os in
+-linux-gnu*) ;;
++linux-gnu*|linux-uclibc*) ;;
+ linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
+ esac
+ 
+@@ -1270,6 +1270,24 @@ linux-gnu*)
+   dynamic_linker='GNU/Linux ld.so'
+   ;;
+ 
++linux-uclibc*)
++  version_type=linux
++  need_lib_prefix=no
++  need_version=no
++  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
++  soname_spec='${libname}${release}.so$major'
++  finish_cmds='PATH="\$PATH:/sbin" ldconfig -n $libdir'
++  shlibpath_var=LD_LIBRARY_PATH
++  shlibpath_overrides_runpath=no
++  # This implies no fast_install, which is unacceptable.
++  # Some rework will be needed to allow for fast_install
++  # before this can be enabled.
++  # Note: copied from linux-gnu, and may not be appropriate.
++  hardcode_into_libs=yes
++  # Assume using the uClibc dynamic linker.
++  dynamic_linker="uClibc ld.so"
++  ;;
++
+ netbsd*)
+   need_lib_prefix=no
+   need_version=no
+diff -rNdup gdb-6.6.orig/opcodes/configure gdb-6.6/opcodes/configure
+--- gdb-6.6.orig/opcodes/configure	2006-10-25 08:49:20.000000000 +0200
++++ gdb-6.6/opcodes/configure	2007-05-14 10:35:50.000000000 +0200
+@@ -3590,6 +3590,11 @@ netbsd* | knetbsd*-gnu)
+   fi
+   ;;
+ 
++linux-uclibc*)
++  lt_cv_deplibs_check_method=pass_all
++  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
++  ;;
++
+ newsos6)
+   lt_cv_deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [ML]SB (executable|dynamic lib)'
+   lt_cv_file_magic_cmd=/usr/bin/file
diff --git a/package/gdb/6.6a/600-fix-compile-flag-mismatch.patch b/package/gdb/6.6a/600-fix-compile-flag-mismatch.patch
new file mode 100644
index 0000000..60f0ace
--- /dev/null
+++ b/package/gdb/6.6a/600-fix-compile-flag-mismatch.patch
@@ -0,0 +1,69 @@
+diff -rduNp gdb-6.6-100/Makefile.in gdb-6.6/Makefile.in
+--- gdb-6.6-100/Makefile.in	2006-12-18 08:21:19.000000000 +0100
++++ gdb-6.6/Makefile.in	2007-05-14 10:54:29.000000000 +0200
+@@ -331,7 +331,7 @@ COMPILER_NM_FOR_TARGET=@COMPILER_NM_FOR_
+ # CFLAGS will be just -g.  We want to ensure that TARGET libraries
+ # (which we know are built with gcc) are built with optimizations so
+ # prepend -O2 when setting CFLAGS_FOR_TARGET.
+-CFLAGS_FOR_TARGET = -O2 $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
++CFLAGS_FOR_TARGET = $(strip $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
+ SYSROOT_CFLAGS_FOR_TARGET = @SYSROOT_CFLAGS_FOR_TARGET@
+ CXXFLAGS_FOR_TARGET = $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
+ LIBCFLAGS_FOR_TARGET = $(CFLAGS_FOR_TARGET)
+diff -rduNp gdb-6.6-100/Makefile.tpl gdb-6.6/Makefile.tpl
+--- gdb-6.6-100/Makefile.tpl	2006-11-15 00:26:39.000000000 +0100
++++ gdb-6.6/Makefile.tpl	2007-05-14 10:54:29.000000000 +0200
+@@ -334,7 +334,7 @@ COMPILER_NM_FOR_TARGET=@COMPILER_NM_FOR_
+ # CFLAGS will be just -g.  We want to ensure that TARGET libraries
+ # (which we know are built with gcc) are built with optimizations so
+ # prepend -O2 when setting CFLAGS_FOR_TARGET.
+-CFLAGS_FOR_TARGET = -O2 $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
++CFLAGS_FOR_TARGET = $(strip $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
+ SYSROOT_CFLAGS_FOR_TARGET = @SYSROOT_CFLAGS_FOR_TARGET@
+ CXXFLAGS_FOR_TARGET = $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
+ LIBCFLAGS_FOR_TARGET = $(CFLAGS_FOR_TARGET)
+diff -rduNp gdb-6.6-100/gdb/configure gdb-6.6/gdb/configure
+--- gdb-6.6-100/gdb/configure	2006-12-17 16:38:59.000000000 +0100
++++ gdb-6.6/gdb/configure	2007-05-14 10:55:41.000000000 +0200
+@@ -272,7 +272,7 @@ PACKAGE_STRING=
+ PACKAGE_BUGREPORT=
+ 
+ ac_unique_file="main.c"
+-ac_subdirs_all="$ac_subdirs_all doc testsuite"
++ac_subdirs_all="$ac_subdirs_all doc"
+ # Factoring default headers for most tests.
+ ac_includes_default="\
+ #include <stdio.h>
+@@ -3055,7 +3055,7 @@ _ACEOF
+ 
+ 
+ 
+-subdirs="$subdirs doc testsuite"
++subdirs="$subdirs doc"
+ 
+ 
+ # Provide defaults for some variables set by the per-host and per-target
+diff -rduNp gdb-6.6-100/gdb/gdbserver/configure gdb-6.6/gdb/gdbserver/configure
+--- gdb-6.6-100/gdb/gdbserver/configure	2006-11-22 01:10:19.000000000 +0100
++++ gdb-6.6/gdb/gdbserver/configure	2007-05-14 10:54:29.000000000 +0200
+@@ -1239,7 +1239,7 @@ echo "$as_me: error: \`$ac_var' was not 
+       ac_cache_corrupted=: ;;
+     ,);;
+     *)
+-      if test "x$ac_old_val" != "x$ac_new_val"; then
++      if test "`echo $ac_old_val`" != "`echo $ac_new_val`"; then
+ 	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
+ echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
+ 	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
+diff -rduNp gdb-6.6-100/gdb/testsuite/configure gdb-6.6/gdb/testsuite/configure
+--- gdb-6.6-100/gdb/testsuite/configure	2006-06-21 15:57:21.000000000 +0200
++++ gdb-6.6/gdb/testsuite/configure	2007-05-14 10:54:29.000000000 +0200
+@@ -1248,7 +1248,7 @@ echo "$as_me: error: \`$ac_var' was not 
+       ac_cache_corrupted=: ;;
+     ,);;
+     *)
+-      if test "x$ac_old_val" != "x$ac_new_val"; then
++      if test "`echo $ac_old_val" != "`echo $ac_new_val"; then
+ 	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
+ echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
+ 	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
diff --git a/package/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch b/package/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
new file mode 100644
index 0000000..65c4b90
--- /dev/null
+++ b/package/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
@@ -0,0 +1,238 @@
+--- gdb-6.6/gdb/gdbserver/configure.srv
++++ gdb-6.6/gdb/gdbserver/configure.srv
+@@ -23,6 +23,11 @@ case "${target}" in
+ 			srv_linux_usrregs=yes
+ 			srv_linux_thread_db=yes
+ 			;;
++  bfin-*-*)		srv_regobj=reg-bfin.o
++			srv_tgtobj="linux-low.o linux-bfin-low.o"
++			srv_linux_usrregs=yes
++			srv_linux_thread_db=yes
++			;;
+   crisv32-*-linux*)	srv_regobj=reg-crisv32.o
+ 			srv_tgtobj="linux-low.o linux-crisv32-low.o"
+ 			srv_linux_regsets=yes
+--- gdb-6.6/gdb/gdbserver/linux-bfin-low.c
++++ gdb-6.6/gdb/gdbserver/linux-bfin-low.c
+@@ -0,0 +1,101 @@
++/* GNU/Linux/BFIN specific low level interface, for the remote server for GDB.
++
++   Copyright (C) 2005 Free Software Foundation, Inc.
++   Contributed by Analog Devices.
++
++   This file is part of GDB.
++
++   This program is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by
++   the Free Software Foundation; either version 2 of the License, or
++   (at your option) any later version.
++
++   This program is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++   GNU General Public License for more details.
++
++   You should have received a copy of the GNU General Public License
++   along with this program; if not, write to the Free Software
++   Foundation, Inc., 51 Franklin Street, Fifth Floor,
++   Boston, MA 02110-1301, USA.  */
++
++#include "server.h"
++#include "linux-low.h"
++#include <asm/ptrace.h>
++ 
++static int bfin_regmap[] =
++{
++  PT_R0, PT_R1, PT_R2, PT_R3, PT_R4, PT_R5, PT_R6, PT_R7,
++  PT_P0, PT_P1, PT_P2, PT_P3, PT_P4, PT_P5, PT_USP, PT_FP,
++  PT_I0, PT_I1, PT_I2, PT_I3, PT_M0, PT_M1, PT_M2, PT_M3,
++  PT_B0, PT_B1, PT_B2, PT_B3, PT_L0, PT_L1, PT_L2, PT_L3,
++  PT_A0X, PT_A0W, PT_A1X, PT_A1W, PT_ASTAT, PT_RETS,
++  PT_LC0, PT_LT0, PT_LB0, PT_LC1, PT_LT1, PT_LB1,
++  -1 /* PT_CYCLES */, -1 /* PT_CYCLES2 */,
++  -1 /* PT_USP */, PT_SEQSTAT, PT_SYSCFG, PT_PC, PT_RETX, PT_RETN, PT_RETE,
++  PT_PC, -1 /* PT_CC */, PT_TEXT_ADDR, PT_TEXT_END_ADDR, PT_DATA_ADDR,
++  PT_FDPIC_EXEC, PT_FDPIC_INTERP,
++  PT_IPEND
++};
++
++#define bfin_num_regs  (sizeof(bfin_regmap) / sizeof(bfin_regmap[0]))
++
++static int
++bfin_cannot_store_register (int regno)
++{
++  return (regno >= bfin_num_regs);
++}
++
++static int
++bfin_cannot_fetch_register (int regno)
++{
++  return (regno >= bfin_num_regs);
++}
++
++static CORE_ADDR
++bfin_get_pc ()
++{
++  unsigned long pc;
++  collect_register_by_name ("pc", &pc);
++  return pc;
++}
++
++static void
++bfin_set_pc (CORE_ADDR pc)
++{
++  unsigned long newpc = pc;
++  supply_register_by_name ("pc", &newpc);
++}
++
++#define bfin_breakpoint_len 2
++static const unsigned char bfin_breakpoint[bfin_breakpoint_len]={0xa1, 0x00};
++
++static int
++bfin_breakpoint_at (CORE_ADDR where)
++{
++  unsigned char insn[bfin_breakpoint_len];
++
++  read_inferior_memory(where, insn, bfin_breakpoint_len);
++  if (insn[0] == bfin_breakpoint[0]
++      && insn[1] == bfin_breakpoint[1])
++    return 1;
++
++  /* If necessary, recognize more trap instructions here.  GDB only uses the
++     one.  */
++  return 0;
++}
++
++struct linux_target_ops the_low_target = {
++  bfin_num_regs,
++  bfin_regmap,
++  bfin_cannot_fetch_register,
++  bfin_cannot_store_register,
++  bfin_get_pc,
++  bfin_set_pc,
++  bfin_breakpoint,
++  bfin_breakpoint_len,
++  0,
++  2,
++  bfin_breakpoint_at,
++};
+--- gdb-6.6/gdb/gdbserver/linux-low.c
++++ gdb-6.6/gdb/gdbserver/linux-low.c
+@@ -1592,6 +1592,10 @@ linux_stopped_data_address (void)
+ #define PT_TEXT_ADDR 49*4
+ #define PT_DATA_ADDR 50*4
+ #define PT_TEXT_END_ADDR  51*4
++#elif defined(BFIN)
++#define PT_TEXT_ADDR 220
++#define PT_TEXT_END_ADDR 224
++#define PT_DATA_ADDR 228
+ #endif
+ 
+ /* Under uClinux, programs are loaded at non-zero offsets, which we need
+--- gdb-6.6/gdb/gdbserver/Makefile.in
++++ gdb-6.6/gdb/gdbserver/Makefile.in
+@@ -119,9 +119,9 @@ SFILES=	$(srcdir)/gdbreplay.c $(srcdir)/
+ 	$(srcdir)/mem-break.c $(srcdir)/proc-service.c $(srcdir)/regcache.c \
+ 	$(srcdir)/remote-utils.c $(srcdir)/server.c $(srcdir)/target.c \
+ 	$(srcdir)/thread-db.c $(srcdir)/utils.c \
+-	$(srcdir)/linux-arm-low.c $(srcdir)/linux-cris-low.c \
+-	$(srcdir)/linux-crisv32-low.c $(srcdir)/linux-i386-low.c \
+-	$(srcdir)/i387-fp.c \
++	$(srcdir)/linux-arm-low.c $(srcdir)/linux-bfin-low.c \
++	$(srcdir)/linux-cris-low.c $(srcdir)/linux-crisv32-low.c \
++	$(srcdir)/linux-i386-low.c $(srcdir)/i387-fp.c \
+ 	$(srcdir)/linux-ia64-low.c $(srcdir)/linux-low.c \
+ 	$(srcdir)/linux-m32r-low.c \
+ 	$(srcdir)/linux-m68k-low.c $(srcdir)/linux-mips-low.c \
+@@ -207,6 +207,7 @@ clean:
+ 	rm -f reg-arm.c reg-i386.c reg-ia64.c reg-m32r.c reg-m68k.c reg-mips.c
+ 	rm -f reg-ppc.c reg-sh.c reg-spu.c reg-x86-64.c reg-i386-linux.c
+ 	rm -f reg-cris.c reg-crisv32.c reg-x86-64-linux.c
++	rm -f reg-bfin.c
+ 
+ maintainer-clean realclean distclean: clean
+ 	rm -f nm.h tm.h xm.h config.status config.h stamp-h config.log
+@@ -272,6 +273,7 @@ linux-low.o: linux-low.c $(linux_low_h) 
+ 
+ linux-arm-low.o: linux-arm-low.c $(linux_low_h) $(server_h) \
+ 	$(gdb_proc_service_h)
++linux-bfin-low.o: linux-bfin-low.c $(linux_low_h) $(server_h)
+ linux-cris-low.o: linux-cris-low.c $(linux_low_h) $(server_h)
+ linux-crisv32-low.o: linux-crisv32-low.c $(linux_low_h) $(server_h)
+ linux-i386-low.o: linux-i386-low.c $(linux_low_h) $(server_h) \
+@@ -294,6 +297,9 @@ spu-low.o: spu-low.c $(server_h)
+ reg-arm.o : reg-arm.c $(regdef_h)
+ reg-arm.c : $(srcdir)/../regformats/reg-arm.dat $(regdat_sh)
+ 	sh $(regdat_sh) $(srcdir)/../regformats/reg-arm.dat reg-arm.c
++reg-bfin.o : reg-bfin.c $(regdef_h)
++reg-bfin.c : $(srcdir)/../regformats/reg-bfin.dat $(regdat_sh)
++	sh $(regdat_sh) $(srcdir)/../regformats/reg-bfin.dat reg-bfin.c
+ reg-cris.o : reg-cris.c $(regdef_h)
+ reg-cris.c : $(srcdir)/../regformats/reg-cris.dat $(regdat_sh)
+ 	sh $(regdat_sh) $(srcdir)/../regformats/reg-cris.dat reg-cris.c
+--- gdb-6.6/gdb/regformats/reg-bfin.dat
++++ gdb-6.6/gdb/regformats/reg-bfin.dat
+@@ -0,0 +1,63 @@
++name:bfin
++expedite:pc,sp,fp
++32:r0
++32:r1
++32:r2
++32:r3
++32:r4
++32:r5
++32:r6
++32:r7
++32:p0
++32:p1
++32:p2
++32:p3
++32:p4
++32:p5
++32:sp
++32:fp
++32:i0
++32:i1
++32:i2
++32:i3
++32:m0
++32:m1
++32:m2
++32:m3
++32:b0
++32:b1
++32:b2
++32:b3
++32:l0
++32:l1
++32:l2
++32:l3
++32:a0x
++32:a0w
++32:a1x
++32:a1w
++32:astat
++32:rets 
++32:lc0
++32:lt0
++32:lb0
++32:lc1
++32:lt1
++32:lb1
++32:cycles
++32:cycles2
++32:usp
++32:seqstat
++32:syscfg
++32:reti
++32:retx
++32:retn
++32:rete
++32:pc
++32:cc
++32:text_addr
++32:text_end_addr
++32:data_addr
++32:fdpic_exec
++32:fdpic_interp
++32:ipend
diff --git a/package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch b/package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
new file mode 100644
index 0000000..81a92db
--- /dev/null
+++ b/package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
@@ -0,0 +1,314 @@
+fix from upstream for building with newer kernel headers
+
+From a7f9ca9cb797d653dc7919538e1dfa0c26010331 Mon Sep 17 00:00:00 2001
+From: tschwinge <tschwinge>
+Date: Wed, 21 Mar 2012 13:43:50 +0000
+Subject: [PATCH] struct siginfo vs. siginfo_t
+
+gdb/
+	* amd64-linux-nat.c (amd64_linux_siginfo_fixup): Use siginfo_t instead
+	of struct siginfo.
+	* arm-linux-nat.c (arm_linux_stopped_data_address): Likewise.
+	* ia64-linux-nat.c (ia64_linux_stopped_data_address): Likewise.
+	* linux-nat.c (linux_nat_siginfo_fixup, siginfo_fixup)
+	(linux_xfer_siginfo, linux_nat_set_siginfo_fixup)
+	(linux_nat_get_siginfo): Likewise.
+	* linux-nat.h (struct lwp_info, linux_nat_set_siginfo_fixup)
+	(linux_nat_get_siginfo): Likewise.
+	* linux-tdep.c (linux_get_siginfo_type): Likewise.
+	* ppc-linux-nat.c (ppc_linux_stopped_data_address): Likewise.
+	* procfs.c (gdb_siginfo_t): Likewise.
+
+gdbserver/
+	* linux-arm-low.c (arm_stopped_by_watchpoint): Use siginfo_t instead of
+	struct siginfo.
+	* linux-low.c (siginfo_fixup, linux_xfer_siginfo): Likewise.
+	* linux-x86-low.c (x86_siginfo_fixup): Likewise.
+	* linux-low.h: Include <signal.h>.
+	(struct siginfo): Remove forward declaration.
+	(struct linux_target_ops) <siginfo_fixup>: Use siginfo_t instead of
+	struct siginfo.
+---
+ gdb/ChangeLog                 |   15 +++++++++++++++
+ gdb/amd64-linux-nat.c         |    4 ++--
+ gdb/arm-linux-nat.c           |    2 +-
+ gdb/gdbserver/ChangeLog       |   11 +++++++++++
+ gdb/gdbserver/linux-arm-low.c |    2 +-
+ gdb/gdbserver/linux-low.c     |   10 +++++-----
+ gdb/gdbserver/linux-low.h     |    5 ++---
+ gdb/gdbserver/linux-x86-low.c |    4 ++--
+ gdb/ia64-linux-nat.c          |    2 +-
+ gdb/linux-nat.c               |   16 ++++++++--------
+ gdb/linux-nat.h               |    6 +++---
+ gdb/ppc-linux-nat.c           |    2 +-
+ gdb/procfs.c                  |    2 +-
+ 13 files changed, 53 insertions(+), 28 deletions(-)
+
+diff --git a/gdb/amd64-linux-nat.c b/gdb/amd64-linux-nat.c
+index f954483..5ebba3a 100644
+--- a/gdb/amd64-linux-nat.c
++++ b/gdb/amd64-linux-nat.c
+@@ -731,13 +731,13 @@ siginfo_from_compat_siginfo (siginfo_t *to, compat_siginfo_t *from)
+    INF.  */
+ 
+ static int
+-amd64_linux_siginfo_fixup (struct siginfo *native, gdb_byte *inf, int direction)
++amd64_linux_siginfo_fixup (siginfo_t *native, gdb_byte *inf, int direction)
+ {
+   /* Is the inferior 32-bit?  If so, then do fixup the siginfo
+      object.  */
+   if (gdbarch_addr_bit (get_frame_arch (get_current_frame ())) == 32)
+     {
+-      gdb_assert (sizeof (struct siginfo) == sizeof (compat_siginfo_t));
++      gdb_assert (sizeof (siginfo_t) == sizeof (compat_siginfo_t));
+ 
+       if (direction == 0)
+ 	compat_siginfo_from_siginfo ((struct compat_siginfo *) inf, native);
+diff --git a/gdb/arm-linux-nat.c b/gdb/arm-linux-nat.c
+index c5ce21c..f9f6ba5 100644
+--- a/gdb/arm-linux-nat.c
++++ b/gdb/arm-linux-nat.c
+@@ -1137,7 +1137,7 @@ arm_linux_remove_watchpoint (CORE_ADDR addr, int len, int rw,
+ static int
+ arm_linux_stopped_data_address (struct target_ops *target, CORE_ADDR *addr_p)
+ {
+-  struct siginfo *siginfo_p = linux_nat_get_siginfo (inferior_ptid);
++  siginfo_t *siginfo_p = linux_nat_get_siginfo (inferior_ptid);
+   int slot = siginfo_p->si_errno;
+ 
+   /* This must be a hardware breakpoint.  */
+diff --git a/gdb/gdbserver/linux-arm-low.c b/gdb/gdbserver/linux-arm-low.c
+index ff2437d..01208ef 100644
+--- a/gdb/gdbserver/linux-arm-low.c
++++ b/gdb/gdbserver/linux-arm-low.c
+@@ -631,7 +631,7 @@ static int
+ arm_stopped_by_watchpoint (void)
+ {
+   struct lwp_info *lwp = get_thread_lwp (current_inferior);
+-  struct siginfo siginfo;
++  siginfo_t siginfo;
+ 
+   /* We must be able to set hardware watchpoints.  */
+   if (arm_linux_get_hw_watchpoint_count () == 0)
+diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
+index d2d4c1d..4734f15 100644
+--- a/gdb/gdbserver/linux-low.c
++++ b/gdb/gdbserver/linux-low.c
+@@ -4779,7 +4779,7 @@ linux_qxfer_osdata (const char *annex,
+    layout of the inferiors' architecture.  */
+ 
+ static void
+-siginfo_fixup (struct siginfo *siginfo, void *inf_siginfo, int direction)
++siginfo_fixup (siginfo_t *siginfo, void *inf_siginfo, int direction)
+ {
+   int done = 0;
+ 
+@@ -4791,9 +4791,9 @@ siginfo_fixup (struct siginfo *siginfo, void *inf_siginfo, int direction)
+   if (!done)
+     {
+       if (direction == 1)
+-	memcpy (siginfo, inf_siginfo, sizeof (struct siginfo));
++	memcpy (siginfo, inf_siginfo, sizeof (siginfo_t));
+       else
+-	memcpy (inf_siginfo, siginfo, sizeof (struct siginfo));
++	memcpy (inf_siginfo, siginfo, sizeof (siginfo_t));
+     }
+ }
+ 
+@@ -4802,8 +4802,8 @@ linux_xfer_siginfo (const char *annex, unsigned char *readbuf,
+ 		    unsigned const char *writebuf, CORE_ADDR offset, int len)
+ {
+   int pid;
+-  struct siginfo siginfo;
+-  char inf_siginfo[sizeof (struct siginfo)];
++  siginfo_t siginfo;
++  char inf_siginfo[sizeof (siginfo_t)];
+ 
+   if (current_inferior == NULL)
+     return -1;
+diff --git a/gdb/gdbserver/linux-low.h b/gdb/gdbserver/linux-low.h
+index 677d261..3aeae70 100644
+--- a/gdb/gdbserver/linux-low.h
++++ b/gdb/gdbserver/linux-low.h
+@@ -20,6 +20,7 @@
+ #ifdef HAVE_THREAD_DB_H
+ #include <thread_db.h>
+ #endif
++#include <signal.h>
+ 
+ #include "gdb_proc_service.h"
+ 
+@@ -46,8 +47,6 @@ struct regset_info
+ extern struct regset_info target_regsets[];
+ #endif
+ 
+-struct siginfo;
+-
+ struct process_info_private
+ {
+   /* Arch-specific additions.  */
+@@ -109,7 +108,7 @@ struct linux_target_ops
+      Returns true if any conversion was done; false otherwise.
+      If DIRECTION is 1, then copy from INF to NATIVE.
+      If DIRECTION is 0, copy from NATIVE to INF.  */
+-  int (*siginfo_fixup) (struct siginfo *native, void *inf, int direction);
++  int (*siginfo_fixup) (siginfo_t *native, void *inf, int direction);
+ 
+   /* Hook to call when a new process is created or attached to.
+      If extra per-process architecture-specific data is needed,
+diff --git a/gdb/gdbserver/linux-x86-low.c b/gdb/gdbserver/linux-x86-low.c
+index ed1f8a8..b466b5d 100644
+--- a/gdb/gdbserver/linux-x86-low.c
++++ b/gdb/gdbserver/linux-x86-low.c
+@@ -918,13 +918,13 @@ siginfo_from_compat_siginfo (siginfo_t *to, compat_siginfo_t *from)
+    INF.  */
+ 
+ static int
+-x86_siginfo_fixup (struct siginfo *native, void *inf, int direction)
++x86_siginfo_fixup (siginfo_t *native, void *inf, int direction)
+ {
+ #ifdef __x86_64__
+   /* Is the inferior 32-bit?  If so, then fixup the siginfo object.  */
+   if (register_size (0) == 4)
+     {
+-      if (sizeof (struct siginfo) != sizeof (compat_siginfo_t))
++      if (sizeof (siginfo_t) != sizeof (compat_siginfo_t))
+ 	fatal ("unexpected difference in siginfo");
+ 
+       if (direction == 0)
+diff --git a/gdb/ia64-linux-nat.c b/gdb/ia64-linux-nat.c
+index 8773195..19b827f 100644
+--- a/gdb/ia64-linux-nat.c
++++ b/gdb/ia64-linux-nat.c
+@@ -637,7 +637,7 @@ static int
+ ia64_linux_stopped_data_address (struct target_ops *ops, CORE_ADDR *addr_p)
+ {
+   CORE_ADDR psr;
+-  struct siginfo *siginfo_p;
++  siginfo_t *siginfo_p;
+   struct regcache *regcache = get_current_regcache ();
+ 
+   siginfo_p = linux_nat_get_siginfo (inferior_ptid);
+diff --git a/gdb/linux-nat.c b/gdb/linux-nat.c
+index f80c0c1..d81d55e 100644
+--- a/gdb/linux-nat.c
++++ b/gdb/linux-nat.c
+@@ -188,7 +188,7 @@ static void (*linux_nat_prepare_to_resume) (struct lwp_info *);
+ /* The method to call, if any, when the siginfo object needs to be
+    converted between the layout returned by ptrace, and the layout in
+    the architecture of the inferior.  */
+-static int (*linux_nat_siginfo_fixup) (struct siginfo *,
++static int (*linux_nat_siginfo_fixup) (siginfo_t *,
+ 				       gdb_byte *,
+ 				       int);
+ 
+@@ -4232,7 +4232,7 @@ linux_nat_mourn_inferior (struct target_ops *ops)
+    layout of the inferiors' architecture.  */
+ 
+ static void
+-siginfo_fixup (struct siginfo *siginfo, gdb_byte *inf_siginfo, int direction)
++siginfo_fixup (siginfo_t *siginfo, gdb_byte *inf_siginfo, int direction)
+ {
+   int done = 0;
+ 
+@@ -4244,9 +4244,9 @@ siginfo_fixup (struct siginfo *siginfo, gdb_byte *inf_siginfo, int direction)
+   if (!done)
+     {
+       if (direction == 1)
+-	memcpy (siginfo, inf_siginfo, sizeof (struct siginfo));
++	memcpy (siginfo, inf_siginfo, sizeof (siginfo_t));
+       else
+-	memcpy (inf_siginfo, siginfo, sizeof (struct siginfo));
++	memcpy (inf_siginfo, siginfo, sizeof (siginfo_t));
+     }
+ }
+ 
+@@ -4256,8 +4256,8 @@ linux_xfer_siginfo (struct target_ops *ops, enum target_object object,
+ 		    const gdb_byte *writebuf, ULONGEST offset, LONGEST len)
+ {
+   int pid;
+-  struct siginfo siginfo;
+-  gdb_byte inf_siginfo[sizeof (struct siginfo)];
++  siginfo_t siginfo;
++  gdb_byte inf_siginfo[sizeof (siginfo_t)];
+ 
+   gdb_assert (object == TARGET_OBJECT_SIGNAL_INFO);
+   gdb_assert (readbuf || writebuf);
+@@ -5266,7 +5266,7 @@ linux_nat_set_new_thread (struct target_ops *t,
+    inferior.  */
+ void
+ linux_nat_set_siginfo_fixup (struct target_ops *t,
+-			     int (*siginfo_fixup) (struct siginfo *,
++			     int (*siginfo_fixup) (siginfo_t *,
+ 						   gdb_byte *,
+ 						   int))
+ {
+@@ -5285,7 +5285,7 @@ linux_nat_set_prepare_to_resume (struct target_ops *t,
+ }
+ 
+ /* Return the saved siginfo associated with PTID.  */
+-struct siginfo *
++siginfo_t *
+ linux_nat_get_siginfo (ptid_t ptid)
+ {
+   struct lwp_info *lp = find_lwp_pid (ptid);
+diff --git a/gdb/linux-nat.h b/gdb/linux-nat.h
+index c9878d9..d87f0cf 100644
+--- a/gdb/linux-nat.h
++++ b/gdb/linux-nat.h
+@@ -78,7 +78,7 @@ struct lwp_info
+ 
+   /* Non-zero si_signo if this LWP stopped with a trap.  si_addr may
+      be the address of a hardware watchpoint.  */
+-  struct siginfo siginfo;
++  siginfo_t siginfo;
+ 
+   /* STOPPED_BY_WATCHPOINT is non-zero if this LWP stopped with a data
+      watchpoint trap.  */
+@@ -184,7 +184,7 @@ void linux_nat_set_new_thread (struct target_ops *, void (*) (struct lwp_info *)
+    that ptrace returns, and the layout in the architecture of the
+    inferior.  */
+ void linux_nat_set_siginfo_fixup (struct target_ops *,
+-				  int (*) (struct siginfo *,
++				  int (*) (siginfo_t *,
+ 					   gdb_byte *,
+ 					   int));
+ 
+@@ -198,7 +198,7 @@ void linux_nat_set_prepare_to_resume (struct target_ops *,
+ void linux_nat_switch_fork (ptid_t new_ptid);
+ 
+ /* Return the saved siginfo associated with PTID.  */
+-struct siginfo *linux_nat_get_siginfo (ptid_t ptid);
++siginfo_t *linux_nat_get_siginfo (ptid_t ptid);
+ 
+ /* Compute and return the processor core of a given thread.  */
+ int linux_nat_core_of_thread_1 (ptid_t ptid);
+diff --git a/gdb/ppc-linux-nat.c b/gdb/ppc-linux-nat.c
+index 1bd157b..9bd11fd 100644
+--- a/gdb/ppc-linux-nat.c
++++ b/gdb/ppc-linux-nat.c
+@@ -2218,7 +2218,7 @@ ppc_linux_thread_exit (struct thread_info *tp, int silent)
+ static int
+ ppc_linux_stopped_data_address (struct target_ops *target, CORE_ADDR *addr_p)
+ {
+-  struct siginfo *siginfo_p;
++  siginfo_t *siginfo_p;
+ 
+   siginfo_p = linux_nat_get_siginfo (inferior_ptid);
+ 
+diff --git a/gdb/procfs.c b/gdb/procfs.c
+index 903621d..cb4bc7c 100644
+--- a/gdb/procfs.c
++++ b/gdb/procfs.c
+@@ -266,7 +266,7 @@ typedef struct sigaction gdb_sigaction_t;
+ #ifdef HAVE_PR_SIGINFO64_T
+ typedef pr_siginfo64_t gdb_siginfo_t;
+ #else
+-typedef struct siginfo gdb_siginfo_t;
++typedef siginfo_t gdb_siginfo_t;
+ #endif
+ 
+ /* On mips-irix, praddset and prdelset are defined in such a way that
+-- 
+1.7.9.7
+
diff --git a/package/gdb/7.4.1/05_all_readline-headers.patch b/package/gdb/7.4.1/05_all_readline-headers.patch
new file mode 100644
index 0000000..e65adf6
--- /dev/null
+++ b/package/gdb/7.4.1/05_all_readline-headers.patch
@@ -0,0 +1,42 @@
+--- a/readline/complete.c
++++ b/readline/complete.c
+@@ -25,6 +25,11 @@
+ #  include <config.h>
+ #endif
+ 
++#ifdef HAVE_WCHAR_H /* wcwidth() */
++# define _GNU_SOURCE
++# include <wchar.h>
++#endif
++
+ #include <sys/types.h>
+ #include <fcntl.h>
+ #if defined (HAVE_SYS_FILE_H)
+--- a/readline/display.c
++++ b/readline/display.c
+@@ -25,6 +25,11 @@
+ #  include <config.h>
+ #endif
+ 
++#ifdef HAVE_WCHAR_H /* wcwidth() */
++# define _GNU_SOURCE
++# include <wchar.h>
++#endif
++
+ #include <sys/types.h>
+ 
+ #if defined (HAVE_UNISTD_H)
+--- a/readline/mbutil.c
++++ b/readline/mbutil.c
+@@ -25,6 +25,11 @@
+ #  include <config.h>
+ #endif
+ 
++#ifdef HAVE_WCHAR_H /* wcwidth() */
++# define _GNU_SOURCE
++# include <wchar.h>
++#endif
++
+ #include <sys/types.h>
+ #include <fcntl.h>
+ #include "posixjmp.h"
diff --git a/package/gdb/7.4.1/xtensa-asm-ptrace-h.patch b/package/gdb/7.4.1/xtensa-asm-ptrace-h.patch
new file mode 100644
index 0000000..3d1b07c
--- /dev/null
+++ b/package/gdb/7.4.1/xtensa-asm-ptrace-h.patch
@@ -0,0 +1,22 @@
+--- gdb-7.4.1/gdb/xtensa-linux-nat.c.orig	2012-10-19 16:23:06.908165323 -0700
++++ gdb-7.4.1/gdb/xtensa-linux-nat.c	2012-10-19 16:35:30.792134876 -0700
+@@ -36,7 +36,7 @@
+ #include "gdb_wait.h"
+ #include <fcntl.h>
+ #include <sys/procfs.h>
+-#include <sys/ptrace.h>
++#include <asm/ptrace.h>
+ 
+ #include "gregset.h"
+ #include "xtensa-tdep.h"
+--- gdb-7.4.1/gdb/gdbserver/linux-xtensa-low.c.orig	2012-10-19 16:24:06.260162894 -0700
++++ gdb-7.4.1/gdb/gdbserver/linux-xtensa-low.c	2012-10-19 16:36:07.920133357 -0700
+@@ -23,7 +23,7 @@
+ /* Defined in auto-generated file reg-xtensa.c.  */
+ void init_registers_xtensa (void);
+ 
+-#include <sys/ptrace.h>
++#include <asm/ptrace.h>
+ #include <xtensa-config.h>
+ 
+ #include "xtensa-xtregs.c"
diff --git a/package/gdb/7.4.1/xtensa-gdb-regsize.patch b/package/gdb/7.4.1/xtensa-gdb-regsize.patch
new file mode 100644
index 0000000..e10bb8f
--- /dev/null
+++ b/package/gdb/7.4.1/xtensa-gdb-regsize.patch
@@ -0,0 +1,19 @@
+--- gdb-7.4.1/gdb/xtensa-tdep.h.orig	2012-10-30 11:40:23.546448594 -0700
++++ gdb-7.4.1/gdb/xtensa-tdep.h	2012-10-30 11:41:43.078445337 -0700
+@@ -17,6 +17,7 @@
+    You should have received a copy of the GNU General Public License
+    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ 
++#include <stdint.h>
+ 
+ /* XTENSA_TDEP_VERSION can/should be changed along with XTENSA_CONFIG_VERSION
+    whenever the "tdep" structure changes in an incompatible way.  */
+@@ -84,7 +85,7 @@
+ /* Xtensa ELF core file register set representation ('.reg' section).
+    Copied from target-side ELF header <xtensa/elf.h>.  */
+ 
+-typedef unsigned long xtensa_elf_greg_t;
++typedef uint32_t xtensa_elf_greg_t;
+ 
+ typedef struct
+ {
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
new file mode 100644
index 0000000..10ac7aa
--- /dev/null
+++ b/package/gdb/Config.in
@@ -0,0 +1,40 @@
+config BR2_PACKAGE_GDB
+	bool "gdb"
+	select BR2_PACKAGE_GDB_SERVER if !BR2_PACKAGE_GDB_DEBUGGER
+	help
+	  GDB, the GNU Project debugger, allows you to see what is
+	  going on `inside' another program while it executes -- or
+	  what another program was doing at the moment it crashed.
+
+	  This option allows to build gdbserver and/or the gdb
+	  debugger for the target.
+
+	  For embedded development, the most common solution is to
+	  build only 'gdbserver' for the target, and use a cross-gdb
+	  on the host. See BR2_PACKAGE_HOST_GDB in the Toolchain menu
+	  to enable one. Notice that external toolchains often provide
+	  their own pre-built cross-gdb and gdbserver binaries.
+
+	  http://www.gnu.org/software/gdb/
+
+if BR2_PACKAGE_GDB
+
+config BR2_PACKAGE_GDB_SERVER
+	bool "gdbserver"
+	help
+	  Build the gdbserver stub to run on the target.
+	  A full gdb is needed to debug the progam.
+
+config BR2_PACKAGE_GDB_DEBUGGER
+	bool "full debugger"
+	select BR2_PACKAGE_NCURSES
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin && !BR2_aarch64
+
+comment "full gdb on target needs WCHAR, thread and thread debugging support in toolchain"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+
+endif
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
new file mode 100644
index 0000000..223c426
--- /dev/null
+++ b/package/gdb/Config.in.host
@@ -0,0 +1,56 @@
+config BR2_PACKAGE_HOST_GDB
+	bool "Build cross gdb for the host"
+	help
+	  Build a cross gdb that runs on the host machine and debugs
+	  programs running on the target. It requires 'gdbserver'
+	  installed on the target, see BR2_PACKAGE_GDB_SERVER to
+	  enable it.
+
+if BR2_PACKAGE_HOST_GDB
+
+choice
+	prompt "GDB debugger Version"
+	default BR2_GDB_VERSION_6_6 if BR2_bfin
+	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
+	default BR2_GDB_VERSION_7_5
+	help
+	  Select the version of gdb you wish to use.
+
+	config BR2_GDB_VERSION_6_6
+		bool "gdb 6.6"
+		depends on BR2_bfin
+
+	config BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
+		depends on BR2_avr32
+		bool "gdb 6.7.1-avr32-2.1.5"
+
+	config BR2_GDB_VERSION_7_2
+		bool "gdb 7.2.x"
+		depends on !BR2_bfin
+		depends on BR2_DEPRECATED
+
+	config BR2_GDB_VERSION_7_3
+		bool "gdb 7.3.x"
+		depends on !BR2_bfin
+		depends on BR2_DEPRECATED
+
+	config BR2_GDB_VERSION_7_4
+		bool "gdb 7.4.x"
+		depends on !BR2_bfin
+
+	config BR2_GDB_VERSION_7_5
+		bool "gdb 7.5.x"
+		depends on !BR2_bfin
+
+endchoice
+
+config BR2_GDB_VERSION
+	string
+	default "6.6a"     if BR2_GDB_VERSION_6_6
+	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
+	default "7.2a"     if BR2_GDB_VERSION_7_2
+	default "7.3.1"    if BR2_GDB_VERSION_7_3
+	default "7.4.1"    if BR2_GDB_VERSION_7_4
+	default "7.5.1"    if BR2_GDB_VERSION_7_5
+
+endif
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
new file mode 100644
index 0000000..24ce9bf
--- /dev/null
+++ b/package/gdb/gdb.mk
@@ -0,0 +1,101 @@
+#############################################################
+#
+# gdb
+#
+#############################################################
+
+GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
+GDB_SITE    = $(BR2_GNU_MIRROR)/gdb
+
+# When no version is defined, it means that cross-gdb for the host has
+# not been enabled, and we will only build gdbserver or gdb for the
+# target. In this case, use the latest available version
+# automatically.
+ifeq ($(GDB_VERSION),)
+ifeq ($(BR2_bfin),y)
+GDB_VERSION = 6.6a
+else ifeq ($(BR2_avr32),y)
+GDB_VERSION = 6.7.1-avr32-2.1.5
+GDB_SITE    = ftp://www.at91.com/pub/buildroot/
+else
+GDB_VERSION = 7.5.1
+endif
+endif
+
+GDB_SOURCE = gdb-$(GDB_VERSION).tar.bz2
+GDB_LICENSE = GPLv2+ LGPLv2+ GPLv3+ LGPLv3+
+GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
+
+# We only want gdbserver and not the entire debugger.
+ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),)
+GDB_SUBDIR = gdb/gdbserver
+HOST_GDB_SUBDIR = .
+else
+GDB_DEPENDENCIES = ncurses
+endif
+
+# For the host variant, we really want to build with XML support,
+# which is needed to read XML descriptions of target architectures.
+HOST_GDB_DEPENDENCIES = host-expat
+
+# Apply the Xtensa specific patches
+XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
+ifneq ($(XTENSA_CORE_NAME),)
+define GDB_XTENSA_PRE_PATCH
+	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(XTENSA_CORE_NAME).tar \
+		-C $(@D) --strip-components=1 gdb
+endef
+HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
+endif
+
+GDB_CONF_ENV = \
+	ac_cv_type_uintptr_t=yes \
+	gt_cv_func_gettext_libintl=yes \
+	ac_cv_func_dcgettext=yes \
+	gdb_cv_func_sigsetjmp=yes \
+	bash_cv_func_strcoll_broken=no \
+	bash_cv_must_reinstall_sighandlers=no \
+	bash_cv_func_sigsetjmp=present \
+	bash_cv_have_mbstate_t=yes \
+	gdb_cv_func_sigsetjmp=yes
+
+GDB_CONF_OPT = \
+	--without-uiout \
+	--disable-tui \
+	--disable-gdbtk \
+	--without-x \
+	--disable-sim \
+	$(if $(BR2_PACKAGE_GDB_SERVER),--enable-gdbserver) \
+	--with-curses \
+	--without-included-gettext \
+	--disable-werror
+
+# This removes some unneeded Python scripts and XML target description
+# files that are not useful for a normal usage of the debugger.
+define GDB_REMOVE_UNNEEDED_FILES
+	$(RM) -rf $(TARGET_DIR)/usr/share/gdb
+endef
+
+GDB_POST_INSTALL_TARGET_HOOKS += GDB_REMOVE_UNNEEDED_FILES
+
+# A few notes:
+#  * --target, because we're doing a cross build rather than a real
+#    host build.
+#  * --enable-static because gdb really wants to use libbfd.a
+#  * --disable-shared, otherwise the old 6.7 version specific to AVR32
+#    doesn't build because it wants to link a shared libbfd.so against
+#    non-PIC liberty.a.
+HOST_GDB_CONF_OPT = \
+	--target=$(GNU_TARGET_NAME) \
+	--enable-static --disable-shared \
+	--without-uiout \
+	--disable-tui \
+	--disable-gdbtk \
+	--without-x \
+	--enable-threads \
+	--disable-werror \
+	--without-included-gettext \
+	--disable-sim
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 7edf82b..6311349 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -12,7 +12,6 @@ config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	depends on !BR2_microblaze && !BR2_aarch64
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
@@ -25,7 +24,6 @@ config BR2_TOOLCHAIN_CTNG
 	bool "Crosstool-NG toolchain"
 	depends on !BR2_microblaze && !BR2_aarch64 && !BR2_xtensa
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 	help
 	  Say 'y' if you want to generate the toolchain with crosstool-NG
 	  ( http://ymorin.is-a-geek.org/projects/crosstool )
diff --git a/toolchain/gdb/6.6a/100-uclibc-conf.patch b/toolchain/gdb/6.6a/100-uclibc-conf.patch
deleted file mode 100644
index a790b6f..0000000
--- a/toolchain/gdb/6.6a/100-uclibc-conf.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-diff -rNdup gdb-6.6.orig/bfd/configure gdb-6.6/bfd/configure
---- gdb-6.6.orig/bfd/configure	2006-10-25 08:49:20.000000000 +0200
-+++ gdb-6.6/bfd/configure	2007-05-14 10:35:50.000000000 +0200
-@@ -3579,6 +3579,11 @@ linux-gnu*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
-+linux-uclibc*)
-+  lt_cv_deplibs_check_method=pass_all
-+  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
-+  ;;
-+
- netbsd* | knetbsd*-gnu)
-   if echo __ELF__ | $CC -E - | grep __ELF__ > /dev/null; then
-     lt_cv_deplibs_check_method='match_pattern /lib[^/\.]+\.so\.[0-9]+\.[0-9]+$'
-diff -rNdup gdb-6.6.orig/libtool.m4 gdb-6.6/libtool.m4
---- gdb-6.6.orig/libtool.m4	2005-12-27 17:37:57.000000000 +0100
-+++ gdb-6.6/libtool.m4	2007-05-14 10:35:50.000000000 +0200
-@@ -751,6 +751,11 @@ netbsd* | knetbsd*-gnu)
-   fi
-   ;;
- 
-+linux-uclibc*)
-+  lt_cv_deplibs_check_method=pass_all
-+  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
-+  ;;
-+
- newsos6)
-   [lt_cv_deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [ML]SB (executable|dynamic lib)']
-   lt_cv_file_magic_cmd=/usr/bin/file
-diff -rNdup gdb-6.6.orig/ltconfig gdb-6.6/ltconfig
---- gdb-6.6.orig/ltconfig	2006-07-04 22:31:03.000000000 +0200
-+++ gdb-6.6/ltconfig	2007-05-14 10:35:50.000000000 +0200
-@@ -602,7 +602,7 @@ host_os=`echo $host | sed 's/^\([^-]*\)-
- 
- # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
- case $host_os in
--linux-gnu*) ;;
-+linux-gnu*|linux-uclibc*) ;;
- linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
- esac
- 
-@@ -1270,6 +1270,24 @@ linux-gnu*)
-   dynamic_linker='GNU/Linux ld.so'
-   ;;
- 
-+linux-uclibc*)
-+  version_type=linux
-+  need_lib_prefix=no
-+  need_version=no
-+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
-+  soname_spec='${libname}${release}.so$major'
-+  finish_cmds='PATH="\$PATH:/sbin" ldconfig -n $libdir'
-+  shlibpath_var=LD_LIBRARY_PATH
-+  shlibpath_overrides_runpath=no
-+  # This implies no fast_install, which is unacceptable.
-+  # Some rework will be needed to allow for fast_install
-+  # before this can be enabled.
-+  # Note: copied from linux-gnu, and may not be appropriate.
-+  hardcode_into_libs=yes
-+  # Assume using the uClibc dynamic linker.
-+  dynamic_linker="uClibc ld.so"
-+  ;;
-+
- netbsd*)
-   need_lib_prefix=no
-   need_version=no
-diff -rNdup gdb-6.6.orig/opcodes/configure gdb-6.6/opcodes/configure
---- gdb-6.6.orig/opcodes/configure	2006-10-25 08:49:20.000000000 +0200
-+++ gdb-6.6/opcodes/configure	2007-05-14 10:35:50.000000000 +0200
-@@ -3590,6 +3590,11 @@ netbsd* | knetbsd*-gnu)
-   fi
-   ;;
- 
-+linux-uclibc*)
-+  lt_cv_deplibs_check_method=pass_all
-+  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
-+  ;;
-+
- newsos6)
-   lt_cv_deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [ML]SB (executable|dynamic lib)'
-   lt_cv_file_magic_cmd=/usr/bin/file
diff --git a/toolchain/gdb/6.6a/600-fix-compile-flag-mismatch.patch b/toolchain/gdb/6.6a/600-fix-compile-flag-mismatch.patch
deleted file mode 100644
index 60f0ace..0000000
--- a/toolchain/gdb/6.6a/600-fix-compile-flag-mismatch.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-diff -rduNp gdb-6.6-100/Makefile.in gdb-6.6/Makefile.in
---- gdb-6.6-100/Makefile.in	2006-12-18 08:21:19.000000000 +0100
-+++ gdb-6.6/Makefile.in	2007-05-14 10:54:29.000000000 +0200
-@@ -331,7 +331,7 @@ COMPILER_NM_FOR_TARGET=@COMPILER_NM_FOR_
- # CFLAGS will be just -g.  We want to ensure that TARGET libraries
- # (which we know are built with gcc) are built with optimizations so
- # prepend -O2 when setting CFLAGS_FOR_TARGET.
--CFLAGS_FOR_TARGET = -O2 $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
-+CFLAGS_FOR_TARGET = $(strip $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
- SYSROOT_CFLAGS_FOR_TARGET = @SYSROOT_CFLAGS_FOR_TARGET@
- CXXFLAGS_FOR_TARGET = $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
- LIBCFLAGS_FOR_TARGET = $(CFLAGS_FOR_TARGET)
-diff -rduNp gdb-6.6-100/Makefile.tpl gdb-6.6/Makefile.tpl
---- gdb-6.6-100/Makefile.tpl	2006-11-15 00:26:39.000000000 +0100
-+++ gdb-6.6/Makefile.tpl	2007-05-14 10:54:29.000000000 +0200
-@@ -334,7 +334,7 @@ COMPILER_NM_FOR_TARGET=@COMPILER_NM_FOR_
- # CFLAGS will be just -g.  We want to ensure that TARGET libraries
- # (which we know are built with gcc) are built with optimizations so
- # prepend -O2 when setting CFLAGS_FOR_TARGET.
--CFLAGS_FOR_TARGET = -O2 $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
-+CFLAGS_FOR_TARGET = $(strip $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
- SYSROOT_CFLAGS_FOR_TARGET = @SYSROOT_CFLAGS_FOR_TARGET@
- CXXFLAGS_FOR_TARGET = $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
- LIBCFLAGS_FOR_TARGET = $(CFLAGS_FOR_TARGET)
-diff -rduNp gdb-6.6-100/gdb/configure gdb-6.6/gdb/configure
---- gdb-6.6-100/gdb/configure	2006-12-17 16:38:59.000000000 +0100
-+++ gdb-6.6/gdb/configure	2007-05-14 10:55:41.000000000 +0200
-@@ -272,7 +272,7 @@ PACKAGE_STRING=
- PACKAGE_BUGREPORT=
- 
- ac_unique_file="main.c"
--ac_subdirs_all="$ac_subdirs_all doc testsuite"
-+ac_subdirs_all="$ac_subdirs_all doc"
- # Factoring default headers for most tests.
- ac_includes_default="\
- #include <stdio.h>
-@@ -3055,7 +3055,7 @@ _ACEOF
- 
- 
- 
--subdirs="$subdirs doc testsuite"
-+subdirs="$subdirs doc"
- 
- 
- # Provide defaults for some variables set by the per-host and per-target
-diff -rduNp gdb-6.6-100/gdb/gdbserver/configure gdb-6.6/gdb/gdbserver/configure
---- gdb-6.6-100/gdb/gdbserver/configure	2006-11-22 01:10:19.000000000 +0100
-+++ gdb-6.6/gdb/gdbserver/configure	2007-05-14 10:54:29.000000000 +0200
-@@ -1239,7 +1239,7 @@ echo "$as_me: error: \`$ac_var' was not 
-       ac_cache_corrupted=: ;;
-     ,);;
-     *)
--      if test "x$ac_old_val" != "x$ac_new_val"; then
-+      if test "`echo $ac_old_val`" != "`echo $ac_new_val`"; then
- 	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
- echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
- 	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
-diff -rduNp gdb-6.6-100/gdb/testsuite/configure gdb-6.6/gdb/testsuite/configure
---- gdb-6.6-100/gdb/testsuite/configure	2006-06-21 15:57:21.000000000 +0200
-+++ gdb-6.6/gdb/testsuite/configure	2007-05-14 10:54:29.000000000 +0200
-@@ -1248,7 +1248,7 @@ echo "$as_me: error: \`$ac_var' was not 
-       ac_cache_corrupted=: ;;
-     ,);;
-     *)
--      if test "x$ac_old_val" != "x$ac_new_val"; then
-+      if test "`echo $ac_old_val" != "`echo $ac_new_val"; then
- 	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
- echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
- 	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
diff --git a/toolchain/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch b/toolchain/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
deleted file mode 100644
index 65c4b90..0000000
--- a/toolchain/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
+++ /dev/null
@@ -1,238 +0,0 @@
---- gdb-6.6/gdb/gdbserver/configure.srv
-+++ gdb-6.6/gdb/gdbserver/configure.srv
-@@ -23,6 +23,11 @@ case "${target}" in
- 			srv_linux_usrregs=yes
- 			srv_linux_thread_db=yes
- 			;;
-+  bfin-*-*)		srv_regobj=reg-bfin.o
-+			srv_tgtobj="linux-low.o linux-bfin-low.o"
-+			srv_linux_usrregs=yes
-+			srv_linux_thread_db=yes
-+			;;
-   crisv32-*-linux*)	srv_regobj=reg-crisv32.o
- 			srv_tgtobj="linux-low.o linux-crisv32-low.o"
- 			srv_linux_regsets=yes
---- gdb-6.6/gdb/gdbserver/linux-bfin-low.c
-+++ gdb-6.6/gdb/gdbserver/linux-bfin-low.c
-@@ -0,0 +1,101 @@
-+/* GNU/Linux/BFIN specific low level interface, for the remote server for GDB.
-+
-+   Copyright (C) 2005 Free Software Foundation, Inc.
-+   Contributed by Analog Devices.
-+
-+   This file is part of GDB.
-+
-+   This program is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by
-+   the Free Software Foundation; either version 2 of the License, or
-+   (at your option) any later version.
-+
-+   This program is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+   GNU General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License
-+   along with this program; if not, write to the Free Software
-+   Foundation, Inc., 51 Franklin Street, Fifth Floor,
-+   Boston, MA 02110-1301, USA.  */
-+
-+#include "server.h"
-+#include "linux-low.h"
-+#include <asm/ptrace.h>
-+ 
-+static int bfin_regmap[] =
-+{
-+  PT_R0, PT_R1, PT_R2, PT_R3, PT_R4, PT_R5, PT_R6, PT_R7,
-+  PT_P0, PT_P1, PT_P2, PT_P3, PT_P4, PT_P5, PT_USP, PT_FP,
-+  PT_I0, PT_I1, PT_I2, PT_I3, PT_M0, PT_M1, PT_M2, PT_M3,
-+  PT_B0, PT_B1, PT_B2, PT_B3, PT_L0, PT_L1, PT_L2, PT_L3,
-+  PT_A0X, PT_A0W, PT_A1X, PT_A1W, PT_ASTAT, PT_RETS,
-+  PT_LC0, PT_LT0, PT_LB0, PT_LC1, PT_LT1, PT_LB1,
-+  -1 /* PT_CYCLES */, -1 /* PT_CYCLES2 */,
-+  -1 /* PT_USP */, PT_SEQSTAT, PT_SYSCFG, PT_PC, PT_RETX, PT_RETN, PT_RETE,
-+  PT_PC, -1 /* PT_CC */, PT_TEXT_ADDR, PT_TEXT_END_ADDR, PT_DATA_ADDR,
-+  PT_FDPIC_EXEC, PT_FDPIC_INTERP,
-+  PT_IPEND
-+};
-+
-+#define bfin_num_regs  (sizeof(bfin_regmap) / sizeof(bfin_regmap[0]))
-+
-+static int
-+bfin_cannot_store_register (int regno)
-+{
-+  return (regno >= bfin_num_regs);
-+}
-+
-+static int
-+bfin_cannot_fetch_register (int regno)
-+{
-+  return (regno >= bfin_num_regs);
-+}
-+
-+static CORE_ADDR
-+bfin_get_pc ()
-+{
-+  unsigned long pc;
-+  collect_register_by_name ("pc", &pc);
-+  return pc;
-+}
-+
-+static void
-+bfin_set_pc (CORE_ADDR pc)
-+{
-+  unsigned long newpc = pc;
-+  supply_register_by_name ("pc", &newpc);
-+}
-+
-+#define bfin_breakpoint_len 2
-+static const unsigned char bfin_breakpoint[bfin_breakpoint_len]={0xa1, 0x00};
-+
-+static int
-+bfin_breakpoint_at (CORE_ADDR where)
-+{
-+  unsigned char insn[bfin_breakpoint_len];
-+
-+  read_inferior_memory(where, insn, bfin_breakpoint_len);
-+  if (insn[0] == bfin_breakpoint[0]
-+      && insn[1] == bfin_breakpoint[1])
-+    return 1;
-+
-+  /* If necessary, recognize more trap instructions here.  GDB only uses the
-+     one.  */
-+  return 0;
-+}
-+
-+struct linux_target_ops the_low_target = {
-+  bfin_num_regs,
-+  bfin_regmap,
-+  bfin_cannot_fetch_register,
-+  bfin_cannot_store_register,
-+  bfin_get_pc,
-+  bfin_set_pc,
-+  bfin_breakpoint,
-+  bfin_breakpoint_len,
-+  0,
-+  2,
-+  bfin_breakpoint_at,
-+};
---- gdb-6.6/gdb/gdbserver/linux-low.c
-+++ gdb-6.6/gdb/gdbserver/linux-low.c
-@@ -1592,6 +1592,10 @@ linux_stopped_data_address (void)
- #define PT_TEXT_ADDR 49*4
- #define PT_DATA_ADDR 50*4
- #define PT_TEXT_END_ADDR  51*4
-+#elif defined(BFIN)
-+#define PT_TEXT_ADDR 220
-+#define PT_TEXT_END_ADDR 224
-+#define PT_DATA_ADDR 228
- #endif
- 
- /* Under uClinux, programs are loaded at non-zero offsets, which we need
---- gdb-6.6/gdb/gdbserver/Makefile.in
-+++ gdb-6.6/gdb/gdbserver/Makefile.in
-@@ -119,9 +119,9 @@ SFILES=	$(srcdir)/gdbreplay.c $(srcdir)/
- 	$(srcdir)/mem-break.c $(srcdir)/proc-service.c $(srcdir)/regcache.c \
- 	$(srcdir)/remote-utils.c $(srcdir)/server.c $(srcdir)/target.c \
- 	$(srcdir)/thread-db.c $(srcdir)/utils.c \
--	$(srcdir)/linux-arm-low.c $(srcdir)/linux-cris-low.c \
--	$(srcdir)/linux-crisv32-low.c $(srcdir)/linux-i386-low.c \
--	$(srcdir)/i387-fp.c \
-+	$(srcdir)/linux-arm-low.c $(srcdir)/linux-bfin-low.c \
-+	$(srcdir)/linux-cris-low.c $(srcdir)/linux-crisv32-low.c \
-+	$(srcdir)/linux-i386-low.c $(srcdir)/i387-fp.c \
- 	$(srcdir)/linux-ia64-low.c $(srcdir)/linux-low.c \
- 	$(srcdir)/linux-m32r-low.c \
- 	$(srcdir)/linux-m68k-low.c $(srcdir)/linux-mips-low.c \
-@@ -207,6 +207,7 @@ clean:
- 	rm -f reg-arm.c reg-i386.c reg-ia64.c reg-m32r.c reg-m68k.c reg-mips.c
- 	rm -f reg-ppc.c reg-sh.c reg-spu.c reg-x86-64.c reg-i386-linux.c
- 	rm -f reg-cris.c reg-crisv32.c reg-x86-64-linux.c
-+	rm -f reg-bfin.c
- 
- maintainer-clean realclean distclean: clean
- 	rm -f nm.h tm.h xm.h config.status config.h stamp-h config.log
-@@ -272,6 +273,7 @@ linux-low.o: linux-low.c $(linux_low_h) 
- 
- linux-arm-low.o: linux-arm-low.c $(linux_low_h) $(server_h) \
- 	$(gdb_proc_service_h)
-+linux-bfin-low.o: linux-bfin-low.c $(linux_low_h) $(server_h)
- linux-cris-low.o: linux-cris-low.c $(linux_low_h) $(server_h)
- linux-crisv32-low.o: linux-crisv32-low.c $(linux_low_h) $(server_h)
- linux-i386-low.o: linux-i386-low.c $(linux_low_h) $(server_h) \
-@@ -294,6 +297,9 @@ spu-low.o: spu-low.c $(server_h)
- reg-arm.o : reg-arm.c $(regdef_h)
- reg-arm.c : $(srcdir)/../regformats/reg-arm.dat $(regdat_sh)
- 	sh $(regdat_sh) $(srcdir)/../regformats/reg-arm.dat reg-arm.c
-+reg-bfin.o : reg-bfin.c $(regdef_h)
-+reg-bfin.c : $(srcdir)/../regformats/reg-bfin.dat $(regdat_sh)
-+	sh $(regdat_sh) $(srcdir)/../regformats/reg-bfin.dat reg-bfin.c
- reg-cris.o : reg-cris.c $(regdef_h)
- reg-cris.c : $(srcdir)/../regformats/reg-cris.dat $(regdat_sh)
- 	sh $(regdat_sh) $(srcdir)/../regformats/reg-cris.dat reg-cris.c
---- gdb-6.6/gdb/regformats/reg-bfin.dat
-+++ gdb-6.6/gdb/regformats/reg-bfin.dat
-@@ -0,0 +1,63 @@
-+name:bfin
-+expedite:pc,sp,fp
-+32:r0
-+32:r1
-+32:r2
-+32:r3
-+32:r4
-+32:r5
-+32:r6
-+32:r7
-+32:p0
-+32:p1
-+32:p2
-+32:p3
-+32:p4
-+32:p5
-+32:sp
-+32:fp
-+32:i0
-+32:i1
-+32:i2
-+32:i3
-+32:m0
-+32:m1
-+32:m2
-+32:m3
-+32:b0
-+32:b1
-+32:b2
-+32:b3
-+32:l0
-+32:l1
-+32:l2
-+32:l3
-+32:a0x
-+32:a0w
-+32:a1x
-+32:a1w
-+32:astat
-+32:rets 
-+32:lc0
-+32:lt0
-+32:lb0
-+32:lc1
-+32:lt1
-+32:lb1
-+32:cycles
-+32:cycles2
-+32:usp
-+32:seqstat
-+32:syscfg
-+32:reti
-+32:retx
-+32:retn
-+32:rete
-+32:pc
-+32:cc
-+32:text_addr
-+32:text_end_addr
-+32:data_addr
-+32:fdpic_exec
-+32:fdpic_interp
-+32:ipend
diff --git a/toolchain/gdb/7.4.1/00_all_ptrace_setsiginfo.patch b/toolchain/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
deleted file mode 100644
index 81a92db..0000000
--- a/toolchain/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
+++ /dev/null
@@ -1,314 +0,0 @@
-fix from upstream for building with newer kernel headers
-
-From a7f9ca9cb797d653dc7919538e1dfa0c26010331 Mon Sep 17 00:00:00 2001
-From: tschwinge <tschwinge>
-Date: Wed, 21 Mar 2012 13:43:50 +0000
-Subject: [PATCH] struct siginfo vs. siginfo_t
-
-gdb/
-	* amd64-linux-nat.c (amd64_linux_siginfo_fixup): Use siginfo_t instead
-	of struct siginfo.
-	* arm-linux-nat.c (arm_linux_stopped_data_address): Likewise.
-	* ia64-linux-nat.c (ia64_linux_stopped_data_address): Likewise.
-	* linux-nat.c (linux_nat_siginfo_fixup, siginfo_fixup)
-	(linux_xfer_siginfo, linux_nat_set_siginfo_fixup)
-	(linux_nat_get_siginfo): Likewise.
-	* linux-nat.h (struct lwp_info, linux_nat_set_siginfo_fixup)
-	(linux_nat_get_siginfo): Likewise.
-	* linux-tdep.c (linux_get_siginfo_type): Likewise.
-	* ppc-linux-nat.c (ppc_linux_stopped_data_address): Likewise.
-	* procfs.c (gdb_siginfo_t): Likewise.
-
-gdbserver/
-	* linux-arm-low.c (arm_stopped_by_watchpoint): Use siginfo_t instead of
-	struct siginfo.
-	* linux-low.c (siginfo_fixup, linux_xfer_siginfo): Likewise.
-	* linux-x86-low.c (x86_siginfo_fixup): Likewise.
-	* linux-low.h: Include <signal.h>.
-	(struct siginfo): Remove forward declaration.
-	(struct linux_target_ops) <siginfo_fixup>: Use siginfo_t instead of
-	struct siginfo.
----
- gdb/ChangeLog                 |   15 +++++++++++++++
- gdb/amd64-linux-nat.c         |    4 ++--
- gdb/arm-linux-nat.c           |    2 +-
- gdb/gdbserver/ChangeLog       |   11 +++++++++++
- gdb/gdbserver/linux-arm-low.c |    2 +-
- gdb/gdbserver/linux-low.c     |   10 +++++-----
- gdb/gdbserver/linux-low.h     |    5 ++---
- gdb/gdbserver/linux-x86-low.c |    4 ++--
- gdb/ia64-linux-nat.c          |    2 +-
- gdb/linux-nat.c               |   16 ++++++++--------
- gdb/linux-nat.h               |    6 +++---
- gdb/ppc-linux-nat.c           |    2 +-
- gdb/procfs.c                  |    2 +-
- 13 files changed, 53 insertions(+), 28 deletions(-)
-
-diff --git a/gdb/amd64-linux-nat.c b/gdb/amd64-linux-nat.c
-index f954483..5ebba3a 100644
---- a/gdb/amd64-linux-nat.c
-+++ b/gdb/amd64-linux-nat.c
-@@ -731,13 +731,13 @@ siginfo_from_compat_siginfo (siginfo_t *to, compat_siginfo_t *from)
-    INF.  */
- 
- static int
--amd64_linux_siginfo_fixup (struct siginfo *native, gdb_byte *inf, int direction)
-+amd64_linux_siginfo_fixup (siginfo_t *native, gdb_byte *inf, int direction)
- {
-   /* Is the inferior 32-bit?  If so, then do fixup the siginfo
-      object.  */
-   if (gdbarch_addr_bit (get_frame_arch (get_current_frame ())) == 32)
-     {
--      gdb_assert (sizeof (struct siginfo) == sizeof (compat_siginfo_t));
-+      gdb_assert (sizeof (siginfo_t) == sizeof (compat_siginfo_t));
- 
-       if (direction == 0)
- 	compat_siginfo_from_siginfo ((struct compat_siginfo *) inf, native);
-diff --git a/gdb/arm-linux-nat.c b/gdb/arm-linux-nat.c
-index c5ce21c..f9f6ba5 100644
---- a/gdb/arm-linux-nat.c
-+++ b/gdb/arm-linux-nat.c
-@@ -1137,7 +1137,7 @@ arm_linux_remove_watchpoint (CORE_ADDR addr, int len, int rw,
- static int
- arm_linux_stopped_data_address (struct target_ops *target, CORE_ADDR *addr_p)
- {
--  struct siginfo *siginfo_p = linux_nat_get_siginfo (inferior_ptid);
-+  siginfo_t *siginfo_p = linux_nat_get_siginfo (inferior_ptid);
-   int slot = siginfo_p->si_errno;
- 
-   /* This must be a hardware breakpoint.  */
-diff --git a/gdb/gdbserver/linux-arm-low.c b/gdb/gdbserver/linux-arm-low.c
-index ff2437d..01208ef 100644
---- a/gdb/gdbserver/linux-arm-low.c
-+++ b/gdb/gdbserver/linux-arm-low.c
-@@ -631,7 +631,7 @@ static int
- arm_stopped_by_watchpoint (void)
- {
-   struct lwp_info *lwp = get_thread_lwp (current_inferior);
--  struct siginfo siginfo;
-+  siginfo_t siginfo;
- 
-   /* We must be able to set hardware watchpoints.  */
-   if (arm_linux_get_hw_watchpoint_count () == 0)
-diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
-index d2d4c1d..4734f15 100644
---- a/gdb/gdbserver/linux-low.c
-+++ b/gdb/gdbserver/linux-low.c
-@@ -4779,7 +4779,7 @@ linux_qxfer_osdata (const char *annex,
-    layout of the inferiors' architecture.  */
- 
- static void
--siginfo_fixup (struct siginfo *siginfo, void *inf_siginfo, int direction)
-+siginfo_fixup (siginfo_t *siginfo, void *inf_siginfo, int direction)
- {
-   int done = 0;
- 
-@@ -4791,9 +4791,9 @@ siginfo_fixup (struct siginfo *siginfo, void *inf_siginfo, int direction)
-   if (!done)
-     {
-       if (direction == 1)
--	memcpy (siginfo, inf_siginfo, sizeof (struct siginfo));
-+	memcpy (siginfo, inf_siginfo, sizeof (siginfo_t));
-       else
--	memcpy (inf_siginfo, siginfo, sizeof (struct siginfo));
-+	memcpy (inf_siginfo, siginfo, sizeof (siginfo_t));
-     }
- }
- 
-@@ -4802,8 +4802,8 @@ linux_xfer_siginfo (const char *annex, unsigned char *readbuf,
- 		    unsigned const char *writebuf, CORE_ADDR offset, int len)
- {
-   int pid;
--  struct siginfo siginfo;
--  char inf_siginfo[sizeof (struct siginfo)];
-+  siginfo_t siginfo;
-+  char inf_siginfo[sizeof (siginfo_t)];
- 
-   if (current_inferior == NULL)
-     return -1;
-diff --git a/gdb/gdbserver/linux-low.h b/gdb/gdbserver/linux-low.h
-index 677d261..3aeae70 100644
---- a/gdb/gdbserver/linux-low.h
-+++ b/gdb/gdbserver/linux-low.h
-@@ -20,6 +20,7 @@
- #ifdef HAVE_THREAD_DB_H
- #include <thread_db.h>
- #endif
-+#include <signal.h>
- 
- #include "gdb_proc_service.h"
- 
-@@ -46,8 +47,6 @@ struct regset_info
- extern struct regset_info target_regsets[];
- #endif
- 
--struct siginfo;
--
- struct process_info_private
- {
-   /* Arch-specific additions.  */
-@@ -109,7 +108,7 @@ struct linux_target_ops
-      Returns true if any conversion was done; false otherwise.
-      If DIRECTION is 1, then copy from INF to NATIVE.
-      If DIRECTION is 0, copy from NATIVE to INF.  */
--  int (*siginfo_fixup) (struct siginfo *native, void *inf, int direction);
-+  int (*siginfo_fixup) (siginfo_t *native, void *inf, int direction);
- 
-   /* Hook to call when a new process is created or attached to.
-      If extra per-process architecture-specific data is needed,
-diff --git a/gdb/gdbserver/linux-x86-low.c b/gdb/gdbserver/linux-x86-low.c
-index ed1f8a8..b466b5d 100644
---- a/gdb/gdbserver/linux-x86-low.c
-+++ b/gdb/gdbserver/linux-x86-low.c
-@@ -918,13 +918,13 @@ siginfo_from_compat_siginfo (siginfo_t *to, compat_siginfo_t *from)
-    INF.  */
- 
- static int
--x86_siginfo_fixup (struct siginfo *native, void *inf, int direction)
-+x86_siginfo_fixup (siginfo_t *native, void *inf, int direction)
- {
- #ifdef __x86_64__
-   /* Is the inferior 32-bit?  If so, then fixup the siginfo object.  */
-   if (register_size (0) == 4)
-     {
--      if (sizeof (struct siginfo) != sizeof (compat_siginfo_t))
-+      if (sizeof (siginfo_t) != sizeof (compat_siginfo_t))
- 	fatal ("unexpected difference in siginfo");
- 
-       if (direction == 0)
-diff --git a/gdb/ia64-linux-nat.c b/gdb/ia64-linux-nat.c
-index 8773195..19b827f 100644
---- a/gdb/ia64-linux-nat.c
-+++ b/gdb/ia64-linux-nat.c
-@@ -637,7 +637,7 @@ static int
- ia64_linux_stopped_data_address (struct target_ops *ops, CORE_ADDR *addr_p)
- {
-   CORE_ADDR psr;
--  struct siginfo *siginfo_p;
-+  siginfo_t *siginfo_p;
-   struct regcache *regcache = get_current_regcache ();
- 
-   siginfo_p = linux_nat_get_siginfo (inferior_ptid);
-diff --git a/gdb/linux-nat.c b/gdb/linux-nat.c
-index f80c0c1..d81d55e 100644
---- a/gdb/linux-nat.c
-+++ b/gdb/linux-nat.c
-@@ -188,7 +188,7 @@ static void (*linux_nat_prepare_to_resume) (struct lwp_info *);
- /* The method to call, if any, when the siginfo object needs to be
-    converted between the layout returned by ptrace, and the layout in
-    the architecture of the inferior.  */
--static int (*linux_nat_siginfo_fixup) (struct siginfo *,
-+static int (*linux_nat_siginfo_fixup) (siginfo_t *,
- 				       gdb_byte *,
- 				       int);
- 
-@@ -4232,7 +4232,7 @@ linux_nat_mourn_inferior (struct target_ops *ops)
-    layout of the inferiors' architecture.  */
- 
- static void
--siginfo_fixup (struct siginfo *siginfo, gdb_byte *inf_siginfo, int direction)
-+siginfo_fixup (siginfo_t *siginfo, gdb_byte *inf_siginfo, int direction)
- {
-   int done = 0;
- 
-@@ -4244,9 +4244,9 @@ siginfo_fixup (struct siginfo *siginfo, gdb_byte *inf_siginfo, int direction)
-   if (!done)
-     {
-       if (direction == 1)
--	memcpy (siginfo, inf_siginfo, sizeof (struct siginfo));
-+	memcpy (siginfo, inf_siginfo, sizeof (siginfo_t));
-       else
--	memcpy (inf_siginfo, siginfo, sizeof (struct siginfo));
-+	memcpy (inf_siginfo, siginfo, sizeof (siginfo_t));
-     }
- }
- 
-@@ -4256,8 +4256,8 @@ linux_xfer_siginfo (struct target_ops *ops, enum target_object object,
- 		    const gdb_byte *writebuf, ULONGEST offset, LONGEST len)
- {
-   int pid;
--  struct siginfo siginfo;
--  gdb_byte inf_siginfo[sizeof (struct siginfo)];
-+  siginfo_t siginfo;
-+  gdb_byte inf_siginfo[sizeof (siginfo_t)];
- 
-   gdb_assert (object == TARGET_OBJECT_SIGNAL_INFO);
-   gdb_assert (readbuf || writebuf);
-@@ -5266,7 +5266,7 @@ linux_nat_set_new_thread (struct target_ops *t,
-    inferior.  */
- void
- linux_nat_set_siginfo_fixup (struct target_ops *t,
--			     int (*siginfo_fixup) (struct siginfo *,
-+			     int (*siginfo_fixup) (siginfo_t *,
- 						   gdb_byte *,
- 						   int))
- {
-@@ -5285,7 +5285,7 @@ linux_nat_set_prepare_to_resume (struct target_ops *t,
- }
- 
- /* Return the saved siginfo associated with PTID.  */
--struct siginfo *
-+siginfo_t *
- linux_nat_get_siginfo (ptid_t ptid)
- {
-   struct lwp_info *lp = find_lwp_pid (ptid);
-diff --git a/gdb/linux-nat.h b/gdb/linux-nat.h
-index c9878d9..d87f0cf 100644
---- a/gdb/linux-nat.h
-+++ b/gdb/linux-nat.h
-@@ -78,7 +78,7 @@ struct lwp_info
- 
-   /* Non-zero si_signo if this LWP stopped with a trap.  si_addr may
-      be the address of a hardware watchpoint.  */
--  struct siginfo siginfo;
-+  siginfo_t siginfo;
- 
-   /* STOPPED_BY_WATCHPOINT is non-zero if this LWP stopped with a data
-      watchpoint trap.  */
-@@ -184,7 +184,7 @@ void linux_nat_set_new_thread (struct target_ops *, void (*) (struct lwp_info *)
-    that ptrace returns, and the layout in the architecture of the
-    inferior.  */
- void linux_nat_set_siginfo_fixup (struct target_ops *,
--				  int (*) (struct siginfo *,
-+				  int (*) (siginfo_t *,
- 					   gdb_byte *,
- 					   int));
- 
-@@ -198,7 +198,7 @@ void linux_nat_set_prepare_to_resume (struct target_ops *,
- void linux_nat_switch_fork (ptid_t new_ptid);
- 
- /* Return the saved siginfo associated with PTID.  */
--struct siginfo *linux_nat_get_siginfo (ptid_t ptid);
-+siginfo_t *linux_nat_get_siginfo (ptid_t ptid);
- 
- /* Compute and return the processor core of a given thread.  */
- int linux_nat_core_of_thread_1 (ptid_t ptid);
-diff --git a/gdb/ppc-linux-nat.c b/gdb/ppc-linux-nat.c
-index 1bd157b..9bd11fd 100644
---- a/gdb/ppc-linux-nat.c
-+++ b/gdb/ppc-linux-nat.c
-@@ -2218,7 +2218,7 @@ ppc_linux_thread_exit (struct thread_info *tp, int silent)
- static int
- ppc_linux_stopped_data_address (struct target_ops *target, CORE_ADDR *addr_p)
- {
--  struct siginfo *siginfo_p;
-+  siginfo_t *siginfo_p;
- 
-   siginfo_p = linux_nat_get_siginfo (inferior_ptid);
- 
-diff --git a/gdb/procfs.c b/gdb/procfs.c
-index 903621d..cb4bc7c 100644
---- a/gdb/procfs.c
-+++ b/gdb/procfs.c
-@@ -266,7 +266,7 @@ typedef struct sigaction gdb_sigaction_t;
- #ifdef HAVE_PR_SIGINFO64_T
- typedef pr_siginfo64_t gdb_siginfo_t;
- #else
--typedef struct siginfo gdb_siginfo_t;
-+typedef siginfo_t gdb_siginfo_t;
- #endif
- 
- /* On mips-irix, praddset and prdelset are defined in such a way that
--- 
-1.7.9.7
-
diff --git a/toolchain/gdb/7.4.1/05_all_readline-headers.patch b/toolchain/gdb/7.4.1/05_all_readline-headers.patch
deleted file mode 100644
index e65adf6..0000000
--- a/toolchain/gdb/7.4.1/05_all_readline-headers.patch
+++ /dev/null
@@ -1,42 +0,0 @@
---- a/readline/complete.c
-+++ b/readline/complete.c
-@@ -25,6 +25,11 @@
- #  include <config.h>
- #endif
- 
-+#ifdef HAVE_WCHAR_H /* wcwidth() */
-+# define _GNU_SOURCE
-+# include <wchar.h>
-+#endif
-+
- #include <sys/types.h>
- #include <fcntl.h>
- #if defined (HAVE_SYS_FILE_H)
---- a/readline/display.c
-+++ b/readline/display.c
-@@ -25,6 +25,11 @@
- #  include <config.h>
- #endif
- 
-+#ifdef HAVE_WCHAR_H /* wcwidth() */
-+# define _GNU_SOURCE
-+# include <wchar.h>
-+#endif
-+
- #include <sys/types.h>
- 
- #if defined (HAVE_UNISTD_H)
---- a/readline/mbutil.c
-+++ b/readline/mbutil.c
-@@ -25,6 +25,11 @@
- #  include <config.h>
- #endif
- 
-+#ifdef HAVE_WCHAR_H /* wcwidth() */
-+# define _GNU_SOURCE
-+# include <wchar.h>
-+#endif
-+
- #include <sys/types.h>
- #include <fcntl.h>
- #include "posixjmp.h"
diff --git a/toolchain/gdb/7.4.1/xtensa-asm-ptrace-h.patch b/toolchain/gdb/7.4.1/xtensa-asm-ptrace-h.patch
deleted file mode 100644
index 3d1b07c..0000000
--- a/toolchain/gdb/7.4.1/xtensa-asm-ptrace-h.patch
+++ /dev/null
@@ -1,22 +0,0 @@
---- gdb-7.4.1/gdb/xtensa-linux-nat.c.orig	2012-10-19 16:23:06.908165323 -0700
-+++ gdb-7.4.1/gdb/xtensa-linux-nat.c	2012-10-19 16:35:30.792134876 -0700
-@@ -36,7 +36,7 @@
- #include "gdb_wait.h"
- #include <fcntl.h>
- #include <sys/procfs.h>
--#include <sys/ptrace.h>
-+#include <asm/ptrace.h>
- 
- #include "gregset.h"
- #include "xtensa-tdep.h"
---- gdb-7.4.1/gdb/gdbserver/linux-xtensa-low.c.orig	2012-10-19 16:24:06.260162894 -0700
-+++ gdb-7.4.1/gdb/gdbserver/linux-xtensa-low.c	2012-10-19 16:36:07.920133357 -0700
-@@ -23,7 +23,7 @@
- /* Defined in auto-generated file reg-xtensa.c.  */
- void init_registers_xtensa (void);
- 
--#include <sys/ptrace.h>
-+#include <asm/ptrace.h>
- #include <xtensa-config.h>
- 
- #include "xtensa-xtregs.c"
diff --git a/toolchain/gdb/7.4.1/xtensa-gdb-regsize.patch b/toolchain/gdb/7.4.1/xtensa-gdb-regsize.patch
deleted file mode 100644
index e10bb8f..0000000
--- a/toolchain/gdb/7.4.1/xtensa-gdb-regsize.patch
+++ /dev/null
@@ -1,19 +0,0 @@
---- gdb-7.4.1/gdb/xtensa-tdep.h.orig	2012-10-30 11:40:23.546448594 -0700
-+++ gdb-7.4.1/gdb/xtensa-tdep.h	2012-10-30 11:41:43.078445337 -0700
-@@ -17,6 +17,7 @@
-    You should have received a copy of the GNU General Public License
-    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- 
-+#include <stdint.h>
- 
- /* XTENSA_TDEP_VERSION can/should be changed along with XTENSA_CONFIG_VERSION
-    whenever the "tdep" structure changes in an incompatible way.  */
-@@ -84,7 +85,7 @@
- /* Xtensa ELF core file register set representation ('.reg' section).
-    Copied from target-side ELF header <xtensa/elf.h>.  */
- 
--typedef unsigned long xtensa_elf_greg_t;
-+typedef uint32_t xtensa_elf_greg_t;
- 
- typedef struct
- {
diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
deleted file mode 100644
index 69f7915..0000000
--- a/toolchain/gdb/Config.in
+++ /dev/null
@@ -1,99 +0,0 @@
-comment "Gdb Options"
-
-config BR2_PACKAGE_GDB
-	bool "Build gdb debugger for the Target"
-	select BR2_PACKAGE_NCURSES
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin && !BR2_aarch64
-	# The newest versions of gdb require thread debugging in the
-	# toolchain. The only cases for which this is not needed is if
-	# we use gdb 6.8 (marked deprecated)
-	depends on \
-		BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED || \
-		BR2_DEPRECATED || \
-		BR2_bfin
-	help
-	    Build the full gdb debugger to run on the target.
-
-comment "Gdb for the target needs WCHAR and threads support in toolchain"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-config BR2_PACKAGE_GDB_SERVER
-	bool "Build gdb server for the Target"
-	depends on !BR2_TOOLCHAIN_EXTERNAL
-	help
-	    Build the gdbserver stub to run on the target.
-	    A full gdb is needed to debug the progam.
-
-config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
-	bool "Copy gdb server to the Target"
-	depends on BR2_TOOLCHAIN_EXTERNAL
-	help
-	  Copy the gdbserver provided by the external toolchain to the
-	  target.
-
-config BR2_PACKAGE_GDB_HOST
-	bool "Build gdb for the Host"
-	# cross-gdb is supposed to be part of the external
-	# toolchain. And the build currently fails.
-	depends on !BR2_TOOLCHAIN_EXTERNAL
-	help
-	    Build gdb to run on the host to debug programs run on the target.
-
-choice
-	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_6_6 if BR2_bfin
-	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
-	default BR2_GDB_VERSION_7_5
-	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
-	help
-	  Select the version of gdb you wish to use.
-
-	config BR2_GDB_VERSION_6_6
-		bool "gdb 6.6"
-		depends on BR2_bfin
-
-	config BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
-		depends on BR2_avr32
-		bool "gdb 6.7.1-avr32-2.1.5"
-
-	config BR2_GDB_VERSION_7_2
-		bool "gdb 7.2.x"
-		depends on !BR2_bfin
-		depends on BR2_DEPRECATED
-		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
-		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
-
-	config BR2_GDB_VERSION_7_3
-		bool "gdb 7.3.x"
-		depends on !BR2_bfin
-		depends on BR2_DEPRECATED
-		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
-		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
-
-	config BR2_GDB_VERSION_7_4
-		bool "gdb 7.4.x"
-		depends on !BR2_bfin
-		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
-		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
-
-	config BR2_GDB_VERSION_7_5
-		bool "gdb 7.5.x"
-		depends on !BR2_bfin
-		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
-		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
-
-endchoice
-
-comment "gdb support needs pthread debug support in toolchain"
-	depends on !BR2_DEPRECATED && !BR2_bfin && !BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
-
-config BR2_GDB_VERSION
-	string
-	default "6.6a"     if BR2_GDB_VERSION_6_6
-	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
-	default "7.2a"     if BR2_GDB_VERSION_7_2
-	default "7.3.1"    if BR2_GDB_VERSION_7_3
-	default "7.4.1"    if BR2_GDB_VERSION_7_4
-	default "7.5.1"    if BR2_GDB_VERSION_7_5
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
deleted file mode 100644
index a932b1f..0000000
--- a/toolchain/gdb/gdb.mk
+++ /dev/null
@@ -1,234 +0,0 @@
-######################################################################
-#
-# gdb
-#
-######################################################################
-GDB_VERSION:=$(call qstrip,$(BR2_GDB_VERSION))
-
-GDB_SOURCE:=gdb-$(GDB_VERSION).tar.bz2
-GDB_CAT:=$(BZCAT)
-
-ifeq ($(findstring avr32,$(GDB_VERSION)),avr32)
- GDB_SITE:=ftp://www.at91.com/pub/buildroot/
- GDB_PATCH_DIR:=toolchain/gdb/$(GDB_VERSION)
-else
- GDB_SITE:=$(BR2_GNU_MIRROR)/gdb
- GDB_PATCH_DIR:=toolchain/gdb/$(GDB_VERSION)
-endif
-
-GDB_DIR:=$(TOOLCHAIN_DIR)/gdb-$(GDB_VERSION)
-
-$(DL_DIR)/$(GDB_SOURCE):
-	$(call DOWNLOAD,$(GDB_SITE)/$(GDB_SOURCE))
-
-gdb-unpacked: $(GDB_DIR)/.unpacked
-$(GDB_DIR)/.unpacked: $(DL_DIR)/$(GDB_SOURCE)
-	mkdir -p $(GDB_DIR)
-	$(GDB_CAT) $(DL_DIR)/$(GDB_SOURCE) | tar -C $(GDB_DIR) $(TAR_STRIP_COMPONENTS)=1 $(TAR_OPTIONS) -
-ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
-	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip, \
-		$(BR2_XTENSA_CORE_NAME)).tar -C $(@D) --strip-components=1 gdb
-endif
-ifneq ($(wildcard $(GDB_PATCH_DIR)),)
-	support/scripts/apply-patches.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch
-endif
-	$(call CONFIG_UPDATE,$(@D))
-	touch $@
-
-gdb-patched: $(GDB_DIR)/.unpacked
-
-gdb-source: $(DL_DIR)/$(GDB_SOURCE)
-gdb-dirclean:
-	rm -rf $(GDB_DIR)
-
-######################################################################
-#
-# gdb target
-#
-######################################################################
-
-GDB_TARGET_DIR:=$(BUILD_DIR)/gdb-$(GDB_VERSION)-target
-
-GDB_TARGET_CONFIGURE_VARS:= \
-	ac_cv_type_uintptr_t=yes \
-	gt_cv_func_gettext_libintl=yes \
-	ac_cv_func_dcgettext=yes \
-	gdb_cv_func_sigsetjmp=yes \
-	bash_cv_func_strcoll_broken=no \
-	bash_cv_must_reinstall_sighandlers=no \
-	bash_cv_func_sigsetjmp=present \
-	bash_cv_have_mbstate_t=yes
-
-$(GDB_TARGET_DIR)/.configured: $(GDB_DIR)/.unpacked
-	mkdir -p $(GDB_TARGET_DIR)
-	(cd $(GDB_TARGET_DIR); \
-		gdb_cv_func_sigsetjmp=yes \
-		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_LDFLAGS) -Wno-error" \
-		CFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS) -Wno-error" \
-		$(GDB_TARGET_CONFIGURE_VARS) \
-		$(GDB_DIR)/configure $(QUIET) \
-		--cache-file=/dev/null \
-		--build=$(GNU_HOST_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--target=$(GNU_TARGET_NAME) \
-		--prefix=/usr \
-		$(DISABLE_NLS) \
-		--without-uiout $(DISABLE_GDBMI) \
-		--disable-tui --disable-gdbtk --without-x \
-		--disable-sim --enable-gdbserver \
-		--without-included-gettext \
-		--disable-werror \
-		$(QUIET) \
-	)
-ifeq ($(BR2_ENABLE_LOCALE),y)
-	-$(SED) "s,^INTL *=.*,INTL = -lintl,g;" $(GDB_DIR)/gdb/Makefile
-endif
-	touch $@
-
-$(GDB_TARGET_DIR)/gdb/gdb: $(GDB_TARGET_DIR)/.configured
-	# force ELF support since it fails due to BFD linking problems
-	gdb_cv_var_elf=yes \
-	$(TARGET_MAKE_ENV) \
-	$(MAKE) CC="$(TARGET_CC)" MT_CFLAGS="$(TARGET_CFLAGS)" \
-		-C $(GDB_TARGET_DIR)
-
-$(TARGET_DIR)/usr/bin/gdb: $(GDB_TARGET_DIR)/gdb/gdb
-	install -c -D $(GDB_TARGET_DIR)/gdb/gdb $(TARGET_DIR)/usr/bin/gdb
-
-gdb_target: ncurses $(TARGET_DIR)/usr/bin/gdb
-
-gdb_target-source: $(DL_DIR)/$(GDB_SOURCE)
-
-gdb_target-clean:
-	-$(MAKE) -C $(GDB_DIR) clean
-
-gdb_target-dirclean:
-	rm -rf $(GDB_DIR)
-
-######################################################################
-#
-# gdbserver
-#
-######################################################################
-
-GDB_SERVER_DIR:=$(BUILD_DIR)/gdbserver-$(GDB_VERSION)
-
-$(GDB_SERVER_DIR)/.configured: $(GDB_DIR)/.unpacked
-	mkdir -p $(GDB_SERVER_DIR)
-	(cd $(GDB_SERVER_DIR); \
-		$(TARGET_CONFIGURE_OPTS) \
-		gdb_cv_func_sigsetjmp=yes \
-		bash_cv_have_mbstate_t=yes \
-		$(GDB_DIR)/gdb/gdbserver/configure $(QUIET) \
-		--cache-file=/dev/null \
-		--build=$(GNU_HOST_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--target=$(GNU_TARGET_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--includedir=$(STAGING_DIR)/usr/include \
-		$(DISABLE_NLS) \
-		--without-uiout $(DISABLE_GDBMI) \
-		--disable-tui --disable-gdbtk --without-x \
-		--without-included-gettext \
-	)
-	touch $@
-
-$(GDB_SERVER_DIR)/gdbserver: $(GDB_SERVER_DIR)/.configured
-	$(TARGET_MAKE_ENV) \
-	$(MAKE) CC="$(TARGET_CC)" MT_CFLAGS="$(TARGET_CFLAGS)" \
-		-C $(GDB_SERVER_DIR)
-
-$(TARGET_DIR)/usr/bin/gdbserver: $(GDB_SERVER_DIR)/gdbserver
-ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
-	mkdir -p $(STAGING_DIR)/usr/$(GNU_TARGET_NAME)/target_utils
-	install -c $(GDB_SERVER_DIR)/gdbserver \
-		$(STAGING_DIR)/usr/$(GNU_TARGET_NAME)/target_utils/gdbserver
-endif
-	install -c -D $(GDB_SERVER_DIR)/gdbserver $(TARGET_DIR)/usr/bin/gdbserver
-
-gdbserver: $(TARGET_DIR)/usr/bin/gdbserver
-
-gdbserver-source: $(DL_DIR)/$(GDB_SOURCE)
-
-gdbserver-clean:
-	-$(MAKE) -C $(GDB_SERVER_DIR) clean
-
-gdbserver-dirclean:
-	rm -rf $(GDB_SERVER_DIR)
-
-######################################################################
-#
-# gdb on host
-#
-######################################################################
-
-GDB_HOST_DIR:=$(TOOLCHAIN_DIR)/gdbhost-$(GDB_VERSION)
-
-$(GDB_HOST_DIR)/.configured: $(GDB_DIR)/.unpacked
-	mkdir -p $(GDB_HOST_DIR)
-	(cd $(GDB_HOST_DIR); \
-		gdb_cv_func_sigsetjmp=yes \
-		bash_cv_have_mbstate_t=yes \
-		$(HOST_CONFIGURE_OPTS) \
-		$(GDB_DIR)/configure $(QUIET) \
-		--cache-file=/dev/null \
-		--prefix=$(STAGING_DIR) \
-		--build=$(GNU_HOST_NAME) \
-		--host=$(GNU_HOST_NAME) \
-		--target=$(GNU_TARGET_NAME) \
-		$(DISABLE_NLS) \
-		--without-uiout $(DISABLE_GDBMI) \
-		--disable-tui --disable-gdbtk --without-x \
-		--without-included-gettext \
-		--enable-threads \
-		--disable-werror \
-	)
-	touch $@
-
-$(GDB_HOST_DIR)/gdb/gdb: $(GDB_HOST_DIR)/.configured
-	# force ELF support since it fails due to BFD linking problems
-	$(HOST_MAKE_ENV) \
-	gdb_cv_var_elf=yes \
-	$(MAKE) -C $(GDB_HOST_DIR)
-	strip $(GDB_HOST_DIR)/gdb/gdb
-
-$(TARGET_CROSS)gdb: $(GDB_HOST_DIR)/gdb/gdb
-	install -c $(GDB_HOST_DIR)/gdb/gdb $(TARGET_CROSS)gdb
-	ln -snf $(@F) $(HOST_DIR)/usr/bin/$(ARCH)-linux-gdb
-
-gdbhost: host-expat $(TARGET_CROSS)gdb
-
-gdbhost-source: $(DL_DIR)/$(GDB_SOURCE)
-
-gdbhost-clean:
-	-$(MAKE) -C $(GDB_HOST_DIR) clean
-
-gdbhost-dirclean:
-	rm -rf $(GDB_HOST_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_GDB),y)
-TARGETS+=gdb_target
-endif
-
-ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
-TARGETS+=gdbserver
-endif
-
-ifeq ($(BR2_PACKAGE_GDB_HOST),y)
-TARGETS+=gdbhost
-endif
diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
index adab0f7..5493177 100644
--- a/toolchain/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot.mk
@@ -2,6 +2,5 @@
 
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
-include toolchain/gdb/gdb.mk
 include toolchain/kernel-headers/kernel-headers.mk
 include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index a713727..7f19b09 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -99,6 +99,13 @@ choice
 		depends on !BR2_xtensa
 endchoice
 
+config BR2_PTHREAD_DEBUG
+	bool "Thread library debugging"
+	depends on BR2_PTHREADS || BR2_PTHREADS_OLD || BR2_PTHREADS_NATIVE
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	help
+	  Build the thread library with debugging enabled.
+
 source "toolchain/elf2flt/Config.in"
 
 config BR2_VFP_FLOAT
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index f6905ae..208ccac 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -3,7 +3,7 @@
 # we want gdb config in the middle of both source and external
 # toolchains, but mconf won't let us source the same file twice,
 # so put it here instead
-source "toolchain/gdb/Config.in"
+source "package/gdb/Config.in.host"
 
 config BR2_LARGEFILE
 	bool
@@ -27,11 +27,6 @@ config BR2_TOOLCHAIN_HAS_THREADS
 	bool
 
 config BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
-	bool
-
-config BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
-	default y if !BR2_TOOLCHAIN_HAS_THREADS
 	bool
 
 config BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
diff --git a/toolchain/toolchain-crosstool-ng.mk b/toolchain/toolchain-crosstool-ng.mk
index d677256..d1e7552 100644
--- a/toolchain/toolchain-crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng.mk
@@ -4,6 +4,5 @@
 include toolchain/helpers.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
-include toolchain/gdb/gdb.mk
 include toolchain/toolchain-crosstool-ng/crosstool-ng.mk
 include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index df4e9b1..93c12e9 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -121,15 +121,18 @@ choice
 	config BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS
 		bool "linuxthreads"
 		select BR2_TOOLCHAIN_HAS_THREADS
+		select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 
 	config BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS_OLD
 		bool "linuxthreads (stable/old)"
 		select BR2_TOOLCHAIN_HAS_THREADS
+		select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 		depends on BR2_TOOLCHAIN_CTNG_uClibc
 
 	config BR2_TOOLCHAIN_CTNG_THREADS_NPTL
 		bool "Native POSIX Threading (NPTL)"
 		select BR2_TOOLCHAIN_HAS_THREADS
+		select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 endchoice
 
 endif # BR2_TOOLCHAIN_CTNG
diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-external.mk
index 4292d85..9999aa2 100644
--- a/toolchain/toolchain-external.mk
+++ b/toolchain/toolchain-external.mk
@@ -3,7 +3,6 @@
 include toolchain/helpers.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
-include toolchain/gdb/gdb.mk
 include toolchain/kernel-headers/kernel-headers.mk
 include toolchain/toolchain-external/ext-tool.mk
 include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d2f3926..e61378b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -913,5 +913,12 @@ config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
 
 endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
+config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
+	bool "Copy gdb server to the Target"
+	depends on BR2_TOOLCHAIN_EXTERNAL
+	help
+	  Copy the gdbserver provided by the external toolchain to the
+	  target.
+
 endif # BR2_TOOLCHAIN_EXTERNAL
 
diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 57c9933..cebad45 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -53,12 +53,6 @@ config BR2_UCLIBC_CONFIG
 	  See also docs/README in this package.
 	  If unsure, use the default.
 
-config BR2_PTHREAD_DEBUG
-	bool "Thread library debugging"
-	depends on BR2_PTHREADS || BR2_PTHREADS_OLD || BR2_PTHREADS_NATIVE
-	help
-	  Build the thread library with debugging enabled.
-
 config BR2_UCLIBC_INSTALL_TEST_SUITE
 	bool "Compile and install uClibc tests"
 	select BR2_PACKAGE_MAKE
-- 
1.7.9.5
