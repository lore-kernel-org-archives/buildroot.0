From: Pierre Ducroquet <pinaraf@pinaraf.info>
Date: Sun, 18 Feb 2018 22:50:39 +0100
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant - Specify that old and new
 dbus are incompatible
Message-ID: <20180218215039.4811-1-pinaraf@pinaraf.info>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building wpa-supplicant with support for both DBus interfaces
generates broken .service files.
Marking old and new DBus incompatible in Config.in makes this
conflict clear.

Signed-off-by: Pierre Ducroquet <pinaraf@pinaraf.info>
---
 package/wpa_supplicant/Config.in | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 58a074fae8..500df354a2 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -100,20 +100,33 @@ config BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE
 	help
 	  Install wpa_passphrase command line utility.
 
+config BR2_PACKAGE_WPA_SUPPLICANT_DBUS
+	bool "Enable support for DBus control interface"
+	depends on BR2_PACKAGE_DBUS
+	help
+	 Enable support for DBus control interface
+
+if BR2_PACKAGE_WPA_SUPPLICANT_DBUS
+
+choice
+	prompt "DBus interface"
+
 config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD
-	bool "Enable support for old DBus control interface"
+	bool "Use old DBus control interface"
 	depends on BR2_PACKAGE_DBUS
 	help
 	  Enable support for old DBus control interface
 	  (fi.epitest.hostap.WPASupplicant).
 
 config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW
-	bool "Enable support for new DBus control interface"
+	bool "Use new DBus control interface"
 	depends on BR2_PACKAGE_DBUS
 	help
 	  Enable support for new DBus control interface
 	  (fi.w1.wpa_supplicant1).
 
+endchoice
+
 config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION
 	bool "Introspection support"
 	depends on BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW
@@ -121,3 +134,5 @@ config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION
 	  Add introspection support for new DBus control interface.
 
 endif
+
+endif
-- 
2.16.1
