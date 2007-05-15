From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 15 May 2007 04:33:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb:  6.6
Message-ID: <20070515113309.B3CA148078@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-05-15 04:33:08 -0700 (Tue, 15 May 2007)
New Revision: 18625

Log:
- add gdb-6.6


Added:
   trunk/buildroot/toolchain/gdb/6.6/
   trunk/buildroot/toolchain/gdb/6.6/100-uclibc-conf.patch
   trunk/buildroot/toolchain/gdb/6.6/600-fix-compile-flag-mismatch.patch

Modified:
   trunk/buildroot/toolchain/gdb/Config.in
   trunk/buildroot/toolchain/gdb/gdb.mk


Changeset:
Added: trunk/buildroot/toolchain/gdb/6.6/100-uclibc-conf.patch
===================================================================
--- trunk/buildroot/toolchain/gdb/6.6/100-uclibc-conf.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gdb/6.6/100-uclibc-conf.patch	2007-05-15 11:33:08 UTC (rev 18625)
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

Added: trunk/buildroot/toolchain/gdb/6.6/600-fix-compile-flag-mismatch.patch
===================================================================
--- trunk/buildroot/toolchain/gdb/6.6/600-fix-compile-flag-mismatch.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gdb/6.6/600-fix-compile-flag-mismatch.patch	2007-05-15 11:33:08 UTC (rev 18625)
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

Modified: trunk/buildroot/toolchain/gdb/Config.in
===================================================================
--- trunk/buildroot/toolchain/gdb/Config.in	2007-05-15 11:28:58 UTC (rev 18624)
+++ trunk/buildroot/toolchain/gdb/Config.in	2007-05-15 11:33:08 UTC (rev 18625)
@@ -39,6 +39,9 @@
 	config BR2_GDB_VERSION_6_5
 		bool "gdb 6.5"
 
+	config BR2_GDB_VERSION_6_6
+		bool "gdb 6.6"
+
 	config BR2_GDB_VERSION_SNAPSHOT
 		bool "gdb snapshot"
 
@@ -50,4 +53,5 @@
 	default "6.3"      if BR2_GDB_VERSION_6_3
 	default "6.4"      if BR2_GDB_VERSION_6_4
 	default "6.5"      if BR2_GDB_VERSION_6_5
+	default "6.6"      if BR2_GDB_VERSION_6_6
 	default "snapshot" if BR2_GDB_VERSION_SNAPSHOT

Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2007-05-15 11:28:58 UTC (rev 18624)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2007-05-15 11:33:08 UTC (rev 18625)
@@ -127,6 +127,7 @@
 	(cd $(GDB_SERVER_DIR); \
 		$(TARGET_CONFIGURE_OPTS) \
 		gdb_cv_func_sigsetjmp=yes \
+		bash_cv_have_mbstate_t=yes \
 		$(GDB_DIR)/gdb/gdbserver/configure \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(REAL_GNU_TARGET_NAME) \
@@ -183,6 +184,7 @@
 	mkdir -p $(GDB_HOST_DIR)
 	(cd $(GDB_HOST_DIR); \
 		gdb_cv_func_sigsetjmp=yes \
+		bash_cv_have_mbstate_t=yes \
 		$(GDB_DIR)/configure \
 		--prefix=$(STAGING_DIR) \
 		--build=$(GNU_HOST_NAME) \
