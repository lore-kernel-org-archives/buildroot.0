From: correa at uclibc.org <correa@uclibc.org>
Date: Fri, 31 Oct 2008 09:37:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/zlib
Message-ID: <20081031163702.6E205F8018@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-10-31 09:37:01 -0700 (Fri, 31 Oct 2008)
New Revision: 23885

Log:
Fix zlib install broken by previous commit. Sorry

Modified:
   trunk/buildroot/package/zlib/zlib.mk


Changeset:
Modified: trunk/buildroot/package/zlib/zlib.mk
===================================================================
--- trunk/buildroot/package/zlib/zlib.mk	2008-10-31 14:18:04 UTC (rev 23884)
+++ trunk/buildroot/package/zlib/zlib.mk	2008-10-31 16:37:01 UTC (rev 23885)
@@ -37,21 +37,22 @@
 	touch -c $@
 
 $(STAGING_DIR)/usr/lib/libz.so: $(ZLIB_DIR)/libz.so
-	$(INSTALL) -D $(ZLIB_DIR)/libz.a $(STAGING_DIR)/usr/lib/
-	$(INSTALL) -D $(ZLIB_DIR)/zlib.h $(STAGING_DIR)/usr/include/
+	$(INSTALL) -D $(ZLIB_DIR)/libz.a $(STAGING_DIR)/usr/lib/libz.a
+	$(INSTALL) -D $(ZLIB_DIR)/zlib.h $(STAGING_DIR)/usr/include/zlib.h
 	$(INSTALL) $(ZLIB_DIR)/zconf.h $(STAGING_DIR)/usr/include/
 	$(INSTALL) $(ZLIB_DIR)/libz.so* $(STAGING_DIR)/usr/lib/
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libz.so: $(STAGING_DIR)/usr/lib/libz.so
-	$(INSTALL) -D $(STAGING_DIR)/usr/lib/libz.so* $(TARGET_DIR)/usr/lib
+	mkdir -p $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/lib/libz.so* $(TARGET_DIR)/usr/lib
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libz.a: $(STAGING_DIR)/usr/lib/libz.so
-	$(INSTALL) -D $(STAGING_DIR)/usr/include/zlib.h $(TARGET_DIR)/usr/include/
+	$(INSTALL) -D $(STAGING_DIR)/usr/include/zlib.h $(TARGET_DIR)/usr/include/zlib.h
 	$(INSTALL) $(STAGING_DIR)/usr/include/zconf.h $(TARGET_DIR)/usr/include/
-	$(INSTALL) -D $(STAGING_DIR)/usr/lib/libz.a $(TARGET_DIR)/usr/lib/
+	$(INSTALL) -D $(STAGING_DIR)/usr/lib/libz.a $(TARGET_DIR)/usr/lib/libz.a
 	touch -c $@
 
 zlib-headers: $(TARGET_DIR)/usr/lib/libz.a
