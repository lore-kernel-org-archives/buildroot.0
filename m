From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Wed, 27 Dec 2017 22:29:28 +0300
Subject: [Buildroot] [PATCH 2/2] hostapd: select DRIVER_NONE if no other
 drivers enabled
In-Reply-To: <20171224204920.uwyafn63a6lyyqan@speedy.hunter>
References: <20171224204920.uwyafn63a6lyyqan@speedy.hunter>
Message-ID: <20171227192928.1129-1-alexander.i.mukhin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select DRIVER_NONE if no wireless or wired drivers selected.
This may be the case when building hostapd as a standalone
RADIUS server.

Apply wireless-specific options only if we have at least one
wireless driver enabled. Otherwise, an attempt to build
a wired-only or RADIUS-only hostapd will fail.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 package/hostapd/Config.in  |  6 ------
 package/hostapd/hostapd.mk | 36 +++++++++++++++++++++++++++++-------
 2 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index bfb5447c1e..2ce26e79aa 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -40,12 +40,6 @@ config BR2_PACKAGE_HOSTAPD_DRIVER_WIRED
 	help
 	  Enable support for wired authenticator.
 
-comment "at least one driver must be selected"
-	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP
-	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
-	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_RTW
-	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_WIRED
-
 config BR2_PACKAGE_HOSTAPD_ACS
 	bool "Enable ACS"
 	default y
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 1700335c1a..e6c981dbe5 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -17,18 +17,14 @@ HOSTAPD_LICENSE = BSD-3-Clause
 HOSTAPD_LICENSE_FILES = README
 HOSTAPD_CONFIG_SET =
 
-HOSTAPD_CONFIG_ENABLE = \
-	CONFIG_HS20 \
-	CONFIG_IEEE80211AC \
-	CONFIG_IEEE80211N \
-	CONFIG_IEEE80211R \
-	CONFIG_INTERNAL_LIBTOMMATH \
-	CONFIG_INTERWORKING
+HOSTAPD_CONFIG_ENABLE = CONFIG_INTERNAL_LIBTOMMATH
 
 HOSTAPD_CONFIG_DISABLE =
 
 HOSTAPD_USE_NL =
 
+HOSTAPD_USE_WIRELESS_DRIVERS =
+
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 HOSTAPD_DEPENDENCIES += libopenssl
@@ -39,25 +35,51 @@ HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD
 HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
+# Select which drivers to build
 ifneq ($(BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP),y)
 HOSTAPD_CONFIG_DISABLE += CONFIG_DRIVER_HOSTAP
+else
+HOSTAPD_USE_WIRELESS_DRIVERS = y
 endif
 
 ifneq ($(BR2_PACKAGE_HOSTAPD_DRIVER_NL80211),y)
 HOSTAPD_CONFIG_DISABLE += CONFIG_DRIVER_NL80211
 else
 HOSTAPD_USE_NL = y
+HOSTAPD_USE_WIRELESS_DRIVERS = y
 endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_RTW),y)
 HOSTAPD_PATCH += https://github.com/pritambaral/hostapd-rtl871xdrv/raw/master/rtlxdrv.patch
 HOSTAPD_CONFIG_SET += CONFIG_DRIVER_RTW
+HOSTAPD_USE_WIRELESS_DRIVERS = y
 endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_WIRED),y)
 HOSTAPD_CONFIG_ENABLE += CONFIG_DRIVER_WIRED
 endif
 
+# Enable CONFIG_DRIVER_NONE if no other drivers enabled
+ifneq ($(BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP),y)
+ifneq ($(BR2_PACKAGE_HOSTAPD_DRIVER_NL80211),y)
+ifneq ($(BR2_PACKAGE_HOSTAPD_DRIVER_RTW),y)
+ifneq ($(BR2_PACKAGE_HOSTAPD_DRIVER_WIRED),y)
+HOSTAPD_CONFIG_ENABLE += CONFIG_DRIVER_NONE
+endif
+endif
+endif
+endif
+
+# Add options for wireless drivers
+ifeq ($(HOSTAPD_USE_WIRELESS_DRIVERS),y)
+HOSTAPD_CONFIG_ENABLE += \
+	CONFIG_HS20 \
+	CONFIG_IEEE80211AC \
+	CONFIG_IEEE80211N \
+	CONFIG_IEEE80211R \
+	CONFIG_INTERWORKING
+endif
+
 ifeq ($(BR2_PACKAGE_HOSTAPD_ACS),y)
 HOSTAPD_CONFIG_ENABLE += CONFIG_ACS
 endif
-- 
2.11.0
