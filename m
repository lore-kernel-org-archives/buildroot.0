From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:27:19 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tiff
Message-ID: <20080306182719.524EF120250@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:27:19 -0800 (Thu, 06 Mar 2008)
New Revision: 21233

Log:
fixes for tiff makefile

Modified:
   trunk/buildroot/package/tiff/tiff.mk


Changeset:
Modified: trunk/buildroot/package/tiff/tiff.mk
===================================================================
--- trunk/buildroot/package/tiff/tiff.mk	2008-03-06 18:26:58 UTC (rev 21232)
+++ trunk/buildroot/package/tiff/tiff.mk	2008-03-06 18:27:19 UTC (rev 21233)
@@ -35,7 +35,7 @@
 		--exec-prefix=/usr \
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
-		--libdir=/lib \
+		--libdir=/usr/lib \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
@@ -58,16 +58,16 @@
 	$(MAKE) -C $(TIFF_DIR)
 	touch -c $(TIFF_DIR)/libtiff/.libs/libtiff.a
 
-$(STAGING_DIR)/lib/libtiff.so.$(TIFF_VERSION): $(TIFF_DIR)/libtiff/.libs/libtiff.a
+$(STAGING_DIR)/usr/lib/libtiff.so.$(TIFF_VERSION): $(TIFF_DIR)/libtiff/.libs/libtiff.a
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(TIFF_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libtiff.la
-	touch -c $(STAGING_DIR)/lib/libtiff.so.$(TIFF_VERSION)
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libtiff.la
+	touch -c $(STAGING_DIR)/usr/lib/libtiff.so.$(TIFF_VERSION)
 
-$(TARGET_DIR)/lib/libtiff.so.$(TIFF_VERSION): $(STAGING_DIR)/lib/libtiff.so.$(TIFF_VERSION)
-	cp -dpf $(STAGING_DIR)/lib/libtiff.so* $(TARGET_DIR)/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libtiff.so.$(TIFF_VERSION)
+$(TARGET_DIR)/usr/lib/libtiff.so.$(TIFF_VERSION): $(STAGING_DIR)/usr/lib/libtiff.so.$(TIFF_VERSION)
+	cp -dpf $(STAGING_DIR)/usr/lib/libtiff.so* $(TARGET_DIR)/usr/lib/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtiff.so.$(TIFF_VERSION)
 
-tiff: uclibc zlib jpeg $(TARGET_DIR)/lib/libtiff.so.$(TIFF_VERSION)
+tiff: uclibc zlib jpeg $(TARGET_DIR)/usr/lib/libtiff.so.$(TIFF_VERSION)
 
 tiff-clean:
 	-$(MAKE) -C $(TIFF_DIR) clean
