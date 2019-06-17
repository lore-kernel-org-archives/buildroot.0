From: jared.bents at rockwellcollins.com <jared.bents@rockwellcollins.com>
Date: Mon, 17 Jun 2019 10:17:10 -0500
Subject: [Buildroot] [PATCH v1 1/1] package/hostapd: add debug information
 options
Message-ID: <20190617151710.21576-1-jared.bents@rockwellcollins.com>
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
index 37c1126859..c569979835 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -28,6 +28,11 @@ config BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
 	help
 	  Enable support for drivers using the nl80211 kernel interface.
 
+config BR2_PACKAGE_HOSTAPD_DEBUG_SYSLOG
+	bool "Enable syslog support"
+	help
+	  Enable support for sending debug messages to syslog.
+
 comment "nl80211 driver needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 550f887206..49af54feb5 100644
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
 
@@ -58,6 +60,10 @@ HOSTAPD_PATCH += https://github.com/pritambaral/hostapd-rtl871xdrv/raw/master/rt
 HOSTAPD_CONFIG_SET += CONFIG_DRIVER_RTW
 endif
 
+ifeq ($(BR2_PACKAGE_HOSTAPD_DEBUG_SYSLOG),y)
+HOSTAPD_CONFIG_ENABLE += CONFIG_DEBUG_SYSLOG
+endif
+
 ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_WIRED),y)
 HOSTAPD_CONFIG_ENABLE += CONFIG_DRIVER_WIRED
 endif
-- 
2.18.0
