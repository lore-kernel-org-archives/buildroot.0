From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 29 Jun 2013 09:27:04 -0400
Subject: [Buildroot] [PATCH] dbus: ensure directory exists before installing
	symlink
Message-ID: <1372512424-26165-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If you use a custom target skeleton with no /var/lib directory,
then the symlink installation in dbus.mk will fail.  This patch
fixes this issue by creating /var/lib before creating a symlink
there.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/dbus/dbus.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index a855f05..57274a0 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -66,6 +66,7 @@ DBUS_POST_INSTALL_TARGET_HOOKS += DBUS_REMOVE_DEVFILES
 endif
 
 define DBUS_INSTALL_TARGET_FIXUP
+	mkdir -p $(TARGET_DIR)/var/lib
 	rm -rf $(TARGET_DIR)/var/lib/dbus
 	ln -sf /tmp/dbus $(TARGET_DIR)/var/lib/dbus
 	$(INSTALL) -m 0755 -D package/dbus/S30dbus $(TARGET_DIR)/etc/init.d/S30dbus
-- 
1.7.9.5
