From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 18 Oct 2011 15:04:23 +0200
Subject: [Buildroot] [git commit] busybox: only install S01logging / S10mdev
	if not present in fs skeleton
Message-ID: <20111018151706.3B35E8E876@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6161049aeda617a3ed93253c1b0122aecf90d4c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To allow custom syslogd / mdev configutations.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 0751f6a..c95190d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -31,7 +31,9 @@ endif
 # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
 define BUSYBOX_INSTALL_MDEV_SCRIPT
-	install -m 0755 package/busybox/S10mdev $(TARGET_DIR)/etc/init.d
+	[ -f $(TARGET_DIR)/etc/init.d/S10mdev ] ||
+		install -D -m 0755 package/busybox/S10mdev \
+			$(TARGET_DIR)/etc/init.d/S10mdev
 endef
 define BUSYBOX_INSTALL_MDEV_CONF
 	[ -f $(TARGET_DIR)/etc/mdev.conf ] || \
@@ -129,8 +131,9 @@ endif
 
 define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
-		$(INSTALL) -m 0755 -D package/busybox/S01logging \
-			$(TARGET_DIR)/etc/init.d/S01logging; \
+		[ -f $(TARGET_DIR)/etc/init.d/S01logging ] || \
+			$(INSTALL) -m 0755 -D package/busybox/S01logging \
+				$(TARGET_DIR)/etc/init.d/S01logging; \
 	else rm -f $(TARGET_DIR)/etc/init.d/S01logging; fi
 endef
 
