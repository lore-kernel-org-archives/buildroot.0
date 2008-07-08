From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  8 Jul 2008 07:14:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: database
	database/sqlite sqlite
Message-ID: <20080708141437.3F97A3C68B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-08 07:14:36 -0700 (Tue, 08 Jul 2008)
New Revision: 22692

Log:
sqlite: move under database submenu

Added:
   trunk/buildroot/package/database/sqlite/
   trunk/buildroot/package/database/sqlite/Config.in
   trunk/buildroot/package/database/sqlite/sqlite.mk

Removed:
   trunk/buildroot/package/sqlite/Config.in
   trunk/buildroot/package/sqlite/sqlite.mk

Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/database/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-07-08 14:12:09 UTC (rev 22691)
+++ trunk/buildroot/package/Config.in	2008-07-08 14:14:36 UTC (rev 22692)
@@ -108,7 +108,6 @@
 source "package/rpm/Config.in"
 endif
 source "package/screen/Config.in"
-source "package/sqlite/Config.in"
 source "package/startup-notification/Config.in"
 source "package/strace/Config.in"
 source "package/sudo/Config.in"

Modified: trunk/buildroot/package/database/Config.in
===================================================================
--- trunk/buildroot/package/database/Config.in	2008-07-08 14:12:09 UTC (rev 22691)
+++ trunk/buildroot/package/database/Config.in	2008-07-08 14:14:36 UTC (rev 22692)
@@ -4,4 +4,5 @@
 
 if BR2_DATABASE_SUPPORT
 source "package/database/mysql_client/Config.in"
+source "package/database/sqlite/Config.in"
 endif

Copied: trunk/buildroot/package/database/sqlite/Config.in (from rev 22691, trunk/buildroot/package/sqlite/Config.in)
===================================================================
--- trunk/buildroot/package/database/sqlite/Config.in	                        (rev 0)
+++ trunk/buildroot/package/database/sqlite/Config.in	2008-07-08 14:14:36 UTC (rev 22692)
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SQLITE
+	bool "sqlite"
+	default n
+	select BR2_PACKAGE_NCURSES
+	select BR2_READLINE
+	help
+	  SQLite is a small C library that implements a self-contained,
+	  embeddable, zero-configuration SQL database engine.
+
+	  http://www.sqlite.org/

Copied: trunk/buildroot/package/database/sqlite/sqlite.mk (from rev 22691, trunk/buildroot/package/sqlite/sqlite.mk)
===================================================================
--- trunk/buildroot/package/database/sqlite/sqlite.mk	                        (rev 0)
+++ trunk/buildroot/package/database/sqlite/sqlite.mk	2008-07-08 14:14:36 UTC (rev 22692)
@@ -0,0 +1,78 @@
+#############################################################
+#
+# sqlite
+#
+#############################################################
+
+SQLITE_VERSION:=3.5.9
+SQLITE_SOURCE:=sqlite-$(SQLITE_VERSION).tar.gz
+SQLITE_SITE:=http://www.sqlite.org
+SQLITE_DIR:=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
+SQLITE_CAT:=$(ZCAT)
+
+$(DL_DIR)/$(SQLITE_SOURCE):
+	$(WGET) -P $(DL_DIR) $(SQLITE_SITE)/$(SQLITE_SOURCE)
+
+$(SQLITE_DIR)/.unpacked: $(DL_DIR)/$(SQLITE_SOURCE)
+	$(SQLITE_CAT) $(DL_DIR)/$(SQLITE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(SQLITE_DIR)/.unpacked
+
+$(SQLITE_DIR)/.configured: $(SQLITE_DIR)/.unpacked
+	(cd $(SQLITE_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		config_BUILD_CC="$(HOSTCC)" \
+		config_TARGET_CFLAGS="$(TARGET_CFLAGS)" \
+		config_TARGET_CC="$(TARGET_CC)" \
+		config_TARGET_READLINE_LIBS="-L$(TARGET_DIR)/usr/lib -L$(TARGET_DIR)/lib -lncurses -lreadline" \
+		config_TARGET_READLINE_INC="-I$(STAGING_DIR)/usr/include" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		--localstatedir=/var \
+		--enable-shared \
+		--enable-static \
+		--disable-tcl \
+		--enable-tempstore \
+		--enable-threadsafe \
+		--enable-releasemode \
+	)
+	touch $(SQLITE_DIR)/.configured
+
+$(SQLITE_DIR)/sqlite3: $(SQLITE_DIR)/.configured
+	$(MAKE) -C $(SQLITE_DIR)
+
+$(STAGING_DIR)/usr/bin/sqlite3: $(SQLITE_DIR)/sqlite3
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SQLITE_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libsqlite3.la
+
+$(TARGET_DIR)/usr/bin/sqlite3: $(STAGING_DIR)/usr/bin/sqlite3
+	$(INSTALL) -m 0755 -D $^ $@
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
+	$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/libsqlite3*.so* $(TARGET_DIR)/usr/lib/
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libsqlite3.so*
+
+sqlite: uclibc readline-target ncurses $(TARGET_DIR)/usr/bin/sqlite3
+
+sqlite-source: $(DL_DIR)/$(SQLITE_SOURCE)
+
+sqlite-clean:
+	-$(MAKE) -C $(SQLITE_DIR) clean
+	-rm -rf $(STAGING_DIR)/usr/lib/libsqlite*
+	-rm -rf $(STAGING_DIR)/usr/bin/sqlite3
+	-rm -rf $(TARGET_DIR)/usr/lib/libsqlite*
+	-rm -rf $(TARGET_DIR)/usr/bin/sqlite3
+
+sqlite-dirclean:
+	rm -rf $(SQLITE_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_SQLITE)),y)
+TARGETS+=sqlite
+endif

