From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 09:54:49 +0200
Subject: [Buildroot] [git commit] busybox: convert to kconfig-package
	infrastructure
Message-ID: <20140804075840.4FEC49D11C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a970021831c9f710fb45c633ca14902e98f75294
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch converts the busybox package to the new kconfig-package
infrastructure, thus removing code duplication and ensuring a consistent
behavior of kconfig packages.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |   25 +++++++++----------------
 1 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f7d28a7..db29636 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -45,6 +45,10 @@ ifndef BUSYBOX_CONFIG_FILE
 	BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
 endif
 
+BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
+BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
+BUSYBOX_KCONFIG_OPT = $(BUSYBOX_MAKE_OPTS)
+
 define BUSYBOX_PERMISSIONS
 /bin/busybox			 f 4755	0 0 - - - - -
 /usr/share/udhcpc/default.script f 755  0 0 - - - - -
@@ -136,10 +140,6 @@ define BUSYBOX_NETKITTELNET
 endef
 endif
 
-define BUSYBOX_COPY_CONFIG
-	$(INSTALL) -D -m 0644 $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)
-endef
-
 # Disable shadow passwords support if unsupported by the C library
 ifeq ($(BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS),)
 define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
@@ -190,8 +190,7 @@ define BUSYBOX_NOCLOBBER_INSTALL
 	$(SED) 's/^noclobber="0"$$/noclobber="1"/' $(@D)/applets/install.sh
 endef
 
-define BUSYBOX_CONFIGURE_CMDS
-	$(BUSYBOX_COPY_CONFIG)
+define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_MMU)
 	$(BUSYBOX_SET_LARGEFILE)
 	$(BUSYBOX_SET_IPV6)
@@ -203,6 +202,9 @@ define BUSYBOX_CONFIGURE_CMDS
 	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
+endef
+
+define BUSYBOX_CONFIGURE_CMDS
 	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
 		-C $(@D) oldconfig
 	$(BUSYBOX_NOCLOBBER_INSTALL)
@@ -224,13 +226,4 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 endef
 
-$(eval $(generic-package))
-
-busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR) \
-		$(subst busybox-,,$@)
-	rm -f $(BUSYBOX_DIR)/.stamp_built
-	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
-
-busybox-update-config: busybox-configure
-	cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
+$(eval $(kconfig-package))
