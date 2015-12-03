From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Dec 2015 13:40:38 -0300
Subject: [Buildroot] [PATCH] hostapd: make ACS optional
Message-ID: <1449160838-15039-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make ACS (Automatic Channel Selection) support in hostapd optional.
There's a clash of standard vs. propietary solutions, hence when hostapd
has builtin ACS support (standard) and it's enabled (channel=0 in the
config) this will preclude the propietary driver from using ACS (it
won't work at all).

See:
http://e2e.ti.com/support/wireless_connectivity/f/307/p/465333/1669270

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hostapd/Config.in  | 10 ++++++++++
 package/hostapd/hostapd.mk |  5 ++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 656645b..62fbb66 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -14,6 +14,16 @@ config BR2_PACKAGE_HOSTAPD
 
 if BR2_PACKAGE_HOSTAPD
 
+config BR2_PACKAGE_HOSTAPD_ACS
+	bool "Enable ACS"
+	default y
+	help
+	  Enable support for standard ACS (Automatic Channel Selection).
+	  Some propietary drivers use a custom algorithm which requires
+	  channel to be set to '0' (which enables ACS in the config),
+	  causing hostapd to use the standard one which doesn't work
+	  for those cases.
+
 config BR2_PACKAGE_HOSTAPD_EAP
 	bool "Enable EAP"
 	depends on !BR2_STATIC_LIBS
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index e22e53f..88867e6 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -15,7 +15,6 @@ HOSTAPD_LICENSE_FILES = README
 HOSTAPD_CONFIG_SET =
 
 HOSTAPD_CONFIG_ENABLE = \
-	CONFIG_ACS \
 	CONFIG_FULL_DYNAMIC_VLAN \
 	CONFIG_HS20 \
 	CONFIG_IEEE80211AC \
@@ -45,6 +44,10 @@ HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD
 HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
+ifeq ($(BR2_PACKAGE_HOSTAPD_ACS),y)
+HOSTAPD_CONFIG_ENABLE += CONFIG_ACS
+endif
+
 ifeq ($(BR2_PACKAGE_HOSTAPD_EAP),y)
 HOSTAPD_CONFIG_ENABLE += \
 	CONFIG_EAP \
-- 
2.4.10
