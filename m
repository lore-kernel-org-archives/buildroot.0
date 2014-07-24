From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Jul 2014 19:49:32 +0200
Subject: [Buildroot] [PATCH 5 of 7] busybox: convert to kconfig-package
	infrastructure
In-Reply-To: <patchbomb.1406224167@localhost>
References: <patchbomb.1406224167@localhost>
Message-ID: <a850aa264c3d0ae5c61f.1406224172@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch converts the busybox package to the new kconfig-package
infrastructure, thus removing code duplication and ensuring a consistent
behavior of kconfig packages.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/busybox/busybox.mk |  21 ++++++++-------------
 1 files changed, 8 insertions(+), 13 deletions(-)

diff -r 80c907c0dfca -r a850aa264c3d package/busybox/busybox.mk
--- a/package/busybox/busybox.mk	Wed Jul 23 20:12:32 2014 +0200
+++ b/package/busybox/busybox.mk	Tue Jul 22 20:43:10 2014 +0200
@@ -136,10 +136,6 @@
 endef
 endif
 
-define BUSYBOX_COPY_CONFIG
-	$(INSTALL) -D -m 0644 $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)
-endef
-
 # Disable shadow passwords support if unsupported by the C library
 ifeq ($(BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS),)
 define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
@@ -190,8 +186,7 @@
 	$(SED) 's/^noclobber="0"$$/noclobber="1"/' $(@D)/applets/install.sh
 endef
 
-define BUSYBOX_CONFIGURE_CMDS
-	$(BUSYBOX_COPY_CONFIG)
+define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_MMU)
 	$(BUSYBOX_SET_LARGEFILE)
 	$(BUSYBOX_SET_IPV6)
@@ -203,6 +198,9 @@
 	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
+endef
+
+define BUSYBOX_CONFIGURE_CMDS
 	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
 		-C $(@D) oldconfig
 	$(BUSYBOX_NOCLOBBER_INSTALL)
@@ -226,11 +224,8 @@
 
 $(eval $(generic-package))
 
-busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR) \
-		$(subst busybox-,,$@)
-	rm -f $(BUSYBOX_DIR)/.stamp_built
-	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
+BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
+BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
+BUSYBOX_KCONFIG_OPT = $(BUSYBOX_MAKE_OPTS)
 
-busybox-update-config: busybox-configure
-	cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
+$(eval $(kconfig-package))
