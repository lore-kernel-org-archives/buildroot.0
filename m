From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 23:14:55 +0100
Subject: [Buildroot] [git commit] package/network-manager: Enable service
	under systemd
Message-ID: <20141207223605.BF4DD800A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb719a907a6e2ac2d4fa03a4874a16f9ed989622
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously NetworkManager had to be enabled and started on the
first boot manually or by a script.

Add install define with the commands to setup the required
service files for automatic start.

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/network-manager/network-manager.mk |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

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
