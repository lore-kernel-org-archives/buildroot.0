From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sun,  6 Apr 2008 03:35:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/udev
Message-ID: <20080406103523.680C33C419@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-06 03:35:22 -0700 (Sun, 06 Apr 2008)
New Revision: 21654

Log:
* udev will not install if you remove project_build_*/uclibc/root and project_build_*/uclibc/.root ... this sets the dependency on the target binary so if its removed, its installed again


Modified:
   trunk/buildroot/package/udev/udev.mk


Changeset:
Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2008-04-06 10:32:34 UTC (rev 21653)
+++ trunk/buildroot/package/udev/udev.mk	2008-04-06 10:35:22 UTC (rev 21654)
@@ -47,8 +47,6 @@
 		LDFLAGS="-warn-common" \
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) -C $(UDEV_DIR) install
-
-$(UDEV_DIR)/.target_install: $(UDEV_DIR)/$(UDEV_BINARY)
 	$(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d
 	$(INSTALL) -m 0644 $(UDEV_DIR)/etc/udev/frugalware/* $(TARGET_DIR)/etc/udev/rules.d
 	( grep udev_root $(TARGET_DIR)/etc/udev/udev.conf > /dev/null 2>&1 || echo 'udev_root=/dev' >> $(TARGET_DIR)/etc/udev/udev.conf )
@@ -59,12 +57,11 @@
 	rm -f $(TARGET_DIR)/usr/bin/udevinfo
 	rm -f $(TARGET_DIR)/usr/bin/udevtest
 endif
-	touch $@
 
 #####################################################################
 .PHONY: udev-source udev udev-clean udev-dirclean
 
-udev: uclibc $(TARGET_DIR)/$(UDEV_TARGET_BINARY) $(UDEV_DIR)/.target_install
+udev: uclibc $(TARGET_DIR)/$(UDEV_TARGET_BINARY)
 
 udev-source: $(DL_DIR)/$(UDEV_SOURCE)
 
