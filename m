From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Feb 2010 20:18:25 +0100
Subject: [Buildroot] [git commit master] Remove obsolete hostap package
Message-ID: <20100225191842.267BB7776C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0f40a46a54a3620c88fbd52e38a0f29c6aedb9a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    3 +-
 package/Config.in        |    1 -
 package/hostap/Config.in |    9 ------
 package/hostap/hostap.mk |   72 ----------------------------------------------
 4 files changed, 2 insertions(+), 83 deletions(-)
 delete mode 100644 package/hostap/Config.in
 delete mode 100644 package/hostap/hostap.mk

diff --git a/CHANGES b/CHANGES
index 4709fdf..3a1d1f6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,11 +5,12 @@
 	Updated/fixed packages: busybox, ipsec-tools, libgtk2, madplay,
 	netsnmp, pango, sylpheed, qt, xfont_font-util
 
-	Removed packages: openmotif, xpdf
+	Removed packages: hostap, openmotif, xpdf
 
 	Issues resolved (http://bugs.uclibc.org):
 
 	#165: openmotif does not build
+	#1147: Remove obsolete hostap package
 	#1183: make source fails to download gmp, mpfr and patches
 
 2010.02-rc2, Released February 23th, 2010:
diff --git a/package/Config.in b/package/Config.in
index b21604d..5dc7c8d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -138,7 +138,6 @@ source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ethtool/Config.in"
 source "package/haserl/Config.in"
-source "package/hostap/Config.in"
 source "package/hostapd/Config.in"
 source "package/ifplugd/Config.in"
 source "package/iperf/Config.in"
diff --git a/package/hostap/Config.in b/package/hostap/Config.in
deleted file mode 100644
index 74431b7..0000000
--- a/package/hostap/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_HOSTAP
-	bool "hostap"
-	depends on BR2_DEPRECATED
-	select BR2_PACKAGE_PCMCIA
-	help
-	  Linux driver for wireless LAN cards based on Intersil's
-	  Prism2/2.5/3 chipset.
-
-	  http://hostap.epitest.fi/
diff --git a/package/hostap/hostap.mk b/package/hostap/hostap.mk
deleted file mode 100644
index d0af5fd..0000000
--- a/package/hostap/hostap.mk
+++ /dev/null
@@ -1,72 +0,0 @@
-#############################################################
-#
-# hostap
-#
-# Note! Host AP driver was added into the main kernel tree in Linux v2.6.14.
-# The version in the kernel tree should be used instead of this external
-# hostap-driver package.
-# The external releases are only for older kernel versions and all
-# the future development will be in the main kernel tree.
-#
-#############################################################
-HOSTAP_VERSION=0.4.9
-HOSTAP_SOURCE=hostap-driver-$(HOSTAP_VERSION).tar.gz
-HOSTAP_SITE=http://hostap.epitest.fi/releases
-HOSTAP_DIR=$(BUILD_DIR)/hostapd-$(HOSTAP_VERSION)
-
-$(DL_DIR)/$(HOSTAP_SOURCE):
-	$(call DOWNLOAD,$(HOSTAP_SITE),$(HOSTAP_SOURCE))
-
-hostap-source: $(DL_DIR)/$(HOSTAP_SOURCE)
-
-$(HOSTAP_DIR)/.unpacked: $(DL_DIR)/$(HOSTAP_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(HOSTAP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	mv -f $(BUILD_DIR)/hostap $(HOSTAP_DIR)
-	touch $@
-
-$(HOSTAP_DIR)/.configured: $(HOSTAP_DIR)/.unpacked
-	#$(SED) "s,/.*#define PRISM2_DOWNLOAD_SUPPORT.*/,#define PRISM2_DOWNLOAD_SUPPORT,g" \
-	# $(HOSTAP_DIR)/driver/modules/hostap_config.h
-	touch $@
-
-$(HOSTAP_DIR)/utils/hostap_crypt_conf: $(HOSTAP_DIR)/.configured
-	$(MAKE) -C $(HOSTAP_DIR)/utils \
-		CC=$(TARGET_CC) \
-		CFLAGS="-Os -Wall $(TARGET_CFLAGS) -I../driver/modules"
-	$(MAKE) -C $(HOSTAP_DIR)/hostapd \
-		CC=$(TARGET_CC) \
-		CFLAGS="-Os -Wall $(TARGET_CFLAGS) -I../driver/modules -I../utils"
-	touch -c $(HOSTAP_DIR)/driver/modules/hostap.o
-
-$(TARGET_DIR)//usr/bin/hostap_crypt_conf: $(HOSTAP_DIR)/utils/hostap_crypt_conf
-	# Make the dir
-	rm -rf $(HOSTAP_TARGET_MODULE_DIR)
-	mkdir -p $(HOSTAP_TARGET_MODULE_DIR)
-	# Copy the pcmcia-cs conf file
-	mkdir -p $(TARGET_DIR)/etc/pcmcia
-	cp -af $(HOSTAP_DIR)/driver/etc/hostap_cs.conf $(TARGET_DIR)/etc/pcmcia/
-	# Copy The Utils
-	cp -af $(HOSTAP_DIR)/utils/hostap_crypt_conf $(TARGET_DIR)/usr/bin/
-	cp -af $(HOSTAP_DIR)/utils/hostap_diag $(TARGET_DIR)/usr/bin/
-	cp -af $(HOSTAP_DIR)/utils/prism2_param $(TARGET_DIR)/usr/bin/
-	cp -af $(HOSTAP_DIR)/utils/prism2_srec $(TARGET_DIR)/usr/bin/
-	# Copy hostapd
-	cp -af $(HOSTAP_DIR)/hostapd/hostapd $(TARGET_DIR)/usr/sbin/
-
-hostap: pcmcia $(TARGET_DIR)//usr/bin/hostap_crypt_conf
-
-hostap-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(HOSTAP_DIR) uninstall
-	-$(MAKE) -C $(HOSTAP_DIR) clean
-
-hostap-dirclean:
-	rm -rf $(HOSTAP_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_HOSTAP),y)
-TARGETS+=hostap
-endif
-- 
1.6.3.3
