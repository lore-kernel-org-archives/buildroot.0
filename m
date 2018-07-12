From: noctarius <me@noctarius.com>
Date: Thu, 12 Jul 2018 23:01:10 +0300
Subject: [Buildroot] [PATCH 1/1] <wireless-regdb>: Adds the option to copy
 "regulatory.db[.p7s]" to /lib/firmware
Message-ID: <20180712200110.4818-1-me@noctarius.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Certain wireless drivers (like the Broadcom FullMac drivers" expect the regulatory.db and
regulatory.db.p7s files to be available to be loadable from /lib/firmware. If not available
the driver still loads but runs on a minimal subset of channels.

This newly added option gives possibility to have those files copied to the necessary directory.

Signed-off-by: Christoph Engelbert <me@noctarius.com>
---
 package/wireless-regdb/Config.in         |  8 ++++++++
 package/wireless-regdb/wireless-regdb.mk | 10 ++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/wireless-regdb/Config.in b/package/wireless-regdb/Config.in
index 0c9896deb9..5c91a7d8c7 100644
--- a/package/wireless-regdb/Config.in
+++ b/package/wireless-regdb/Config.in
@@ -7,3 +7,11 @@ config BR2_PACKAGE_WIRELESS_REGDB
 	  allowed radio frequencies for each local jurisdiction.
 
 	  https://wireless.wiki.kernel.org/en/developers/regulatory/wireless-regdb
+
+config BR2_PACKAGE_WIRELESS_REGDB_FIRMWARE
+	bool "wireless-regdb-firmware"
+	depends on BR2_PACKAGE_WIRELESS_REGDB
+	help
+	  Copies the regulatory.db and regulatory.db.p7s files to
+	  /lib/firmware which is necessary for certain drivers like
+	  the Broadcom FullMac driver.
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index e9283a00e2..e322035841 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -10,6 +10,16 @@ WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
 WIRELESS_REGDB_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_WIRELESS_REGDB_FIRMWARE),y)
+define WIRELESS_REGDB_FIRMWARE_INSTALL
+	$(INSTALL) -m 644 -D -T $(@D)/regulatory.db \
+		$(TARGET_DIR)/lib/firmware/regulatory.db
+	$(INSTALL) -m 644 -D -T $(@D)/regulatory.db.p7s \
+		$(TARGET_DIR)/lib/firmware/regulatory.db.p7s
+endef
+WIRELESS_REGDB_POST_INSTALL_TARGET_HOOKS += WIRELESS_REGDB_FIRMWARE_INSTALL
+endif
+
 define WIRELESS_REGDB_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 644 -D -T $(@D)/regulatory.bin \
 		$(TARGET_DIR)/usr/lib/crda/regulatory.bin
-- 
2.17.1
