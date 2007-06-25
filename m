From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 01:37:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/expat
Message-ID: <20070625083723.B67A7A45B1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 01:37:23 -0700 (Mon, 25 Jun 2007)
New Revision: 18910

Log:
- bump version and correct install dirs (Julien Letessier)


Modified:
   trunk/buildroot/package/expat/expat.mk


Changeset:
Modified: trunk/buildroot/package/expat/expat.mk
===================================================================
--- trunk/buildroot/package/expat/expat.mk	2007-06-25 08:16:14 UTC (rev 18909)
+++ trunk/buildroot/package/expat/expat.mk	2007-06-25 08:37:23 UTC (rev 18910)
@@ -4,12 +4,15 @@
 #
 #############################################################
 
-EXPAT_VERSION=2.0.0
+EXPAT_VERSION=2.0.1
 EXPAT_SOURCE=expat-$(EXPAT_VERSION).tar.gz
 EXPAT_CAT:=$(ZCAT)
 EXPAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/expat
 EXPAT_DIR:=$(BUILD_DIR)/expat-$(EXPAT_VERSION)
 
+EXPAT_BINARY:=.libs/libexpat.a
+EXPAT_TARGET_BINARY:=usr/lib/libexpat.so.1
+
 $(DL_DIR)/$(EXPAT_SOURCE):
 	$(WGET) -P $(DL_DIR) $(EXPAT_SITE)/$(EXPAT_SOURCE)
 
@@ -17,13 +20,12 @@
 
 $(EXPAT_DIR)/.unpacked: $(DL_DIR)/$(EXPAT_SOURCE)
 	$(EXPAT_CAT) $(DL_DIR)/$(EXPAT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(EXPAT_DIR)/.unpacked
+	$(CONFIG_UPDATE) $(EXPAT_DIR)
+	touch $@
 
 $(EXPAT_DIR)/.configured: $(EXPAT_DIR)/.unpacked
 	(cd $(EXPAT_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -42,29 +44,29 @@
 		--infodir=/usr/info \
 		--enable-shared \
 	);
-	touch  $(EXPAT_DIR)/.configured
+	touch $@
 
-$(EXPAT_DIR)/.libs/libexpat.a: $(EXPAT_DIR)/.configured
+$(EXPAT_DIR)/$(EXPAT_BINARY): $(EXPAT_DIR)/.configured
 	$(MAKE) -C $(EXPAT_DIR) all
-	touch -c $(EXPAT_DIR)/.libs/libexpat.a
+	touch -c $@
 
-$(STAGING_DIR)/lib/libexpat.so.1: $(EXPAT_DIR)/.libs/libexpat.a
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(EXPAT_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libexpat.la
-	touch -c $(STAGING_DIR)/lib/libexpat.so.1
+$(STAGING_DIR)/$(EXPAT_TARGET_BINARY): $(EXPAT_DIR)/$(EXPAT_BINARY)
+	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(EXPAT_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libexpat.la
+	touch -c $@
 
-$(TARGET_DIR)/lib/libexpat.so.1: $(STAGING_DIR)/lib/libexpat.so.1
-	cp -dpf $(STAGING_DIR)/lib/libexpat.so* $(TARGET_DIR)/lib/
-	#cp -dpf $(STAGING_DIR)/usr/bin/xmlwf $(TARGET_DIR)/bin/xmlwf
-	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libexpat.so*
-	touch -c $(TARGET_DIR)/lib/libexpat.so.1
+$(TARGET_DIR)/$(EXPAT_TARGET_BINARY): $(STAGING_DIR)/$(EXPAT_TARGET_BINARY)
+	cp -dpf $(STAGING_DIR)/usr/lib/libexpat.so* $(TARGET_DIR)/usr/lib/
+	#cp -dpf $(STAGING_DIR)/usr/bin/xmlwf $(TARGET_DIR)/usr/bin/xmlwf
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libexpat.so*
+	touch -c $@
 
-expat: uclibc pkgconfig $(TARGET_DIR)/lib/libexpat.so.1
+expat: uclibc pkgconfig $(TARGET_DIR)/$(EXPAT_TARGET_BINARY)
 
 expat-clean:
 	rm -f $(EXPAT_DIR)/.configured
-	rm -f $(STAGING_DIR)/lib/libexpat.* $(TARGET_DIR)/lib/libexpat.*
-	#rm -f $(STAGING_DIR)/usr/bin/xmlwf  $(TARGET_DIR)/bin/xmlwf
+	rm -f $(STAGING_DIR)/usr/lib/libexpat.* $(TARGET_DIR)/usr/lib/libexpat.*
+	#rm -f $(STAGING_DIR)/usr/bin/xmlwf  $(TARGET_DIR)/usr/bin/xmlwf
 	-$(MAKE) -C $(EXPAT_DIR) clean
 
 #############################################################
