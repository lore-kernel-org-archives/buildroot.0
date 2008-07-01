From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  1 Jul 2008 14:35:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb/6.5
Message-ID: <20080701213534.602683C678@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-01 14:35:33 -0700 (Tue, 01 Jul 2008)
New Revision: 22598

Log:
Fix gbd-6.5, courtesy Fathi Boudra

Modified:
   trunk/buildroot/toolchain/gdb/6.5/100-uclibc-conf.patch
   trunk/buildroot/toolchain/gdb/6.5/200-uclibc-readline-conf.patch
   trunk/buildroot/toolchain/gdb/6.5/400-mips-coredump.patch-2.4.23-29
   trunk/buildroot/toolchain/gdb/6.5/500-thread-timeout.patch
   trunk/buildroot/toolchain/gdb/6.5/600-fix-compile-flag-mismatch.patch


Changeset:
Modified: trunk/buildroot/toolchain/gdb/6.5/100-uclibc-conf.patch
===================================================================
--- trunk/buildroot/toolchain/gdb/6.5/100-uclibc-conf.patch	2008-07-01 19:24:36 UTC (rev 22597)
+++ trunk/buildroot/toolchain/gdb/6.5/100-uclibc-conf.patch	2008-07-01 21:35:33 UTC (rev 22598)
@@ -1,7 +1,7 @@
---- gdb-6.3/bfd/configure.orig	Fri Oct  8 16:53:56 2004
-+++ gdb-6.3/bfd/configure	Sun Feb 27 18:32:58 2005
-@@ -3583,6 +3583,11 @@
-   lt_cv_file_magic_test_file=`echo /lib/libc.so* /lib/libc-*.so`
+--- a/bfd/configure
++++ b/bfd/configure
+@@ -3580,6 +3580,11 @@
+   lt_cv_deplibs_check_method=pass_all
    ;;
  
 +linux-uclibc*)
@@ -12,9 +12,9 @@
  netbsd* | knetbsd*-gnu)
    if echo __ELF__ | $CC -E - | grep __ELF__ > /dev/null; then
      lt_cv_deplibs_check_method='match_pattern /lib[^/\.]+\.so\.[0-9]+\.[0-9]+$'
---- gdb-6.3/libtool.m4.orig	Wed Jul 21 21:21:41 2004
-+++ gdb-6.3/libtool.m4	Mon Feb 28 00:08:11 2005
-@@ -653,6 +653,11 @@
+--- a/libtool.m4
++++ b/libtool.m4
+@@ -751,6 +751,11 @@
    fi
    ;;
  
@@ -26,8 +26,8 @@
  newsos6)
    [lt_cv_deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [ML]SB (executable|dynamic lib)']
    lt_cv_file_magic_cmd=/usr/bin/file
---- gdb-6.3/ltconfig.orig	Tue Oct  5 15:34:42 2004
-+++ gdb-6.3/ltconfig	Sun Feb 27 18:14:41 2005
+--- a/ltconfig
++++ b/ltconfig
 @@ -602,7 +602,7 @@
  
  # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
@@ -62,9 +62,9 @@
  netbsd*)
    need_lib_prefix=no
    need_version=no
---- gdb-6.3/opcodes/configure.orig	Fri Sep 17 08:13:38 2004
-+++ gdb-6.3/opcodes/configure	Mon Feb 28 00:09:42 2005
-@@ -3595,6 +3595,11 @@
+--- a/opcodes/configure
++++ b/opcodes/configure
+@@ -3591,6 +3591,11 @@
    fi
    ;;
  

Modified: trunk/buildroot/toolchain/gdb/6.5/200-uclibc-readline-conf.patch
===================================================================
--- trunk/buildroot/toolchain/gdb/6.5/200-uclibc-readline-conf.patch	2008-07-01 19:24:36 UTC (rev 22597)
+++ trunk/buildroot/toolchain/gdb/6.5/200-uclibc-readline-conf.patch	2008-07-01 21:35:33 UTC (rev 22598)
@@ -1,6 +1,6 @@
---- gdb-6.1.1-dist/readline/configure	2003-05-27 18:29:47.000000000 -0500
-+++ gdb-6.1.1/readline/configure	2004-08-09 14:20:23.000000000 -0500
-@@ -6249,7 +6249,12 @@
+--- a/readline/configure
++++ b/readline/configure
+@@ -7871,7 +7871,12 @@
  
  
  echo "$as_me:$LINENO: checking for mbstate_t" >&5

