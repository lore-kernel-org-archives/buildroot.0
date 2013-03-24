From: Dimitrios Siganos <dimitris@siganos.org>
Date: Sun, 24 Mar 2013 22:45:18 +0000
Subject: [Buildroot] [PATCH v4] wireless-regdb: new package
Message-ID: <1364165118-6984-1-git-send-email-dimitris@siganos.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>
---
 package/Config.in                        |    1 +
 package/wireless-regdb/Config.in         |   10 ++++++++++
 package/wireless-regdb/wireless-regdb.mk |   18 ++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/wireless-regdb/Config.in
 create mode 100644 package/wireless-regdb/wireless-regdb.mk

diff --git a/package/Config.in b/package/Config.in
index 94e279b..bbd3ea2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -746,6 +746,7 @@ source "package/vtun/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/wget/Config.in"
 endif
+source "package/wireless-regdb/Config.in"
 source "package/wireless_tools/Config.in"
 source "package/wireshark/Config.in"
 source "package/wpa_supplicant/Config.in"
diff --git a/package/wireless-regdb/Config.in b/package/wireless-regdb/Config.in
new file mode 100644
index 0000000..89a6147
--- /dev/null
+++ b/package/wireless-regdb/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_WIRELESS_REGDB
+	bool "wireless-regdb"
+	help
+	  Wireless regulatory database.
+
+	  Wireless regulatory database for CRDA. The database lists the
+	  allowed radio frequencies for each local jurisdiction.
+
+	  http://linuxwireless.org/en/developers/Regulatory
+
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
new file mode 100644
index 0000000..f07618e
--- /dev/null
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# wireless-regdb
+#
+#############################################################
+
+WIRELESS_REGDB_VERSION = 2013.01.11
+WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.bz2
+WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
+WIRELESS_REGDB_LICENSE = ISC
+WIRELESS_REGDB_LICENSE_FILES = LICENSE
+
+define WIRELESS_REGDB_INSTALL_TARGET_CMDS
+    install -m 644 -D -T $(@D)/regulatory.bin $(TARGET_DIR)/usr/lib/crda/regulatory.bin
+    install -m 644 -D -T $(@D)/linville.key.pub.pem $(TARGET_DIR)/usr/lib/crda/pubkeys/linville.key.pub.pem
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
