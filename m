From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  2 Apr 2019 22:56:01 +0200
Subject: [Buildroot] [PATCH 1/2] package/libfuse: only install udev rules if
 (e)udev is enabled
Message-ID: <20190402205602.1823-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No point in installing udev rules if nothing will use it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-- 
2.11.0
