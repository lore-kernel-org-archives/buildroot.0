From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Jun 2013 22:37:01 +0200
Subject: [Buildroot] [git commit] gpsd: install udev rules, if appropriate
Message-ID: <20130612203926.381809AD4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b26883c9882d633995bd09b91106b88fe4f52709
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gpsd/gpsd.mk |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

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
