From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  3 Mar 2009 20:23:18 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/database/sqlite
Message-ID: <20090303202319.141177626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-03 20:23:18 +0000 (Tue, 03 Mar 2009)
New Revision: 25511

Log:
sqlite: bump version and convert to Makefile.autotools.in format

Patch by Gustavo Zacarias <gustavo@zacarias.com.ar>

Closes #139.

Modified:
   trunk/buildroot/package/database/sqlite/Config.in
   trunk/buildroot/package/database/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/database/sqlite/Config.in
===================================================================
--- trunk/buildroot/package/database/sqlite/Config.in	2009-03-03 20:23:10 UTC (rev 25510)
+++ trunk/buildroot/package/database/sqlite/Config.in	2009-03-03 20:23:18 UTC (rev 25511)
@@ -1,9 +1,16 @@
 config BR2_PACKAGE_SQLITE
 	bool "sqlite"
-	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_READLINE
 	help
 	  SQLite is a small C library that implements a self-contained,
 	  embeddable, zero-configuration SQL database engine.
 
 	  http://www.sqlite.org/
+
+config BR2_PACKAGE_SQLITE_READLINE
+	bool "Command-line editing"
+	depends on BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
+	help
+	  Enable command-line editing. This requires ncurses and readline.
+

Modified: trunk/buildroot/package/database/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/database/sqlite/sqlite.mk	2009-03-03 20:23:10 UTC (rev 25510)
+++ trunk/buildroot/package/database/sqlite/sqlite.mk	2009-03-03 20:23:18 UTC (rev 25511)
@@ -4,77 +4,38 @@
 #
 #############################################################
 
-SQLITE_VERSION:=3.6.10
-SQLITE_SOURCE:=sqlite-$(SQLITE_VERSION).tar.gz
-SQLITE_SITE:=http://www.sqlite.org
-SQLITE_DIR:=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
-SQLITE_CAT:=$(ZCAT)
+SQLITE_VERSION = 3.6.11
+SQLITE_SOURCE = sqlite-$(SQLITE_VERSION).tar.gz
+SQLITE_SITE = http://www.sqlite.org
+SQLITE_INSTALL_STAGING = YES
+SQLITE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+SQLITE_LIBTOOL_PATCH = NO
+SQLITE_DEPENDENCIES = uclibc
 
-$(DL_DIR)/$(SQLITE_SOURCE):
-	$(call DOWNLOAD,$(SQLITE_SITE),$(SQLITE_SOURCE))
+SQLITE_CONF_OPT =	--enable-shared \
+			--enable-static \
+			--enable-tempstore=yes \
+			--enable-threadsafe \
+			--enable-releasemode \
+			--disable-tcl \
+			--localstatedir=/var
 
-$(SQLITE_DIR)/.unpacked: $(DL_DIR)/$(SQLITE_SOURCE)
-	$(SQLITE_CAT) $(DL_DIR)/$(SQLITE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(SQLITE_DIR)/.unpacked
+ifeq ($(BR2_PACKAGE_SQLITE_READLINE),y)
+SQLITE_DEPENDENCIES += ncurses readline
+SQLITE_CONF_OPT += --with-readline-inc="-I$(STAGING_DIR)/usr/include"
+else
+SQLITE_CONF_OPT += --disable-readline
+endif
 
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
+$(eval $(call AUTOTARGETS,package,sqlite))
 
-$(SQLITE_DIR)/sqlite3: $(SQLITE_DIR)/.configured
-	$(MAKE) -C $(SQLITE_DIR)
+$(SQLITE_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/usr/bin/sqlite3
+	rm -f $(TARGET_DIR)/usr/lib/libsqlite3*
+	rm -f $(STAGING_DIR)/usr/bin/sqlite3
+	rm -f $(STAGING_DIR)/usr/lib/libsqlite3*
+	rm -f $(STAGING_DIR)/usr/lib/pkgconfig/sqlite3.pc
+	rm -f $(STAGING_DIR)/usr/include/sqlite3*.h
+	rm -f $(SQLITE_TARGET_INSTALL_TARGET) $(SQLITE_HOOK_POST_INSTALL)
 
-$(STAGING_DIR)/usr/bin/sqlite3: $(SQLITE_DIR)/sqlite3
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SQLITE_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libsqlite3.la
-
-$(TARGET_DIR)/usr/bin/sqlite3: $(STAGING_DIR)/usr/bin/sqlite3
-	$(INSTALL) -m 0755 -D $^ $@
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-	cp -dpf $(STAGING_DIR)/usr/lib/libsqlite3*.so* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libsqlite3.so
-
-sqlite: uclibc ncurses $(TARGET_DIR)/usr/bin/sqlite3
-
-sqlite-source: $(DL_DIR)/$(SQLITE_SOURCE)
-
-sqlite-clean:
-	-$(MAKE) -C $(SQLITE_DIR) clean
-	-rm -rf $(STAGING_DIR)/usr/lib/libsqlite*
-	-rm -rf $(STAGING_DIR)/usr/bin/sqlite3
-	-rm -rf $(STAGING_DIR)/usr/include/sqlite*
-	-rm -rf $(STAGING_DIR)/usr/lib/pkgconfig/sqlite*
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
-ifeq ($(BR2_PACKAGE_SQLITE),y)
-TARGETS+=sqlite
-endif
