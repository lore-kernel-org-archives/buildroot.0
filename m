From: Nathaniel Roach <nroach44@gmail.com>
Date: Tue,  2 Dec 2014 16:53:39 +0800
Subject: [Buildroot] [PATCH v2] package/network-manager: Enable service
	under systemd
Message-ID: <1417510419-9400-1-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously NetworkManager had to be enabled and started on the
first boot manually or by a script.

Add install define with the commands to setup the required
service files for automatic start.

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
Changes v1 -> v2
  - Corrected the symlinks so they point to the correct files,
	ensuring the dispatcher service works

 package/network-manager/network-manager.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 9770cae..3f6512c 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -72,4 +72,17 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/network-manager/S45network-manager $(TARGET_DIR)/etc/init.d/S45network-manager
 endef
 
+define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -sf /usr/lib/systemd/system/NetworkManager.service \
+		$(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.NetworkManager.service
+
+	ln -sf /usr/lib/systemd/system/NetworkManager.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/NetworkManager.service
+
+	ln -sf /usr/lib/systemd/system/NetworkManager-dispatcher.service \
+		$(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service
+endef
+
 $(eval $(autotools-package))
-- 
2.1.3
