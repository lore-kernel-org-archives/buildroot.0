From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 28 Apr 2009 18:42:03 +0000 (UTC)
Subject: [Buildroot] svn commit: [26230] trunk/buildroot/toolchain/gdb:
	snapshot
Message-ID: <20090428184203.604A077118@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-28 18:42:02 +0000 (Tue, 28 Apr 2009)
New Revision: 26230

Log:
toolchain/gdb: remove broken snapshot support

Removed:
   trunk/buildroot/toolchain/gdb/snapshot/100-uclibc-conf.patch
   trunk/buildroot/toolchain/gdb/snapshot/200-uclibc-readline-conf.patch
   trunk/buildroot/toolchain/gdb/snapshot/400-mips-coredump.patch-2.4.23-29
   trunk/buildroot/toolchain/gdb/snapshot/400-mips-nptl-support.patch
   trunk/buildroot/toolchain/gdb/snapshot/500-thread-timeout.patch
   trunk/buildroot/toolchain/gdb/snapshot/680-debian_sim-destdir.patch
   trunk/buildroot/toolchain/gdb/snapshot/690-debian_member-field-symtab.patch

Modified:
   trunk/buildroot/toolchain/gdb/Config.in
   trunk/buildroot/toolchain/gdb/gdb.mk


Changeset:
Modified: trunk/buildroot/toolchain/gdb/Config.in
===================================================================
--- trunk/buildroot/toolchain/gdb/Config.in	2009-04-28 18:30:20 UTC (rev 26229)
+++ trunk/buildroot/toolchain/gdb/Config.in	2009-04-28 18:42:02 UTC (rev 26230)
@@ -57,10 +57,6 @@
 		bool "gdb 6.8"
 		depends on !BR2_avr32
 
-	config BR2_GDB_VERSION_SNAPSHOT
-		bool "gdb snapshot"
-		depends on !BR2_avr32 && !BR2_nios2
-
 endchoice
 
 config BR2_GDB_VERSION
@@ -72,4 +68,3 @@
 	default "6.6"      if BR2_GDB_VERSION_6_6
 	default "6.7.1"    if BR2_GDB_VERSION_6_7_1
 	default "6.8"      if BR2_GDB_VERSION_6_8
