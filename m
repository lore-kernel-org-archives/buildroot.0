From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  8 Jul 2008 07:12:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sqlite
Message-ID: <20080708141211.029D83C685@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-08 07:12:09 -0700 (Tue, 08 Jul 2008)
New Revision: 22691

Log:
sqlite: strip binary and use $(INSTALL) for installation

Modified:
   trunk/buildroot/package/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2008-07-08 13:49:23 UTC (rev 22690)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2008-07-08 14:12:09 UTC (rev 22691)
@@ -50,8 +50,9 @@
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libsqlite3.la
 
 $(TARGET_DIR)/usr/bin/sqlite3: $(STAGING_DIR)/usr/bin/sqlite3
-	cp -a $(STAGING_DIR)/usr/bin/sqlite3 $(TARGET_DIR)/usr/bin
-	cp -a $(STAGING_DIR)/usr/lib/libsqlite3*.so* $(TARGET_DIR)/usr/lib/
+	$(INSTALL) -m 0755 -D $^ $@
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
+	$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/libsqlite3*.so* $(TARGET_DIR)/usr/lib/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libsqlite3.so*
 
 sqlite: uclibc readline-target ncurses $(TARGET_DIR)/usr/bin/sqlite3
