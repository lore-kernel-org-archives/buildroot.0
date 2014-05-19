From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 May 2014 00:07:19 +0200
Subject: [Buildroot] [PATCH 2/2] gdb: switch to 7.x for Blackfin
In-Reply-To: <1400537239-24812-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1400537239-24812-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1400537239-24812-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason, we were keeping gdb version 6.6a specially for
Blackfin. However, it turns out that support for Blackfin was merged
in gdb 7.4 (cross-gdb and gdbserver, not native gdb on the
target). Therefore, we can simply remove the support for version 6.6a
and use 7.5 as the default.

Both 7.4 and 7.5 were built tested, including cross-gdb and gdbserver.

The original reason to switch to 7.x is that 6.6a doesn't build for
Blackfin FLAT, and while it builds for Blackfin FDPIC, it only builds
libiberty.a and does not actually build a cross debugger.

Fixes:

  http://autobuild.buildroot.org/results/b47/b47f85553336b7f63ee4ecdf8598374ce4a225a3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/6.6a/100-uclibc-conf.patch             |  82 -------
 .../gdb/6.6a/600-fix-compile-flag-mismatch.patch   |  69 ------
 package/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch      | 238 ---------------------
 package/gdb/Config.in.host                         |   7 -
 4 files changed, 396 deletions(-)
 delete mode 100644 package/gdb/6.6a/100-uclibc-conf.patch
 delete mode 100644 package/gdb/6.6a/600-fix-compile-flag-mismatch.patch
 delete mode 100644 package/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch

diff --git a/package/gdb/6.6a/100-uclibc-conf.patch b/package/gdb/6.6a/100-uclibc-conf.patch
deleted file mode 100644
index a790b6f..0000000
--- a/package/gdb/6.6a/100-uclibc-conf.patch
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
diff --git a/package/gdb/6.6a/600-fix-compile-flag-mismatch.patch b/package/gdb/6.6a/600-fix-compile-flag-mismatch.patch
deleted file mode 100644
index 60f0ace..0000000
--- a/package/gdb/6.6a/600-fix-compile-flag-mismatch.patch
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
diff --git a/package/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch b/package/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
deleted file mode 100644
index 65c4b90..0000000
--- a/package/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
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
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index e853469..4dbc81d 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -17,27 +17,20 @@ choice
 	prompt "GDB debugger Version"
 	depends on !BR2_arc
 	depends on !BR2_microblaze
-	default BR2_GDB_VERSION_6_6 if BR2_bfin
 	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
 	default BR2_GDB_VERSION_7_5
 	help
 	  Select the version of gdb you wish to use.
 
-	config BR2_GDB_VERSION_6_6
-		bool "gdb 6.6"
-		depends on BR2_bfin
-
 	config BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
 		depends on BR2_avr32
 		bool "gdb 6.7.1-avr32-2.1.5"
 
 	config BR2_GDB_VERSION_7_4
 		bool "gdb 7.4.x"
-		depends on !BR2_bfin
 
 	config BR2_GDB_VERSION_7_5
 		bool "gdb 7.5.x"
-		depends on !BR2_bfin
 
 endchoice
 
-- 
1.9.3
