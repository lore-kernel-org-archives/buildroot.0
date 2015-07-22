From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jul 2015 16:58:55 +0200
Subject: [Buildroot] [PATCH 4/4 v8] package/linux-backports: switch to using
	the kernel-module infra
In-Reply-To: <cover.1437576751.git.yann.morin.1998@free.fr>
References: <cover.1437576751.git.yann.morin.1998@free.fr>
Message-ID: <200f17ef13ac12610b33139a1b1f8820fc0c85bd.1437576751.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Petr Vorel <petr.vorel@gmail.com>
---
 package/linux-backports/linux-backports.mk | 32 +++++++++++++-----------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
index 790d7e4..7c10270 100644
--- a/package/linux-backports/linux-backports.mk
+++ b/package/linux-backports/linux-backports.mk
@@ -11,33 +11,28 @@ LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stab
 LINUX_BACKPORTS_LICENSE = GPLv2
 LINUX_BACKPORTS_LICENSE_FILES = COPYING
 
-LINUX_BACKPORTS_DEPENDENCIES = linux
-
-LINUX_BACKPORTS_MAKE_OPTS = \
-	$(LINUX_MAKE_FLAGS) \
-	KLIB_BUILD=$(LINUX_DIR) \
-	KLIB=$(TARGET_DIR)
-
 ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
 LINUX_BACKPORTS_KCONFIG_FILE = $(LINUX_BACKPORTS_DIR)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))
 else ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
 LINUX_BACKPORTS_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE))
 endif
 
-define LINUX_BACKPORTS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) -C $(@D)
-endef
-
-define LINUX_BACKPORTS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) \
-		-C $(LINUX_DIR) M=$(@D) \
-		INSTALL_MOD_DIR=backports \
-		modules_install
-endef
-
 LINUX_BACKPORTS_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CONFIG_FRAGMENT_FILES))
 LINUX_BACKPORTS_KCONFIG_OPTS = $(LINUX_BACKPORTS_MAKE_OPTS)
 
+LINUX_BACKPORTS_MAKE_OPTS = \
+	BACKPORT_DIR=$(@D) \
+	KLIB_BUILD=$(LINUX_DIR) \
+	KLIB=$(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED) \
+	`sed -r -e '/^\#/d;' $(@D)/.config`
+
+LINUX_BACKPORTS_MODULE_MAKE_OPTS = $(LINUX_BACKPORTS_MAKE_OPTS)
+
+define LINUX_BACKPORTS_AUTOCONF
+	$(MAKE) -C $(@D) $(LINUX_BACKPORTS_MAKE_OPTS) backport-include/backport/autoconf.h
+endef
+LINUX_BACKPORTS_POST_CONFIGURE_HOOKS += LINUX_BACKPORTS_AUTOCONF
+
 # Checks to give errors that the user can understand
 ifeq ($(BR_BUILDING),y)
 
@@ -55,6 +50,7 @@ endif
 
 endif # BR_BUILDING
 
+$(eval $(kernel-module))
 $(eval $(kconfig-package))
 
 # linux-backports' own .config file needs options from the kernel's own
-- 
1.9.1
