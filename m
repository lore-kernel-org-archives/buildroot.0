From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Tue,  6 Feb 2007 10:17:31 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb:  6.4
Message-ID: <20070206181731.4333D4866D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-02-06 10:17:31 -0800 (Tue, 06 Feb 2007)
New Revision: 17799

Log:
Fix building of GDB when using external toolchain.


Added:
   trunk/buildroot/toolchain/gdb/6.4/600-fix-compile-flag-mismatch.patch

Modified:
   trunk/buildroot/toolchain/gdb/gdb.mk


Changeset:
Added: trunk/buildroot/toolchain/gdb/6.4/600-fix-compile-flag-mismatch.patch
===================================================================
--- trunk/buildroot/toolchain/gdb/6.4/600-fix-compile-flag-mismatch.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gdb/6.4/600-fix-compile-flag-mismatch.patch	2007-02-06 18:17:31 UTC (rev 17799)
@@ -0,0 +1,87 @@
+diff -ur gdb-6.4/gdb/configure gdb-6.4-patched/gdb/configure
+--- gdb-6.4/gdb/configure	2005-07-25 10:08:40.000000000 -0500
++++ gdb-6.4-patched/gdb/configure	2007-02-05 13:22:36.000000000 -0600
+@@ -309,7 +309,7 @@
+ # include <unistd.h>
+ #endif"
+ 
+-ac_subdirs_all="$ac_subdirs_all doc testsuite"
++ac_subdirs_all="$ac_subdirs_all doc"
+ ac_subdirs_all="$ac_subdirs_all gdbtk"
+ ac_subdirs_all="$ac_subdirs_all multi-ice"
+ ac_subdirs_all="$ac_subdirs_all gdbserver"
+@@ -5940,7 +5940,7 @@
+ 
+ 
+ 
+-subdirs="$subdirs doc testsuite"
++subdirs="$subdirs doc"
+ 
+ 
+ . $srcdir/configure.host
+diff -ur gdb-6.4/gdb/gdbserver/configure gdb-6.4-patched/gdb/gdbserver/configure
+--- gdb-6.4/gdb/gdbserver/configure	2005-09-17 18:14:37.000000000 -0500
++++ gdb-6.4-patched/gdb/gdbserver/configure	2007-02-05 13:22:58.000000000 -0600
+@@ -1239,7 +1239,7 @@
+       ac_cache_corrupted=: ;;
+     ,);;
+     *)
+-      if test "x$ac_old_val" != "x$ac_new_val"; then
++      if test "`echo $ac_old_val`" != "`echo $ac_new_val`"; then
+ 	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
+ echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
+ 	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
+diff -ur gdb-6.4/gdb/testsuite/configure gdb-6.4-patched/gdb/testsuite/configure
+--- gdb-6.4/gdb/testsuite/configure	2005-04-11 09:13:12.000000000 -0500
++++ gdb-6.4-patched/gdb/testsuite/configure	2007-02-05 13:22:36.000000000 -0600
+@@ -1248,7 +1248,7 @@
+       ac_cache_corrupted=: ;;
+     ,);;
+     *)
+-      if test "x$ac_old_val" != "x$ac_new_val"; then
++      if test "`echo $ac_old_val" != "`echo $ac_new_val"; then
+ 	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
+ echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
+ 	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
+diff -ur gdb-6.4/Makefile.in gdb-6.4-patched/Makefile.in
+--- gdb-6.4/Makefile.in	2005-12-01 23:29:54.000000000 -0600
++++ gdb-6.4-patched/Makefile.in	2007-02-05 13:22:36.000000000 -0600
+@@ -383,7 +383,7 @@
+ # CFLAGS will be just -g.  We want to ensure that TARGET libraries
+ # (which we know are built with gcc) are built with optimizations so
+ # prepend -O2 when setting CFLAGS_FOR_TARGET.
+-CFLAGS_FOR_TARGET = -O2 $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
++CFLAGS_FOR_TARGET = $(strip $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
+ SYSROOT_CFLAGS_FOR_TARGET = @SYSROOT_CFLAGS_FOR_TARGET@
+ 
+ # If GCC_FOR_TARGET is not overriden on the command line, then this
+@@ -423,7 +423,7 @@
+     fi; \
+   fi`
+ 
+-CXXFLAGS_FOR_TARGET = $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
++CXXFLAGS_FOR_TARGET = $(strip $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
+ LIBCXXFLAGS_FOR_TARGET = $(CXXFLAGS_FOR_TARGET) -fno-implicit-templates
+ 
+ GCJ_FOR_TARGET=$(STAGE_CC_WRAPPER) @GCJ_FOR_TARGET@ $(FLAGS_FOR_TARGET)
+diff -ur gdb-6.4/Makefile.tpl gdb-6.4-patched/Makefile.tpl
+--- gdb-6.4/Makefile.tpl	2005-10-22 05:37:55.000000000 -0500
++++ gdb-6.4-patched/Makefile.tpl	2007-02-05 13:22:36.000000000 -0600
+@@ -386,7 +386,7 @@
+ # CFLAGS will be just -g.  We want to ensure that TARGET libraries
+ # (which we know are built with gcc) are built with optimizations so
+ # prepend -O2 when setting CFLAGS_FOR_TARGET.
+-CFLAGS_FOR_TARGET = -O2 $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
++CFLAGS_FOR_TARGET = $(strip $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
+ SYSROOT_CFLAGS_FOR_TARGET = @SYSROOT_CFLAGS_FOR_TARGET@
+ 
+ # If GCC_FOR_TARGET is not overriden on the command line, then this
+@@ -426,7 +426,7 @@
+     fi; \
+   fi`
+ 
+-CXXFLAGS_FOR_TARGET = $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
++CXXFLAGS_FOR_TARGET = $(strip $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
+ LIBCXXFLAGS_FOR_TARGET = $(CXXFLAGS_FOR_TARGET) -fno-implicit-templates
+ 
+ GCJ_FOR_TARGET=$(STAGE_CC_WRAPPER) @GCJ_FOR_TARGET@ $(FLAGS_FOR_TARGET)

Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2007-02-06 18:17:08 UTC (rev 17798)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2007-02-06 18:17:31 UTC (rev 17799)
@@ -3,8 +3,13 @@
 # gdb
 #
 ######################################################################
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 GDB_VERSION:=$(strip $(subst ",, $(BR2_GDB_VERSION)))
 #"))
+else
+GDB_VERSION:=$(strip $(subst ",, $(BR2_EXT_GDB_VERSION)))
+#"))
+endif
 
 ifeq ($(GDB_VERSION),snapshot)
 # Be aware that this changes daily....
@@ -70,7 +75,8 @@
 	(cd $(GDB_TARGET_DIR); \
 		gdb_cv_func_sigsetjmp=yes \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS_FOR_TARGET="$(TARGET_CFLAGS)" \
+		CFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+		CFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
 		$(GDB_TARGET_CONFIGURE_VARS) \
 		$(GDB_DIR)/configure \
 		--build=$(GNU_HOST_NAME) \
@@ -94,7 +100,7 @@
 	$(STRIP) $(GDB_TARGET_DIR)/gdb/gdb
 
 $(TARGET_DIR)/usr/bin/gdb: $(GDB_TARGET_DIR)/gdb/gdb
-	install -c $(GDB_TARGET_DIR)/gdb/gdb $(TARGET_DIR)/usr/bin/gdb
+	install -c -D $(GDB_TARGET_DIR)/gdb/gdb $(TARGET_DIR)/usr/bin/gdb
 
 gdb_target: ncurses $(TARGET_DIR)/usr/bin/gdb
 
@@ -153,7 +159,7 @@
 	install -c $(GDB_SERVER_DIR)/gdbserver \
 		$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils/gdbserver
 endif
-	install -c $(GDB_SERVER_DIR)/gdbserver $(TARGET_DIR)/usr/bin/gdbserver
+	install -c -D $(GDB_SERVER_DIR)/gdbserver $(TARGET_DIR)/usr/bin/gdbserver
 
 gdbserver: $(TARGET_DIR)/usr/bin/gdbserver
 