Modified: trunk/buildroot/toolchain/gdb/6.5/400-mips-coredump.patch-2.4.23-29
===================================================================
--- trunk/buildroot/toolchain/gdb/6.5/400-mips-coredump.patch-2.4.23-29	2008-07-01 19:24:36 UTC (rev 22597)
+++ trunk/buildroot/toolchain/gdb/6.5/400-mips-coredump.patch-2.4.23-29	2008-07-01 21:35:33 UTC (rev 22598)
@@ -1,9 +1,9 @@
 Sometime around 2.4.22-23, the mips pt_regs.h fields were reordered, breaking
 coredump handling by gdb for current kernels.  Update the hardcoded constants
 to reflect the change.
---- gdb-6.2.1/gdb/mips-linux-tdep.c-orig	2004-10-29 14:23:55.000000000 -0500
-+++ gdb-6.2.1/gdb/mips-linux-tdep.c	2004-10-29 14:26:44.000000000 -0500
-@@ -53,12 +53,22 @@
+--- a/gdb/mips-linux-tdep.h
++++ b/gdb/mips-linux-tdep.h
+@@ -41,12 +41,22 @@
  
  #define EF_REG0			6
  #define EF_REG31		37

Modified: trunk/buildroot/toolchain/gdb/6.5/500-thread-timeout.patch
===================================================================
--- trunk/buildroot/toolchain/gdb/6.5/500-thread-timeout.patch	2008-07-01 19:24:36 UTC (rev 22597)
+++ trunk/buildroot/toolchain/gdb/6.5/500-thread-timeout.patch	2008-07-01 21:35:33 UTC (rev 22598)
@@ -1,14 +1,14 @@
---- gdb-6.3.org/gdb/gdbserver/thread-db.c	2004-10-17 02:42:00.000000000 +0900
-+++ gdb-6.3/gdb/gdbserver/thread-db.c	2005-01-27 12:19:29.000000000 +0900
+--- a/gdb/gdbserver/thread-db.c
++++ b/gdb/gdbserver/thread-db.c
 @@ -21,6 +21,7 @@
-    Foundation, Inc., 59 Temple Place - Suite 330,
-    Boston, MA 02111-1307, USA.  */
+    Foundation, Inc., 51 Franklin Street, Fifth Floor,
+    Boston, MA 02110-1301, USA.  */
  
 +#include <unistd.h>
  #include "server.h"
  
  #include "linux-low.h"
-@@ -142,6 +143,7 @@
+@@ -134,6 +135,7 @@
    td_event_msg_t msg;
    td_err_e err;
    struct inferior_linux_data *tdata;
@@ -16,7 +16,7 @@
  
    if (debug_threads)
      fprintf (stderr, "Thread creation event.\n");
-@@ -152,7 +154,13 @@
+@@ -144,7 +146,13 @@
       In the LinuxThreads implementation, this is safe,
       because all events come from the manager thread
       (except for its own creation, of course).  */
@@ -31,4 +31,3 @@
    if (err != TD_OK)
      fprintf (stderr, "thread getmsg err: %s\n",
  	     thread_db_err_str (err));
-

Modified: trunk/buildroot/toolchain/gdb/6.5/600-fix-compile-flag-mismatch.patch
===================================================================
--- trunk/buildroot/toolchain/gdb/6.5/600-fix-compile-flag-mismatch.patch	2008-07-01 19:24:36 UTC (rev 22597)
+++ trunk/buildroot/toolchain/gdb/6.5/600-fix-compile-flag-mismatch.patch	2008-07-01 21:35:33 UTC (rev 22598)
@@ -1,6 +1,5 @@
-diff -ur gdb-6.4/gdb/configure gdb-6.4-patched/gdb/configure
---- gdb-6.4/gdb/configure	2005-07-25 10:08:40.000000000 -0500
-+++ gdb-6.4-patched/gdb/configure	2007-02-05 13:22:36.000000000 -0600
+--- a/gdb/configure
++++ b/gdb/configure
 @@ -309,7 +309,7 @@
  # include <unistd.h>
  #endif"
