From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 04:16:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libogg
Message-ID: <20080616111630.23F7FF800B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-16 04:16:28 -0700 (Mon, 16 Jun 2008)
New Revision: 22371

Log:
libogg: move header install to seperate target so it isn't always out-of-date


Modified:
   trunk/buildroot/package/libogg/libogg.mk


Changeset:
Modified: trunk/buildroot/package/libogg/libogg.mk
===================================================================
--- trunk/buildroot/package/libogg/libogg.mk	2008-06-16 11:16:10 UTC (rev 22370)
+++ trunk/buildroot/package/libogg/libogg.mk	2008-06-16 11:16:28 UTC (rev 22371)
@@ -56,14 +56,16 @@
 	rm -rf $(TARGET_DIR)/usr/share/doc/$(LIBOGG_NAME)
 endif
 
-$(TARGET_DIR)/usr/lib/libogg.a: $(TARGET_DIR)/usr/lib/libogg.so
+$(TARGET_DIR)/usr/lib/libogg.a: $(STAGING_DIR)/usr/lib/libogg.so
 	cp -dpf $(STAGING_DIR)/usr/lib/libogg.a $@
 
-libogg-header: $(TARGET_DIR)/usr/lib/libogg.a
+$(TARGET_DIR)/usr/include/ogg/ogg.h: $(STAGING_DIR)/usr/lib/libogg.so
 	mkdir -p $(TARGET_DIR)/usr/include/ogg
 	cp -dpf $(LIBOGG_DIR)/include/ogg/*.h \
 		$(TARGET_DIR)/usr/include/ogg
 
+libogg-header: $(TARGET_DIR)/usr/lib/libogg.a $(TARGET_DIR)/usr/include/ogg/ogg.h
+
 libogg: uclibc pkgconfig $(TARGET_DIR)/usr/lib/libogg.so
 
 libogg-source: $(DL_DIR)/$(LIBOGG_SOURCE)
