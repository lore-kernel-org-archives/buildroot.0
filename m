From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 2 May 2010 09:41:29 +0200
Subject: [Buildroot] [git commit master] eeprog: Convert to gentargets
Message-ID: <20100502074440.984CC8A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=558861639cea0b4991ab07313f972187ed644867
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1615

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    3 +-
 package/eeprog/eeprog.mk |   48 +++++++++++----------------------------------
 2 files changed, 14 insertions(+), 37 deletions(-)

diff --git a/CHANGES b/CHANGES
index d5b1e66..4eccaf0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -13,7 +13,7 @@
 	netperf, squid
 
 	Updated/fixed packages: alsa-utils, busybox, dnsmasq, dosfstools,
-	e2fsprogs, fbv, freetype, hostapd, iperf, iptables, iw, less,
+	e2fsprogs, eeprog, fbv, freetype, hostapd, iperf, iptables, iw, less,
 	libaio,libdrm, libgcrypt, libglib2, libpng, libxml2, matchbox,
 	mdadm, memstat, mesa3d, mtd-utils, nano, openssl, pciutils,
 	php, pixman, portage, pppd, pthread-stubs, python, qt, radvd,
@@ -66,6 +66,7 @@
 	#1567: openssl0.9.8n fails to compile
 	#1573: Alsa-utils alsactl/init/* not installed to target
 	#1591: portmap fails to compile
+	#1615: Convert eeprog package to gentargets
 	#1645: Bump hostapd package to 0.7.2
 
 2010.02, Release February 26th, 2010:
diff --git a/package/eeprog/eeprog.mk b/package/eeprog/eeprog.mk
index b19c7a3..070fcd4 100644
--- a/package/eeprog/eeprog.mk
+++ b/package/eeprog/eeprog.mk
@@ -3,44 +3,20 @@
 # eeprog
 #
 #############################################################
-EEPROG_VERSION:=0.7.6
-EEPROG_SOURCE:=eeprog-$(EEPROG_VERSION).tar.gz
-EEPROG_SITE:=http://codesink.org/download
-EEPROG_DIR:=$(BUILD_DIR)/eeprog-$(EEPROG_VERSION)
-EEPROG_BINARY:=eeprog
-EEPROG_TARGET_BINARY:=usr/sbin/eeprog
 
-$(DL_DIR)/$(EEPROG_SOURCE):
-	 $(call DOWNLOAD,$(EEPROG_SITE),$(EEPROG_SOURCE))
+EEPROG_VERSION = 0.7.6
+EEPROG_SITE = http://codesink.org/download
 
-eeprog-source: $(DL_DIR)/$(EEPROG_SOURCE)
+define EEPROG_BUILD_CMDS
+	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(@D)
+endef
 
-$(EEPROG_DIR)/.unpacked: $(DL_DIR)/$(EEPROG_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(EEPROG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(EEPROG_DIR) package/eeprog/ eeprog\*.patch
-	touch $(EEPROG_DIR)/.unpacked
+define EEPROG_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/eeprog $(TARGET_DIR)/usr/bin/eeprog
+endef
 
-$(EEPROG_DIR)/$(EEPROG_BINARY): $(EEPROG_DIR)/.unpacked
-	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(EEPROG_DIR)
-	$(STRIPCMD) $(EEPROG_DIR)/$(EEPROG_BINARY)
+define EEPROG_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/eeprog
+endef
 
-$(TARGET_DIR)/$(EEPROG_TARGET_BINARY): $(EEPROG_DIR)/$(EEPROG_BINARY)
-	$(INSTALL) -m 0755 -D $(EEPROG_DIR)/$(EEPROG_BINARY) $(TARGET_DIR)/$(EEPROG_TARGET_BINARY)
-
-eeprog: $(TARGET_DIR)/$(EEPROG_TARGET_BINARY)
-
-eeprog-clean:
-	rm -f $(TARGET_DIR)/$(EEPROG_TARGET_BINARY)
-	-$(MAKE) -C $(EEPROG_DIR) clean
-
-eeprog-dirclean:
-	rm -rf $(EEPROG_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_EEPROG),y)
-TARGETS+=eeprog
-endif
+$(eval $(call GENTARGETS,package,eeprog))
-- 
1.6.3.3
