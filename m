From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:25:03 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sqlite
Message-ID: <20080306182503.4BA5F12027D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:25:02 -0800 (Thu, 06 Mar 2008)
New Revision: 21228

Log:
fixes for sqlite makefile

Modified:
   trunk/buildroot/package/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2008-03-06 18:24:27 UTC (rev 21227)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2008-03-06 18:25:02 UTC (rev 21228)
@@ -34,12 +34,12 @@
 		--exec-prefix=/usr \
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
-		--libdir=/lib \
+		--libdir=/usr/lib \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--enable-shared \
@@ -56,11 +56,12 @@
 
 $(STAGING_DIR)/usr/bin/sqlite3: $(SQLITE_DIR)/sqlite3
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SQLITE_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libsqlite3.la
 
 $(TARGET_DIR)/usr/bin/sqlite3: $(STAGING_DIR)/usr/bin/sqlite3
 	cp -a $(STAGING_DIR)/usr/bin/sqlite3 $(TARGET_DIR)/usr/bin
-	cp -a $(STAGING_DIR)/lib/libsqlite3*.so* $(TARGET_DIR)/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libsqlite3.so*
+	cp -a $(STAGING_DIR)/usr/lib/libsqlite3*.so* $(TARGET_DIR)/usr/lib/
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libsqlite3.so*
 
 sqlite: uclibc readline-target ncurses $(TARGET_DIR)/usr/bin/sqlite3
 
