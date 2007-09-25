From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 25 Sep 2007 05:54:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
Message-ID: <20070925125449.4F6E930055@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-25 05:54:48 -0700 (Tue, 25 Sep 2007)
New Revision: 20017

Log:
Build libusb without annoying tests, breaking the build

Modified:
   trunk/buildroot/package/libusb/libusb.mk


Changeset:
Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2007-09-25 12:34:09 UTC (rev 20016)
+++ trunk/buildroot/package/libusb/libusb.mk	2007-09-25 12:54:48 UTC (rev 20017)
@@ -29,6 +29,9 @@
 ifneq ($(LIBUSB_PATCH_FILE),)
 	(cd $(LIBUSB_DIR) && $(LIBUSB_CAT) $(LIBUSB_PATCH) | patch -p1)
 endif
+	toolchain/patch-kernel.sh $(LIBUSB_DIR) package/libusb/ libusb-$(LIBUSB_VERSION)\*.patch*
+	$(SED) 's,^all:.*,all:,g' $(LIBUSB_DIR)/tests/Makefile.in
+	$(SED) 's,^install:.*,install:,g' $(LIBUSB_DIR)/tests/Makefile.in
 	touch $@
 
 $(LIBUSB_DIR)/.configured: $(LIBUSB_DIR)/.unpacked
