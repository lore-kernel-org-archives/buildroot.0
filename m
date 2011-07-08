From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  8 Jul 2011 17:47:53 +0200
Subject: [Buildroot] [PATCH] busybox: provide /etc/mdev.conf if mdev is used
Message-ID: <1310140073-14231-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without an mdev.conf file installed, mdev generates some /dev entries in
an incorrect or non-standard way. Some examples:
 1. /dev/null has permissions 660, but it should be accessible to normal
    users;
 2. alsa devices get created in /dev, not /dev/snd as is more common,
    and as the default value of BR2_PACKAGE_ALSA_LIB_DEVDIR suggests;
 3. event<N> files are created in /dev, not /dev/input.

This mdev.conf is a selection from the examples provided in the busybox
sources with minor tweaks.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/busybox/busybox.mk |    4 ++++
 package/busybox/mdev.conf  |   35 +++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/mdev.conf

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 509c3bb..30b7ab6 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -33,6 +33,9 @@ ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
 define BUSYBOX_INSTALL_MDEV_SCRIPT
 	install -m 0755 package/busybox/S10mdev $(TARGET_DIR)/etc/init.d
 endef
+define BUSYBOX_INSTALL_MDEV_CONF
+	install -m 0644 package/busybox/mdev.conf $(TARGET_DIR)/etc
+endef
 define BUSYBOX_SET_MDEV
 	$(call KCONFIG_ENABLE_OPT,CONFIG_MDEV,$(BUSYBOX_BUILD_CONFIG))
 	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_MDEV_CONF,$(BUSYBOX_BUILD_CONFIG))
@@ -159,6 +162,7 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
 	fi
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
+	$(BUSYBOX_INSTALL_MDEV_CONF)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 endef
 
diff --git a/package/busybox/mdev.conf b/package/busybox/mdev.conf
new file mode 100644
index 0000000..247c0ed
--- /dev/null
+++ b/package/busybox/mdev.conf
@@ -0,0 +1,35 @@
+# null may already exist; therefore ownership has to be changed with command
+null		root:root 666 @chmod 666 $MDEV
+zero		root:root 666
+full		root:root 666
+random		root:root 444
+urandom		root:root 444
+hwrandom	root:root 444
+grsec		root:root 660
+
+kmem		root:root 640
+mem		root:root 640
+port		root:root 640
+# console may already exist; therefore ownership has to be changed with command
+console		root:tty 600 @chmod 600 $MDEV
+ptmx		root:tty 666
+pty.*		root:tty 660
+
+# Typical devices
+tty		root:tty 666
+tty[0-9]*	root:tty 660
+vcsa*[0-9]*	root:tty 660
+ttyS[0-9]*	root:root 660
+
+# alsa sound devices
+pcm.*		root:audio 660 =snd/
+control.*	root:audio 660 =snd/
+midi.*		root:audio 660 =snd/
+seq		root:audio 660 =snd/
+timer		root:audio 660 =snd/
+
+# input stuff
+event[0-9]+	root:root 640 =input/
+mice		root:root 640 =input/
+mouse[0-9]	root:root 640 =input/
+ts[0-9]		root:root 600 =input/
-- 
1.7.4.1
