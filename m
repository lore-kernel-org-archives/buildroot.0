From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 22:44:17 +0100
Subject: [Buildroot] [git commit] bluez5_utils: Make systemd link correctly
Message-ID: <20180227214433.0CA95813C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aca8bcc836f7df6c8ddb1d5a71348ed08e374320
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The link in /etc/systemd/system/, named dbus-org.bluez.service, pointing to
../../../../usr/lib/systemd/system/bluetooth.service has one too many ".." in
it.  Likely the target was copied from the other link in
/etc/systemd/system/bluetooth.target.wants/, which is one level deeper.

Adjust link to be correct.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bluez5_utils/bluez5_utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 0634ec9f6f..395340a3e6 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -116,7 +116,7 @@ define BLUEZ5_UTILS_INSTALL_INIT_SYSTEMD
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/bluetooth.target.wants
 	ln -fs ../../../../usr/lib/systemd/system/bluetooth.service \
 		$(TARGET_DIR)/etc/systemd/system/bluetooth.target.wants/bluetooth.service
-	ln -fs ../../../../usr/lib/systemd/system/bluetooth.service \
+	ln -fs ../../../usr/lib/systemd/system/bluetooth.service \
 		$(TARGET_DIR)/etc/systemd/system/dbus-org.bluez.service
 endef
 
