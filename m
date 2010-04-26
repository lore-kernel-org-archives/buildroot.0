From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Apr 2010 23:01:14 +0200
Subject: [Buildroot] [git commit master] alsa-utils: fix usr/share/alsa
	installation to target
Message-ID: <20100426210143.7C25A20302@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5ad2672470109ddea4c467a67b0ddae6471e6f9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1573

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                     |    3 ++-
 package/multimedia/alsa-utils/alsa-utils.mk |    5 +++++
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2e4cdeb..7decafd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -12,7 +12,7 @@
 	New packages: librsync, libatomic_ops, libusb-compat, lmbench,
 	netperf, squid
 
-	Updated/fixed packages: busybox, dnsmasq, dosfstools,
+	Updated/fixed packages: alsa-utils, busybox, dnsmasq, dosfstools,
 	e2fsprogs, fbv, freetype, iperf, iptables, iw, less,
 	libaio,libdrm, libgcrypt, libglib2, libpng, libxml2, matchbox,
 	mdadm, memstat, mesa3d, mtd-utils, nano, openssl, pciutils,
@@ -64,6 +64,7 @@
 	#1555: Fix default uclibc-0.9.31 configuration
 	#1561: [SECURITY] Update samba to 3.3.12
 	#1567: openssl0.9.8n fails to compile
+	#1573: Alsa-utils alsactl/init/* not installed to target
 	#1591: portmap fails to compile
 
 2010.02, Release February 26th, 2010:
diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 99d85ce..8348f4c 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -78,6 +78,11 @@ $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY): $(ALSA_UTILS_DIR)/$(ALSA_UTILS_BINARY
 		cp -rdpf $(STAGING_DIR)/usr/share/alsa/speaker-test/* $(TARGET_DIR)/usr/share/alsa/speaker-test/; \
 		cp -rdpf $(STAGING_DIR)/usr/share/sounds/alsa/* $(TARGET_DIR)/usr/share/sounds/alsa/; \
 	fi
+	if [ -x "$(TARGET_DIR)/usr/sbin/alsactl" ]; then \
+		mkdir -p $(TARGET_DIR)/usr/share/; \
+		rm -rf $(TARGET_DIR)/usr/share/alsa/; \
+		cp -rdpf $(STAGING_DIR)/usr/share/alsa/ $(TARGET_DIR)/usr/share/alsa/; \
+	fi
 	touch -c $@
 
 alsa-utils: alsa-lib $(if $(BR2_PACKAGE_NCURSES),ncurses) $(if $(BR2_PACKAGE_LIBINTL),libintl) $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY)
-- 
1.6.3.3
