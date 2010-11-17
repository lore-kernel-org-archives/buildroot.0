From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 17 Nov 2010 01:47:11 -0500
Subject: [Buildroot] [PATCH 1/2] busybox: unify duplicated build steps
Message-ID: <1289976432-22684-1-git-send-email-vapier@gentoo.org>
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
 package/busybox/busybox.mk |   21 ++++++---------------
 1 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index b7f4740..5ef1622 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -123,15 +123,13 @@ endef
 define BUSYBOX_BUILD_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
 		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
+		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
+		-C $(BUSYBOX_DIR)
 endef
 
 ifeq ($(BR2_PACKAGE_BUSYBOX_FULLINSTALL),y)
 define BUSYBOX_INSTALL_BINARY
-	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
-		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
-		-C $(@D) install
+	$(BUSYBOX_BUILD_CMDS) install
 endef
 else
 define BUSYBOX_INSTALL_BINARY
@@ -145,24 +143,17 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 endef
 
 define BUSYBOX_UNINSTALL_TARGET_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
-		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
-		-C $(@D) uninstall
+	$(BUSYBOX_BUILD_CMDS) uninstall
 endef
 
 define BUSYBOX_CLEAN_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
-		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
-		-C $(@D) clean
+	$(BUSYBOX_BUILD_CMDS) clean
 endef
 
 $(eval $(call GENTARGETS,package,busybox))
 
 busybox-menuconfig:	$(BUSYBOX_DIR)/.stamp_extracted
-	$(BUSYBOX_MAKE_ENV) $(MAKE) ARCH=$(KERNEL_ARCH) \
-		CROSS_COMPILE="$(TARGET_CROSS)" -C $(BUSYBOX_DIR) menuconfig
+	$(BUSYBOX_BUILD_CMDS) menuconfig
 	rm -f $(BUSYBOX_DIR)/.stamp_built
 	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
 
-- 
1.7.3.2
