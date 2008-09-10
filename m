From: Michel Wilson <michel@crondor.net>
Date: Wed, 10 Sep 2008 10:11:10 +0200
Subject: [Buildroot] [PATCH] Ignore errors on rmdir in clean-targets; retry
Message-ID: <20080910081110.GA24785@aeon.hgd.crondor.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Same patch, better mailer :)
As stated before, makes various clean-targets behave when some
directories it tries to remove are missing.

Regards,

Michel Wilson.
---
Index: target/jffs2/jffs2root.mk
===================================================================
--- target/jffs2/jffs2root.mk	(revision 23359)
+++ target/jffs2/jffs2root.mk	(working copy)
@@ -58,7 +58,7 @@
 ifneq ($(BR2_HAVE_INFOPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/info
 endif
-	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
+	@-rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
Index: target/cloop/cloop.mk
===================================================================
--- target/cloop/cloop.mk	(revision 23359)
+++ target/cloop/cloop.mk	(working copy)
@@ -71,7 +71,7 @@
 	@rm -rf $(TARGET_DIR)/usr/info
 	@rm -rf $(TARGET_DIR)/usr/share/info
 endif
-	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
+	@-rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 	which mkisofs
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
 	- which symlinks && symlinks -r $(TARGET_DIR)
Index: package/dbus/dbus.mk
===================================================================
--- package/dbus/dbus.mk	(revision 23359)
+++ package/dbus/dbus.mk	(working copy)
@@ -92,7 +92,7 @@
 dbus-clean:
 	rm -f $(TARGET_DIR)/etc/dbus-1/session.conf
 	rm -f $(TARGET_DIR)/etc/dbus-1/system.conf
-	rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/etc/dbus-1/system.d
+	-rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/etc/dbus-1/system.d
 	rm -f $(TARGET_DIR)/etc/init.d/S30dbus
 	rm -f $(TARGET_DIR)/usr/lib/libdbus-1.so*
 	rm -f $(TARGET_DIR)/usr/bin/dbus-daemon
@@ -100,7 +100,7 @@
 	rm -f $(STAGING_DIR)/usr/lib/libdbus-1.*
 	rm -rf $(STAGING_DIR)/usr/lib/dbus-1.0
 	rm -rf $(STAGING_DIR)/usr/include/dbus-1.0
-	rmdir --ignore-fail-on-non-empty $(STAGING_DIR)/usr/include
+	-rmdir --ignore-fail-on-non-empty $(STAGING_DIR)/usr/include
 	-$(MAKE) -C $(DBUS_DIR) clean
 
 dbus-dirclean:
Index: package/bind/bind.mk
===================================================================
--- package/bind/bind.mk	(revision 23359)
+++ package/bind/bind.mk	(working copy)
@@ -61,7 +61,7 @@
 $(TARGET_DIR)/$(BIND_TARGET_BINARY): $(BIND_DIR2)/$(BIND_BINARY)
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -j1 MAKEDEFS="INSTALL_DATA=true" \
 		DESTDIR=$(TARGET_DIR) -C $(BIND_DIR2)/bin install
-	cd $(TARGET_DIR)/usr/man; rmdir --ignore-fail-on-non-empty man8 man5 `pwd`
+	-cd $(TARGET_DIR)/usr/man; rmdir --ignore-fail-on-non-empty man8 man5 `pwd`
 	$(INSTALL) -m 0755 -D package/bind/bind.sysvinit $(TARGET_DIR)/etc/init.d/S81named
 
 bind-bin: $(TARGET_DIR)/$(BIND_TARGET_BINARY) bind-lib
Index: package/tinyhttpd/tinyhttpd.mk
===================================================================
--- package/tinyhttpd/tinyhttpd.mk	(revision 23359)
+++ package/tinyhttpd/tinyhttpd.mk	(working copy)
@@ -41,7 +41,7 @@
 	-$(MAKE) -C $(TINYHTTPD_DIR) clean
 	@rm -f $(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY)
 	@rm -f $(TARGET_DIR)/etc/init.d/S85tinyhttpd
-	@rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/var/www
+	@-rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/var/www
 
 tinyhttpd-dirclean:
 	rm -rf $(TINYHTTPD_DIR)
Index: package/usbutils/usbutils.mk
===================================================================
--- package/usbutils/usbutils.mk	(revision 23359)
+++ package/usbutils/usbutils.mk	(working copy)
@@ -46,7 +46,7 @@
 usbutils-clean:
 	rm -f $(TARGET_DIR)/$(USBUTILS_TARGET_BINARY)
 	rm -f $(TARGET_DIR)/usr/share/usb.ids
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
+	-rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 	-$(MAKE) -C $(USBUTILS_DIR) clean
 
 usbutils-dirclean:
Index: package/udev/udev.mk
===================================================================
--- package/udev/udev.mk	(revision 23359)
+++ package/udev/udev.mk	(working copy)
@@ -110,7 +110,7 @@
 	rm -f $(STAGING_DIR)/usr/lib/libvolume_id.la
 	rm -f $(TARGET_DIR)/usr/lib/libvolume_id.so.0*
 	rm -f $(TARGET_DIR)/lib/udev/vol_id
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/lib/udev
+	-rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/lib/udev
 
 udev-volume_id-dirclean:
 	-$(MAKE) EXTRAS="extras/volume_id" -C $(UDEV_DIR) clean
@@ -142,7 +142,7 @@
 udev-scsi_id-clean:
 	rm -f $(TARGET_DIR)/lib/udev/scsi_id
 	rm -f $(TARGET_DIR)/lib/udev/usb_id
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/lib/udev
+	-rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/lib/udev
 
 udev-scsi_id-dirclean:
 	-$(MAKE) EXTRAS="extras/scsi_id" -C $(UDEV_DIR) clean
Index: package/hwdata/hwdata.mk
===================================================================
--- package/hwdata/hwdata.mk	(revision 23359)
+++ package/hwdata/hwdata.mk	(working copy)
@@ -35,7 +35,7 @@
 
 hwdata-clean:
 	rm -rf $(TARGET_DIR)/usr/share/hwdata
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
+	-rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 
 hwdata-dirclean:
 	rm -rf $(HWDATA_DIR)
Index: package/hal/hal.mk
===================================================================
--- package/hal/hal.mk	(revision 23359)
+++ package/hal/hal.mk	(working copy)
@@ -99,7 +99,7 @@
 	rm -f $(TARGET_DIR)/usr/bin/hal-* $(TARGET_DIR)/usr/bin/lshal
 	rm -f $(TARGET_DIR)/usr/sbin/hald
 	rm -f $(TARGET_DIR)/usr/libexec/hald-* $(TARGET_DIR)/usr/libexec/hal-*
-	rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/libexec
+	-rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/libexec
 	rm -f $(TARGET_DIR)/usr/lib/libhal.so.1*
 	rm -f $(TARGET_DIR)/usr/lib/libhal-storage.so.1*
 	-$(MAKE) -C $(HAL_DIR) clean
-- 
Michel Wilson     michel at crondor.net
PGP key ID        0xD2CB4B7E
