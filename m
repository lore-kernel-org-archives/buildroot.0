From: jared.bents at rockwellcollins.com <jared.bents@rockwellcollins.com>
Date: Mon, 17 Jun 2019 10:35:33 -0500
Subject: [Buildroot] [PATCH v2 1/1] package/hostapd: add debug information
 options
Message-ID: <20190617153533.26255-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jared Bents <jared.bents@rockwellcollins.com>

hostapd 2.7 added compile time options to include
redirecting the output from stdout to a file or syslog
like wpa_supplicant

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/hostapd/Config.in  | 5 +++++
 package/hostapd/hostapd.mk | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 37c1126859..00a9ade95f 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -81,6 +81,11 @@ config BR2_PACKAGE_HOSTAPD_WPS
 	help
 	  Enable support for Wi-Fi Protected Setup.
 
+config BR2_PACKAGE_HOSTAPD_DEBUG_SYSLOG
+	bool "Enable syslog support"
+	help
+	  Enable support for sending debug messages to syslog.
+
 config BR2_PACKAGE_HOSTAPD_VLAN
 	bool "Enable VLAN support"
 	default y
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 550f887206..abc9fc97ad 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -31,7 +31,9 @@ HOSTAPD_LICENSE = BSD-3-Clause
 HOSTAPD_LICENSE_FILES = README
 HOSTAPD_CONFIG_SET =
 
-HOSTAPD_CONFIG_ENABLE = CONFIG_INTERNAL_LIBTOMMATH
+HOSTAPD_CONFIG_ENABLE = \
+	CONFIG_INTERNAL_LIBTOMMATH \
+	CONFIG_DEBUG_FILE
 
 HOSTAPD_CONFIG_DISABLE =
 
@@ -98,6 +100,10 @@ ifeq ($(BR2_PACKAGE_HOSTAPD_WPS),y)
 HOSTAPD_CONFIG_ENABLE += CONFIG_WPS
 endif
 
+ifeq ($(BR2_PACKAGE_HOSTAPD_DEBUG_SYSLOG),y)
+HOSTAPD_CONFIG_ENABLE += CONFIG_DEBUG_SYSLOG
+endif
+
 ifeq ($(BR2_PACKAGE_HOSTAPD_VLAN),)
 HOSTAPD_CONFIG_ENABLE += CONFIG_NO_VLAN
 endif
-- 
2.18.0
