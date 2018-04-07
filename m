From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  7 Apr 2018 20:19:49 +0200
Subject: [Buildroot] [PATCH v1 1/3] zstd: enable host/taget libzstd support
Message-ID: <20180407181951.22037-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/zstd/zstd.mk | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index c0fa88026c..0c489014be 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -6,6 +6,7 @@
 
 ZSTD_VERSION = v1.3.3
 ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
+ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
 ZSTD_LICENSE_FILES = LICENSE COPYING
 
@@ -36,14 +37,32 @@ else
 ZSTD_OPTS += HAVE_LZ4=0
 endif
 
+define HOST_ZSTD_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		-C $(@D) lib
+endef
+
 define ZSTD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		-C $(@D) zstd
+		-C $(@D) lib zstd
+endef
+
+define HOST_ZSTD_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D)/lib install
+endef
+
+define ZSTD_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/lib install
 endef
 
 define ZSTD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/lib install
 endef
 
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.16.3
