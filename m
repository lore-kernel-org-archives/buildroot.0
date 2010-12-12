From: Mike Frysinger <vapier@gentoo.org>
Date: Sun, 12 Dec 2010 11:58:06 -0500
Subject: [Buildroot] [PATCH 1/2 v2] busybox: unify duplicated build steps
Message-ID: <1292173087-8806-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This does set a few more vars in some steps that weren't set before, but
they should be harmless in the contexts in question.  And the resulting
save in duplication is nice.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- remove some code unification to appease thomas

 package/busybox/busybox.mk |   29 ++++++++++++-----------------
 1 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index b7f4740..67664f6 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -15,6 +15,13 @@ BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
 # Allows the build system to tweak CFLAGS
 BUSYBOX_MAKE_ENV = $(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_HEADERS_DIR)/include"
+BUSYBOX_MAKE_OPTS = \
+	CC="$(TARGET_CC)" \
+	ARCH=$(KERNEL_ARCH) \
+	PREFIX="$(TARGET_DIR)" \
+	EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	CONFIG_PREFIX="$(TARGET_DIR)"
 
 ifndef BUSYBOX_CONFIG_FILE
 	BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
@@ -121,17 +128,12 @@ define BUSYBOX_CONFIGURE_CMDS
 endef
 
 define BUSYBOX_BUILD_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
-		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D)
 endef
 
 ifeq ($(BR2_PACKAGE_BUSYBOX_FULLINSTALL),y)
 define BUSYBOX_INSTALL_BINARY
-	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
-		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
-		-C $(@D) install
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
 endef
 else
 define BUSYBOX_INSTALL_BINARY
@@ -145,24 +147,17 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 endef
 
 define BUSYBOX_UNINSTALL_TARGET_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
-		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
-		-C $(@D) uninstall
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) uninstall
 endef
 
 define BUSYBOX_CLEAN_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
-		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
-		-C $(@D) clean
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) clean
 endef
 
 $(eval $(call GENTARGETS,package,busybox))
 
 busybox-menuconfig:	$(BUSYBOX_DIR)/.stamp_extracted
-	$(BUSYBOX_MAKE_ENV) $(MAKE) ARCH=$(KERNEL_ARCH) \
-		CROSS_COMPILE="$(TARGET_CROSS)" -C $(BUSYBOX_DIR) menuconfig
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) menuconfig
 	rm -f $(BUSYBOX_DIR)/.stamp_built
 	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
 
-- 
1.7.3.3
