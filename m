From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 16 Jun 2007 10:56:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/usbmount
	target/jffs2
Message-ID: <20070616175605.C2BFF485C9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-06-16 10:56:05 -0700 (Sat, 16 Jun 2007)
New Revision: 18835

Log:
Get rid of extra directory entry in JFFS2 and add wildcarding for usbmount patches.


Modified:
   trunk/buildroot/package/usbmount/usbmount.mk
   trunk/buildroot/target/jffs2/jffs2root.mk


Changeset:
Modified: trunk/buildroot/package/usbmount/usbmount.mk
===================================================================
--- trunk/buildroot/package/usbmount/usbmount.mk	2007-06-16 17:55:32 UTC (rev 18834)
+++ trunk/buildroot/package/usbmount/usbmount.mk	2007-06-16 17:56:05 UTC (rev 18835)
@@ -18,7 +18,7 @@
 
 $(USBMOUNT_DIR)/.unpacked: $(DL_DIR)/$(USBMOUNT_SOURCE)
 	$(USBMOUNT_CAT) $(DL_DIR)/$(USBMOUNT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(USBMOUNT_DIR) package/usbmount usbmount-$(USBMOUNT_VERSION).patch
+	toolchain/patch-kernel.sh $(USBMOUNT_DIR) package/usbmount usbmount-$(USBMOUNT_VERSION)*.patch
 	touch $@
 
 $(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY): $(USBMOUNT_DIR)/.unpacked

Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2007-06-16 17:55:32 UTC (rev 18834)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2007-06-16 17:56:05 UTC (rev 18835)
@@ -53,6 +53,7 @@
 	@rm -rf $(TARGET_DIR)/usr/man
 	@rm -rf $(TARGET_DIR)/usr/share/man
 	@rm -rf $(TARGET_DIR)/usr/info
+	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 	-/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
