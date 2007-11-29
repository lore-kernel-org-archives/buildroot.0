From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Nov 2007 01:42:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libogg
Message-ID: <20071129094206.203CE3004B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-29 01:42:06 -0800 (Thu, 29 Nov 2007)
New Revision: 20578

Log:
Ensure ogg lib is in staging dir

Modified:
   trunk/buildroot/package/libogg/libogg.mk


Changeset:
Modified: trunk/buildroot/package/libogg/libogg.mk
===================================================================
--- trunk/buildroot/package/libogg/libogg.mk	2007-11-29 08:17:45 UTC (rev 20577)
+++ trunk/buildroot/package/libogg/libogg.mk	2007-11-29 09:42:06 UTC (rev 20578)
@@ -41,11 +41,16 @@
 	touch $@
 
 $(LIBOGG_DIR)/.libs: $(LIBOGG_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(LIBOGG_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBOGG_DIR)
 	touch $@
 
-$(TARGET_DIR)/usr/lib/libogg.so: $(LIBOGG_DIR)/.libs
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LIBOGG_DIR) install
+$(STAGING_DIR)/usr/lib/libogg.so: $(LIBOGG_DIR)/.libs
+	mkdir -p $(STAGING_DIR)
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBOGG_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libogg.la
+
+$(TARGET_DIR)/usr/lib/libogg.so: $(STAGING_DIR)/usr/lib/libogg.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libogg.so* $(TARGET_DIR)/usr/lib
 ifneq ($(strip $(BR2_HAVE_MANPAGES)),y)
 	rm -rf $(TARGET_DIR)/usr/share/doc/$(LIBOGG_NAME)
 endif
@@ -65,7 +70,8 @@
 libogg-source: $(DL_DIR)/$(LIBOGG_SOURCE)
 
 libogg-clean:
-	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(LIBOGG_DIR) uninstall
+	-rm -rf $(TARGET_DIR)/usr/lib/libogg.so*
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBOGG_DIR) uninstall
 	-$(MAKE) -C $(LIBOGG_DIR) clean
 
 libogg-dirclean:
