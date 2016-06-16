From: Martin Bark <martin@barkynet.com>
Date: Thu, 16 Jun 2016 18:15:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: correct systemd
	service install
Message-ID: <1466097338-19149-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit d732fa4 add the BLUEZ5_UTILS_INSTALL_INIT_SYSTEMD rule, however,
it is not correct.  The [Install] section of bluetooth.service is as
follows:

 [Install]
 WantedBy=bluetooth.target
 Alias=dbus-org.bluez.service

hence there are currently two mistakes:
 1) bluetooth.service is wanted by bluetooth.target not multi-user.target
 2) dbus-org.bluez.service is a missing alias to bluetooth.service

This commit fixes both these issues.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/bluez5_utils/bluez5_utils.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index ddc8c45..49cc7c2 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -77,9 +77,11 @@ BLUEZ5_UTILS_CONF_OPTS += --disable-systemd
 endif
 
 define BLUEZ5_UTILS_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/bluetooth.target.wants
 	ln -fs ../../../../usr/lib/systemd/system/bluetooth.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/bluetooth.service
+		$(TARGET_DIR)/etc/systemd/system/bluetooth.target.wants/bluetooth.service
+	ln -fs ../../../../usr/lib/systemd/system/bluetooth.service \
+		$(TARGET_DIR)/etc/systemd/system/dbus-org.bluez.service
 endef
 
 $(eval $(autotools-package))
-- 
2.7.4
