From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Aug 2013 18:50:34 +0200
Subject: [Buildroot] [git commit] sunxi-cedarx: fix armel and internal
	toolchain build issues
Message-ID: <20130807165021.D525D9B234@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=129233fed6295d154acc2c84b5d51236be4e61d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes autobuilder issues
http://autobuild.buildroot.org/results/a06/a06fe1f2fa2cb57d57524eff5f7b88fe36fdbf68
http://autobuild.buildroot.org/results/328/328b36c3cbf952cccabf16a25fc13f0c3515e8bd

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sunxi-cedarx/sunxi-cedarx.mk |   30 ++++++++++++++++++++----------
 1 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/package/sunxi-cedarx/sunxi-cedarx.mk b/package/sunxi-cedarx/sunxi-cedarx.mk
index b1c3717..07c85d4 100644
--- a/package/sunxi-cedarx/sunxi-cedarx.mk
+++ b/package/sunxi-cedarx/sunxi-cedarx.mk
@@ -9,14 +9,13 @@ SUNXI_CEDARX_SITE = http://github.com/linux-sunxi/cedarx-libs/tarball/$(SUNXI_CE
 
 SUNXI_CEDARX_INSTALL_STAGING = YES
 
+SUNXI_CEDARX_CONFIGURE_OPTS = \
+	CROSS_COMPILE=$(TARGET_CROSS)
+
 ifeq ($(BR2_ARM_EABIHF),y)
 SUNXI_CEDARX_BIN_DIR = $(@D)/libcedarv/linux-armhf
-else
-SUNXI_CEDARX_BIN_DIR = $(@D)/libcedarv/linux-armel
-endif
-
-define SUNXI_CEDARX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(SUNXI_CEDARX_BIN_DIR)
+# libavheap.so is only available on EABIHF
+define SUNXI_CEDARX_BUILD_AVHEAP
 	$(TARGET_CC) $(TARGET_CFLAGS) \
 		-c $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/avheap.c \
 		-o $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/avheap.o \
@@ -26,6 +25,19 @@ define SUNXI_CEDARX_BUILD_CMDS
 		-o $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/libavheap.so \
 		$(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/avheap.o
 endef
+define SUNXI_CEDARX_INSTALL_AVHEAP
+	$(INSTALL) -D -m 755 $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/libavheap.so \
+		$(1)/usr/lib/libavheap.so
+endef
+else
+SUNXI_CEDARX_BIN_DIR = $(@D)/libcedarv/linux-armel
+endif
+
+define SUNXI_CEDARX_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(SUNXI_CEDARX_BIN_DIR) \
+		$(SUNXI_CEDARX_CONFIGURE_OPTS)
+	$(SUNXI_CEDARX_BUILD_AVHEAP)
+endef
 
 define SUNXI_CEDARX_INSTALL_STAGING_CMDS
 	$(INSTALL) -d -m 755 $(STAGING_DIR)/usr/include/libvecore
@@ -35,15 +47,13 @@ define SUNXI_CEDARX_INSTALL_STAGING_CMDS
 		$(STAGING_DIR)/usr/include/
 	$(INSTALL) -D -m 755 $(SUNXI_CEDARX_BIN_DIR)/libvecore/libvecore.so \
 		$(STAGING_DIR)/usr/lib/libvecore.so
-	$(INSTALL) -D -m 755 $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/libavheap.so \
-		$(STAGING_DIR)/usr/lib/libavheap.so
+	$(call SUNXI_CEDARX_INSTALL_AVHEAP, $(STAGING_DIR))
 endef
 
 define SUNXI_CEDARX_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(SUNXI_CEDARX_BIN_DIR)/libvecore/libvecore.so \
 		$(TARGET_DIR)/usr/lib/libvecore.so
-	$(INSTALL) -D -m 755 $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/libavheap.so \
-		$(TARGET_DIR)/usr/lib/libavheap.so
+	$(call SUNXI_CEDARX_INSTALL_AVHEAP, $(TARGET_DIR))
 endef
 
 $(eval $(generic-package))
