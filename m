From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:18:25 +0100
Subject: [Buildroot] [git commit] busybox: install init script and config
	file unconditionally
Message-ID: <20141201233009.2261880051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de78a9896fb89b3d5cff18c592ac1a61e2db23bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

[Peter: drop && conditional from watchdog installation as noted by Yann]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk |   30 ++++++++++++------------------
 1 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index eb2f3f1..9fb389d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -57,14 +57,12 @@ endef
 # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
 define BUSYBOX_INSTALL_MDEV_SCRIPT
-	[ -f $(TARGET_DIR)/etc/init.d/S10mdev ] || \
-		$(INSTALL) -D -m 0755 package/busybox/S10mdev \
-			$(TARGET_DIR)/etc/init.d/S10mdev
+	$(INSTALL) -D -m 0755 package/busybox/S10mdev \
+		$(TARGET_DIR)/etc/init.d/S10mdev
 endef
 define BUSYBOX_INSTALL_MDEV_CONF
-	[ -f $(TARGET_DIR)/etc/mdev.conf ] || \
-		$(INSTALL) -D -m 0644 package/busybox/mdev.conf \
-			$(TARGET_DIR)/etc/mdev.conf
+	$(INSTALL) -D -m 0644 package/busybox/mdev.conf \
+		$(TARGET_DIR)/etc/mdev.conf
 endef
 define BUSYBOX_SET_MDEV
 	$(call KCONFIG_ENABLE_OPT,CONFIG_MDEV,$(BUSYBOX_BUILD_CONFIG))
@@ -165,9 +163,8 @@ endif
 
 define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
-		[ -f $(TARGET_DIR)/etc/init.d/S01logging ] || \
-			$(INSTALL) -m 0755 -D package/busybox/S01logging \
-				$(TARGET_DIR)/etc/init.d/S01logging; \
+		$(INSTALL) -m 0755 -D package/busybox/S01logging \
+			$(TARGET_DIR)/etc/init.d/S01logging; \
 	else rm -f $(TARGET_DIR)/etc/init.d/S01logging; fi
 endef
 
@@ -176,11 +173,10 @@ define BUSYBOX_SET_WATCHDOG
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG,$(BUSYBOX_BUILD_CONFIG))
 endef
 define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
-	[ -f $(TARGET_DIR)/etc/init.d/S15watchdog ] || \
-		$(INSTALL) -D -m 0755 package/busybox/S15watchdog \
-			$(TARGET_DIR)/etc/init.d/S15watchdog && \
-		$(SED) s/PERIOD/$(call qstrip,$(BR2_PACKAGE_BUSYBOX_WATCHDOG_PERIOD))/ \
-			$(TARGET_DIR)/etc/init.d/S15watchdog
+	$(INSTALL) -D -m 0755 package/busybox/S15watchdog \
+		$(TARGET_DIR)/etc/init.d/S15watchdog
+	$(SED) s/PERIOD/$(call qstrip,$(BR2_PACKAGE_BUSYBOX_WATCHDOG_PERIOD))/ \
+		$(TARGET_DIR)/etc/init.d/S15watchdog
 endef
 endif
 
@@ -214,10 +210,8 @@ endef
 
 define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
-	if [ ! -f $(TARGET_DIR)/usr/share/udhcpc/default.script ]; then \
-		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
-			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
-	fi
+	$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
+		$(TARGET_DIR)/usr/share/udhcpc/default.script
 	$(BUSYBOX_INSTALL_MDEV_CONF)
 endef
 
