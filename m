From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 17:55:41 +0200
Subject: [Buildroot] [git commit] package/hostapd: add Config.in option for
 WPA3 support
Message-ID: <20190921155721.E16B88EE6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90878dcc8d431647ed03c959520e8a370083d6b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New hostapd v2.9 supports WPA3 features such as OWE, SAE, DPP.
Those features are disabled by default in defconfig, so no
dependency from openssl is requried unless WPA3 support
is enabled.

This patch adds Config.in option for WPA3 support in hostapd.
When this option is selected, libopenssl is also selected and
WPA3 features including OWE, SAE, DPP are enabled in hostapd
.config file. When this option is deselected, then WPA3
options are disabled.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
