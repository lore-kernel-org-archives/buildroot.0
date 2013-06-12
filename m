From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 12 Jun 2013 18:52:35 +0100
Subject: [Buildroot] [PATCH v2] gpsd: install udev rules, if appropriate
Message-ID: <1371059555-21015-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 v2: Resend; no changes.

 package/gpsd/gpsd.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 33aff5e..be2e681 100644
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
