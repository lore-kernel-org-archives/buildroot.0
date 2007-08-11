From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 09:50:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/udev
Message-ID: <20070811165049.3C359A5D38@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 09:50:49 -0700 (Sat, 11 Aug 2007)
New Revision: 19428

Log:
Bump udev version, add rules

Modified:
   trunk/buildroot/package/udev/S10udev
   trunk/buildroot/package/udev/udev.mk


Changeset:
Modified: trunk/buildroot/package/udev/S10udev
===================================================================
--- trunk/buildroot/package/udev/S10udev	2007-08-11 16:44:54 UTC (rev 19427)
+++ trunk/buildroot/package/udev/S10udev	2007-08-11 16:50:49 UTC (rev 19428)
@@ -64,6 +64,7 @@
         echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
         $UDEV_BIN -d || (echo "FAIL" && exit 1)
 	$UDEVSTART_BIN || (echo "FAIL" && exit 1)
+	mount -t devpts /dev/pts /dev/pts || (echo "FAIL" && exit 1)
         echo "done"
         ;;
     stop)

Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2007-08-11 16:44:54 UTC (rev 19427)
+++ trunk/buildroot/package/udev/udev.mk	2007-08-11 16:50:49 UTC (rev 19428)
@@ -3,7 +3,7 @@
 # udev
 #
 #############################################################
-UDEV_VERSION:=101
+UDEV_VERSION:=114
 UDEV_SOURCE:=udev-$(UDEV_VERSION).tar.bz2
 UDEV_SITE:=ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
 UDEV_CAT:=$(BZCAT)
@@ -46,6 +46,9 @@
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) -C $(UDEV_DIR) install
 	$(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0644 $(UDEV_DIR)/etc/udev/frugalware/* $(TARGET_DIR)/etc/udev/rules.d
+	( grep udev_root $(TARGET_DIR)/etc/udev/udev.conf > /dev/null 2>&1 || echo 'udev_root=/dev' >> $(TARGET_DIR)/etc/udev/udev.conf )
+	install -m 0755 -D $(UDEV_DIR)/udevstart $(TARGET_DIR)/sbin/udevstart
 	rm -rf $(TARGET_DIR)/usr/share/man
 ifneq ($(strip $(BR2_PACKAGE_UDEV_UTILS)),y)
 	rm -f $(TARGET_DIR)/usr/sbin/udevmonitor
@@ -82,6 +85,9 @@
 
 udev-volume_id-dirclean:
 	-$(MAKE) EXTRAS="extras/volume_id" -C $(UDEV_DIR) clean
+
+UDEV_CLEAN_DEPS+=udev-volume_id-clean
+UDEV_DIRCLEAN_DEPS+=udev-volume_id-dirclean
 endif
 
 ifeq ($(strip $(BR2_PACKAGE_UDEV_SCSI_ID)),y)
@@ -104,15 +110,18 @@
 
 udev-scsi_id-dirclean:
 	-$(MAKE) EXTRAS="extras/scsi_id" -C $(UDEV_DIR) clean
+
+UDEV_CLEAN_DEPS+=udev-scsi_id-clean
+UDEV_DIRCLEAN_DEPS+=udev-scsi_id-dirclean
 endif
 
-udev-clean: udev-volume_id-clean udev-scsi_id-clean
+udev-clean: $(UDEV_CLEAN_DEPS)
 	rm -f $(TARGET_DIR)/etc/init.d/S10udev $(TARGET_DIR)/sbin/udev*
 	rm -f $(TARGET_DIR)/usr/sbin/udevmonitor $(TARGET_DIR)/usr/bin/udev*
 	rmdir $(TARGET_DIR)/sys
 	-$(MAKE) -C $(UDEV_DIR) clean
 
-udev-dirclean: udev-volume_id-dirclean udev-scsi_id-dirclean
+udev-dirclean: $(UDEV_DIRCLEAN_DEPS)
 	rm -rf $(UDEV_DIR)
 
 #############################################################
