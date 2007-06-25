From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 01:58:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libraw1394
Message-ID: <20070625085839.2F01FA45BD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 01:58:38 -0700 (Mon, 25 Jun 2007)
New Revision: 18911

Log:
- Install the library under $(STAGING_DIR)/usr/lib (Julien Letessier)


Modified:
   trunk/buildroot/package/libraw1394/libraw1394.mk


Changeset:
Modified: trunk/buildroot/package/libraw1394/libraw1394.mk
===================================================================
--- trunk/buildroot/package/libraw1394/libraw1394.mk	2007-06-25 08:37:23 UTC (rev 18910)
+++ trunk/buildroot/package/libraw1394/libraw1394.mk	2007-06-25 08:58:38 UTC (rev 18911)
@@ -12,15 +12,13 @@
 $(DL_DIR)/$(LIBRAW1394_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LIBRAW1394_SITE)/$(LIBRAW1394_SOURCE)
 
-$(LIBRAW1394_DIR)/.source: $(DL_DIR)/$(LIBRAW1394_SOURCE)
+$(LIBRAW1394_DIR)/.unpacked: $(DL_DIR)/$(LIBRAW1394_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(LIBRAW1394_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(LIBRAW1394_DIR)/.source
+	touch $@
 
-$(LIBRAW1394_DIR)/.configured: $(LIBRAW1394_DIR)/.source
-	(cd $(LIBRAW1394_DIR); \
+$(LIBRAW1394_DIR)/.configured: $(LIBRAW1394_DIR)/.unpacked
+	(cd $(LIBRAW1394_DIR); rm -rf config.cache ; \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -29,7 +27,7 @@
 		--exec-prefix=/usr \
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
-		--libdir=/lib \
+		--libdir=/usr/lib \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
@@ -38,17 +36,17 @@
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 	);
-	touch $(LIBRAW1394_DIR)/.configured;
+	touch $@
 
 $(LIBRAW1394_DIR)/.compiled: $(LIBRAW1394_DIR)/.configured
 	$(MAKE) -C $(LIBRAW1394_DIR)
-	touch $(LIBRAW1394_DIR)/.compiled
+	touch $@
 
-$(STAGING_DIR)/lib/libraw1394.so: $(LIBRAW1394_DIR)/.compiled
+$(STAGING_DIR)/usr/lib/libraw1394.so: $(LIBRAW1394_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBRAW1394_DIR)/src install
 
 $(TARGET_DIR)/usr/lib/libraw1394.so: $(STAGING_DIR)/lib/libraw1394.so
-	cp -dpf $(STAGING_DIR)/lib/libraw1394.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/lib/libraw1394.so* $(TARGET_DIR)/usr/lib/
 
 libraw1394: uclibc $(TARGET_DIR)/usr/lib/libraw1394.so
 
