From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 30 Aug 2020 18:07:33 +0200
Subject: [Buildroot] [git commit branch/next] packages/{eudev,
 systemd}: move common users to package/udev
Message-ID: <20200901193956.CE81484F31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d648d81dd581093eab1735e5d35b8e33e659ac5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use UDEV_USERS, now that it's suported by virtual packages.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/eudev/eudev.mk     | 7 -------
 package/systemd/systemd.mk | 3 ---
 package/udev/udev.mk       | 7 +++++++
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 9cf4361956..d4133a5ace 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -55,13 +55,6 @@ define EUDEV_INSTALL_INIT_OPENRC
 	@:
 endef
 
-# Required by default rules for input devices
-define EUDEV_USERS
-	- - input -1 * - - - Input device group
-	- - render -1 * - - - DRI rendering nodes
-	- - kvm -1 * - - - kvm nodes
-endef
-
 HOST_EUDEV_DEPENDENCIES = host-gperf host-pkgconf
 
 HOST_EUDEV_SYSCONFDIR = $(if $(BR2_PACKAGE_SYSTEMD),/usr/lib,/etc)
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e0e1dd1a3f..41f1824d11 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -523,9 +523,6 @@ endef
 
 define SYSTEMD_USERS
 	# udev user groups
-	- - input -1 * - - - Input device group
-	- - render -1 * - - - DRI rendering nodes
-	- - kvm -1 * - - - kvm nodes
 	# systemd user groups
 	- - systemd-journal -1 * - - - Journal
 	$(SYSTEMD_REMOTE_USER)
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
