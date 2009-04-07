From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  7 Apr 2009 21:04:24 +0000 (UTC)
Subject: [Buildroot] svn commit: [26019] trunk/buildroot/package/liberation
Message-ID: <20090407210424.A8CCC768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-07 21:04:23 +0000 (Tue, 07 Apr 2009)
New Revision: 26019

Log:
liberation: cleanup and really fix continous rebuild

Modified:
   trunk/buildroot/package/liberation/liberation.mk


Changeset:
Modified: trunk/buildroot/package/liberation/liberation.mk
===================================================================
--- trunk/buildroot/package/liberation/liberation.mk	2009-04-07 20:07:23 UTC (rev 26018)
+++ trunk/buildroot/package/liberation/liberation.mk	2009-04-07 21:04:23 UTC (rev 26019)
@@ -8,6 +8,7 @@
 LIBERATION_SOURCE = liberation-fonts-$(LIBERATION_VERSION).tar.gz
 LIBERATION_DIR = $(BUILD_DIR)/liberation-fonts-$(LIBERATION_VERSION)
 LIBERATION_CAT:=$(ZCAT)
+LIBERATION_TARGET_DIR:=$(TARGET_DIR)/usr/share/fonts/liberation
 
 $(DL_DIR)/$(LIBERATION_SOURCE):
 	$(call DOWNLOAD,$(LIBERATION_SITE),$(LIBERATION_SOURCE))
@@ -18,15 +19,15 @@
 	$(LIBERATION_CAT) $(DL_DIR)/$(LIBERATION_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(TARGET_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: $(LIBERATION_DIR)/.unpacked
-	-mkdir -p $(TARGET_DIR)/usr/share/fonts/liberation
-	$(INSTALL) -m0644 $(LIBERATION_DIR)/*.ttf $(TARGET_DIR)/usr/share/fonts/liberation/
+$(LIBERATION_TARGET_DIR)/LiberationMono-Bold.ttf: $(LIBERATION_DIR)/.unpacked
+	mkdir -p $(LIBERATION_TARGET_DIR)
+	$(INSTALL) -m0644 $(LIBERATION_DIR)/*.ttf $(LIBERATION_TARGET_DIR)
 	touch -c $@
 
-liberation: uclibc $(TARGET_DIR)/usr/share/fonts/LiberationMono-Bold.ttf
+liberation: uclibc $(LIBERATION_TARGET_DIR)/LiberationMono-Bold.ttf
 
 liberation-clean:
-	rm -rf $(TARGET_DIR)/usr/share/fonts/liberation/
+	rm -rf $(LIBERATION_TARGET_DIR)
 
 liberation-dirclean:
 	rm -rf $(LIBERATION_DIR)
