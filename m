From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 10 Jan 2007 23:25:02 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/expat
Message-ID: <20070111072502.7479D48583@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-10 23:25:01 -0800 (Wed, 10 Jan 2007)
New Revision: 17240

Log:
fix dependancies and install paths


Modified:
   trunk/buildroot/package/expat/expat.mk


Changeset:
Modified: trunk/buildroot/package/expat/expat.mk
===================================================================
--- trunk/buildroot/package/expat/expat.mk	2007-01-11 06:17:24 UTC (rev 17239)
+++ trunk/buildroot/package/expat/expat.mk	2007-01-11 07:25:01 UTC (rev 17240)
@@ -41,23 +41,27 @@
 	);
 	touch  $(EXPAT_DIR)/.configured
 
-$(EXPAT_DIR)/.libs/libexpat.so.0.5.0: $(EXPAT_DIR)/.configured
+$(EXPAT_DIR)/.libs/libexpat.a: $(EXPAT_DIR)/.configured
 	$(MAKE) -C $(EXPAT_DIR) all
+	touch -c $(EXPAT_DIR)/.libs/libexpat.a
 
-$(STAGING_DIR)/lib/libexpat.so.0.5.0: $(EXPAT_DIR)/.libs/libexpat.so.0.5.0
-	$(MAKE) -C $(EXPAT_DIR) prefix=$(STAGING_DIR) exec_prefix=$(STAGING_DIR) mandir=$(STAGING_DIR)/man install
+$(STAGING_DIR)/lib/libexpat.so.1: $(EXPAT_DIR)/.libs/libexpat.a
+	$(MAKE) -C $(EXPAT_DIR) prefix=$(STAGING_DIR) \
+		exec_prefix=$(STAGING_DIR) mandir=$(STAGING_DIR)/man install
+	touch -c $(STAGING_DIR)/lib/libexpat.so.1
 
-$(TARGET_DIR)/usr/lib/libexpat.so.0.5.0: $(STAGING_DIR)/lib/libexpat.so.0.5.0
-	cp -dpf $(STAGING_DIR)/lib/libexpat.so* $(TARGET_DIR)/usr/lib/
-	cp -dpf $(STAGING_DIR)/usr/bin/xmlwf $(TARGET_DIR)/usr/bin/xmlwf
-	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libexpat.so.0.5.0
+$(TARGET_DIR)/lib/libexpat.so.1: $(STAGING_DIR)/lib/libexpat.so.1
+	cp -dpf $(STAGING_DIR)/lib/libexpat.so* $(TARGET_DIR)/lib/
+	#cp -dpf $(STAGING_DIR)/usr/bin/xmlwf $(TARGET_DIR)/bin/xmlwf
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libexpat.so.0.5.0
+	touch -c $(TARGET_DIR)/lib/libexpat.so.1
 
-expat: uclibc $(TARGET_DIR)/usr/lib/libexpat.so.0.5.0
+expat: uclibc $(TARGET_DIR)/lib/libexpat.so.1
 
 expat-clean:
 	rm -f $(EXPAT_DIR)/.configured
-	rm -f $(STAGING_DIR)/lib/libexpat.* $(TARGET_DIR)/usr/lib/libexpat.*
-	rm -f $(STAGING_DIR)/usr/bin/xmlwf  $(TARGET_DIR)/usr/bin/xmlwf
+	rm -f $(STAGING_DIR)/lib/libexpat.* $(TARGET_DIR)/lib/libexpat.*
+	#rm -f $(STAGING_DIR)/usr/bin/xmlwf  $(TARGET_DIR)/bin/xmlwf
 	-$(MAKE) -C $(EXPAT_DIR) clean
 
 #############################################################
