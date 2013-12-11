From: Sven Neumann <neumann@teufel.de>
Date: Wed, 11 Dec 2013 14:17:23 +0100
Subject: [Buildroot] [PATCH v2] wpa_supplicant: add option to enable syslog
	support
In-Reply-To: <1386766417.2783.12.camel@sven>
References: <1386766417.2783.12.camel@sven>
Message-ID: <1386767843-30271-1-git-send-email-neumann@teufel.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to enable support for sending debug messages
to syslog instead of stdout.

Signed-off-by: Sven Neumann <neumann@teufel.de>
---
 package/wpa_supplicant/Config.in         | 5 +++++
 package/wpa_supplicant/wpa_supplicant.mk | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 8b0b366..74145f1 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -49,6 +49,11 @@ config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION
 	help
 	  Add introspection support for new DBus control interface.
 
+config BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG
+	bool "Enable syslog support"
+	help
+	  Enable support for sending debug messages to syslog
+
 config BR2_PACKAGE_WPA_SUPPLICANT_WPS
 	bool "Enable support for WPS"
 	help
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 4ae41c1..920f96a 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -116,6 +116,12 @@ endef
 
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG),y)
+define WPA_SUPPLICANT_DEBUG_CONFIG
+	$(SED) 's/\(#\)\(CONFIG_DEBUG_SYSLOG.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+endef
+endif
+
 define WPA_SUPPLICANT_CONFIGURE_CMDS
 	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
 	$(SED) 's/\(#\)\(CONFIG_HS20.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
@@ -133,6 +139,7 @@ define WPA_SUPPLICANT_CONFIGURE_CMDS
 	$(WPA_SUPPLICANT_LIBNL_CONFIG)
 	$(WPA_SUPPLICANT_DBUS_CONFIG)
 	$(WPA_SUPPLICANT_AP_CONFIG)
+	$(WPA_SUPPLICANT_DEBUG_CONFIG)
 endef
 
 define WPA_SUPPLICANT_BUILD_CMDS
-- 
1.8.3.2
