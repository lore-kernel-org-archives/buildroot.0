From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 19 Sep 2010 23:22:24 +0200
Subject: [Buildroot] [git commit master 1/1] usbmount: convert to gentargets
	and fix dependencies
Message-ID: <20100919212409.88AAC8B421@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e5a9c22c905257dd5b9057eda8a380cb283580cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

udev needs to be selected before the sub options can be selected, and
UDEV_SCSI_ID isn't needed.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    3 +-
 package/usbmount/Config.in   |    2 +-
 package/usbmount/usbmount.mk |   43 ++++++++---------------------------------
 3 files changed, 12 insertions(+), 36 deletions(-)

diff --git a/CHANGES b/CHANGES
index 53923b0..f8501b4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -23,7 +23,8 @@
 	neon, netperf, ntfsprogs, openntpd, openssh, openvpn, oprofile,
 	pango, pcre, php, prboom, radvd, qt, samba, sdl_sound,
 	shared-mime-info, speex, sqlite, strace, taglib, tcpdump,
-	tiff, tn5250, udev, udpcast, usbutils, which, xlib_libX11
+	tiff, tn5250, udev, udpcast, usbmount, usbutils, which,
+	xlib_libX11
 
 	Removed packages: dillo, libglib12, libgtk12, microwin,
 	pcmcia
diff --git a/package/usbmount/Config.in b/package/usbmount/Config.in
index cf93f71..5cf15be 100644
--- a/package/usbmount/Config.in
+++ b/package/usbmount/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_USBMOUNT
 	bool "usbmount"
+	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_UDEV_VOLUME_ID
-	select BR2_PACKAGE_UDEV_SCSI_ID
 	select BR2_PACKAGE_LOCKFILE_PROGS
 	help
 	  The usbmount package automatically mounts USB mass storage devices
diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index 0e1c72c..5925e5e 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -6,42 +6,17 @@
 USBMOUNT_VERSION=0.0.14.1
 USBMOUNT_SOURCE:=usbmount_$(USBMOUNT_VERSION).tar.gz
 USBMOUNT_SITE:=http://usbmount.alioth.debian.org/package/
-USBMOUNT_CAT:=$(ZCAT)
-USBMOUNT_DIR:=$(BUILD_DIR)/usbmount-$(USBMOUNT_VERSION)
-USBMOUNT_BINARY:=usbmount
-USBMOUNT_TARGET_BINARY:=sbin/usbmount
+USBMOUNT_DEPENDENCIES = udev lockfile-progs
 
-$(DL_DIR)/$(USBMOUNT_SOURCE):
-	 $(call DOWNLOAD,$(USBMOUNT_SITE),$(USBMOUNT_SOURCE))
-
-usbmount-source: $(DL_DIR)/$(USBMOUNT_SOURCE)
-
-$(USBMOUNT_DIR)/.unpacked: $(DL_DIR)/$(USBMOUNT_SOURCE)
-	$(USBMOUNT_CAT) $(DL_DIR)/$(USBMOUNT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(USBMOUNT_DIR) package/usbmount usbmount-$(USBMOUNT_VERSION).patch
-	touch $@
-
-$(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY): $(USBMOUNT_DIR)/.unpacked
-	$(INSTALL) -m 0755 -D $(USBMOUNT_DIR)/usbmount $(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY)
+define USBMOUNT_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/usbmount $(TARGET_DIR)/sbin/usbmount
 	@if [ ! -f $(TARGET_DIR)/etc/usbmount/usbmount.conf ]; then \
-	        $(INSTALL) -m 0644 -D $(USBMOUNT_DIR)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf; \
+	        $(INSTALL) -m 0644 -D $(@D)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf; \
 	fi
-	touch -c $@
-
-usbmount: $(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY)
-
-usbmount-clean:
-	rm -f $(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY)
-	rm -rf $(TARGET_DIR)/etc/usbmount
+endef
 
-usbmount-dirclean:
-	rm -rf $(USBMOUNT_DIR)
+define USBMOUNT_UNINSTALL_TARGET_CMDS
+	rm -rf $(TARGET_DIR)/etc/usbmount $(TARGET_DIR)/sbin/usbmount
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_USBMOUNT),y)
-TARGETS+=usbmount
-endif
+$(eval $(call GENTARGETS,package,usbmount))
-- 
1.7.1