Deleted: trunk/buildroot/package/sqlite/Config.in
===================================================================
--- trunk/buildroot/package/sqlite/Config.in	2008-07-08 14:12:09 UTC (rev 22691)
+++ trunk/buildroot/package/sqlite/Config.in	2008-07-08 14:14:36 UTC (rev 22692)
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_SQLITE
-	bool "sqlite"
-	default n
-	select BR2_PACKAGE_NCURSES
-	select BR2_READLINE
-	help
-	  SQLite is a small C library that implements a self-contained,
-	  embeddable, zero-configuration SQL database engine.
-
-	  http://www.sqlite.org/

Deleted: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2008-07-08 14:12:09 UTC (rev 22691)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2008-07-08 14:14:36 UTC (rev 22692)
@@ -1,78 +0,0 @@
-#############################################################
-#
-# sqlite
-#
-#############################################################
-
-SQLITE_VERSION:=3.5.9
-SQLITE_SOURCE:=sqlite-$(SQLITE_VERSION).tar.gz
-SQLITE_SITE:=http://www.sqlite.org
-SQLITE_DIR:=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
-SQLITE_CAT:=$(ZCAT)
-
-$(DL_DIR)/$(SQLITE_SOURCE):
-	$(WGET) -P $(DL_DIR) $(SQLITE_SITE)/$(SQLITE_SOURCE)
-
-$(SQLITE_DIR)/.unpacked: $(DL_DIR)/$(SQLITE_SOURCE)
-	$(SQLITE_CAT) $(DL_DIR)/$(SQLITE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(SQLITE_DIR)/.unpacked
-
-$(SQLITE_DIR)/.configured: $(SQLITE_DIR)/.unpacked
-	(cd $(SQLITE_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		config_BUILD_CC="$(HOSTCC)" \
-		config_TARGET_CFLAGS="$(TARGET_CFLAGS)" \
-		config_TARGET_CC="$(TARGET_CC)" \
-		config_TARGET_READLINE_LIBS="-L$(TARGET_DIR)/usr/lib -L$(TARGET_DIR)/lib -lncurses -lreadline" \
-		config_TARGET_READLINE_INC="-I$(STAGING_DIR)/usr/include" \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--localstatedir=/var \
-		--enable-shared \
-		--enable-static \
-		--disable-tcl \
-		--enable-tempstore \
-		--enable-threadsafe \
-		--enable-releasemode \
-	)
-	touch $(SQLITE_DIR)/.configured
-
-$(SQLITE_DIR)/sqlite3: $(SQLITE_DIR)/.configured
-	$(MAKE) -C $(SQLITE_DIR)
-
-$(STAGING_DIR)/usr/bin/sqlite3: $(SQLITE_DIR)/sqlite3
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SQLITE_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libsqlite3.la
-
-$(TARGET_DIR)/usr/bin/sqlite3: $(STAGING_DIR)/usr/bin/sqlite3
-	$(INSTALL) -m 0755 -D $^ $@
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-	$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/libsqlite3*.so* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libsqlite3.so*
-
-sqlite: uclibc readline-target ncurses $(TARGET_DIR)/usr/bin/sqlite3
-
-sqlite-source: $(DL_DIR)/$(SQLITE_SOURCE)
-
-sqlite-clean:
-	-$(MAKE) -C $(SQLITE_DIR) clean
-	-rm -rf $(STAGING_DIR)/usr/lib/libsqlite*
-	-rm -rf $(STAGING_DIR)/usr/bin/sqlite3
-	-rm -rf $(TARGET_DIR)/usr/lib/libsqlite*
-	-rm -rf $(TARGET_DIR)/usr/bin/sqlite3
-
-sqlite-dirclean:
-	rm -rf $(SQLITE_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_SQLITE)),y)
-TARGETS+=sqlite
-endif
