From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 17 Jul 2008 06:19:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/zlib
Message-ID: <20080717131958.58B433C885@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-17 06:19:54 -0700 (Thu, 17 Jul 2008)
New Revision: 22860

Log:
zlib: cleanup and fix -clean target

Modified:
   trunk/buildroot/package/zlib/zlib.mk


Changeset:
Modified: trunk/buildroot/package/zlib/zlib.mk
===================================================================
--- trunk/buildroot/package/zlib/zlib.mk	2008-07-17 13:19:42 UTC (rev 22859)
+++ trunk/buildroot/package/zlib/zlib.mk	2008-07-17 13:19:54 UTC (rev 22860)
@@ -36,47 +36,43 @@
 	)
 	touch $@
 
-$(ZLIB_DIR)/libz.so.$(ZLIB_VERSION): $(ZLIB_DIR)/.configured
+$(ZLIB_DIR)/libz.so: $(ZLIB_DIR)/.configured
 	$(MAKE) -C $(ZLIB_DIR) all libz.a
-	touch -c $(ZLIB_DIR)/libz.so.$(ZLIB_VERSION)
+	touch -c $@
 
-$(STAGING_DIR)/usr/lib/libz.so.$(ZLIB_VERSION): $(ZLIB_DIR)/libz.so.$(ZLIB_VERSION)
+$(STAGING_DIR)/usr/lib/libz.so: $(ZLIB_DIR)/libz.so
 	cp -dpf $(ZLIB_DIR)/libz.a $(STAGING_DIR)/usr/lib/
 	cp -dpf $(ZLIB_DIR)/zlib.h $(STAGING_DIR)/usr/include/
 	cp -dpf $(ZLIB_DIR)/zconf.h $(STAGING_DIR)/usr/include/
 	cp -dpf $(ZLIB_DIR)/libz.so* $(STAGING_DIR)/usr/lib/
-	ln -sf libz.so.$(ZLIB_VERSION) $(STAGING_DIR)/usr/lib/libz.so.1
-	chmod a-x $(STAGING_DIR)/usr/lib/libz.so.$(ZLIB_VERSION)
 	touch -c $@
 
-$(TARGET_DIR)/usr/lib/libz.so.$(ZLIB_VERSION): $(STAGING_DIR)/usr/lib/libz.so.$(ZLIB_VERSION)
+$(TARGET_DIR)/usr/lib/libz.so: $(STAGING_DIR)/usr/lib/libz.so
 	mkdir -p $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/lib/libz.so* $(TARGET_DIR)/usr/lib
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libz.so*
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 	touch -c $@
 
-$(TARGET_DIR)/usr/lib/libz.a: $(STAGING_DIR)/usr/lib/libz.so.$(ZLIB_VERSION)
+$(TARGET_DIR)/usr/lib/libz.a: $(STAGING_DIR)/usr/lib/libz.so
 	mkdir -p $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/include/zlib.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(STAGING_DIR)/usr/include/zconf.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(STAGING_DIR)/usr/lib/libz.a $(TARGET_DIR)/usr/lib/
-	rm -f $(TARGET_DIR)/lib/libz.so $(TARGET_DIR)/usr/lib/libz.so
-	ln -sf libz.so.$(ZLIB_VERSION) $(TARGET_DIR)/usr/lib/libz.so
 	touch -c $@
 
 zlib-headers: $(TARGET_DIR)/usr/lib/libz.a
 
-zlib: uclibc $(TARGET_DIR)/usr/lib/libz.so.$(ZLIB_VERSION)
+zlib: uclibc $(TARGET_DIR)/usr/lib/libz.so
 
 zlib-source: $(DL_DIR)/$(ZLIB_SOURCE)
 
 zlib-clean:
-	rm -f $(TARGET_DIR)/usr/lib/libz.so* \
-		$(TARGET_DIR)/usr/include/zlib.h \
-		$(TARGET_DIR)/usr/include/zconf.h \
-		$(STAGING_DIR)/usr/include/zlib.h \
-		$(STAGING_DIR)/usr/include/zconf.h \
-		$(STAGING_DIR)/usr/lib/libz.*
+	rm -f $(TARGET_DIR)/usr/lib/libz.* \
+	      $(TARGET_DIR)/usr/include/zlib.h \
+	      $(TARGET_DIR)/usr/include/zconf.h \
+	      $(STAGING_DIR)/usr/include/zlib.h \
+	      $(STAGING_DIR)/usr/include/zconf.h \
+	      $(STAGING_DIR)/usr/lib/libz.*
 	-$(MAKE) -C $(ZLIB_DIR) clean
 
 zlib-dirclean:
