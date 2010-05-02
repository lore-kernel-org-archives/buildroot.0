From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 00:18:50 +0200
Subject: [Buildroot] [git commit master] toolchain/gdb: get rid of 6.4 / 6.5
Message-ID: <20100502222202.8A61C8D318@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a54f53d3e25aed09f056d5ea67b050d2d49c90cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These are ancient (2006) and upstream strongly discourage using them:
ftp://sourceware.org/pub/gdb/old-releases/README

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/6.4/100-uclibc-conf.patch            |   78 ------------------
 toolchain/gdb/6.4/200-uclibc-readline-conf.patch   |   15 ----
 .../gdb/6.4/400-mips-coredump.patch-2.4.23-29      |   28 ------
 toolchain/gdb/6.4/500-thread-timeout.patch         |   34 --------
 .../gdb/6.4/600-fix-compile-flag-mismatch.patch    |   87 --------------------
 toolchain/gdb/6.5/100-uclibc-conf.patch            |   78 ------------------
 toolchain/gdb/6.5/200-uclibc-readline-conf.patch   |   15 ----
 .../gdb/6.5/400-mips-coredump.patch-2.4.23-29      |   28 ------
 toolchain/gdb/6.5/500-thread-timeout.patch         |   33 --------
 .../gdb/6.5/600-fix-compile-flag-mismatch.patch    |   64 --------------
 toolchain/gdb/Config.in                            |   12 ---
 11 files changed, 0 insertions(+), 472 deletions(-)
 delete mode 100644 toolchain/gdb/6.4/100-uclibc-conf.patch
 delete mode 100644 toolchain/gdb/6.4/200-uclibc-readline-conf.patch
 delete mode 100644 toolchain/gdb/6.4/400-mips-coredump.patch-2.4.23-29
 delete mode 100644 toolchain/gdb/6.4/500-thread-timeout.patch
 delete mode 100644 toolchain/gdb/6.4/600-fix-compile-flag-mismatch.patch
 delete mode 100644 toolchain/gdb/6.5/100-uclibc-conf.patch
 delete mode 100644 toolchain/gdb/6.5/200-uclibc-readline-conf.patch
 delete mode 100644 toolchain/gdb/6.5/400-mips-coredump.patch-2.4.23-29
 delete mode 100644 toolchain/gdb/6.5/500-thread-timeout.patch
 delete mode 100644 toolchain/gdb/6.5/600-fix-compile-flag-mismatch.patch

