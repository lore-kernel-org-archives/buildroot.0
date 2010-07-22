From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 18:13:00 +0200
Subject: [Buildroot] [git commit master 1/1] busybox: fix cflags
Message-ID: <20100722161658.250BE82940@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d8a41bb5364461dd62a96fbc384649edd259c485
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass CFLAGS as env rather than opt to allow the build system to tweak them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |   28 ++++++++++++++--------------
 1 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d7b86cb..086b563 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -12,8 +12,9 @@ BUSYBOX_VERSION = $(call qstrip,$(BR2_BUSYBOX_VERSION))
 BUSYBOX_SITE = http://www.busybox.net/downloads
 endif
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
-BUSYBOX_CFLAGS = "$(TARGET_CFLAGS) -I$(LINUX_HEADERS_DIR)/include"
 BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
+# Allows the build system to tweak CFLAGS
+BUSYBOX_MAKE_ENV = $(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_HEADERS_DIR)/include"
 
 ifndef BUSYBOX_CONFIG_FILE
 	BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
@@ -120,18 +121,17 @@ define BUSYBOX_CONFIGURE_CMDS
 endef
 
 define BUSYBOX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
+	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
 		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" CFLAGS=$(BUSYBOX_CFLAGS) \
-		-C $(@D)
+		CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
 endef
 
 ifeq ($(BR2_PACKAGE_BUSYBOX_FULLINSTALL),y)
 define BUSYBOX_INSTALL_BINARY
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
+	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
 		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" CFLAGS=$(BUSYBOX_CFLAGS) \
-		CONFIG_PREFIX="$(TARGET_DIR)" -C $(@D) install
+		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
+		-C $(@D) install
 endef
 else
 define BUSYBOX_INSTALL_BINARY
@@ -145,23 +145,23 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 endef
 
 define BUSYBOX_UNINSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
+	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
 		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" CFLAGS=$(BUSYBOX_CFLAGS) \
-		CONFIG_PREFIX="$(TARGET_DIR)" -C $(@D) uninstall
+		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
+		-C $(@D) uninstall
 endef
 
 define BUSYBOX_CLEAN_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
+	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
 		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" CFLAGS=$(BUSYBOX_CFLAGS) \
-		CONFIG_PREFIX="$(TARGET_DIR)" -C $(@D) clean
+		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
+		-C $(@D) clean
 endef
 
 $(eval $(call GENTARGETS,package,busybox))
 
 busybox-menuconfig:	$(BUSYBOX_DIR)/.stamp_extracted
-	$(TARGET_MAKE_ENV) $(MAKE) ARCH=$(KERNEL_ARCH) \
+	$(BUSYBOX_MAKE_ENV) $(MAKE) ARCH=$(KERNEL_ARCH) \
 		CROSS_COMPILE="$(TARGET_CROSS)" -C $(BUSYBOX_DIR) menuconfig
 	rm -f $(BUSYBOX_DIR)/.stamp_built
 	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
-- 
1.7.1
