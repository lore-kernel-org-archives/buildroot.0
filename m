From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 Jan 2010 11:10:32 +0100
Subject: [Buildroot] [git commit master] Bump wpa_supplicant to 0.6.10,
	enable nl80211
Message-ID: <20100120101208.53D12776FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ca2ad7d855d04df2036f5685cebb010bfe2c19a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #925.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                  |    3 ++-
 package/wpa_supplicant/wpa_supplicant.mk |   10 ++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 32c9f8e..db97604 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,7 +8,7 @@
 	directfb, e2fsprogs, gstreamer, gst-plugins-bad, hal, iptables,
 	iw, jpeg, libfuse, libpcap, libungif, lighttpd, mesa, mpg123,
 	mtd-utils, neon, pcre, qt, rpm, sshfs, tremor, u-boot,
-	usb_modeswitch, usbutils, xfsprogs
+	usb_modeswitch, usbutils, wpa_supplicant, xfsprogs
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -33,6 +33,7 @@
 	#841: Build error
 	#913: Bump iptables to 1.4.6
 	#919: Bump usb_modeswitch package to 1.0.7
+	#925: Bump wpa_supplicant package to 0.6.10
 
 2009.11, Released December 1st, 2009:
 
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 7edab84..01436b1 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -4,8 +4,7 @@
 #
 #############################################################
 
-WPA_SUPPLICANT_VERSION = 0.6.9
-WPA_SUPPLICANT_SOURCE = wpa_supplicant-$(WPA_SUPPLICANT_VERSION).tar.gz
+WPA_SUPPLICANT_VERSION = 0.6.10
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
 WPA_SUPPLICANT_LIBTOOL_PATCH = NO
 WPA_SUPPLICANT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
@@ -15,6 +14,10 @@ WPA_SUPPLICANT_SUBDIR = wpa_supplicant
 WPA_SUPPLICANT_TARGET_BINS = wpa_cli wpa_supplicant wpa_passphrase
 WPA_SUPPLICANT_DBUS_SERVICE = fi.epitest.hostap.WPASupplicant
 
+ifeq ($(BR2_PACKAGE_LIBNL),y)
+	WPA_SUPPLICANT_DEPENDENCIES += libnl
+endif
+
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_OPENSSL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += openssl
 endif
@@ -46,6 +49,9 @@ endif
 ifeq ($(BR2_PACKAGE_DBUS),y)
 	echo "CONFIG_CTRL_IFACE_DBUS=y" >>$(WPA_SUPPLICANT_CONFIG)
 endif
+ifeq ($(BR2_PACKAGE_LIBNL),y)
+	echo "CONFIG_DRIVER_NL80211=y" >>$(WPA_SUPPLICANT_CONFIG)
+endif
 	touch $@
 
 $(WPA_SUPPLICANT_HOOK_POST_INSTALL):
-- 
1.6.3.3
