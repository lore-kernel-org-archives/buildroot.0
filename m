From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 17 Jul 2008 06:20:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/database/sqlite
Message-ID: <20080717132026.A65CA3C8AA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-17 06:20:23 -0700 (Thu, 17 Jul 2008)
New Revision: 22862

Log:
sqlite: fix target install and clean

- install -D isn't a good idea for symlinks as it replaces them with the
  target files, leading to 3 copies of libsqlite.
- clean was missing include and pkgconfig files

Modified:
   trunk/buildroot/package/database/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/database/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/database/sqlite/sqlite.mk	2008-07-17 13:20:05 UTC (rev 22861)
+++ trunk/buildroot/package/database/sqlite/sqlite.mk	2008-07-17 13:20:23 UTC (rev 22862)
@@ -52,8 +52,8 @@
 $(TARGET_DIR)/usr/bin/sqlite3: $(STAGING_DIR)/usr/bin/sqlite3
 	$(INSTALL) -m 0755 -D $^ $@
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-	$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/libsqlite3*.so* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libsqlite3.so*
+	cp -dpf $(STAGING_DIR)/usr/lib/libsqlite3*.so* $(TARGET_DIR)/usr/lib/
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libsqlite3.so
 
 sqlite: uclibc readline-target ncurses $(TARGET_DIR)/usr/bin/sqlite3
 
@@ -63,6 +63,8 @@
 	-$(MAKE) -C $(SQLITE_DIR) clean
 	-rm -rf $(STAGING_DIR)/usr/lib/libsqlite*
 	-rm -rf $(STAGING_DIR)/usr/bin/sqlite3
+	-rm -rf $(STAGING_DIR)/usr/include/sqlite*
+	-rm -rf $(STAGING_DIR)/usr/lib/pkgconfig/sqlite*
 	-rm -rf $(TARGET_DIR)/usr/lib/libsqlite*
 	-rm -rf $(TARGET_DIR)/usr/bin/sqlite3
 
