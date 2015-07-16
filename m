From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 16 Jul 2015 18:30:35 +0200
Subject: [Buildroot] [PATCH] package: Fix overwrite inittab w/ default
	skeleton
Message-ID: <1437064235-32432-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If you select a custom skeleton, and have busybox or sysvinit as init,
the install of their inittab would trigger, rendering yours useless.

The hooks doing the sed in the skeleton package would only trigger for a
default skeleton.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/busybox/busybox.mk   | 2 +-
 package/sysvinit/sysvinit.mk | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 6b2abca..7c208d3 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -148,7 +148,7 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	else rm -f $(TARGET_DIR)/etc/init.d/S01logging; fi
 endef
 
-ifeq ($(BR2_INIT_BUSYBOX),y)
+ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT)$(BR2_INIT_BUSYBOX),yy)
 define BUSYBOX_INSTALL_INITTAB
 	$(INSTALL) -D -m 0644 package/busybox/inittab $(TARGET_DIR)/etc/inittab
 endef
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 2460dd9..34800d8 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -30,14 +30,20 @@ define SYSVINIT_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) SULOGINLIBS="-lcrypt" -C $(@D)/src
 endef
 
+ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT)$(BR2_INIT_SYSVINIT),yy)
+define SYSVINIT_INSTALL_INITTAB
+	$(INSTALL) -D -m 0644 package/sysvinit/inittab $(TARGET_DIR)/etc/inittab
+endef
+endif
+
 define SYSVINIT_INSTALL_TARGET_CMDS
 	for x in halt init shutdown killall5; do \
 		$(INSTALL) -D -m 0755 $(@D)/src/$$x $(TARGET_DIR)/sbin/$$x || exit 1; \
 	done
-	$(INSTALL) -D -m 0644 package/sysvinit/inittab $(TARGET_DIR)/etc/inittab
 	ln -sf /sbin/halt $(TARGET_DIR)/sbin/reboot
 	ln -sf /sbin/halt $(TARGET_DIR)/sbin/poweroff
 	ln -sf killall5 $(TARGET_DIR)/sbin/pidof
+	$(SYSVINIT_INSTALL_INITTAB)
 endef
 
 $(eval $(generic-package))
-- 
2.1.4
