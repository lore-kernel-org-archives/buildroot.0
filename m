From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 21:39:30 +0200
Subject: [Buildroot] [git commit] package/libfuse: only install udev rules
 if (e)udev is enabled
Message-ID: <20190403193600.68D8F8D1ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cba22bbfa21ac27d28cfb7e9973c2c91e30568f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No point in installing udev rules if nothing will use it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libfuse/libfuse.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 84027ebedb..ab0131b057 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -17,11 +17,18 @@ LIBFUSE_CONF_OPTS = \
 	--enable-util \
 	UDEV_RULES_PATH=/lib/udev/rules.d
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+define LIBFUSE_INSTALL_UDEV
+	mkdir -p $(TARGET_DIR)/lib/udev/rules.d
+	cp $(STAGING_DIR)/lib/udev/rules.d/*-fuse.rules $(TARGET_DIR)/lib/udev/rules.d
+endef
+
+LIBFUSE_POST_INSTALL_TARGET_HOOKS += LIBFUSE_INSTALL_UDEV
+endif
+
 define LIBFUSE_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/
 	cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
-	mkdir -p $(TARGET_DIR)/lib/udev/rules.d
-	cp $(STAGING_DIR)/lib/udev/rules.d/*-fuse.rules $(TARGET_DIR)/lib/udev/rules.d
 endef
 
 define LIBFUSE_DEVICES
