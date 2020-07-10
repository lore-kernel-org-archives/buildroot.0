From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 11 Jul 2020 00:26:55 +0200
Subject: [Buildroot] [PATCH v2] package/systemd: use current tool for
 generating HWDB
Message-ID: <20200710222656.6885-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

udevadm has been deprecated for a while(for bulding the DB),
systemd-hwdb should be used in its place.

this tool further has a switch to generate the database in
/usr which is a better place for a one-time created file.

Also remove the config files from both paths
(rootfs overlay could add stuff) aswell as the service and tool
from the target fs.

Signed-off-by: Norbert Lange <nolange79@gmail.com>

---
v1 -> v2
-   fix removal of service
---
 package/systemd/systemd.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1a8eb86e53..05c1d1ff9a 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -229,11 +229,14 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
 SYSTEMD_CONF_OPTS += -Dhwdb=true
 define SYSTEMD_BUILD_HWDB
-	$(HOST_DIR)/bin/udevadm hwdb --update --root $(TARGET_DIR)
+	$(HOST_DIR)/bin/systemd-hwdb update --root $(TARGET_DIR) --usr
 endef
 SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_BUILD_HWDB
 define SYSTEMD_RM_HWDB_SRV
-	rm -rf $(TARGET_DIR)/$(HOST_EUDEV_SYSCONFDIR)/udev/hwdb.d/
+	rm -rf $(TARGET_DIR)/usr/lib/udev/hwdb.d/ $(TARGET_DIR)/etc/udev/hwdb.d/ \
+		$(TARGET_DIR)/usr/lib/systemd/system/systemd-hwdb-update.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/*/systemd-hwdb-update.service \
+		$(TARGET_DIR)/usr/bin/systemd-hwdb
 endef
 SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_HWDB_SRV
 else
@@ -633,7 +636,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dsysusers=false \
 	-Dtmpfiles=false \
 	-Dimportd=false \
-	-Dhwdb=false \
+	-Dhwdb=true \
 	-Drfkill=false \
 	-Dman=false \
 	-Dhtml=false \
-- 
2.27.0
