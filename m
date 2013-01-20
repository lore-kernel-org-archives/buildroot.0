From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jan 2013 00:52:16 +0100
Subject: [Buildroot] [RFC v1 07/14] busybox: support out of tree build
In-Reply-To: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358725943-31485-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |   26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 9154c08..36b0903 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -15,6 +15,8 @@ BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPLv2
 BUSYBOX_LICENSE_FILES = LICENSE
 
+BUSYBOX_SUPPORTS_OUT_OF_TREE = YES
+
 BUSYBOX_CFLAGS = \
 	$(TARGET_CFLAGS) \
 	-I$(LINUX_HEADERS_DIR)/include
@@ -32,7 +34,7 @@ BUSYBOX_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
 BUSYBOX_CFLAGS_busybox += -ltirpc
 endif
 
-BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
+BUSYBOX_BUILD_CONFIG = $(BUSYBOX_BUILDDIR)/.config
 # Allows the build system to tweak CFLAGS
 BUSYBOX_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
@@ -173,10 +175,8 @@ define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
 endef
 endif
 
-# We do this here to avoid busting a modified .config in configure
-BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
-
 define BUSYBOX_CONFIGURE_CMDS
+	$(BUSYBOX_COPY_CONFIG)
 	$(BUSYBOX_SET_LARGEFILE)
 	$(BUSYBOX_SET_IPV6)
 	$(BUSYBOX_PREFER_STATIC)
@@ -188,15 +188,15 @@ define BUSYBOX_CONFIGURE_CMDS
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
 	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
-		-C $(@D) oldconfig
+		-C $(BUSYBOX_SRCDIR) O=$(@D) oldconfig
 endef
 
 define BUSYBOX_BUILD_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D)
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_SRCDIR) O=$(@D)
 endef
 
 define BUSYBOX_INSTALL_TARGET_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_SRCDIR) O=$(@D) install
 	if [ ! -f $(TARGET_DIR)/usr/share/udhcpc/default.script ]; then \
 		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
 			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
@@ -208,20 +208,20 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 endef
 
 define BUSYBOX_UNINSTALL_TARGET_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) uninstall
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_SRCDIR) O=$(@D) uninstall
 endef
 
 define BUSYBOX_CLEAN_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) clean
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_SRCDIR) O=$(@D) clean
 endef
 
 $(eval $(generic-package))
 
 busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR) \
-		$(subst busybox-,,$@)
-	rm -f $(BUSYBOX_DIR)/.stamp_built
-	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_SRCDIR) \
+		O=$(BUSYBOX_BUILDDIR) $(subst busybox-,,$@)
+	rm -f $(BUSYBOX_BUILDDIR)/.stamp_built
+	rm -f $(BUSYBOX_BUILDDIR)/.stamp_target_installed
 
 busybox-update-config:
 	cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
-- 
1.7.9.5
