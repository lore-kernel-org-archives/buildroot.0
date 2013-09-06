From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  5 Sep 2013 23:25:16 -0500
Subject: [Buildroot] [PATCH v2 2/7] sunxi-cedarx: bump to newer version,
	use armel2 binaries, add demo
In-Reply-To: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1378441521-10050-3-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/sunxi-cedarx/Config.in       | 10 ++++++++++
 package/sunxi-cedarx/sunxi-cedarx.mk | 26 ++++++++++++++++++++++----
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/package/sunxi-cedarx/Config.in b/package/sunxi-cedarx/Config.in
index b280db0..aa520b5 100644
--- a/package/sunxi-cedarx/Config.in
+++ b/package/sunxi-cedarx/Config.in
@@ -10,5 +10,15 @@ config BR2_PACKAGE_SUNXI_CEDARX
 	  http://github.com/linux-sunxi/cedarx-libs
 	  http://linux-sunxi.org/CedarX
 
+if BR2_PACKAGE_SUNXI_CEDARX
+
+config BR2_PACKAGE_SUNXI_CEDARX_DEMO
+	bool "install enc_dec_test demo"
+	help
+	  Install a test program which verifies the functionality of the CedarX
+	  libraries
+
+endif
+
 comment "sunxi-cedarx requires an eglibc/glibc based toolchain"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
diff --git a/package/sunxi-cedarx/sunxi-cedarx.mk b/package/sunxi-cedarx/sunxi-cedarx.mk
index 07c85d4..bc8ee32 100644
--- a/package/sunxi-cedarx/sunxi-cedarx.mk
+++ b/package/sunxi-cedarx/sunxi-cedarx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_CEDARX_VERSION = 74923e55fc
+SUNXI_CEDARX_VERSION = 74c3e9052
 SUNXI_CEDARX_SITE = http://github.com/linux-sunxi/cedarx-libs/tarball/$(SUNXI_CEDARX_VERSION)
 
 SUNXI_CEDARX_INSTALL_STAGING = YES
@@ -14,7 +14,12 @@ SUNXI_CEDARX_CONFIGURE_OPTS = \
 
 ifeq ($(BR2_ARM_EABIHF),y)
 SUNXI_CEDARX_BIN_DIR = $(@D)/libcedarv/linux-armhf
-# libavheap.so is only available on EABIHF
+SUNXI_CEDARX_SAMPLE_LOC = $(SUNXI_CEDARX_BIN_DIR)/sample/ve
+else
+SUNXI_CEDARX_BIN_DIR = $(@D)/libcedarv/linux-armel2
+SUNXI_CEDARX_SAMPLE_LOC = $(SUNXI_CEDARX_BIN_DIR)/sample/output/ve
+endif
+
 define SUNXI_CEDARX_BUILD_AVHEAP
 	$(TARGET_CC) $(TARGET_CFLAGS) \
 		-c $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/avheap.c \
@@ -25,18 +30,30 @@ define SUNXI_CEDARX_BUILD_AVHEAP
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
+
+ifeq ($(BR2_PACKAGE_SUNXI_CEDARX_DEMO),y)
+
+define SUNXI_CEDARX_BUILD_DEMO
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(SUNXI_CEDARX_BIN_DIR)/sample
+endef
+
+define SUNXI_CEDARX_INSTALL_DEMO
+	$(INSTALL) -D -m 755 $(SUNXI_CEDARX_SAMPLE_LOC) \
+		$(TARGET_DIR)/usr/bin/ve
+endef
+
 endif
 
 define SUNXI_CEDARX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(SUNXI_CEDARX_BIN_DIR) \
 		$(SUNXI_CEDARX_CONFIGURE_OPTS)
 	$(SUNXI_CEDARX_BUILD_AVHEAP)
+	$(SUNXI_CEDARX_BUILD_DEMO)
 endef
 
 define SUNXI_CEDARX_INSTALL_STAGING_CMDS
@@ -54,6 +71,7 @@ define SUNXI_CEDARX_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(SUNXI_CEDARX_BIN_DIR)/libvecore/libvecore.so \
 		$(TARGET_DIR)/usr/lib/libvecore.so
 	$(call SUNXI_CEDARX_INSTALL_AVHEAP, $(TARGET_DIR))
+	$(SUNXI_CEDARX_INSTALL_DEMO)
 endef
 
 $(eval $(generic-package))
-- 
1.8.1.2