-	default "snapshot" if BR2_GDB_VERSION_SNAPSHOT

Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2009-04-28 18:30:20 UTC (rev 26229)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2009-04-28 18:42:02 UTC (rev 26230)
@@ -6,15 +6,6 @@
 GDB_VERSION:=$(strip $(subst ",, $(BR2_GDB_VERSION)))
 #"))
 
-ifeq ($(GDB_VERSION),snapshot)
-# Be aware that this changes daily....
-GDB_SITE:=ftp://sources.redhat.com/pub/gdb/snapshots/current
-GDB_SOURCE:=gdb.tar.bz2
-GDB_CAT:=$(BZCAT)
-GDB_DIR:=$(TOOL_BUILD_DIR)/gdb-$(GDB_VERSION)
-GDB_PATCH_DIR:=toolchain/gdb/$(GDB_VERSION)
-else
-
 GDB_OFFICIAL_VERSION:=$(GDB_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GDB_RELEASE)
 
 GDB_SOURCE:=gdb-$(GDB_OFFICIAL_VERSION).tar.bz2
@@ -38,7 +29,6 @@
 ifeq ($(GDB_VERSION),6.3)
 DISABLE_GDBMI:=--disable-gdbmi
 endif
-endif
 
 $(DL_DIR)/$(GDB_SOURCE):
 	$(call DOWNLOAD,$(GDB_SITE),$(GDB_SOURCE))

Deleted: trunk/buildroot/toolchain/gdb/snapshot/100-uclibc-conf.patch
===================================================================
--- trunk/buildroot/toolchain/gdb/snapshot/100-uclibc-conf.patch	2009-04-28 18:30:20 UTC (rev 26229)
+++ trunk/buildroot/toolchain/gdb/snapshot/100-uclibc-conf.patch	2009-04-28 18:42:02 UTC (rev 26230)
@@ -1,94 +0,0 @@
-diff -urN gdb-6.3.50.20050915/bfd/config.bfd gdb-6.3.50.20050915-patched/bfd/config.bfd
---- gdb-6.3.50.20050915/bfd/config.bfd	2005-08-30 11:06:00.000000000 -0500
-+++ gdb-6.3.50.20050915-patched/bfd/config.bfd	2005-09-15 20:08:49.000000000 -0500
-@@ -725,7 +725,7 @@
-     targ_defvec=hp300hpux_vec
-     targ_underscore=yes
-     ;;
--  m68*-*-linux*aout*)
-+  m68*-*-linux*aout* | m68*-*-linux-uclibc*)
-     targ_defvec=m68klinux_vec
-     targ_selvecs=bfd_elf32_m68k_vec
-     targ_underscore=yes
-diff -urN gdb-6.3.50.20050915/bfd/configure gdb-6.3.50.20050915-patched/bfd/configure
---- gdb-6.3.50.20050915/bfd/configure	2005-08-26 04:47:43.000000000 -0500
-+++ gdb-6.3.50.20050915-patched/bfd/configure	2005-09-15 20:09:54.000000000 -0500
-@@ -3585,6 +3585,11 @@
-   lt_cv_file_magic_test_file=`echo /lib/libc.so* /lib/libc-*.so`
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
-diff -urN gdb-6.3.50.20050915/libtool.m4 gdb-6.3.50.20050915-patched/libtool.m4
---- gdb-6.3.50.20050915/libtool.m4	2005-07-15 21:36:38.000000000 -0500
-+++ gdb-6.3.50.20050915-patched/libtool.m4	2005-09-15 20:13:33.000000000 -0500
-@@ -653,6 +653,11 @@
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
-diff -urN gdb-6.3.50.20050915/ltconfig gdb-6.3.50.20050915-patched/ltconfig
---- gdb-6.3.50.20050915/ltconfig	2005-07-15 21:36:38.000000000 -0500
-+++ gdb-6.3.50.20050915-patched/ltconfig	2005-09-15 21:23:35.000000000 -0500
-@@ -602,7 +602,7 @@
- 
- # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
- case $host_os in
--linux-gnu*) ;;
-+linux-gnu*|linux-uclibc*) ;;
- linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
- esac
- 
-@@ -1270,6 +1270,24 @@
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
-diff -urN gdb-6.3.50.20050915/opcodes/configure gdb-6.3.50.20050915-patched/opcodes/configure
---- gdb-6.3.50.20050915/opcodes/configure	2005-08-17 22:49:00.000000000 -0500
-+++ gdb-6.3.50.20050915-patched/opcodes/configure	2005-09-15 21:22:20.000000000 -0500
-@@ -3596,6 +3596,11 @@
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

Deleted: trunk/buildroot/toolchain/gdb/snapshot/200-uclibc-readline-conf.patch
===================================================================
--- trunk/buildroot/toolchain/gdb/snapshot/200-uclibc-readline-conf.patch	2009-04-28 18:30:20 UTC (rev 26229)
+++ trunk/buildroot/toolchain/gdb/snapshot/200-uclibc-readline-conf.patch	2009-04-28 18:42:02 UTC (rev 26230)
@@ -1,16 +0,0 @@
-diff -urN gdb-6.3.50.20050915/readline/configure gdb-6.3.50.20050915-patched/readline/configure
---- gdb-6.3.50.20050915/readline/configure	2005-07-03 03:22:47.000000000 -0500
-+++ gdb-6.3.50.20050915-patched/readline/configure	2005-09-15 22:25:00.000000000 -0500
-@@ -6723,7 +6723,12 @@
- 
- 
- echo "$as_me:$LINENO: checking for mbstate_t" >&5
-+echo $ECHO_N "bash_cv_have_mbstate_t=$bash_cv_have_mbstate_t" >&6
- echo $ECHO_N "checking for mbstate_t... $ECHO_C" >&6
-+if test "${bash_cv_have_mbstate_t+set}" != set; then
-+  bash_cv_have_mbstate_t=yes
-+  echo $ECHO_N "WARNING!! forcing to yes!!! $ECHO_C" >&6
-+fi
- if test "${bash_cv_have_mbstate_t+set}" = set; then
-   echo $ECHO_N "(cached) $ECHO_C" >&6
- else

