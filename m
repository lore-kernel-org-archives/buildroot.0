From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 09:50:13 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: database/sqlite
	python readline
Message-ID: <20090130095013.B2DB7765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-30 09:50:13 +0000 (Fri, 30 Jan 2009)
New Revision: 25159

Log:
readline: remove BR2_PACKAGE_READLINE_TARGET configuration option

Other packages don't have this, and several packages are depending on
readline where they actually want readline-target instead.

Modified:
   trunk/buildroot/package/database/sqlite/sqlite.mk
   trunk/buildroot/package/python/python.mk
   trunk/buildroot/package/readline/Config.in
   trunk/buildroot/package/readline/readline.mk


Changeset:
Modified: trunk/buildroot/package/database/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/database/sqlite/sqlite.mk	2009-01-30 09:50:02 UTC (rev 25158)
+++ trunk/buildroot/package/database/sqlite/sqlite.mk	2009-01-30 09:50:13 UTC (rev 25159)
@@ -55,7 +55,7 @@
 	cp -dpf $(STAGING_DIR)/usr/lib/libsqlite3*.so* $(TARGET_DIR)/usr/lib/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libsqlite3.so
 
-sqlite: uclibc readline-target ncurses $(TARGET_DIR)/usr/bin/sqlite3
+sqlite: uclibc ncurses $(TARGET_DIR)/usr/bin/sqlite3
 
 sqlite-source: $(DL_DIR)/$(SQLITE_SOURCE)
 

Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2009-01-30 09:50:02 UTC (rev 25158)
+++ trunk/buildroot/package/python/python.mk	2009-01-30 09:50:13 UTC (rev 25159)
@@ -17,7 +17,7 @@
 BR2_PYTHON_DISABLED_MODULES=dbm zipfile
 
 ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
-PYTHON_DEPS += readline-target
+PYTHON_DEPS += readline
 else
 BR2_PYTHON_DISABLED_MODULES += readline
 endif

Modified: trunk/buildroot/package/readline/Config.in
===================================================================
--- trunk/buildroot/package/readline/Config.in	2009-01-30 09:50:02 UTC (rev 25158)
+++ trunk/buildroot/package/readline/Config.in	2009-01-30 09:50:13 UTC (rev 25159)
@@ -3,9 +3,3 @@
 	bool "readline"
 	help
 	    Enable GNU readline support?
-
-config BR2_PACKAGE_READLINE_TARGET
-	bool "readline for the target"
-	depends on BR2_READLINE
-	help
-	  Say yes here to install the readline libraries on the target.

Modified: trunk/buildroot/package/readline/readline.mk
===================================================================
--- trunk/buildroot/package/readline/readline.mk	2009-01-30 09:50:02 UTC (rev 25158)
+++ trunk/buildroot/package/readline/readline.mk	2009-01-30 09:50:13 UTC (rev 25159)
@@ -76,23 +76,16 @@
 	chmod 775 $(TARGET_DIR)/usr/lib/libreadline.so.$(READLINE_VERSION) $(TARGET_DIR)/usr/lib/libhistory.so.$(READLINE_VERSION)
 	$(STRIPCMD) $(TARGET_DIR)/usr/lib/libreadline.so.$(READLINE_VERSION) $(TARGET_DIR)/usr/lib/libhistory.so.$(READLINE_VERSION)
 
-readline: ncurses $(STAGING_DIR)/usr/include/readline/readline.h
+readline: ncurses $(STAGING_DIR)/usr/include/readline/readline.h $(TARGET_DIR)/$(READLINE_TARGET_SHARED_BINARY)
 
 readline-clean:
-	$(MAKE) -C $(READLINE_DIR) DESTDIR=$(STAGING_DIR) uninstall
+	-$(MAKE) -C $(READLINE_DIR) DESTDIR=$(STAGING_DIR) uninstall
+	-$(MAKE) -C $(READLINE_DIR) DESTDIR=$(TARGET_DIR) uninstall
 	-$(MAKE) -C $(READLINE_DIR) clean
 
 readline-dirclean:
 	rm -rf $(READLINE_DIR)
 
-readline-target: readline $(TARGET_DIR)/$(READLINE_TARGET_SHARED_BINARY)
-
-readline-target-clean:
-	-$(MAKE) DESTDIR=$(TARGET_DIR) -C $(READLINE_DIR) uninstall
-
 ifeq ($(BR2_READLINE),y)
 TARGETS+=readline
 endif
-ifeq ($(BR2_PACKAGE_READLINE_TARGET),y)
-TARGETS+=readline-target
-endif
