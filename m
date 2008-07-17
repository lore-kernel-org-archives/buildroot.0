From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 17 Jul 2008 06:19:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tiff
Message-ID: <20080717131935.1590E3C864@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-17 06:19:33 -0700 (Thu, 17 Jul 2008)
New Revision: 22858

Log:
tiff: cleanup and fix -clean target

Modified:
   trunk/buildroot/package/tiff/tiff.mk


Changeset:
Modified: trunk/buildroot/package/tiff/tiff.mk
===================================================================
--- trunk/buildroot/package/tiff/tiff.mk	2008-07-17 11:59:13 UTC (rev 22857)
+++ trunk/buildroot/package/tiff/tiff.mk	2008-07-17 13:19:33 UTC (rev 22858)
@@ -56,20 +56,22 @@
 
 $(TIFF_DIR)/libtiff/.libs/libtiff.a: $(TIFF_DIR)/.configured
 	$(MAKE) -C $(TIFF_DIR)
-	touch -c $(TIFF_DIR)/libtiff/.libs/libtiff.a
+	touch -c $@
 
-$(STAGING_DIR)/usr/lib/libtiff.so.$(TIFF_VERSION): $(TIFF_DIR)/libtiff/.libs/libtiff.a
+$(STAGING_DIR)/usr/lib/libtiff.so: $(TIFF_DIR)/libtiff/.libs/libtiff.a
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(TIFF_DIR) install
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libtiff.la
-	touch -c $(STAGING_DIR)/usr/lib/libtiff.so.$(TIFF_VERSION)
+	touch -c $@
 
-$(TARGET_DIR)/usr/lib/libtiff.so.$(TIFF_VERSION): $(STAGING_DIR)/usr/lib/libtiff.so.$(TIFF_VERSION)
+$(TARGET_DIR)/usr/lib/libtiff.so: $(STAGING_DIR)/usr/lib/libtiff.so
 	cp -dpf $(STAGING_DIR)/usr/lib/libtiff.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtiff.so.$(TIFF_VERSION)
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
-tiff: uclibc zlib jpeg $(TARGET_DIR)/usr/lib/libtiff.so.$(TIFF_VERSION)
+tiff: uclibc zlib jpeg $(TARGET_DIR)/usr/lib/libtiff.so
 
 tiff-clean:
+	-rm -f $(TARGET_DIR)/usr/lib/libtiff.so*
+	-$(MAKE) -C $(TIFF_DIR) DESTDIR=$(STAGING_DIR) uninstall
 	-$(MAKE) -C $(TIFF_DIR) clean
 
 tiff-dirclean:
