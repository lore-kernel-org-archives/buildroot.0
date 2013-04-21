From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Apr 2013 23:11:04 +0200
Subject: [Buildroot] [git commit] wireless-regdb: new package
Message-ID: <20130421211402.0C6649B783@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d9ce2f563b78ccc40af80f7d20b7a260a8ab3fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                        |    1 +
 package/wireless-regdb/Config.in         |   10 ++++++++++
 package/wireless-regdb/wireless-regdb.mk |   18 ++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 54a9a2b..b9fe726 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -765,6 +765,7 @@ source "package/vtun/Config.in"
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
index 0000000..b4e038c
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
+    install -m 644 -D -T $(@D)/linville.key.pub.pem $(TARGET_DIR)/etc/wireless-regdb/pubkeys/linville.key.pub.pem
+endef
+
+$(eval $(generic-package))
