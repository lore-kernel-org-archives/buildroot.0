From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Sep 2006 09:01:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  sqlite
Message-ID: <20060926160108.85F90486C4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-09-26 09:01:07 -0700 (Tue, 26 Sep 2006)
New Revision: 16227

Log:
sqlite package, based on gumstix

Added:
   trunk/buildroot/package/sqlite/
   trunk/buildroot/package/sqlite/Config.in
   trunk/buildroot/package/sqlite/sqlite.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2006-09-26 15:56:03 UTC (rev 16226)
+++ trunk/buildroot/package/Config.in	2006-09-26 16:01:07 UTC (rev 16227)
@@ -127,6 +127,7 @@
 source "package/slang/Config.in"
 source "package/smartmontools/Config.in"
 source "package/socat/Config.in"
+source "package/sqlite/Config.in"
 source "package/strace/Config.in"
 source "package/sudo/Config.in"
 source "package/sysklogd/Config.in"

Added: trunk/buildroot/package/sqlite/Config.in
===================================================================
--- trunk/buildroot/package/sqlite/Config.in	2006-09-26 15:56:03 UTC (rev 16226)
+++ trunk/buildroot/package/sqlite/Config.in	2006-09-26 16:01:07 UTC (rev 16227)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SQLITE
+	bool "sqlite"
+	default n
+	help
+	  SQLite is a small C library that implements a self-contained,
+	  embeddable, zero-configuration SQL database engine.
+
+	  http://www.sqlite.org/

Added: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2006-09-26 15:56:03 UTC (rev 16226)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2006-09-26 16:01:07 UTC (rev 16227)
@@ -0,0 +1,73 @@
+#############################################################
+#
+# sqlite
+#
+#############################################################
+
+SQLITE_VERSION=3.3.7
+SQLITE_SOURCE=sqlite-$(SQLITE_VERSION).tar.gz
+SQLITE_SITE=http://www.sqlite.org
+SQLITE_DIR=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
+SQLITE_CAT:=zcat
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
+		--disable-tcl \
+		--enable-shared \
+		--enable-static \
+		--disable-tcl \
+		--enable-tempstore \
+		--enable-threadsafe \
+		--enable-releasemode \
+	);
+	touch $(SQLITE_DIR)/.configured
+
+$(SQLITE_DIR)/sqlite3: $(SQLITE_DIR)/.configured
+	$(MAKE) -C $(SQLITE_DIR)
+
+$(STAGING_DIR)/bin/sqlite3: $(SQLITE_DIR)/sqlite3
+	$(MAKE) prefix=$(STAGING_DIR) -C $(SQLITE_DIR) install
+
+$(TARGET_DIR)/usr/bin/sqlite3: $(STAGING_DIR)/bin/sqlite3
+	cp -a $(STAGING_DIR)/bin/sqlite3 $(TARGET_DIR)/usr/bin
+	cp -a $(STAGING_DIR)/lib/libsqlite3.so* $(TARGET_DIR)/lib/
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libsqlite3.so*
+
+sqlite:	uclibc readline-target ncurses $(TARGET_DIR)/usr/bin/sqlite3
+
+sqlite-source: $(DL_DIR)/$(SQLITE_SOURCE)
+
+sqlite-clean:
+	@if [ -d $(SQLITE_DIR)/Makefile ] ; then \
+		$(MAKE) -C $(SQLITE_DIR) clean ; \
+	fi;
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
