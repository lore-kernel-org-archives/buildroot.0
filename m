From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 06:55:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/expat
Message-ID: <20070708135551.4522B30043@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 06:55:49 -0700 (Sun, 08 Jul 2007)
New Revision: 19038

Log:
- add missing dirclean target (Cristian Ionescu-Idbohrn)


Modified:
   trunk/buildroot/package/expat/expat.mk


Changeset:
Modified: trunk/buildroot/package/expat/expat.mk
===================================================================
--- trunk/buildroot/package/expat/expat.mk	2007-07-08 13:51:15 UTC (rev 19037)
+++ trunk/buildroot/package/expat/expat.mk	2007-07-08 13:55:49 UTC (rev 19038)
@@ -19,7 +19,8 @@
 expat-source: $(DL_DIR)/$(EXPAT_SOURCE)
 
 $(EXPAT_DIR)/.unpacked: $(DL_DIR)/$(EXPAT_SOURCE)
-	$(EXPAT_CAT) $(DL_DIR)/$(EXPAT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(EXPAT_CAT) $(DL_DIR)/$(EXPAT_SOURCE) | \
+		tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(EXPAT_DIR)
 	touch $@
 
@@ -40,7 +41,7 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--enable-shared \
@@ -53,7 +54,8 @@
 
 $(STAGING_DIR)/$(EXPAT_TARGET_BINARY): $(EXPAT_DIR)/$(EXPAT_BINARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(EXPAT_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libexpat.la
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
+		$(STAGING_DIR)/usr/lib/libexpat.la
 	touch -c $@
 
 $(TARGET_DIR)/$(EXPAT_TARGET_BINARY): $(STAGING_DIR)/$(EXPAT_TARGET_BINARY)
@@ -66,10 +68,14 @@
 
 expat-clean:
 	rm -f $(EXPAT_DIR)/.configured
-	rm -f $(STAGING_DIR)/usr/lib/libexpat.* $(TARGET_DIR)/usr/lib/libexpat.*
+	rm -f $(STAGING_DIR)/usr/lib/libexpat.* \
+		$(TARGET_DIR)/usr/lib/libexpat.*
 	#rm -f $(STAGING_DIR)/usr/bin/xmlwf  $(TARGET_DIR)/usr/bin/xmlwf
 	-$(MAKE) -C $(EXPAT_DIR) clean
 
+expat-dirclean:
+	rm -rf $(EXPAT_DIR)
+
 #############################################################
 #
 # Toplevel Makefile options
