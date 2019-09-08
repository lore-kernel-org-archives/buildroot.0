From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  8 Sep 2019 18:17:09 +0300
Subject: [Buildroot] [PATCH 2/2] package/hostapd: add Config.in option for
 WPA3
In-Reply-To: <20190908151709.23971-1-geomatsi@gmail.com>
References: <20190908151709.23971-1-geomatsi@gmail.com>
Message-ID: <20190908151709.23971-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New hostapd v2.9 supports WPA3 features such as OWE, SAE, DPP.
Those features are disabled by default, so no dependency from
openssl is requried unless WPA3 support is enabled.

This patch adds Config.in option for WPA3 support in hostapd.
When this option is selected, libopenssl is also selected and
WPA3 features including OWE, SAE, DPP are enabled in hostapd
configuration. When this option is deselected, then WPA3
options are disabled in hostapd configuration.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/hostapd/Config.in  |  7 +++++++
 package/hostapd/hostapd.mk | 11 +++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 8a7abbb901..54d2086c09 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -74,6 +74,13 @@ config BR2_PACKAGE_HOSTAPD_WPS
 	help
 	  Enable support for Wi-Fi Protected Setup.
 
+config BR2_PACKAGE_HOSTAPD_WPA3
+	bool "Enable WPA3 support"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	help
+	  Enable WPA3 support including OWE, SAE, DPP
+
 config BR2_PACKAGE_HOSTAPD_VLAN
 	bool "Enable VLAN support"
 	default y
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index fb6ac8fb2e..4a493cb9b2 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -79,6 +79,17 @@ ifeq ($(BR2_PACKAGE_HOSTAPD_WPS),y)
 HOSTAPD_CONFIG_ENABLE += CONFIG_WPS
 endif
 
+ifeq ($(BR2_PACKAGE_HOSTAPD_WPA3),y)
+HOSTAPD_CONFIG_SET += \
+	CONFIG_DPP \
+	CONFIG_SAE
+HOSTAPD_CONFIG_ENABLE += \
+	CONFIG_OWE
+else
+HOSTAPD_CONFIG_DISABLE += \
+	CONFIG_OWE
+endif
+
 ifeq ($(BR2_PACKAGE_HOSTAPD_VLAN),)
 HOSTAPD_CONFIG_ENABLE += CONFIG_NO_VLAN
 endif
-- 
2.23.0
