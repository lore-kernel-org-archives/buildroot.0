From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Sep 2010 22:53:22 +0200
Subject: [Buildroot] [git commit master 1/1] hwdata: convert to gentargets
	and bump to 0.230
Message-ID: <20100926205433.6FBCF8B6D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=231449e1d5615f7092b49fab65a88f898bc16de3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: get rid of unused vars, use install -D]
Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    2 +-
 package/hwdata/hwdata.mk |   51 ++++++++++------------------------------------
 2 files changed, 12 insertions(+), 41 deletions(-)

diff --git a/CHANGES b/CHANGES
index 26c17e7..4f6ed1e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -20,7 +20,7 @@
 	Updated/fixed packages: alsa-lib, at, avahi, berkeleydb, bind,
 	bmon, boa, bridge-utils, bsdiff, busybox, dbus, dmraid,
 	docker, dosfstools, dropbear, e2fsprogs, expat, ezxml, fbset,
-	freetype, gawk, gvfs, haserl, hostapd, ifplugd, iperf,
+	freetype, gawk, gvfs, haserl, hostapd, hwdata, ifplugd, iperf,
 	iproute2, iptables, jpeg, kexec, kismet, less, libcurl,
 	libdnet, libevent, libglade, libgtk2, libiconv, libidn,
 	libmms, libnl, liboil, libpcap, libpng, libungif, libxml2,
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index ed81cd7..7a0cef8 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -3,48 +3,19 @@
 # hwdata
 #
 #############################################################
-HWDATA_VERSION:=0.191
-HWDATA_SOURCE:=hwdata_$(HWDATA_VERSION).orig.tar.gz
-HWDATA_PATCH:=hwdata_$(HWDATA_VERSION)-1.diff.gz
-HWDATA_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/h/hwdata/
-HWDATA_CAT:=$(ZCAT)
-HWDATA_DIR:=$(BUILD_DIR)/hwdata-$(HWDATA_VERSION)
-HWDATA_BINARY:=pci.ids
-HWDATA_TARGET_BINARY:=usr/share/hwdata/pci.ids
+HWDATA_VERSION = 0.230
+HWDATA_SOURCE = hwdata_$(HWDATA_VERSION).orig.tar.gz
+HWDATA_PATCH = hwdata_$(HWDATA_VERSION)-1.diff.gz
+HWDATA_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/h/hwdata/
 
-$(DL_DIR)/$(HWDATA_SOURCE):
-	 $(call DOWNLOAD,$(HWDATA_SITE),$(HWDATA_SOURCE))
+define HWDATA_INSTALL_TARGET_CMDS
+	install -D -m 644 $(@D)/pci.ids $(TARGET_DIR)/usr/share/hwdata/pci.ids
+	install -D -m 644 $(@D)/usb.ids $(TARGET_DIR)/usr/share/hwdata/usb.ids
+endef
 
-$(DL_DIR)/$(HWDATA_PATCH):
-	 $(call DOWNLOAD,$(HWDATA_SITE),$(HWDATA_PATCH))
-
-hwdata-source: $(DL_DIR)/$(HWDATA_SOURCE) $(DL_DIR)/$(HWDATA_PATCH)
-
-$(HWDATA_DIR)/.unpacked: $(DL_DIR)/$(HWDATA_SOURCE) $(DL_DIR)/$(HWDATA_PATCH)
-	$(HWDATA_CAT) $(DL_DIR)/$(HWDATA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(HWDATA_DIR) $(DL_DIR) $(HWDATA_PATCH)
-	touch $(HWDATA_DIR)/.unpacked
-
-$(TARGET_DIR)/$(HWDATA_TARGET_BINARY): $(HWDATA_DIR)/.unpacked
-	mkdir -p -m 755 $(TARGET_DIR)/usr/share/hwdata
-	cp -a $(HWDATA_DIR)/pci.ids $(TARGET_DIR)/usr/share/hwdata
-	cp -a $(HWDATA_DIR)/usb.ids $(TARGET_DIR)/usr/share/hwdata
-	-touch -c $(TARGET_DIR)/usr/share/hwdata/*
-
-hwdata: $(TARGET_DIR)/$(HWDATA_TARGET_BINARY)
-
-hwdata-clean:
+define HWDATA_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/share/hwdata
 	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
+endef
 
-hwdata-dirclean:
-	rm -rf $(HWDATA_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_HWDATA),y)
-TARGETS+=hwdata
-endif
+$(eval $(call GENTARGETS,package,hwdata))
-- 
1.7.1
