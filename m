From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Sat, 23 Dec 2017 22:06:15 +0300
Subject: [Buildroot] [PATCH 2/4] hostapd: select driver support
In-Reply-To: <20171223190617.3981-1-alexander.i.mukhin@gmail.com>
References: <20171223190617.3981-1-alexander.i.mukhin@gmail.com>
Message-ID: <20171223190617.3981-3-alexander.i.mukhin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add configuration options for hostapd to select which
drivers to build.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 package/hostapd/Config.in  | 17 +++++++++++++++++
 package/hostapd/hostapd.mk |  8 ++++++++
 2 files changed, 25 insertions(+)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 84156e8f11..509797a44a 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -14,11 +14,28 @@ config BR2_PACKAGE_HOSTAPD
 
 if BR2_PACKAGE_HOSTAPD
 
+config BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP
+	bool "Enable hostap driver"
+	default y
+	help
+	  Enable support for Host AP driver.
+
+config BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
+	bool "Enable nl80211 driver"
+	default y
+	help
+	  Enable support for drivers using the nl80211 kernel interface.
+
 config BR2_PACKAGE_HOSTAPD_DRIVER_RTW
 	bool "Enable rtl871xdrv driver"
 	help
 	  Enable support for Realtek wireless chips.
 
+comment "at least one driver must be selected"
+	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP
+	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
+	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_RTW
+
 config BR2_PACKAGE_HOSTAPD_ACS
 	bool "Enable ACS"
 	default y
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 04ffa35758..143efe9627 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -45,6 +45,14 @@ HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD
 HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
+ifneq ($(BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP),y)
+HOSTAPD_CONFIG_DISABLE += CONFIG_DRIVER_HOSTAP
+endif
+
+ifneq ($(BR2_PACKAGE_HOSTAPD_DRIVER_NL80211),y)
+HOSTAPD_CONFIG_DISABLE += CONFIG_DRIVER_NL80211
+endif
+
 ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_RTW),y)
 HOSTAPD_PATCH += https://github.com/pritambaral/hostapd-rtl871xdrv/raw/master/rtlxdrv.patch
 HOSTAPD_CONFIG_SET += CONFIG_DRIVER_RTW
-- 
2.11.0
