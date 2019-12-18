From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 18:33:22 +0100
Subject: [Buildroot] [git commit] package/network-manager: adapt to
 systemctl preset-all
Message-ID: <20191218172934.7C0A78806D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb075916f411915eefa056385862b7d6a793005c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NM has three services
* NetworkManger.service : the main daemon
* NetworkManger-dispatcher.service : a daemon handling network callbacks
* NetworkManager-wait-online.service : sync of other services with network-online

Only the first two were activated. We now also enable
wait-online. Not enabling it was probably a bug.

Note that buildroot adds an alias dbus-org.freedesktop.NetworkManager
Adding an alias that is not known upstream is not clean,
but I left it for backward compatibility

Signed-off-by: J??r??my Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/network-manager/network-manager.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 7de2c220fe..56b768cdef 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -88,16 +88,9 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSV
 endef
 
 define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-
 	ln -sf /usr/lib/systemd/system/NetworkManager.service \
 		$(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.NetworkManager.service
 
-	ln -sf /usr/lib/systemd/system/NetworkManager.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/NetworkManager.service
-
-	ln -sf /usr/lib/systemd/system/NetworkManager-dispatcher.service \
-		$(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service
 endef
 
 $(eval $(autotools-package))
