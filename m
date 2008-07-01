From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  1 Jul 2008 14:38:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb
Message-ID: <20080701213803.746CC3C681@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-01 14:38:03 -0700 (Tue, 01 Jul 2008)
New Revision: 22601

Log:
disable configure caching in gdb, courtesy of Fathi Boudra

Modified:
   trunk/buildroot/toolchain/gdb/gdb.mk


Changeset:
Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2008-07-01 21:36:31 UTC (rev 22600)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2008-07-01 21:38:03 UTC (rev 22601)
@@ -84,13 +84,14 @@
 
 $(GDB_TARGET_DIR)/.configured: $(GDB_DIR)/.unpacked
 	mkdir -p $(GDB_TARGET_DIR)
-	(cd $(GDB_TARGET_DIR); rm -rf config.cache; \
+	(cd $(GDB_TARGET_DIR); \
 		gdb_cv_func_sigsetjmp=yes \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_LDFLAGS) -Wno-error" \
 		CFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS) -Wno-error" \
 		$(GDB_TARGET_CONFIGURE_VARS) \
 		$(GDB_DIR)/configure \
+		--cache-file=/dev/null \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(REAL_GNU_TARGET_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
@@ -135,11 +136,12 @@
 
 $(GDB_SERVER_DIR)/.configured: $(GDB_DIR)/.unpacked
 	mkdir -p $(GDB_SERVER_DIR)
-	(cd $(GDB_SERVER_DIR); rm -rf config.cache; \
+	(cd $(GDB_SERVER_DIR); \
 		$(TARGET_CONFIGURE_OPTS) \
 		gdb_cv_func_sigsetjmp=yes \
 		bash_cv_have_mbstate_t=yes \
 		$(GDB_DIR)/gdb/gdbserver/configure \
+		--cache-file=/dev/null \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(REAL_GNU_TARGET_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
@@ -165,6 +167,7 @@
 	$(MAKE) CC=$(TARGET_CC) MT_CFLAGS="$(TARGET_CFLAGS)" \
 		-C $(GDB_SERVER_DIR)
 	$(STRIPCMD) $(GDB_SERVER_DIR)/gdbserver
+
 $(TARGET_DIR)/usr/bin/gdbserver: $(GDB_SERVER_DIR)/gdbserver
 ifeq ($(strip $(BR2_CROSS_TOOLCHAIN_TARGET_UTILS)),y)
 	mkdir -p $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils
@@ -191,10 +194,11 @@
 
 $(GDB_HOST_DIR)/.configured: $(GDB_DIR)/.unpacked
 	mkdir -p $(GDB_HOST_DIR)
-	(cd $(GDB_HOST_DIR); rm -rf config.cache; \
+	(cd $(GDB_HOST_DIR); \
 		gdb_cv_func_sigsetjmp=yes \
 		bash_cv_have_mbstate_t=yes \
 		$(GDB_DIR)/configure \
+		--cache-file=/dev/null \
 		--prefix=$(STAGING_DIR) \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
@@ -226,8 +230,6 @@
 gdbhost-dirclean:
 	rm -rf $(GDB_HOST_DIR)
 
-
-
 #############################################################
 #
 # Toplevel Makefile options