diff --git a/toolchain/gdb/6.4/100-uclibc-conf.patch b/toolchain/gdb/6.4/100-uclibc-conf.patch
deleted file mode 100644
index 9d8fd4e..0000000
--- a/toolchain/gdb/6.4/100-uclibc-conf.patch
+++ /dev/null
@@ -1,78 +0,0 @@
---- gdb-6.3/bfd/configure.orig	Fri Oct  8 16:53:56 2004
-+++ gdb-6.3/bfd/configure	Sun Feb 27 18:32:58 2005
-@@ -3583,6 +3583,11 @@
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
---- gdb-6.3/libtool.m4.orig	Wed Jul 21 21:21:41 2004
-+++ gdb-6.3/libtool.m4	Mon Feb 28 00:08:11 2005
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
---- gdb-6.3/ltconfig.orig	Tue Oct  5 15:34:42 2004
-+++ gdb-6.3/ltconfig	Sun Feb 27 18:14:41 2005
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
---- gdb-6.3/opcodes/configure.orig	Fri Sep 17 08:13:38 2004
-+++ gdb-6.3/opcodes/configure	Mon Feb 28 00:09:42 2005
-@@ -3595,6 +3595,11 @@
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
diff --git a/toolchain/gdb/6.4/200-uclibc-readline-conf.patch b/toolchain/gdb/6.4/200-uclibc-readline-conf.patch
deleted file mode 100644
index ffe792d..0000000
--- a/toolchain/gdb/6.4/200-uclibc-readline-conf.patch
+++ /dev/null
@@ -1,15 +0,0 @@
---- gdb-6.1.1-dist/readline/configure	2003-05-27 18:29:47.000000000 -0500
-+++ gdb-6.1.1/readline/configure	2004-08-09 14:20:23.000000000 -0500
-@@ -6249,7 +6249,12 @@
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
diff --git a/toolchain/gdb/6.4/400-mips-coredump.patch-2.4.23-29 b/toolchain/gdb/6.4/400-mips-coredump.patch-2.4.23-29
deleted file mode 100644
index 4e17ba7..0000000
--- a/toolchain/gdb/6.4/400-mips-coredump.patch-2.4.23-29
+++ /dev/null
@@ -1,28 +0,0 @@
-Sometime around 2.4.22-23, the mips pt_regs.h fields were reordered, breaking
-coredump handling by gdb for current kernels.  Update the hardcoded constants
-to reflect the change.
---- gdb-6.2.1/gdb/mips-linux-tdep.c-orig	2004-10-29 14:23:55.000000000 -0500
-+++ gdb-6.2.1/gdb/mips-linux-tdep.c	2004-10-29 14:26:44.000000000 -0500
-@@ -53,12 +53,22 @@
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
diff --git a/toolchain/gdb/6.4/500-thread-timeout.patch b/toolchain/gdb/6.4/500-thread-timeout.patch
deleted file mode 100644
index 6db0a7a..0000000
--- a/toolchain/gdb/6.4/500-thread-timeout.patch
+++ /dev/null
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
diff --git a/toolchain/gdb/6.4/600-fix-compile-flag-mismatch.patch b/toolchain/gdb/6.4/600-fix-compile-flag-mismatch.patch
deleted file mode 100644
index 659a5f0..0000000
--- a/toolchain/gdb/6.4/600-fix-compile-flag-mismatch.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-diff -ur gdb-6.4/gdb/configure gdb-6.4-patched/gdb/configure
---- gdb-6.4/gdb/configure	2005-07-25 10:08:40.000000000 -0500
-+++ gdb-6.4-patched/gdb/configure	2007-02-05 13:22:36.000000000 -0600
-@@ -309,7 +309,7 @@
- # include <unistd.h>
- #endif"
- 
--ac_subdirs_all="$ac_subdirs_all doc testsuite"
-+ac_subdirs_all="$ac_subdirs_all doc"
- ac_subdirs_all="$ac_subdirs_all gdbtk"
- ac_subdirs_all="$ac_subdirs_all multi-ice"
- ac_subdirs_all="$ac_subdirs_all gdbserver"
-@@ -5940,7 +5940,7 @@
- 
- 
- 
--subdirs="$subdirs doc testsuite"
-+subdirs="$subdirs doc"
- 
- 
- . $srcdir/configure.host
-diff -ur gdb-6.4/gdb/gdbserver/configure gdb-6.4-patched/gdb/gdbserver/configure
---- gdb-6.4/gdb/gdbserver/configure	2005-09-17 18:14:37.000000000 -0500
-+++ gdb-6.4-patched/gdb/gdbserver/configure	2007-02-05 13:22:58.000000000 -0600
-@@ -1239,7 +1239,7 @@
-       ac_cache_corrupted=: ;;
-     ,);;
-     *)
--      if test "x$ac_old_val" != "x$ac_new_val"; then
-+      if test "`echo $ac_old_val`" != "`echo $ac_new_val`"; then
- 	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
- echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
- 	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
-diff -ur gdb-6.4/gdb/testsuite/configure gdb-6.4-patched/gdb/testsuite/configure
---- gdb-6.4/gdb/testsuite/configure	2005-04-11 09:13:12.000000000 -0500
-+++ gdb-6.4-patched/gdb/testsuite/configure	2007-02-05 13:22:36.000000000 -0600
-@@ -1248,7 +1248,7 @@
-       ac_cache_corrupted=: ;;
-     ,);;
-     *)
--      if test "x$ac_old_val" != "x$ac_new_val"; then
-+      if test "`echo $ac_old_val" != "`echo $ac_new_val"; then
- 	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
- echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
- 	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
-diff -ur gdb-6.4/Makefile.in gdb-6.4-patched/Makefile.in
---- gdb-6.4/Makefile.in	2005-12-01 23:29:54.000000000 -0600
-+++ gdb-6.4-patched/Makefile.in	2007-02-05 13:22:36.000000000 -0600
-@@ -383,7 +383,7 @@
- # CFLAGS will be just -g.  We want to ensure that TARGET libraries
- # (which we know are built with gcc) are built with optimizations so
- # prepend -O2 when setting CFLAGS_FOR_TARGET.
--CFLAGS_FOR_TARGET = -O2 $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
-+CFLAGS_FOR_TARGET = $(strip $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
- SYSROOT_CFLAGS_FOR_TARGET = @SYSROOT_CFLAGS_FOR_TARGET@
- 
- # If GCC_FOR_TARGET is not overriden on the command line, then this
-@@ -423,7 +423,7 @@
-     fi; \
-   fi`
- 
--CXXFLAGS_FOR_TARGET = $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
-+CXXFLAGS_FOR_TARGET = $(strip $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
- LIBCXXFLAGS_FOR_TARGET = $(CXXFLAGS_FOR_TARGET) -fno-implicit-templates
- 
- GCJ_FOR_TARGET=$(STAGE_CC_WRAPPER) @GCJ_FOR_TARGET@ $(FLAGS_FOR_TARGET)
-diff -ur gdb-6.4/Makefile.tpl gdb-6.4-patched/Makefile.tpl
---- gdb-6.4/Makefile.tpl	2005-10-22 05:37:55.000000000 -0500
-+++ gdb-6.4-patched/Makefile.tpl	2007-02-05 13:22:36.000000000 -0600
-@@ -386,7 +386,7 @@
- # CFLAGS will be just -g.  We want to ensure that TARGET libraries
- # (which we know are built with gcc) are built with optimizations so
- # prepend -O2 when setting CFLAGS_FOR_TARGET.
--CFLAGS_FOR_TARGET = -O2 $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
-+CFLAGS_FOR_TARGET = $(strip $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
- SYSROOT_CFLAGS_FOR_TARGET = @SYSROOT_CFLAGS_FOR_TARGET@
- 
- # If GCC_FOR_TARGET is not overriden on the command line, then this
-@@ -426,7 +426,7 @@
-     fi; \
-   fi`
- 
--CXXFLAGS_FOR_TARGET = $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
-+CXXFLAGS_FOR_TARGET = $(strip $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
- LIBCXXFLAGS_FOR_TARGET = $(CXXFLAGS_FOR_TARGET) -fno-implicit-templates
- 
- GCJ_FOR_TARGET=$(STAGE_CC_WRAPPER) @GCJ_FOR_TARGET@ $(FLAGS_FOR_TARGET)
diff --git a/toolchain/gdb/6.5/100-uclibc-conf.patch b/toolchain/gdb/6.5/100-uclibc-conf.patch
deleted file mode 100644
index 33f0af9..0000000
--- a/toolchain/gdb/6.5/100-uclibc-conf.patch
+++ /dev/null
@@ -1,78 +0,0 @@
---- a/bfd/configure
-+++ b/bfd/configure
-@@ -3580,6 +3580,11 @@
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
---- a/libtool.m4
-+++ b/libtool.m4
-@@ -751,6 +751,11 @@
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
---- a/ltconfig
-+++ b/ltconfig
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
---- a/opcodes/configure
-+++ b/opcodes/configure
-@@ -3591,6 +3591,11 @@
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
diff --git a/toolchain/gdb/6.5/200-uclibc-readline-conf.patch b/toolchain/gdb/6.5/200-uclibc-readline-conf.patch
deleted file mode 100644
index e05eaa4..0000000
--- a/toolchain/gdb/6.5/200-uclibc-readline-conf.patch
+++ /dev/null
@@ -1,15 +0,0 @@
---- a/readline/configure
-+++ b/readline/configure
-@@ -7871,7 +7871,12 @@
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
diff --git a/toolchain/gdb/6.5/400-mips-coredump.patch-2.4.23-29 b/toolchain/gdb/6.5/400-mips-coredump.patch-2.4.23-29
deleted file mode 100644
index d00740d..0000000
--- a/toolchain/gdb/6.5/400-mips-coredump.patch-2.4.23-29
+++ /dev/null
@@ -1,28 +0,0 @@
-Sometime around 2.4.22-23, the mips pt_regs.h fields were reordered, breaking
-coredump handling by gdb for current kernels.  Update the hardcoded constants
-to reflect the change.
---- a/gdb/mips-linux-tdep.h
-+++ b/gdb/mips-linux-tdep.h
-@@ -41,12 +41,22 @@
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
diff --git a/toolchain/gdb/6.5/500-thread-timeout.patch b/toolchain/gdb/6.5/500-thread-timeout.patch
deleted file mode 100644
index 9380253..0000000
--- a/toolchain/gdb/6.5/500-thread-timeout.patch
+++ /dev/null
@@ -1,33 +0,0 @@
---- a/gdb/gdbserver/thread-db.c
-+++ b/gdb/gdbserver/thread-db.c
-@@ -21,6 +21,7 @@
-    Foundation, Inc., 51 Franklin Street, Fifth Floor,
-    Boston, MA 02110-1301, USA.  */
- 
-+#include <unistd.h>
- #include "server.h"
- 
- #include "linux-low.h"
-@@ -134,6 +135,7 @@
-   td_event_msg_t msg;
-   td_err_e err;
-   struct inferior_linux_data *tdata;
-+  int timeout;
- 
-   if (debug_threads)
-     fprintf (stderr, "Thread creation event.\n");
-@@ -144,7 +146,13 @@
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
diff --git a/toolchain/gdb/6.5/600-fix-compile-flag-mismatch.patch b/toolchain/gdb/6.5/600-fix-compile-flag-mismatch.patch
deleted file mode 100644
index 08100bf..0000000
--- a/toolchain/gdb/6.5/600-fix-compile-flag-mismatch.patch
+++ /dev/null
@@ -1,64 +0,0 @@
---- a/gdb/configure
-+++ b/gdb/configure
-@@ -309,7 +309,7 @@
- # include <unistd.h>
- #endif"
- 
--ac_subdirs_all="$ac_subdirs_all doc testsuite"
-+ac_subdirs_all="$ac_subdirs_all doc"
- ac_subdirs_all="$ac_subdirs_all gdbtk"
- ac_subdirs_all="$ac_subdirs_all multi-ice"
- ac_subdirs_all="$ac_subdirs_all gdbserver"
-@@ -5939,7 +5939,7 @@
- 
- 
- 
--subdirs="$subdirs doc testsuite"
-+subdirs="$subdirs doc"
- 
- 
- # Provide defaults for some variables set by the per-host and per-target
---- a/gdb/gdbserver/configure
-+++ b/gdb/gdbserver/configure
-@@ -1239,7 +1239,7 @@
-       ac_cache_corrupted=: ;;
-     ,);;
-     *)
--      if test "x$ac_old_val" != "x$ac_new_val"; then
-+      if test "`echo $ac_old_val`" != "`echo $ac_new_val`"; then
- 	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
- echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
- 	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
---- a/gdb/testsuite/configure
-+++ b/gdb/testsuite/configure
-@@ -1248,7 +1248,7 @@
-       ac_cache_corrupted=: ;;
-     ,);;
-     *)
--      if test "x$ac_old_val" != "x$ac_new_val"; then
-+      if test "`echo $ac_old_val" != "`echo $ac_new_val"; then
- 	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
- echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
- 	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -329,7 +329,7 @@
- # CFLAGS will be just -g.  We want to ensure that TARGET libraries
- # (which we know are built with gcc) are built with optimizations so
- # prepend -O2 when setting CFLAGS_FOR_TARGET.
--CFLAGS_FOR_TARGET = -O2 $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
-+CFLAGS_FOR_TARGET = $(strip $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
- SYSROOT_CFLAGS_FOR_TARGET = @SYSROOT_CFLAGS_FOR_TARGET@
- CXXFLAGS_FOR_TARGET = $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
- LIBCFLAGS_FOR_TARGET = $(CFLAGS_FOR_TARGET)
---- a/Makefile.tpl
-+++ b/Makefile.tpl
-@@ -332,7 +332,7 @@
- # CFLAGS will be just -g.  We want to ensure that TARGET libraries
- # (which we know are built with gcc) are built with optimizations so
- # prepend -O2 when setting CFLAGS_FOR_TARGET.
--CFLAGS_FOR_TARGET = -O2 $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
-+CFLAGS_FOR_TARGET = $(strip $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
- SYSROOT_CFLAGS_FOR_TARGET = @SYSROOT_CFLAGS_FOR_TARGET@
- CXXFLAGS_FOR_TARGET = $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
- LIBCFLAGS_FOR_TARGET = $(CFLAGS_FOR_TARGET)
diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index f4fbaab..09701c7 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -29,16 +29,6 @@ choice
 	help
 	  Select the version of gdb you wish to use.
 
-	config BR2_GDB_VERSION_6_4
-		bool "gdb 6.4"
-		depends on !BR2_avr32
-		depends on BR2_DEPRECATED
-
-	config BR2_GDB_VERSION_6_5
-		bool "gdb 6.5"
-		depends on !BR2_avr32
-		depends on BR2_DEPRECATED
-
 	config BR2_GDB_VERSION_6_6
 		bool "gdb 6.6"
 		depends on !BR2_avr32
@@ -68,8 +58,6 @@ endchoice
 
 config BR2_GDB_VERSION
 	string
-	default "6.4"      if BR2_GDB_VERSION_6_4
-	default "6.5"      if BR2_GDB_VERSION_6_5
 	default "6.6"      if BR2_GDB_VERSION_6_6
 	default "6.7.1"    if BR2_GDB_VERSION_6_7_1
 	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
-- 
1.6.3.3
