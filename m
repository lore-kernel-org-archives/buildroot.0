From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 13 Aug 2007 23:28:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20070814062801.19F89A682C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-13 23:28:01 -0700 (Mon, 13 Aug 2007)
New Revision: 19499

Log:
Add links to 'usr/include/freetype2/freetype' to 'include' and 'usr/include'. Add PHONY targets

Modified:
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2007-08-14 06:18:02 UTC (rev 19498)
+++ trunk/buildroot/package/freetype/freetype.mk	2007-08-14 06:28:01 UTC (rev 19499)
@@ -14,8 +14,6 @@
 $(DL_DIR)/$(FREETYPE_SOURCE):
 	$(WGET) -P $(DL_DIR) $(FREETYPE_SITE)/$(FREETYPE_SOURCE)
 
-freetype-source: $(DL_DIR)/$(FREETYPE_SOURCE)
-
 $(FREETYPE_DIR)/.unpacked: $(DL_DIR)/$(FREETYPE_SOURCE)
 	$(FREETYPE_CAT) $(DL_DIR)/$(FREETYPE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(FREETYPE_DIR)/.unpacked
@@ -48,6 +46,12 @@
 	$(MAKE) CCexe="$(HOSTCC)" -C $(FREETYPE_DIR)
 	touch $(FREETYPE_DIR)/.compiled
 
+$(STAGING_DIR)/usr/include/freetype:
+	ln -sf ./freetype2/freetype  $(STAGING_DIR)/usr/include/freetype
+
+$(STAGING_DIR)/include/freetype:
+	ln -sf ../usr/include/freetype2/freetype  $(STAGING_DIR)/include/freetype
+
 $(STAGING_DIR)/lib/libfreetype.so: $(FREETYPE_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(FREETYPE_DIR) install
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libfreetype.la
@@ -85,10 +89,14 @@
 	$(MAKE) -C $(FREETYPE_DIR1) install
 	touch -c $@
 
-host-freetype: $(FREETYPE_HOST_DIR)/lib/libfreetype.so
+.PHONY:	freetype freetype-source freetype-links freetype-clean freetype-dirclean
 
-freetype: uclibc pkgconfig $(TARGET_DIR)/lib/libfreetype.so
+freetype: uclibc pkgconfig $(TARGET_DIR)/lib/libfreetype.so freetype-links
 
+freetype-source: $(DL_DIR)/$(FREETYPE_SOURCE)
+
+freetype-links:	$(STAGING_DIR)/usr/include/freetype $(STAGING_DIR)/include/freetype
+
 freetype-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FREETYPE_DIR) uninstall
 	-$(MAKE) -C $(FREETYPE_DIR) clean
@@ -96,6 +104,10 @@
 freetype-dirclean:
 	rm -rf $(FREETYPE_DIR)
 
+.PHONY:	host-freetype
+
+host-freetype: $(FREETYPE_HOST_DIR)/lib/libfreetype.so
+
 #############################################################
 #
 # Toplevel Makefile options
