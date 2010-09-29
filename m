From: Martin Banky <martin.banky@gmail.com>
Date: Wed, 29 Sep 2010 22:40:31 +0200
Subject: [Buildroot] [git commit master 1/1] gadgets-test: convert to
	gentargets
Message-ID: <20100929204137.CF60B8B6E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aca1958b8be478532d5043c80d17b8e64b0592b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix aio dependency, add uninstall]
Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                |   12 ++++----
 package/gadgetfs-test/gadgetfs-test.mk |   49 ++++++++++----------------------
 2 files changed, 21 insertions(+), 40 deletions(-)

diff --git a/CHANGES b/CHANGES
index 80c6a0f..88267a1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -24,12 +24,12 @@
 	automake, avahi, axel, beecrypt, berkeleydb, bind, bmon, boa,
 	bootutils, bridge-utils, bsdiff, busybox, dbus, dmraid,
 	docker, dosfstools, dropbear, e2fsprogs, expat, ezxml, fbset,
-	fconfig, ffmpeg, freetype, gamin, gawk, gperf, gtk2-themes,
-	gtkperf, gvfs, haserl, hdparm, hostapd, hwdata, ifplugd,
-	iperf, iproute2, iptables, jpeg, kexec, kismet, less, libcgi,
-	libcurl, libdaemon, libdnet, libevent, libglade, libgtk2,
-	libiconv, libidn, libmms, libnl, liboil, libpcap, libpng,
-	libtool, libungif, libxml2, libxslt, lighttpd, lite,
+	fconfig, ffmpeg, freetype, gadgetfs-test, gamin, gawk, gperf,
+	gtk2-themes, gtkperf, gvfs, haserl, hdparm, hostapd, hwdata,
+	ifplugd, iperf, iproute2, iptables, jpeg, kexec, kismet, less,
+	libcgi, libcurl, libdaemon, libdnet, libevent, libglade,
+	libgtk2, libiconv, libidn, libmms, libnl, liboil, libpcap,
+	libpng, libtool, libungif, libxml2, libxslt, lighttpd, lite,
 	lm-sensors, logrotate, m4, mdadm, mesa3d, metacity, mtd-utils,
 	mysql_client, nano, nbd, ncftp, neon, netperf, netsnmp,
 	ng-spice-rework, ntfsprogs, ntp, openntpd, openssh, openvpn,
diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
index e3ab95e..1464ec1 100644
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -5,47 +5,28 @@
 #############################################################
 GADGETFS_TEST_SOURCE=gadgetfs-test.tar.bz2
 GADGETFS_TEST_SITE=http://avr32linux.org/twiki/pub/Main/GadgetFsTest/
-GADGETFS_TEST_DIR=$(BUILD_DIR)/gadgetfs-test
 
-GADGETFS_TEST_MAKEOPTS:=CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
+GADGETFS_TEST_MAKEOPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
 
 ifeq ($(BR2_PACKAGE_GADGETFS_TEST_USE_AIO),y)
+GADGETFS_TEST_DEPENDENCIES = libaio
 GADGETFS_TEST_MAKEOPTS+=USE_AIO=y
 endif
 
-$(DL_DIR)/$(GADGETFS_TEST_SOURCE):
-	$(call DOWNLOAD,$(GADGETFS_TEST_SITE),$(GADGETFS_TEST_SOURCE))
+define GADGETFS_TEST_BUILD_CMDS
+	$(MAKE) -C $(@D) $(GADGETFS_TEST_MAKEOPTS)
+endef
 
-$(GADGETFS_TEST_DIR)/.unpacked: $(DL_DIR)/$(GADGETFS_TEST_SOURCE)
-	$(BZCAT) $(DL_DIR)/$(GADGETFS_TEST_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(GADGETFS_TEST_DIR) package/gadgetfs-test gadgetfs-test\*.patch
-	touch $@
+define GADGETFS_TEST_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) prefix=/usr install
+endef
 
-$(GADGETFS_TEST_DIR)/gadgetfs-test: $(GADGETFS_TEST_DIR)/.unpacked
-	$(MAKE) -C $(GADGETFS_TEST_DIR) $(GADGETFS_TEST_MAKEOPTS)
+define GADGETFS_TEST_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/bin/gadgetfs-test
+endef
 
-$(TARGET_DIR)/usr/bin/gadgetfs-test: $(GADGETFS_TEST_DIR)/gadgetfs-test
-	$(MAKE) -C $(GADGETFS_TEST_DIR) DESTDIR=$(TARGET_DIR) prefix=/usr install
+define GADGETFS_TEST_CLEAN_CMDS
+	-$(MAKE) -C $(@D) $(GADGETFS_TEST_MAKEOPTS) clean
+endef
 
-ifeq ($(BR2_PACKAGE_GADGETFS_TEST_USE_AIO),y)
-gadgetfs-test: libaio $(TARGET_DIR)/usr/bin/gadgetfs-test
-else
-gadgetfs-test: $(TARGET_DIR)/usr/bin/gadgetfs-test
-endif
-
-gadgetfs-test-source: $(DL_DIR)/$(GADGETFS_TEST_SOURCE)
-
-gadgetfs-test-clean:
-	-$(MAKE) -C $(GADGETFS_TEST_DIR) $(GADGETFS_TEST_MAKEOPTS) clean
-
-gadgetfs-test-dirclean:
-	rm -rf $(GADGETFS_TEST_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_GADGETFS_TEST),y)
-TARGETS+=gadgetfs-test
-endif
+$(eval $(call GENTARGETS,package,gadgetfs-test))
-- 
1.7.1
