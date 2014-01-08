From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Wed,  8 Jan 2014 14:48:33 +0100
Subject: [Buildroot] [PATCH] force devtmpfs and inotify kernel option when
	udev is used as dev handler
Message-ID: <1389188913-15173-1-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>

---
patch suggested by Thomas Petazzoni

I also added devtmpfs because it's documented as needed but wasn't enforced
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index fa8aa0c..2482952 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -185,6 +185,10 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
+	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),
+                $(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KTAP),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_EVENT_TRACING,$(@D)/.config)
-- 
1.8.5.2
