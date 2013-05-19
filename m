From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 19 May 2013 20:53:57 +0100
Subject: [Buildroot] [PATCH] gpsd: install udev rules, if appropriate
Message-ID: <1368993237-7003-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/gpsd/gpsd.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 384726d..808cce7 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -222,4 +222,17 @@ define GPSD_INSTALL_STAGING_CMDS
 		install)
 endef
 
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),y)
+define GPSD_INSTALL_UDEV_RULES
+	(cd $(@D); \
+		$(GPSD_SCONS_ENV) \
+		DESTDIR=$(TARGET_DIR) \
+		$(SCONS) \
+		$(GPSD_SCONS_OPTS) \
+		udev-install)
+endef
+
+GPSD_POST_INSTALL_TARGET_HOOKS += GPSD_INSTALL_UDEV_RULES
+endif
+
 $(eval $(generic-package))
-- 
1.8.1.2
