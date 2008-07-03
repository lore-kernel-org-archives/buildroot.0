From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu,  3 Jul 2008 01:14:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libvorbis
Message-ID: <20080703081454.A79343C651@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-03 01:14:54 -0700 (Thu, 03 Jul 2008)
New Revision: 22616

Log:
Cleanup libvorbis, install in STAGING_DIR, courtesy Conrad Parker

Modified:
   trunk/buildroot/package/libvorbis/libvorbis.mk


Changeset:
Modified: trunk/buildroot/package/libvorbis/libvorbis.mk
===================================================================
--- trunk/buildroot/package/libvorbis/libvorbis.mk	2008-07-03 08:12:51 UTC (rev 22615)
+++ trunk/buildroot/package/libvorbis/libvorbis.mk	2008-07-03 08:14:54 UTC (rev 22616)
@@ -40,13 +40,16 @@
 	touch $@
 
 $(LIBVORBIS_DIR)/.libs: $(LIBVORBIS_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(LIBVORBIS_DIR)
+	$(MAKE) -C $(@D)
 	touch $@
 
-$(TARGET_DIR)/usr/lib/libvorbis.so: $(LIBVORBIS_DIR)/.libs
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LIBVORBIS_DIR) install
-	touch $@
+$(STAGING_DIR)/usr/lib/libvorbis.so: $(LIBVORBIS_DIR)/.libs
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBVORBIS_DIR) install
 
+$(TARGET_DIR)/usr/lib/libvorbis.so: $(STAGING_DIR)/usr/lib/libvorbis.so
+	$(INSTALL) -D $(STAGING_DIR)/usr/lib/libvorbis*.so* $(TARGET_DIR)/usr/lib
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libvorbis*.so*
+
 libvorbis: uclibc pkgconfig libogg $(TARGET_DIR)/usr/lib/libvorbis.so
 
 libvorbis-source: $(DL_DIR)/$(LIBVORBIS_SOURCE)
