From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 12:47:04 +0200
Subject: [Buildroot] [PATCH] sunxi-cedarx: bump version, improve EABI support
Message-ID: <1413110824-9528-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Spenser Gilliland <spenser@gillilanding.com>

This commit bumps the sunxi-cedarx package version to the latest git
commit, which also provides a better support for ARM EABI, since it
now has a non-EABIhf variant of avheap.so available.

Built tested on ARM EABI and ARM EABIhf.

[Thomas: compared to Spenser's original version, bumped to a newer
version, and dropped the supported for the demo since it didn't build,
and fixing it isn't trivial.]

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sunxi-cedarx/sunxi-cedarx.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/sunxi-cedarx/sunxi-cedarx.mk b/package/sunxi-cedarx/sunxi-cedarx.mk
index 54d081e..219f1bc 100644
--- a/package/sunxi-cedarx/sunxi-cedarx.mk
+++ b/package/sunxi-cedarx/sunxi-cedarx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_CEDARX_VERSION = 74923e55fc3ef512d4cd2462da58ae5331611f37
+SUNXI_CEDARX_VERSION = b8f52d913f73720e50d8f1b2f8610467b575dc45
 SUNXI_CEDARX_SITE = $(call github,linux-sunxi,cedarx-libs,$(SUNXI_CEDARX_VERSION))
 
 SUNXI_CEDARX_INSTALL_STAGING = YES
@@ -14,7 +14,10 @@ SUNXI_CEDARX_CONFIGURE_OPTS = \
 
 ifeq ($(BR2_ARM_EABIHF),y)
 SUNXI_CEDARX_BIN_DIR = $(@D)/libcedarv/linux-armhf
-# libavheap.so is only available on EABIHF
+else
+SUNXI_CEDARX_BIN_DIR = $(@D)/libcedarv/linux-armel2
+endif
+
 define SUNXI_CEDARX_BUILD_AVHEAP
 	$(TARGET_CC) $(TARGET_CFLAGS) \
 		-c $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/avheap.c \
@@ -25,13 +28,11 @@ define SUNXI_CEDARX_BUILD_AVHEAP
 		-o $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/libavheap.so \
 		$(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/avheap.o
 endef
+
 define SUNXI_CEDARX_INSTALL_AVHEAP
 	$(INSTALL) -D -m 755 $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/libavheap.so \
 		$(1)/usr/lib/libavheap.so
 endef
-else
-SUNXI_CEDARX_BIN_DIR = $(@D)/libcedarv/linux-armel
-endif
 
 define SUNXI_CEDARX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(SUNXI_CEDARX_BIN_DIR) \
-- 
2.0.0
