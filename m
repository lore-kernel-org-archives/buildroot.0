From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 27 Mar 2008 06:00:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
Message-ID: <20080327130032.219ED3C346@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-27 06:00:31 -0700 (Thu, 27 Mar 2008)
New Revision: 21514

Log:
libusb: correctly install into STAGING_DIR/usr

Closes #2494


Modified:
   trunk/buildroot/package/libusb/libusb.mk


Changeset:
Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2008-03-27 10:23:13 UTC (rev 21513)
+++ trunk/buildroot/package/libusb/libusb.mk	2008-03-27 13:00:31 UTC (rev 21514)
@@ -45,17 +45,17 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-		--prefix=/ \
+		--prefix=$(STAGING_DIR)/usr \
 		--disable-debug \
 		--disable-build-docs \
 	)
 	touch $@
 
-$(STAGING_DIR)/lib/libusb.so: $(LIBUSB_DIR)/.configured
+$(STAGING_DIR)/usr/lib/libusb.so: $(LIBUSB_DIR)/.configured
 	$(MAKE) -C $(LIBUSB_DIR)
-	$(MAKE) -C $(LIBUSB_DIR) DESTDIR=$(STAGING_DIR) install
+	$(MAKE) -C $(LIBUSB_DIR) install
 
-$(TARGET_DIR)/$(LIBUSB_BINARY): $(STAGING_DIR)/lib/libusb.so
+$(TARGET_DIR)/$(LIBUSB_BINARY): $(STAGING_DIR)/usr/lib/libusb.so
 	cp -dpf $(STAGING_DIR)/usr/lib/libusb*.so* $(TARGET_DIR)/usr/lib/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libusb*.so*
 
