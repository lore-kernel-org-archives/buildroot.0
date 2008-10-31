From: correa at uclibc.org <correa@uclibc.org>
Date: Fri, 31 Oct 2008 05:10:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/zlib
Message-ID: <20081031121011.6D91B3C7FE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-10-31 05:10:10 -0700 (Fri, 31 Oct 2008)
New Revision: 23879

Log:
Make sure directories are created during install to STAGING_DIR and TARGET_DIR. Thanks to Thomas Petazzoni and Bernhard Reutner-Fischer.

Modified:
   trunk/buildroot/package/zlib/zlib.mk


Changeset:
Modified: trunk/buildroot/package/zlib/zlib.mk
===================================================================
--- trunk/buildroot/package/zlib/zlib.mk	2008-10-31 09:50:42 UTC (rev 23878)
+++ trunk/buildroot/package/zlib/zlib.mk	2008-10-31 12:10:10 UTC (rev 23879)
@@ -37,23 +37,21 @@
 	touch -c $@
 
 $(STAGING_DIR)/usr/lib/libz.so: $(ZLIB_DIR)/libz.so
-	cp -dpf $(ZLIB_DIR)/libz.a $(STAGING_DIR)/usr/lib/
-	cp -dpf $(ZLIB_DIR)/zlib.h $(STAGING_DIR)/usr/include/
-	cp -dpf $(ZLIB_DIR)/zconf.h $(STAGING_DIR)/usr/include/
-	cp -dpf $(ZLIB_DIR)/libz.so* $(STAGING_DIR)/usr/lib/
+	$(INSTALL) -D $(ZLIB_DIR)/libz.a $(STAGING_DIR)/usr/lib/
+	$(INSTALL) -D $(ZLIB_DIR)/zlib.h $(STAGING_DIR)/usr/include/
+	$(INSTALL) $(ZLIB_DIR)/zconf.h $(STAGING_DIR)/usr/include/
+	$(INSTALL) $(ZLIB_DIR)/libz.so* $(STAGING_DIR)/usr/lib/
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libz.so: $(STAGING_DIR)/usr/lib/libz.so
-	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -dpf $(STAGING_DIR)/usr/lib/libz.so* $(TARGET_DIR)/usr/lib
+	$(INSTALL) -D $(STAGING_DIR)/usr/lib/libz.so* $(TARGET_DIR)/usr/lib
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libz.a: $(STAGING_DIR)/usr/lib/libz.so
-	mkdir -p $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib
-	cp -dpf $(STAGING_DIR)/usr/include/zlib.h $(TARGET_DIR)/usr/include/
-	cp -dpf $(STAGING_DIR)/usr/include/zconf.h $(TARGET_DIR)/usr/include/
-	cp -dpf $(STAGING_DIR)/usr/lib/libz.a $(TARGET_DIR)/usr/lib/
+	$(INSTALL) -D $(STAGING_DIR)/usr/include/zlib.h $(TARGET_DIR)/usr/include/
+	$(INSTALL) $(STAGING_DIR)/usr/include/zconf.h $(TARGET_DIR)/usr/include/
+	$(INSTALL) -D $(STAGING_DIR)/usr/lib/libz.a $(TARGET_DIR)/usr/lib/
 	touch -c $@
 
 zlib-headers: $(TARGET_DIR)/usr/lib/libz.a
