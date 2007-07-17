From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 17 Jul 2007 08:17:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxml2
Message-ID: <20070717151745.301A8A65A7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-17 08:17:42 -0700 (Tue, 17 Jul 2007)
New Revision: 19135

Log:
Copy libxml2 headers to staging_dir (and possibly target_dir)

Modified:
   trunk/buildroot/package/libxml2/libxml2.mk


Changeset:
Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2007-07-17 13:28:31 UTC (rev 19134)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2007-07-17 15:17:42 UTC (rev 19135)
@@ -46,12 +46,21 @@
 $(TARGET_DIR)/usr/lib/libxml2.a: $(STAGING_DIR)/usr/lib/libxml2.so
 	mkdir -p $(TARGET_DIR)/usr/include
 	cp -dpf $(STAGING_DIR)/usr/lib/libxml2.*a $(TARGET_DIR)/usr/lib/
-#	cp -dpf $(STAGING_DIR)/usr/include/mad.h $(TARGET_DIR)/usr/include/
+#	cp -dpf $(STAGING_DIR)/usr/include/libxml $(TARGET_DIR)/usr/include/
 
-libxml2:	uclibc $(TARGET_DIR)/usr/lib/libxml2.so
+libxml2:	uclibc $(TARGET_DIR)/usr/lib/libxml2.so libxml2-headers
 
-libxml2-headers: $(TARGET_DIR)/usr/lib/libxml2.a
+$(STAGING_DIR)/usr/include/libxml:	$(TARGET_DIR)/usr/lib/libxml2.a
+	cp -af $(LIBXML2_DIR)/include/libxml $(STAGING_DIR)/usr/include/libxml2
 
+$(TARGET_DIR)/usr/include:	libxml2-headers
+	cp -af $(LIBXML2_DIR)/include/libxml $(TARGET_DIR)/usr/include/libxml2
+
+
+libxml2-headers:	$(STAGING_DIR)/usr/include/libxml2
+
+libxml2-target-headers: $(TARGET_DIR)/usr/include/libxml2
+
 libxml2-source: $(DL_DIR)/$(LIBXML2_SOURCE)
 
 libxml2-clean:
@@ -64,6 +73,8 @@
 
 libxml2-dirclean:
 	rm -rf $(LIBXML2_DIR)
+
+.PHONY:	libxml2-headers libxml2-target-headers
 #############################################################
 #
 # Toplevel Makefile options
@@ -73,5 +84,5 @@
 TARGETS+=libxml2
 endif
 ifeq ($(strip $(BR2_PACKAGE_LIBXML2_TARGET_HEADERS)),y)
-TARGETS+=libxml2-headers
+TARGETS+=libxml2-target-headers
 endif
