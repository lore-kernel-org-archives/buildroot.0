From: hamish at uclibc.org <hamish@uclibc.org>
Date: Fri, 13 Jun 2008 03:01:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: libtool libusb
Message-ID: <20080613100104.8BDB93C82A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-06-13 03:01:03 -0700 (Fri, 13 Jun 2008)
New Revision: 22316

Log:
Publish $(LIBTOOL) variable and use it in the libusb dependencies, so that
libusb isn't rebuilt every time.


Modified:
   trunk/buildroot/package/libtool/libtool.mk
   trunk/buildroot/package/libusb/libusb.mk


Changeset:
Modified: trunk/buildroot/package/libtool/libtool.mk
===================================================================
--- trunk/buildroot/package/libtool/libtool.mk	2008-06-13 09:55:13 UTC (rev 22315)
+++ trunk/buildroot/package/libtool/libtool.mk	2008-06-13 10:01:03 UTC (rev 22316)
@@ -12,6 +12,7 @@
 LIBTOOL_HOST_DIR:=$(TOOL_BUILD_DIR)/libtool-$(LIBTOOL_VERSION)-host
 LIBTOOL_BINARY:=libtool
 LIBTOOL_TARGET_BINARY:=usr/bin/libtool
+LIBTOOL:=$(STAGING_DIR)/usr/bin/libtool
 
 $(DL_DIR)/$(LIBTOOL_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(LIBTOOL_SITE)/$(LIBTOOL_SOURCE)
@@ -122,7 +123,7 @@
 	$(MAKE) -C $(LIBTOOL_HOST_DIR)
 	touch -c $@
 
-$(STAGING_DIR)/$(LIBTOOL_TARGET_BINARY): $(LIBTOOL_HOST_DIR)/$(LIBTOOL_BINARY)
+$(LIBTOOL): $(LIBTOOL_HOST_DIR)/$(LIBTOOL_BINARY)
 	$(MAKE) -C $(LIBTOOL_HOST_DIR) install
 	rm -rf $(STAGING_DIR)/share/locale
 	rm -rf $(STAGING_DIR)/usr/share/doc
@@ -134,7 +135,7 @@
 endif
 	touch -c $@
 
-host-libtool: $(STAGING_DIR)/$(LIBTOOL_TARGET_BINARY)
+host-libtool: $(LIBTOOL)
 
 host-libtool-clean:
 	$(MAKE) -C $(LIBTOOL_HOST_DIR) uninstall

Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2008-06-13 09:55:13 UTC (rev 22315)
+++ trunk/buildroot/package/libusb/libusb.mk	2008-06-13 10:01:03 UTC (rev 22316)
@@ -24,7 +24,7 @@
 libusb-source: $(DL_DIR)/$(LIBUSB_SOURCE) $(LIBUSB_PATCH)
 
 libusb-unpacked: $(LIBUSB_DIR)/.unpacked
-$(LIBUSB_DIR)/.unpacked: $(AUTOCONF) $(AUTOMAKE) $(STAGING_DIR)/$(LIBTOOL_TARGET_BINARY) $(DL_DIR)/$(LIBUSB_SOURCE)
+$(LIBUSB_DIR)/.unpacked: $(AUTOCONF) $(AUTOMAKE) $(LIBTOOL) $(DL_DIR)/$(LIBUSB_SOURCE)
 	$(LIBUSB_CAT) $(DL_DIR)/$(LIBUSB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(LIBUSB_PATCH_FILE),)
 	(cd $(LIBUSB_DIR) && $(LIBUSB_CAT) $(LIBUSB_PATCH) | patch -p1)
