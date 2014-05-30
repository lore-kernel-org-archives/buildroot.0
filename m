From: Heiko Abraham <abrahamh@web.de>
Date: Fri, 30 May 2014 17:26:21 +0200
Subject: [Buildroot] [PATCH] package/connman : enable build without gnutls
	dependency
Message-ID: <1401463581-27534-1-git-send-email-abrahamh@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add new configuration option '--enable-wispr' (disabled by default)
- move gnutls dependency to "wispr" config option

Signed-off-by: Heiko Abraham <abrahamh@web.de>
---
 package/connman/Config.in  | 14 +++++++++++++-
 package/connman/connman.mk |  7 ++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 8083233..ac9f468 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_CONNMAN
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_IPTABLES
-	select BR2_PACKAGE_GNUTLS
 	depends on !BR2_avr32 # no inotify_init1
 	depends on !BR2_UCLIBC_VERSION_0_9_32
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
@@ -26,9 +25,22 @@ config BR2_PACKAGE_CONNMAN_ETHERNET
 config BR2_PACKAGE_CONNMAN_WIFI
 	bool "enable WiFi support"
 	select BR2_PACKAGE_WPA_SUPPLICANT
+	help
+	  Enable WiFi support (scan and static/dhcp interface setup). ConnMan 
+	  detect the start of wpa_supplicant automatically.
+
+config BR2_PACKAGE_CONNMAN_WISPR
+	bool "enable WISPr support"
+	select BR2_PACKAGE_GNUTLS
+	help
+	  Enable support for (WISPr) Wireless Internet Service Provider roaming.
+	  A RADIUS server is used to authenticate the subscriber's credentials.
 
 config BR2_PACKAGE_CONNMAN_BLUETOOTH
 	bool "enable Bluetooth support"
+	help
+	  Enable Bluetooth (PAN profile) support. The start of bluetoothd is 
+	  automatically detected and only a runtime dependency. 
 
 config BR2_PACKAGE_CONNMAN_LOOPBACK
 	bool "enable loopback support"
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index f720d1c..bf52840 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -7,7 +7,7 @@
 CONNMAN_VERSION = 1.23
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman/
-CONNMAN_DEPENDENCIES = libglib2 dbus iptables gnutls
+CONNMAN_DEPENDENCIES = libglib2 dbus iptables
 CONNMAN_INSTALL_STAGING = YES
 CONNMAN_LICENSE = GPLv2
 CONNMAN_LICENSE_FILES = COPYING
@@ -15,6 +15,7 @@ CONNMAN_CONF_OPT += --localstatedir=/var \
 	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)		\
 	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet)	\
 	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)			\
+	$(if $(BR2_PACKAGE_CONNMAN_WISPR),--enable-wispr,--disable-wispr) \
 	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth)	\
 	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback)	\
 	$(if $(BR2_PACKAGE_CONNMAN_NEARD),--enable-neard,--disable-neard) \
@@ -25,6 +26,10 @@ CONNMAN_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_CONNMAN_NEARD),neard) \
 	$(if $(BR2_PACKAGE_CONNMAN_OFONO),ofono)
 
+ifeq ($(BR2_PACKAGE_CONNMAN_WISPR),y)
+CONNMAN_DEPENDENCIES += gnutls
+endif
+
 define CONNMAN_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
 endef
-- 
1.8.5.2 (Apple Git-48)
