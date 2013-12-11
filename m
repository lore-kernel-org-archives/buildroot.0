From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:11:00 +0100
Subject: [Buildroot] [git commit] wpa_supplicant: add option to enable
	syslog support
Message-ID: <20131211213614.7AE4D9BFD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f2a0fa9378fd03268c8d39338aa74ee2581cd01c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option to enable support for sending debug messages
to syslog instead of stdout.

Signed-off-by: Sven Neumann <neumann@teufel.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/Config.in         |    5 +++++
 package/wpa_supplicant/wpa_supplicant.mk |    7 +++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

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
