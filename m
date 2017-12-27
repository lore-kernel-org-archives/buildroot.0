From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Wed, 27 Dec 2017 22:29:00 +0300
Subject: [Buildroot] [PATCH 1/2] hostapd: add support for wired driver
In-Reply-To: <20171224204920.uwyafn63a6lyyqan@speedy.hunter>
References: <20171224204920.uwyafn63a6lyyqan@speedy.hunter>
Message-ID: <20171227192900.1082-1-alexander.i.mukhin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for the wired authenticator (disabled by default).

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---

These patches are meant to be applied after the series I sent before
(see hostapd: new configuration options)

 package/hostapd/Config.in  | 7 +++++++
 package/hostapd/hostapd.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 115563f564..bfb5447c1e 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -34,10 +34,17 @@ config BR2_PACKAGE_HOSTAPD_DRIVER_RTW
 	help
 	  Enable support for Realtek wireless chips.
 
+config BR2_PACKAGE_HOSTAPD_DRIVER_WIRED
+	bool "Enable wired driver"
+	default y
+	help
+	  Enable support for wired authenticator.
+
 comment "at least one driver must be selected"
 	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP
 	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
 	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_RTW
+	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_WIRED
 
 config BR2_PACKAGE_HOSTAPD_ACS
 	bool "Enable ACS"
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 9b73c596f8..1700335c1a 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -54,6 +54,10 @@ HOSTAPD_PATCH += https://github.com/pritambaral/hostapd-rtl871xdrv/raw/master/rt
 HOSTAPD_CONFIG_SET += CONFIG_DRIVER_RTW
 endif
 
+ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_WIRED),y)
+HOSTAPD_CONFIG_ENABLE += CONFIG_DRIVER_WIRED
+endif
+
 ifeq ($(BR2_PACKAGE_HOSTAPD_ACS),y)
 HOSTAPD_CONFIG_ENABLE += CONFIG_ACS
 endif
-- 
2.11.0
