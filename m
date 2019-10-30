From: unixmania at gmail.com <unixmania@gmail.com>
Date: Wed, 30 Oct 2019 10:27:59 -0300
Subject: [Buildroot] [PATCH RFC 3/3] packages/{eudev,
 systemd}: move commoun users to package/udev
In-Reply-To: <20191030132759.8643-1-unixmania@gmail.com>
References: <20191030132759.8643-1-unixmania@gmail.com>
Message-ID: <20191030132759.8643-4-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Use UDEV_USERS, now that it's suported by virtual packages.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/eudev/eudev.mk     | 7 -------
 package/systemd/systemd.mk | 3 ---
 package/udev/udev.mk       | 7 +++++++
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 2a3adb849c..c7597738b0 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -48,11 +48,4 @@ define EUDEV_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
 endef
 
-# Required by default rules for input devices
-define EUDEV_USERS
-	- - input -1 * - - - Input device group
-	- - render -1 * - - - DRI rendering nodes
-	- - kvm -1 * - - - kvm nodes
-endef
-
 $(eval $(autotools-package))
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index df40961fee..512e124149 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -477,10 +477,7 @@ define SYSTEMD_INSTALL_IMAGES_CMDS
 endef
 
 define SYSTEMD_USERS
-	- - input -1 * - - - Input device group
 	- - systemd-journal -1 * - - - Journal
-	- - render -1 * - - - DRI rendering nodes
-	- - kvm -1 * - - - kvm nodes
 	systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus messages to/from a bus
 	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
 	systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index cc4a6e3a26..05b35b21f0 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -4,4 +4,11 @@
 #
 ################################################################################
 
+# Required by default rules for input devices
+define UDEV_USERS
+	- - input -1 * - - - Input device group
+	- - render -1 * - - - DRI rendering nodes
+	- - kvm -1 * - - - kvm nodes
+endef
+
 $(eval $(virtual-package))
-- 
2.18.1
