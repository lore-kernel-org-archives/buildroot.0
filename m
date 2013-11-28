From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 28 Nov 2013 09:36:40 +0000
Subject: [Buildroot] [PATCH] connman: add support for ofono and neard
Message-ID: <1385631400-14668-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/connman/Config.in  | 8 ++++++++
 package/connman/connman.mk | 8 +++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 021e211..639cd57 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -38,9 +38,17 @@ config BR2_PACKAGE_CONNMAN_BLUETOOTH
 config BR2_PACKAGE_CONNMAN_LOOPBACK
 	bool "enable loopback support"
 
+config BR2_PACKAGE_CONNMAN_NEARD
+	bool "enable neard support"
+	select BR2_PACKAGE_NEARD
+
 config BR2_PACKAGE_CONNMAN_NTPD
 	bool "enable ntpd support"
 
+config BR2_PACKAGE_CONNMAN_OFONO
+	bool "enable ofono support"
+	select BR2_PACKAGE_OFONO
+
 config BR2_PACKAGE_CONNMAN_DEBUG
 	bool "enable compiling with debugging information"
 
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 4a6bb78..85e1be4 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -18,7 +18,13 @@ CONNMAN_CONF_OPT += --localstatedir=/var \
 	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)			\
 	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth)	\
 	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback)	\
-	$(if $(BR2_PACKAGE_CONNMAN_NTPD),--enable-ntpd,--disable-ntpd)
+	$(if $(BR2_PACKAGE_CONNMAN_NEARD),--enable-neard,--disable-neard) \
+	$(if $(BR2_PACKAGE_CONNMAN_NTPD),--enable-ntpd,--disable-ntpd) \
+	$(if $(BR2_PACKAGE_CONNMAN_OFONO),--enable-ofono,--disable-ofono)
+
+CONNMAN_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_CONNMAN_NEARD),neard) \
+	$(if $(BR2_PACKAGE_CONNMAN_OFONO),ofono)
 
 define CONNMAN_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
-- 
1.8.3.2