Deleted: trunk/buildroot/toolchain/gdb/snapshot/400-mips-coredump.patch-2.4.23-29
===================================================================
--- trunk/buildroot/toolchain/gdb/snapshot/400-mips-coredump.patch-2.4.23-29	2009-04-28 18:30:20 UTC (rev 26229)
+++ trunk/buildroot/toolchain/gdb/snapshot/400-mips-coredump.patch-2.4.23-29	2009-04-28 18:42:02 UTC (rev 26230)
@@ -1,30 +0,0 @@
-Sometime around 2.4.22-23, the mips pt_regs.h fields were reordered, breaking
-coredump handling by gdb for current kernels.  Update the hardcoded constants
-to reflect the change.
---
-diff -urN gdb-6.3.50.20050915/gdb/mips-linux-tdep.c gdb-6.3.50.20050915-patched/gdb/mips-linux-tdep.c
---- gdb-6.3.50.20050915/gdb/mips-linux-tdep.c	2005-04-02 16:59:34.000000000 -0600
-+++ gdb-6.3.50.20050915-patched/gdb/mips-linux-tdep.c	2005-09-15 22:33:13.000000000 -0500
-@@ -54,12 +54,22 @@
- 
- #define EF_REG0			6
- #define EF_REG31		37
-+
-+#if 0
- #define EF_LO			38
- #define EF_HI			39
- #define EF_CP0_EPC		40
- #define EF_CP0_BADVADDR		41
- #define EF_CP0_STATUS		42
- #define EF_CP0_CAUSE		43
-+#else
-+#define EF_CP0_STATUS		38
-+#define EF_LO			39
-+#define EF_HI			40
-+#define EF_CP0_BADVADDR		41
-+#define EF_CP0_CAUSE		42
-+#define EF_CP0_EPC		43
-+#endif
- 
- #define EF_SIZE			180
- 

