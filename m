From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jan 2011 10:50:13 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: unify duplicated build
	steps
Message-ID: <20110111113707.6AAFC8A47A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=69df644f5c539760cc4fd425571ee9d6dc4295b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This does set a few more vars in some steps that weren't set before, but
they should be harmless in the contexts in question.  And the resulting
save in duplication is nice.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |   29 ++++++++++++-----------------
 1 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 8bff1a6..342819a 100644
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
@@ -121,16 +128,11 @@ define BUSYBOX_CONFIGURE_CMDS
 endef
 
 define BUSYBOX_BUILD_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
-		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D)
 endef
 
 define BUSYBOX_INSTALL_TARGET_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
-		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
-		-C $(@D) install
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
 	if [ ! -f $(TARGET_DIR)/usr/share/udhcpc/default.script ]; then \
 		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
 			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
@@ -138,24 +140,17 @@ define BUSYBOX_INSTALL_TARGET_CMDS
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
1.7.2.2
