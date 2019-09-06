From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Fri,  6 Sep 2019 13:21:00 +0300
Subject: [Buildroot] [PATCH 1/2] hostapd: remove support for Realtek drivers
Message-ID: <20190906102101.4676-1-alexander.i.mukhin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After hostapd update to 2.9, the patch provided no longer works,
although applies. Moreover, AP support for Realtek chips is broken
anyway in kernels > 4.9.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 package/hostapd/Config.in    | 7 -------
 package/hostapd/hostapd.hash | 1 -
 package/hostapd/hostapd.mk   | 5 -----
 3 files changed, 13 deletions(-)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 37c1126859..8a7abbb901 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -31,12 +31,6 @@ config BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
 comment "nl80211 driver needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_HOSTAPD_DRIVER_RTW
-	bool "Enable rtl871xdrv driver"
-	select BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS
-	help
-	  Enable support for Realtek wireless chips.
-
 config BR2_PACKAGE_HOSTAPD_DRIVER_WIRED
 	bool "Enable wired driver"
 	help
@@ -47,7 +41,6 @@ config BR2_PACKAGE_HOSTAPD_DRIVER_NONE
 	default y
 	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP
 	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
-	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_RTW
 	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_WIRED
 
 config BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS
diff --git a/package/hostapd/hostapd.hash b/package/hostapd/hostapd.hash
index 50225cf6d7..bf5016acc3 100644
--- a/package/hostapd/hostapd.hash
+++ b/package/hostapd/hostapd.hash
@@ -1,4 +1,3 @@
 # Locally calculated
 sha256  881d7d6a90b2428479288d64233151448f8990ab4958e0ecaca7eeb3c9db2bd7  hostapd-2.9.tar.gz
-sha256  e204da659d0583c71af23cb9b55536fe99598ee26a44104344f456e4d17350c6  rtlxdrv.patch
 sha256  9da5dd0776da266b180b915e460ff75c6ff729aca1196ab396529510f24f3761  README
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index f55e716a7c..fb6ac8fb2e 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -39,11 +39,6 @@ ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_NL80211),)
 HOSTAPD_CONFIG_DISABLE += CONFIG_DRIVER_NL80211
 endif
 
-ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_RTW),y)
-HOSTAPD_PATCH += https://github.com/pritambaral/hostapd-rtl871xdrv/raw/master/rtlxdrv.patch
-HOSTAPD_CONFIG_SET += CONFIG_DRIVER_RTW
-endif
-
 ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_WIRED),y)
 HOSTAPD_CONFIG_ENABLE += CONFIG_DRIVER_WIRED
 endif
-- 
2.20.1
