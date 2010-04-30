From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Apr 2010 16:16:38 +0200
Subject: [Buildroot] [git commit master] hostapd: Bump to 0.7.2
Message-ID: <20100430143412.E72E0212A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=554ef43a9c1470cb2eebbc2d2f1eea9cfe5648a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1645

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    3 ++-
 package/hostapd/Config.in  |    1 +
 package/hostapd/hostapd.mk |    9 ++-------
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7decafd..d5b1e66 100644
--- a/CHANGES
+++ b/CHANGES
@@ -13,7 +13,7 @@
 	netperf, squid
 
 	Updated/fixed packages: alsa-utils, busybox, dnsmasq, dosfstools,
-	e2fsprogs, fbv, freetype, iperf, iptables, iw, less,
+	e2fsprogs, fbv, freetype, hostapd, iperf, iptables, iw, less,
 	libaio,libdrm, libgcrypt, libglib2, libpng, libxml2, matchbox,
 	mdadm, memstat, mesa3d, mtd-utils, nano, openssl, pciutils,
 	php, pixman, portage, pppd, pthread-stubs, python, qt, radvd,
@@ -66,6 +66,7 @@
 	#1567: openssl0.9.8n fails to compile
 	#1573: Alsa-utils alsactl/init/* not installed to target
 	#1591: portmap fails to compile
+	#1645: Bump hostapd package to 0.7.2
 
 2010.02, Release February 26th, 2010:
 
diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 5eaa326..133796e 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOSTAPD
 	bool "hostapd"
+	select BR2_PACKAGE_LIBNL
 	help
 	  User space daemon for wireless access points.
 
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 0cad5aa..5c5c1e3 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -4,14 +4,11 @@
 #
 #############################################################
 
-HOSTAPD_VERSION = 0.6.9
+HOSTAPD_VERSION = 0.7.2
 HOSTAPD_SITE = http://hostap.epitest.fi/releases
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
-
-ifeq ($(BR2_PACKAGE_LIBNL),y)
-	HOSTAPD_DEPENDENCIES += libnl
-endif
+HOSTAPD_DEPENDENCIES = libnl
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	HOSTAPD_DEPENDENCIES += openssl
@@ -57,9 +54,7 @@ endif
 # Drivers
 	echo "CONFIG_DRIVER_WIRED=y" >>$(HOSTAPD_CONFIG)
 	echo "CONFIG_DRIVER_PRISM54=y" >>$(HOSTAPD_CONFIG)
-ifeq ($(BR2_PACKAGE_LIBNL),y)
 	echo "CONFIG_DRIVER_NL80211=y" >>$(HOSTAPD_CONFIG)
-endif
 # Misc
 	echo "CONFIG_IEEE80211N=y" >>$(HOSTAPD_CONFIG)
 	echo "CONFIG_IEEE80211R=y" >>$(HOSTAPD_CONFIG)
-- 
1.6.3.3
