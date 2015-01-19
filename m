From: Maxim Mikityanskiy <maxtram95@gmail.com>
Date: Mon, 19 Jan 2015 18:14:01 +0200
Subject: [Buildroot] [PATCH 01/16] package/busybox: optional udhcpc script
In-Reply-To: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
Message-ID: <1421684056-5266-2-git-send-email-maxtram95@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create new config option BR2_PACKAGE_BUSYBOX_UDHCPC_SCRIPT to control
whether to install optional udhcpc default.script. It is possible that
udhcpc is not enabled in busybox config, so default.script is useless in
that case.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 package/busybox/Config.in  |  5 +++++
 package/busybox/busybox.mk | 15 +++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index f2f2990..626faf5 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -26,6 +26,11 @@ config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	  Show packages in menuconfig that are potentially also provided
 	  by busybox.
 
+config BR2_PACKAGE_BUSYBOX_UDHCPC_SCRIPT
+	bool "Install the udhcpc default script"
+	help
+	  Install /usr/share/udhcp/default.script for udhcpc.
+
 config BR2_PACKAGE_BUSYBOX_WATCHDOG
 	bool "Install the watchdog daemon startup script"
 	help
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f68a2f8..fbdde62 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -49,10 +49,20 @@ BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
 BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
 BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_UDHCPC_SCRIPT),y)
+define BUSYBOX_INSTALL_UDHCPC_SCRIPT
+	$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
+		$(TARGET_DIR)/usr/share/udhcpc/default.script; \
+endef
 define BUSYBOX_PERMISSIONS
 	/bin/busybox                     f 4755 0  0 - - - - -
 	/usr/share/udhcpc/default.script f 755  0  0 - - - - -
 endef
+else
+define BUSYBOX_PERMISSIONS
+	/bin/busybox                     f 4755 0  0 - - - - -
+endef
+endif
 
 # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
@@ -210,10 +220,7 @@ endef
 
 define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
-	$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
-		$(TARGET_DIR)/usr/share/udhcpc/default.script
-	$(INSTALL) -m 0755 -d \
-		$(TARGET_DIR)/usr/share/udhcpc/default.script.d
+	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
 endef
 
-- 
2.2.1
