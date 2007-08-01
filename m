From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed,  1 Aug 2007 15:34:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libmad
Message-ID: <20070801223451.C75CCA605C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-01 15:34:50 -0700 (Wed, 01 Aug 2007)
New Revision: 19394

Log:
Build correct target in libmad

Modified:
   trunk/buildroot/package/libmad/libmad.mk


Changeset:
Modified: trunk/buildroot/package/libmad/libmad.mk
===================================================================
--- trunk/buildroot/package/libmad/libmad.mk	2007-08-01 19:15:14 UTC (rev 19393)
+++ trunk/buildroot/package/libmad/libmad.mk	2007-08-01 22:34:50 UTC (rev 19394)
@@ -39,20 +39,19 @@
 	rm -f $@
 	$(MAKE) -C $(LIBMAD_DIR)
 
-$(STAGING_DIR)/usr/lib/libmad.0: $(LIBMAD_DIR)/libmad.la
+$(STAGING_DIR)/usr/lib/libmad.so: $(LIBMAD_DIR)/libmad.la
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBMAD_DIR) install
 
-$(TARGET_DIR)/usr/lib/libmad.0: $(STAGING_DIR)/usr/lib/libmad.0
-	cp -dpf $(STAGING_DIR)/usr/lib/libmad $(TARGET_DIR)/usr/lib/
-	cp -dpf $(STAGING_DIR)/usr/lib/libmad.0* $(TARGET_DIR)/usr/lib/
+$(TARGET_DIR)/usr/lib/libmad.so: $(STAGING_DIR)/usr/lib/libmad.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libmad.so* $(TARGET_DIR)/usr/lib/
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libmad*
 
-$(TARGET_DIR)/usr/lib/libmad.a: $(STAGING_DIR)/usr/lib/libmad.0
+$(TARGET_DIR)/usr/lib/libmad.a: $(STAGING_DIR)/usr/lib/libmad.so
 	mkdir -p $(TARGET_DIR)/usr/include
 	cp -dpf $(STAGING_DIR)/usr/include/mad.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(STAGING_DIR)/usr/lib/libmad.*a $(TARGET_DIR)/usr/lib/
 
-libmad:	uclibc $(TARGET_DIR)/usr/lib/libmad.0
+libmad:	uclibc $(TARGET_DIR)/usr/lib/libmad.so
 
 libmad-headers: $(TARGET_DIR)/usr/lib/libmad.a
 