Deleted: trunk/buildroot/toolchain/gdb/snapshot/400-mips-nptl-support.patch
===================================================================
--- trunk/buildroot/toolchain/gdb/snapshot/400-mips-nptl-support.patch	2009-04-28 18:30:20 UTC (rev 26229)
+++ trunk/buildroot/toolchain/gdb/snapshot/400-mips-nptl-support.patch	2009-04-28 18:42:02 UTC (rev 26230)
@@ -1,143 +0,0 @@
-2005-03-17  Daniel Jacobowitz  <dan@codesourcery.com>
-
-	* linux-mips-low.c: Include "gdb_proc_service.h".
-	(PTRACE_GET_THREAD_AREA): Define.
-	(ps_get_thread_area): New function.
-	* Makefile.in: Update dependencies for linux-mips-low.o,
-	linux-i386-low.o, and linux-x86-64-low.o.
-
-2005-03-17  Daniel Jacobowitz  <dan@codesourcery.com>
-
-	* linux-mips-low.c: Include "gdb_proc_service.h".
-	(PTRACE_GET_THREAD_AREA): Define.
-	(ps_get_thread_area): New function.
-	* Makefile.in (mips-linux-nat.o): Update dependencies.
---
-diff -urN gdb-6.3.50.20050915/gdb/Makefile.in gdb-6.3.50.20050915-patched/gdb/Makefile.in
---- gdb-6.3.50.20050915/gdb/Makefile.in	2005-09-10 13:11:01.000000000 -0500
-+++ gdb-6.3.50.20050915-patched/gdb/Makefile.in	2005-09-15 19:24:39.000000000 -0500
-@@ -2282,7 +2282,7 @@
- 	$(gdb_string_h) $(mips_tdep_h) $(solib_svr4_h)
- mips-irix-tdep.o: mips-irix-tdep.c $(defs_h) $(osabi_h) $(elf_bfd_h)
- mips-linux-nat.o: mips-linux-nat.c $(defs_h) $(mips_tdep_h) $(target_h) \
--	$(linux_nat_h)
-+	$(linux_nat_h) $(gdb_proc_service_h)
- mips-linux-tdep.o: mips-linux-tdep.c $(defs_h) $(gdbcore_h) $(target_h) \
- 	$(solib_svr4_h) $(osabi_h) $(mips_tdep_h) $(gdb_string_h) \
- 	$(gdb_assert_h) $(frame_h) $(regcache_h) $(trad_frame_h) \
-diff -urN gdb-6.3.50.20050915/gdb/gdbserver/Makefile.in gdb-6.3.50.20050915-patched/gdb/gdbserver/Makefile.in
---- gdb-6.3.50.20050915/gdb/gdbserver/Makefile.in	2005-05-28 17:09:04.000000000 -0500
-+++ gdb-6.3.50.20050915-patched/gdb/gdbserver/Makefile.in	2005-09-15 19:20:01.000000000 -0500
-@@ -267,15 +267,18 @@
- linux-arm-low.o: linux-arm-low.c $(linux_low_h) $(server_h)
- linux-cris-low.o: linux-cris-low.c $(linux_low_h) $(server_h)
- linux-crisv32-low.o: linux-crisv32-low.c $(linux_low_h) $(server_h)
--linux-i386-low.o: linux-i386-low.c $(linux_low_h) $(server_h)
-+linux-i386-low.o: linux-i386-low.c $(linux_low_h) $(server_h) \
-+	$(gdb_proc_service_h)
- linux-ia64-low.o: linux-ia64-low.c $(linux_low_h) $(server_h)
- linux-m32r-low.o: linux-m32r-low.c $(linux_low_h) $(server_h)
--linux-mips-low.o: linux-mips-low.c $(linux_low_h) $(server_h)
-+linux-mips-low.o: linux-mips-low.c $(linux_low_h) $(server_h) \
-+	$(gdb_proc_service_h)
- linux-ppc-low.o: linux-ppc-low.c $(linux_low_h) $(server_h)
- linux-ppc64-low.o: linux-ppc64-low.c $(linux_low_h) $(server_h)
- linux-s390-low.o: linux-s390-low.c $(linux_low_h) $(server_h)
- linux-sh-low.o: linux-sh-low.c $(linux_low_h) $(server_h)
--linux-x86-64-low.o: linux-x86-64-low.c $(linux_low_h) $(server_h)
-+linux-x86-64-low.o: linux-x86-64-low.c $(linux_low_h) $(server_h) \
-+	$(gdb_proc_service_h)
- 
- reg-arm.o : reg-arm.c $(regdef_h)
- reg-arm.c : $(srcdir)/../regformats/reg-arm.dat $(regdat_sh)
-diff -urN gdb-6.3.50.20050915/gdb/gdbserver/linux-mips-low.c gdb-6.3.50.20050915-patched/gdb/gdbserver/linux-mips-low.c
---- gdb-6.3.50.20050915/gdb/gdbserver/linux-mips-low.c	2005-06-12 20:59:22.000000000 -0500
-+++ gdb-6.3.50.20050915-patched/gdb/gdbserver/linux-mips-low.c	2005-09-15 19:16:54.000000000 -0500
-@@ -22,6 +22,26 @@
- #include "server.h"
- #include "linux-low.h"
- 
-+#include <sys/ptrace.h>
-+
-+/* Correct for all GNU/Linux targets (for quite some time).  */
-+#define GDB_GREGSET_T elf_gregset_t
-+#define GDB_FPREGSET_T elf_fpregset_t
-+
-+#ifndef HAVE_ELF_FPREGSET_T
-+/* Make sure we have said types.  Not all platforms bring in <linux/elf.h>
-+   via <sys/procfs.h>.  */
-+#ifdef HAVE_LINUX_ELF_H
-+#include <linux/elf.h>
-+#endif
-+#endif
-+
-+#include "../gdb_proc_service.h"
-+
-+#ifndef PTRACE_GET_THREAD_AREA
-+#define PTRACE_GET_THREAD_AREA 25
-+#endif
-+
- #ifdef HAVE_SYS_REG_H
- #include <sys/reg.h>
- #endif
-@@ -140,6 +160,23 @@
-   return 0;
- }
- 
-+/* Fetch the thread-local storage pointer for libthread_db.  */
-+
-+ps_err_e
-+ps_get_thread_area (const struct ps_prochandle *ph,
-+                    lwpid_t lwpid, int idx, void **base)
-+{
-+  if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
-+    return PS_ERR;
-+
-+  /* IDX is the bias from the thread pointer to the beginning of the
-+     thread descriptor.  It has to be subtracted due to implementation
-+     quirks in libthread_db.  */
-+  *base = (void *) ((char *)*base - idx);
-+
-+  return PS_OK;
-+}
-+
- struct linux_target_ops the_low_target = {
-   mips_num_regs,
-   mips_regmap,
-diff -urN gdb-6.3.50.20050915/gdb/mips-linux-nat.c gdb-6.3.50.20050915-patched/gdb/mips-linux-nat.c
---- gdb-6.3.50.20050915/gdb/mips-linux-nat.c	2005-09-10 13:11:04.000000000 -0500
-+++ gdb-6.3.50.20050915-patched/gdb/mips-linux-nat.c	2005-09-15 19:16:54.000000000 -0500
-@@ -24,6 +24,12 @@
- #include "target.h"
- #include "linux-nat.h"
- 
-+#include "gdb_proc_service.h"
-+
-+#ifndef PTRACE_GET_THREAD_AREA
-+#define PTRACE_GET_THREAD_AREA 25
-+#endif
-+
- /* Pseudo registers can not be read.  ptrace does not provide a way to
-    read (or set) MIPS_PS_REGNUM, and there's no point in reading or
-    setting MIPS_ZERO_REGNUM.  We also can not set BADVADDR, CAUSE, or
-@@ -72,3 +78,20 @@
- {
-   add_target (linux_target ());
- }
-+
-+/* Fetch the thread-local storage pointer for libthread_db.  */
-+
-+ps_err_e
-+ps_get_thread_area (const struct ps_prochandle *ph,
-+                    lwpid_t lwpid, int idx, void **base)
-+{
-+  if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
-+    return PS_ERR;
-+
-+  /* IDX is the bias from the thread pointer to the beginning of the
-+     thread descriptor.  It has to be subtracted due to implementation
-+     quirks in libthread_db.  */
-+  *base = (void *) ((char *)*base - idx);
-+
-+  return PS_OK;
-+}

Deleted: trunk/buildroot/toolchain/gdb/snapshot/500-thread-timeout.patch
===================================================================
--- trunk/buildroot/toolchain/gdb/snapshot/500-thread-timeout.patch	2009-04-28 18:30:20 UTC (rev 26229)
+++ trunk/buildroot/toolchain/gdb/snapshot/500-thread-timeout.patch	2009-04-28 18:42:02 UTC (rev 26230)
@@ -1,34 +0,0 @@
---- gdb-6.3.org/gdb/gdbserver/thread-db.c	2004-10-17 02:42:00.000000000 +0900
-+++ gdb-6.3/gdb/gdbserver/thread-db.c	2005-01-27 12:19:29.000000000 +0900
-@@ -21,6 +21,7 @@
-    Foundation, Inc., 59 Temple Place - Suite 330,
-    Boston, MA 02111-1307, USA.  */
- 
-+#include <unistd.h>
- #include "server.h"
- 
- #include "linux-low.h"
-@@ -142,6 +143,7 @@
-   td_event_msg_t msg;
-   td_err_e err;
-   struct inferior_linux_data *tdata;
-+  int timeout;
- 
-   if (debug_threads)
-     fprintf (stderr, "Thread creation event.\n");
-@@ -152,7 +154,13 @@
-      In the LinuxThreads implementation, this is safe,
-      because all events come from the manager thread
-      (except for its own creation, of course).  */
--  err = td_ta_event_getmsg (thread_agent, &msg);
-+  for (timeout = 0; timeout < 50000; timeout++)
-+    {
-+      err = td_ta_event_getmsg (thread_agent, &msg);
-+      if (err != TD_NOMSG)
-+	break;
-+      usleep(1000);
-+    }
-   if (err != TD_OK)
-     fprintf (stderr, "thread getmsg err: %s\n",
- 	     thread_db_err_str (err));
-

Deleted: trunk/buildroot/toolchain/gdb/snapshot/680-debian_sim-destdir.patch
===================================================================
--- trunk/buildroot/toolchain/gdb/snapshot/680-debian_sim-destdir.patch	2009-04-28 18:30:20 UTC (rev 26229)
+++ trunk/buildroot/toolchain/gdb/snapshot/680-debian_sim-destdir.patch	2009-04-28 18:42:02 UTC (rev 26230)
@@ -1,14 +0,0 @@
-Fix some missing uses of DESTDIR in the sim/ directories.  The Debian
-packages use DESTDIR to build.
---
-diff -ur gdb-6.3.50.20050915/sim/Makefile.in gdb-6.3.50.20050915-patched/sim/Makefile.in
---- gdb-6.3.50.20050915/sim/Makefile.in	2005-01-28 18:53:13.000000000 -0600
-+++ gdb-6.3.50.20050915-patched/sim/Makefile.in	2005-09-15 23:17:42.000000000 -0500
-@@ -93,6 +93,7 @@
- 	"CC=$(CC)" \
- 	"CC_FOR_BUILD=$(CC_FOR_BUILD)" \
- 	"CFLAGS=$(CFLAGS)" \
-+	"DESTDIR=$(DESTDIR)" \
- 	"CHILLFLAGS=$(CHILLFLAGS)" \
- 	"CHILL=$(CHILL_FOR_TARGET)" \
- 	"CHILL_FOR_TARGET=$(CHILL_FOR_TARGET)" \

Deleted: trunk/buildroot/toolchain/gdb/snapshot/690-debian_member-field-symtab.patch
===================================================================
--- trunk/buildroot/toolchain/gdb/snapshot/690-debian_member-field-symtab.patch	2009-04-28 18:30:20 UTC (rev 26229)
+++ trunk/buildroot/toolchain/gdb/snapshot/690-debian_member-field-symtab.patch	2009-04-28 18:42:02 UTC (rev 26230)
@@ -1,20 +0,0 @@
-Status: unsubmitted
-
-This patch was for Debian bug #239535.  It needs to be tested, and
-submitted.
---
-diff -ur gdb-6.3.50.20050915/gdb/valops.c gdb-6.3.50.20050915-patched/gdb/valops.c
---- gdb-6.3.50.20050915/gdb/valops.c	2005-05-26 23:39:32.000000000 -0500
-+++ gdb-6.3.50.20050915-patched/gdb/valops.c	2005-09-15 23:21:49.000000000 -0500
-@@ -2256,8 +2256,10 @@
- 	return 1;
-     }
- 
-+  /* Check each baseclass.  Call check_typedef, which will follow typedefs
-+     and do opaque/stub type resolution.  */
-   for (i = TYPE_N_BASECLASSES (type) - 1; i >= 0; i--)
--    if (check_field_in (TYPE_BASECLASS (type, i), name))
-+    if (check_field_in (check_typedef (TYPE_BASECLASS (type, i)), name))
-       return 1;
- 
-   return 0;
