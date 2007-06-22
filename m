From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 22 Jun 2007 03:42:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb
Message-ID: <20070622104208.86838485E8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-22 03:42:07 -0700 (Fri, 22 Jun 2007)
New Revision: 18893

Log:
- gdb resides in usr/


Modified:
   trunk/buildroot/toolchain/gdb/gdb.mk


Changeset:
Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2007-06-22 08:47:09 UTC (rev 18892)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2007-06-22 10:42:07 UTC (rev 18893)
@@ -47,7 +47,7 @@
 endif
 	toolchain/patch-kernel.sh $(GDB_DIR) toolchain/gdb/$(GDB_VERSION) \*.patch
 	$(CONFIG_UPDATE) $(GDB_DIR)
-	touch $(GDB_DIR)/.unpacked
+	touch $@
 
 gdb-dirclean:
 	rm -rf $(GDB_DIR)
@@ -72,7 +72,7 @@
 
 $(GDB_TARGET_DIR)/.configured: $(GDB_DIR)/.unpacked
 	mkdir -p $(GDB_TARGET_DIR)
-	(cd $(GDB_TARGET_DIR); \
+	(cd $(GDB_TARGET_DIR); rm -rf config.cache ; \
 		gdb_cv_func_sigsetjmp=yes \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
@@ -92,7 +92,7 @@
 ifeq ($(BR2_ENABLE_LOCALE),y)
 	-$(SED) "s,^INTL *=.*,INTL = -lintl,g;" $(GDB_DIR)/gdb/Makefile
 endif
-	touch  $(GDB_TARGET_DIR)/.configured
+	touch $@
 
 $(GDB_TARGET_DIR)/gdb/gdb: $(GDB_TARGET_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) MT_CFLAGS="$(TARGET_CFLAGS)" \
@@ -107,9 +107,7 @@
 gdb_target-source: $(DL_DIR)/$(GDB_SOURCE)
 
 gdb_target-clean:
-	@if [ -d $(GDB_DIR)/Makefile ] ; then \
-		$(MAKE) -C $(GDB_DIR) clean ; \
-	fi;
+	-$(MAKE) -C $(GDB_DIR) clean
 
 gdb_target-dirclean:
 	rm -rf $(GDB_DIR)
@@ -124,7 +122,7 @@
 
 $(GDB_SERVER_DIR)/.configured: $(GDB_DIR)/.unpacked
 	mkdir -p $(GDB_SERVER_DIR)
-	(cd $(GDB_SERVER_DIR); \
+	(cd $(GDB_SERVER_DIR); rm -rf config.cache ; \
 		$(TARGET_CONFIGURE_OPTS) \
 		gdb_cv_func_sigsetjmp=yes \
 		bash_cv_have_mbstate_t=yes \
@@ -148,7 +146,7 @@
 		--disable-tui --disable-gdbtk --without-x \
 		--without-included-gettext \
 	);
-	touch  $(GDB_SERVER_DIR)/.configured
+	touch $@
 
 $(GDB_SERVER_DIR)/gdbserver: $(GDB_SERVER_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) MT_CFLAGS="$(TARGET_CFLAGS)" \
@@ -165,9 +163,7 @@
 gdbserver: $(TARGET_DIR)/usr/bin/gdbserver
 
 gdbserver-clean:
-	@if [ -d $(GDB_SERVER_DIR)/Makefile ] ; then \
-		$(MAKE) -C $(GDB_SERVER_DIR) clean ; \
-	fi;
+	-$(MAKE) -C $(GDB_SERVER_DIR) clean
 
 gdbserver-dirclean:
 	rm -rf $(GDB_SERVER_DIR)
@@ -182,7 +178,7 @@
 
 $(GDB_HOST_DIR)/.configured: $(GDB_DIR)/.unpacked
 	mkdir -p $(GDB_HOST_DIR)
-	(cd $(GDB_HOST_DIR); \
+	(cd $(GDB_HOST_DIR); rm -rf config.cache ; \
 		gdb_cv_func_sigsetjmp=yes \
 		bash_cv_have_mbstate_t=yes \
 		$(GDB_DIR)/configure \
@@ -196,7 +192,7 @@
 		--without-included-gettext \
 		--enable-threads \
 	);
-	touch  $(GDB_HOST_DIR)/.configured
+	touch $@
 
 $(GDB_HOST_DIR)/gdb/gdb: $(GDB_HOST_DIR)/.configured
 	$(MAKE) -C $(GDB_HOST_DIR)
@@ -205,16 +201,14 @@
 $(TARGET_CROSS)gdb: $(GDB_HOST_DIR)/gdb/gdb
 	install -c $(GDB_HOST_DIR)/gdb/gdb $(TARGET_CROSS)gdb
 	ln -snf ../../bin/$(REAL_GNU_TARGET_NAME)-gdb \
-		$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/gdb
+		$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/gdb
 	ln -snf $(REAL_GNU_TARGET_NAME)-gdb \
-		$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-gdb
+		$(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-gdb
 
 gdbhost: $(TARGET_CROSS)gdb
 
 gdbhost-clean:
-	@if [ -d $(GDB_HOST_DIR)/Makefile ] ; then \
-		$(MAKE) -C $(GDB_HOST_DIR) clean ; \
-	fi;
+	-$(MAKE) -C $(GDB_HOST_DIR) clean
 
 gdbhost-dirclean:
 	rm -rf $(GDB_HOST_DIR)
