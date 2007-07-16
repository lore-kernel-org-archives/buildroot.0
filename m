From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 16 Jul 2007 02:45:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
Message-ID: <20070716094539.B5841A685C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-16 02:45:39 -0700 (Mon, 16 Jul 2007)
New Revision: 19108

Log:
Avoid repeated rebuild of libusb

Modified:
   trunk/buildroot/package/libusb/libusb.mk


Changeset:
Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2007-07-16 09:32:07 UTC (rev 19107)
+++ trunk/buildroot/package/libusb/libusb.mk	2007-07-16 09:45:39 UTC (rev 19108)
@@ -35,11 +35,11 @@
 	);
 	touch $(LIBUSB_DIR)/.configured
 
-$(STAGING_DIR)/$(LIBUSB_BINARY): $(LIBUSB_DIR)/.configured
+$(STAGING_DIR)/lib/libusb.so: $(LIBUSB_DIR)/.configured
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBUSB_DIR)
 	$(MAKE) -C $(LIBUSB_DIR) DESTDIR=$(STAGING_DIR) install
 
-$(TARGET_DIR)/$(LIBUSB_BINARY): $(STAGING_DIR)/$(LIBUSB_BINARY)
+$(TARGET_DIR)/$(LIBUSB_BINARY): $(STAGING_DIR)/lib/libusb.so
 	-mkdir -p $(TARGET_DIR)/usr/lib
 	cp -a $(STAGING_DIR)/lib/libusb* $(TARGET_DIR)/usr/lib
 	rm -f $(TARGET_DIR)/usr/lib/*.a $(TARGET_DIR)/usr/lib/*.la
@@ -56,6 +56,9 @@
 
 libusb-dirclean:
 	rm -rf $(LIBUSB_DIR)
+
+.PHONY:	libusb
+
 #############################################################
 #
 # Toplevel Makefile options
