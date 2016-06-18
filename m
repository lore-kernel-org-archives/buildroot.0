From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:37:47 +0200
Subject: [Buildroot] [git commit] package/bluez5_utils: correct systemd
	service install
Message-ID: <20160618133752.CCC18819CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a34ac240cd0f051cfe189125cc70c368b1774fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
