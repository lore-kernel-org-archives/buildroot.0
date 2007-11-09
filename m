From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Fri,  9 Nov 2007 01:30:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
Message-ID: <20071109093008.C87FB30062@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-11-09 01:30:08 -0800 (Fri, 09 Nov 2007)
New Revision: 20390

Log:
fix libusb autoconf scripts for armeb

Modified:
   trunk/buildroot/package/libusb/libusb.mk


Changeset:
Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2007-11-09 09:26:37 UTC (rev 20389)
+++ trunk/buildroot/package/libusb/libusb.mk	2007-11-09 09:30:08 UTC (rev 20390)
@@ -23,7 +23,7 @@
 
 libusb-source: $(DL_DIR)/$(LIBUSB_SOURCE) $(LIBUSB_PATCH)
 
-libusb-unpacked: $(LIBUSB_DIR)/.unpacked
+libusb-unpacked: host-automake host-autoconf $(LIBUSB_DIR)/.unpacked
 $(LIBUSB_DIR)/.unpacked: $(DL_DIR)/$(LIBUSB_SOURCE)
 	$(LIBUSB_CAT) $(DL_DIR)/$(LIBUSB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(LIBUSB_PATCH_FILE),)
@@ -32,6 +32,8 @@
 	toolchain/patch-kernel.sh $(LIBUSB_DIR) package/libusb/ libusb-$(LIBUSB_VERSION)\*.patch*
 	$(SED) 's,^all:.*,all:,g' $(LIBUSB_DIR)/tests/Makefile.in
 	$(SED) 's,^install:.*,install:,g' $(LIBUSB_DIR)/tests/Makefile.in
+	$(CONFIG_UPDATE) $(LIBUSB_DIR)
+	cd $(LIBUSB_DIR) && $(AUTORECONF)
 	touch $@
 
 $(LIBUSB_DIR)/.configured: $(LIBUSB_DIR)/.unpacked
