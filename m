From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Dec 2009 22:37:01 +0100
Subject: [Buildroot] [git commit master] Add new package hostapd
Message-ID: <20091206213901.2F82A776F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=44816b1b93f173a34436bac0f27e7a521592cfd8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #739.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    3 +-
 package/Config.in          |    1 +
 package/hostapd/Config.in  |   24 +++++++++++++
 package/hostapd/hostapd.mk |   83 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 110 insertions(+), 1 deletions(-)
 create mode 100644 package/hostapd/Config.in
 create mode 100644 package/hostapd/hostapd.mk

diff --git a/CHANGES b/CHANGES
index 5ac7534..64f76ea 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
 2010.02, Not yet released:
 
-	New packages: tcpreplay
+	New packages: tcpreplay, hostapd
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
 	directfb, iw, libpcap, lighttpd, mesa, pcre, usbutils
@@ -10,6 +10,7 @@
 	#515: tcpreplay: new package
 	#553: Wrong DirectFB ps2mouse limitation
 	#559: mesa3d build fails
+	#739: New/updated hostapd package
 	#749: Bump usbutils package to version 0.86
 	#751: Kernel 2.6 snapshot fetch fail
 	#753: Bump lighttpd package to 1.4.25
diff --git a/package/Config.in b/package/Config.in
index e48ee93..ba0f96d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -138,6 +138,7 @@ source "package/dropbear/Config.in"
 source "package/ethtool/Config.in"
 source "package/haserl/Config.in"
 source "package/hostap/Config.in"
+source "package/hostapd/Config.in"
 source "package/ifplugd/Config.in"
 source "package/iperf/Config.in"
 source "package/iproute2/Config.in"
diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
new file mode 100644
index 0000000..5eaa326
--- /dev/null
+++ b/package/hostapd/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_HOSTAPD
+	bool "hostapd"
+	help
+	  User space daemon for wireless access points.
+
+	  It implements IEEE 802.11 access point management,
+	  IEEE 802.1X/WPA/WPA2/EAP authenticators, RADIUS client,
+	  EAP server and RADIUS authentication server.
+
+	  http://hostap.epitest.fi/
+
+config BR2_PACKAGE_HOSTAPD_EXTRA_EAP
+	bool "Enable EAP TLS/TTLS/MSCHAPv2/PEAP"
+	depends on BR2_PACKAGE_HOSTAPD
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enable support for extra EAP methods TLS, TTLS, MSCHAPv2 and PEAP.
+
+config BR2_PACKAGE_HOSTAPD_WPS
+	bool "Enable WPS"
+	depends on BR2_PACKAGE_HOSTAPD
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enable support for Wi-Fi Protected Setup.
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
new file mode 100644
index 0000000..0cad5aa
--- /dev/null
+++ b/package/hostapd/hostapd.mk
@@ -0,0 +1,83 @@
+#############################################################
+#
+# hostapd
+#
+#############################################################
+
+HOSTAPD_VERSION = 0.6.9
+HOSTAPD_SITE = http://hostap.epitest.fi/releases
+HOSTAPD_SUBDIR = hostapd
+HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
+
+ifeq ($(BR2_PACKAGE_LIBNL),y)
+	HOSTAPD_DEPENDENCIES += libnl
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	HOSTAPD_DEPENDENCIES += openssl
+endif
+
+$(eval $(call AUTOTARGETS,package,hostapd))
+
+$(HOSTAPD_TARGET_CONFIGURE):
+	cp $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/defconfig $(HOSTAPD_CONFIG)
+	$(SED) "s/\/local//" $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/Makefile
+	echo "CFLAGS += $(TARGET_CFLAGS)" >>$(HOSTAPD_CONFIG)
+	echo "CC = $(TARGET_CC)" >>$(HOSTAPD_CONFIG)
+# IPv6
+ifneq ($(BR2_INET_IPV6),y)
+	$(SED) "s/CONFIG_IPV6=y//" $(HOSTAPD_CONFIG)
+endif
+# EAP
+	echo "CONFIG_EAP_AKA=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_AKA_PRIME=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_GPSK=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_GPSK_SHA256=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_PAX=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_PSK=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_SAKE=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_SIM=y" >>$(HOSTAPD_CONFIG)
+ifneq ($(BR2_PACKAGE_HOSTAPD_EXTRA_EAP),y)
+	$(SED) "s/CONFIG_EAP_MSCHAPV2=y//" $(HOSTAPD_CONFIG)
+	$(SED) "s/CONFIG_EAP_PEAP=y//" $(HOSTAPD_CONFIG)
+	$(SED) "s/CONFIG_EAP_TLS=y//" $(HOSTAPD_CONFIG)
+	$(SED) "s/CONFIG_EAP_TTLS=y//" $(HOSTAPD_CONFIG)
+endif
+# OpenSSL is required for EXTRA_EAP and/or WPS
+# We take care of that in Config.in
+ifneq ($(BR2_PACKAGE_OPENSSL),y)
+	echo "CONFIG_CRYPTO=internal" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_TLS=internal" >>$(HOSTAPD_CONFIG)
+endif
+# WPS
+ifeq ($(BR2_PACKAGE_HOSTAPD_WPS),y)
+	echo "CONFIG_WPS=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_WPS_UPNP=y" >>$(HOSTAPD_CONFIG)
+endif
+# Drivers
+	echo "CONFIG_DRIVER_WIRED=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_DRIVER_PRISM54=y" >>$(HOSTAPD_CONFIG)
+ifeq ($(BR2_PACKAGE_LIBNL),y)
+	echo "CONFIG_DRIVER_NL80211=y" >>$(HOSTAPD_CONFIG)
+endif
+# Misc
+	echo "CONFIG_IEEE80211N=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_IEEE80211R=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_IEEE80211W=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_RADIUS_SERVER=y" >>$(HOSTAPD_CONFIG)
+	touch $@
+
+$(HOSTAPD_TARGET_INSTALL_TARGET):
+	$(call MESSAGE,"Installing to target")
+	$(INSTALL) -m 0755 $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/hostapd \
+		$(TARGET_DIR)/usr/sbin
+	$(INSTALL) -m 0755 $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/hostapd_cli \
+		$(TARGET_DIR)/usr/bin
+	touch $@
+
+$(HOSTAPD_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/usr/sbin/hostapd
+	rm -f $(TARGET_DIR)/usr/bin/hostapd
+	rm -f $(HOSTAPD_TARGET_INSTALL_TARGET) $(HOSTAPD_HOOK_POST_INSTALL)
+
-- 
1.6.3.3
