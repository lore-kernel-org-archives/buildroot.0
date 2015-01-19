From: Maxim Mikityanskiy <maxtram95@gmail.com>
Date: Mon, 19 Jan 2015 18:14:03 +0200
Subject: [Buildroot] [PATCH 03/16] package/dbus: fix machine-id when using
	systemd
In-Reply-To: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
Message-ID: <1421684056-5266-4-git-send-email-maxtram95@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When systemd is used, /var/lib/dbus becomes dangling symlink, because
nobody does mkdir /tmp/dbus, so /var/lib/dbus/machine-id could not be
written. On SysVinit systems there is init script that creates
/tmp/dbus.

This patch preserves old behavior for SysVinit systems, and introduces
new one for systemd-booted systems: /var/lib/dbus is a persistent
directory, it holds symlink /var/lib/dbus/machine-id -> /etc/machine-id
as machine-id(5) suggests, and /etc/machine-id is managed by systemd.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 package/dbus/dbus.mk | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index faad2b5..266e27b 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -73,17 +73,18 @@ endef
 
 DBUS_POST_INSTALL_TARGET_HOOKS += DBUS_REMOVE_DEVFILES
 
-define DBUS_INSTALL_TARGET_FIXUP
+define DBUS_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/dbus/S30dbus \
+		$(TARGET_DIR)/etc/init.d/S30dbus
+
 	mkdir -p $(TARGET_DIR)/var/lib
 	rm -rf $(TARGET_DIR)/var/lib/dbus
 	ln -sf /tmp/dbus $(TARGET_DIR)/var/lib/dbus
 endef
 
-DBUS_POST_INSTALL_TARGET_HOOKS += DBUS_INSTALL_TARGET_FIXUP
-
-define DBUS_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/dbus/S30dbus \
-		$(TARGET_DIR)/etc/init.d/S30dbus
+define DBUS_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/var/lib/dbus
+	ln -sf /etc/machine-id $(TARGET_DIR)/var/lib/dbus/machine-id
 endef
 
 HOST_DBUS_DEPENDENCIES = host-pkgconf host-expat
-- 
2.2.1