@@ -10,7 +9,7 @@
  ac_subdirs_all="$ac_subdirs_all gdbtk"
  ac_subdirs_all="$ac_subdirs_all multi-ice"
  ac_subdirs_all="$ac_subdirs_all gdbserver"
-@@ -5940,7 +5940,7 @@
+@@ -5939,7 +5939,7 @@
  
  
  
@@ -18,10 +17,9 @@
 +subdirs="$subdirs doc"
  
  
- . $srcdir/configure.host
-diff -ur gdb-6.4/gdb/gdbserver/configure gdb-6.4-patched/gdb/gdbserver/configure
---- gdb-6.4/gdb/gdbserver/configure	2005-09-17 18:14:37.000000000 -0500
-+++ gdb-6.4-patched/gdb/gdbserver/configure	2007-02-05 13:22:58.000000000 -0600
+ # Provide defaults for some variables set by the per-host and per-target
+--- a/gdb/gdbserver/configure
++++ b/gdb/gdbserver/configure
 @@ -1239,7 +1239,7 @@
        ac_cache_corrupted=: ;;
      ,);;
@@ -31,9 +29,8 @@
  	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
  echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
  	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
-diff -ur gdb-6.4/gdb/testsuite/configure gdb-6.4-patched/gdb/testsuite/configure
---- gdb-6.4/gdb/testsuite/configure	2005-04-11 09:13:12.000000000 -0500
-+++ gdb-6.4-patched/gdb/testsuite/configure	2007-02-05 13:22:36.000000000 -0600
+--- a/gdb/testsuite/configure
++++ b/gdb/testsuite/configure
 @@ -1248,7 +1248,7 @@
        ac_cache_corrupted=: ;;
      ,);;
@@ -43,27 +40,25 @@
  	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
  echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
  	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
-diff -ur gdb-6.4/Makefile.in gdb-6.4-patched/Makefile.in
---- gdb-6.4/Makefile.in	2005-12-01 23:29:54.000000000 -0600
-+++ gdb-6.4-patched/Makefile.in	2007-02-05 13:22:36.000000000 -0600
-@@ -383,7 +383,7 @@
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -329,7 +329,7 @@
  # CFLAGS will be just -g.  We want to ensure that TARGET libraries
  # (which we know are built with gcc) are built with optimizations so
  # prepend -O2 when setting CFLAGS_FOR_TARGET.
 -CFLAGS_FOR_TARGET = -O2 $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
 +CFLAGS_FOR_TARGET = $(strip $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
  SYSROOT_CFLAGS_FOR_TARGET = @SYSROOT_CFLAGS_FOR_TARGET@
- 
- # If GCC_FOR_TARGET is not overriden on the command line, then this
-diff -ur gdb-6.4/Makefile.tpl gdb-6.4-patched/Makefile.tpl
---- gdb-6.4/Makefile.tpl	2005-10-22 05:37:55.000000000 -0500
-+++ gdb-6.4-patched/Makefile.tpl	2007-02-05 13:22:36.000000000 -0600
-@@ -386,7 +386,7 @@
+ CXXFLAGS_FOR_TARGET = $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
+ LIBCFLAGS_FOR_TARGET = $(CFLAGS_FOR_TARGET)
+--- a/Makefile.tpl
++++ b/Makefile.tpl
+@@ -332,7 +332,7 @@
  # CFLAGS will be just -g.  We want to ensure that TARGET libraries
  # (which we know are built with gcc) are built with optimizations so
  # prepend -O2 when setting CFLAGS_FOR_TARGET.
 -CFLAGS_FOR_TARGET = -O2 $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
 +CFLAGS_FOR_TARGET = $(strip $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
  SYSROOT_CFLAGS_FOR_TARGET = @SYSROOT_CFLAGS_FOR_TARGET@
- 
- # If GCC_FOR_TARGET is not overriden on the command line, then this
+ CXXFLAGS_FOR_TARGET = $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
+ LIBCFLAGS_FOR_TARGET = $(CFLAGS_FOR_TARGET)
