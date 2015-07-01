From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu,  2 Jul 2015 00:58:53 +0200
Subject: [Buildroot] [PATCH v7 1/1] Added linux drivers backports project
Message-ID: <1435791533-25991-1-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://backports.wiki.kernel.org

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
TODO: still don't know how to handle dependency on linux .config.

Changes v6->v7:
* Bump version to lastest stable 4.0.1-1.
* Update to current version of kconfig-package.
* Add option to specify config fragments.
* Include upstream patch to fix build error.

Changes v5->v6:
Added changes by Arnout Vandecappelle in Mon Apr 20 21:46:34 UTC 2015:
* linux-backports.mk: $(LINUX_BACKPORTS_KCONFIG_FILE): linux
  this doesn't help: we'd need to use:
  LINUX_BACKPORTS_KCONFIG_FILE := $(LINUX_BACKPORTS_DIR)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))
  but then we don't get value for $(LINUX_BACKPORTS_DIR) nor $(@D).
* linux-backports.mk: LINUX_BACKPORTS_PATCH_DEPENDENCIES = linux
  This also does not help, it does linux extracting, patching, but we
  need also configuring. We'd need something like
  LINUX_BACKPORTS_CONFIGURE_DEPENDENCIES to be implemented.
* Config.in: info about support from kernel 3.0.
* Config.in: help text wrapped to 72 columns.

Changes v4->v5:
* Added changes made by Thomas Petazzoni in Sun, 19 Apr 2015 11:03:26 +0200.

Changes v3->v4:
* Define LINUX_BACKPORTS_MAKE_ENV instead of LINUX_BACKPORTS_MAKE_OPTS, remove TARGET_MAKE_ENV from it.
* Add nconfig to LINUX_BACKPORTS_KCONFIG_EDITORS.
* Clean formating of build commands.
---
 package/Config.in                                  |  1 +
 ...1-backports-add-missing-include-for-vfree.patch | 26 +++++++++
 package/linux-backports/Config.in                  | 48 ++++++++++++++++
 package/linux-backports/linux-backports.hash       |  2 +
 package/linux-backports/linux-backports.mk         | 64 ++++++++++++++++++++++
 5 files changed, 141 insertions(+)
 create mode 100644 package/linux-backports/0001-backports-add-missing-include-for-vfree.patch
 create mode 100644 package/linux-backports/Config.in
 create mode 100644 package/linux-backports/linux-backports.hash
 create mode 100644 package/linux-backports/linux-backports.mk

diff --git a/package/Config.in b/package/Config.in
index 13a7e74..26406ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -369,6 +369,7 @@ endif
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
 	source "package/libump/Config.in"
+	source "package/linux-backports/Config.in"
 	source "package/lirc-tools/Config.in"
 	source "package/lm-sensors/Config.in"
 	source "package/lshw/Config.in"
diff --git a/package/linux-backports/0001-backports-add-missing-include-for-vfree.patch b/package/linux-backports/0001-backports-add-missing-include-for-vfree.patch
new file mode 100644
index 0000000..3aee980
--- /dev/null
+++ b/package/linux-backports/0001-backports-add-missing-include-for-vfree.patch
@@ -0,0 +1,26 @@
+From e9dadfe5f446c9b2b1563ad50daf3a50b4497726 Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Fri, 5 Jun 2015 23:06:53 +1000
+Subject: [PATCH] backports: add missing include for vfree
+
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+Signed-off-by: Luis R. Rodriguez <mcgrof@do-not-panic.com>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+
+[ petr.vorel at gmail.com: adjusted path ]
+---
+ compat/backport-3.15.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/compat/backport-3.15.c b/compat/backport-3.15.c
+index c6f9d43..381fe65 100644
+--- a/compat/backport-3.15.c
++++ b/compat/backport-3.15.c
+@@ -15,6 +15,7 @@
+ #include <linux/string.h>
+ #include <linux/mm.h>
+ #include <linux/slab.h>
++#include <linux/vmalloc.h>
+ #include <net/net_namespace.h>
+ 
+ #if IS_ENABLED(CPTCFG_IEEE802154_6LOWPAN)
diff --git a/package/linux-backports/Config.in b/package/linux-backports/Config.in
new file mode 100644
index 0000000..4d793b2
--- /dev/null
+++ b/package/linux-backports/Config.in
@@ -0,0 +1,48 @@
+comment "linux-backports needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_LINUX_BACKPORTS
+	bool "linux-backports"
+	depends on BR2_LINUX_KERNEL
+	help
+          The linux-backports package includes many Linux drivers from
+          recent kernels, backported to older ones.
+
+          This version of linux-backports supports kernels starting from 3.0.
+
+	  https://backports.wiki.kernel.org
+
+if BR2_PACKAGE_LINUX_BACKPORTS
+
+choice
+	prompt "Linux kernel driver backports configuration"
+	default BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG
+
+config BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG
+	bool "Using a defconfig"
+
+config BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG
+	bool "Using a custom config file"
+
+endchoice
+
+config BR2_PACKAGE_LINUX_BACKPORTS_CONFIG_FRAGMENT_FILES
+	string "Additional linux-backports configuration fragment files"
+	help
+	  A space-separated list of configuration fragment files,
+	  that will be merged to the main linux-backports configuration file.
+
+config BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG
+	string "Defconfig name"
+	depends on BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG
+	help
+          Name of the backports defconfig file to use. The defconfig is
+          located in defconfigs/ directory in the backports tree.
+
+config BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG
+	help
+	  Path to the backports configuration file
+
+endif
diff --git a/package/linux-backports/linux-backports.hash b/package/linux-backports/linux-backports.hash
new file mode 100644
index 0000000..6ed57f1
--- /dev/null
+++ b/package/linux-backports/linux-backports.hash
@@ -0,0 +1,2 @@
+# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v4.0.1/sha256sums.asc
+sha256 71da08c0d2975716b57039b7b9159ab8a882252bf2cac34843b77d2dd6d4cf31  backports-4.0.1-1.tar.xz
diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
new file mode 100644
index 0000000..d45166a
--- /dev/null
+++ b/package/linux-backports/linux-backports.mk
@@ -0,0 +1,64 @@
+################################################################################
+#
+# linux-backports
+#
+################################################################################
+
+LINUX_BACKPORTS_VERSION_MAJOR = 4.0.1
+LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
+LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
+LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
+
+LINUX_BACKPORTS_DEPENDENCIES = linux
+# FIXME: does linux extracting, patching, but we need also linux to be configured.
+LINUX_BACKPORTS_PATCH_DEPENDENCIES = linux
+
+LINUX_BACKPORTS_MAKE_OPTS = \
+	$(LINUX_MAKE_FLAGS) \
+	KLIB_BUILD=$(LINUX_DIR) \
+	KLIB=$(TARGET_DIR)
+
+ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
+LINUX_BACKPORTS_SOURCE_CONFIG = $(LINUX_BACKPORTS_DIR)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))
+else ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
+LINUX_BACKPORTS_SOURCE_CONFIG = $(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)
+endif
+
+# backports configure needs a configured kernel
+# FIXME: not used as we'd need to assign LINUX_BACKPORTS_SOURCE_CONFIG with :=,
+# but then we don't get $(LINUX_BACKPORTS_DIR) evaluated.
+$(LINUX_BACKPORTS_SOURCE_CONFIG): linux
+
+define LINUX_BACKPORTS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) -C $(@D)
+endef
+
+define LINUX_BACKPORTS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) \
+		-C $(LINUX_DIR) M=$(@D) \
+		INSTALL_MOD_DIR=backports \
+		modules_install
+endef
+
+LINUX_BACKPORTS_KCONFIG_FILE = $(LINUX_BACKPORTS_SOURCE_CONFIG)
+LINUX_BACKPORTS_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CONFIG_FRAGMENT_FILES))
+LINUX_BACKPORTS_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
+LINUX_BACKPORTS_KCONFIG_OPTS = $(LINUX_BACKPORTS_MAKE_OPTS)
+
+$(eval $(kconfig-package))
+
+# Checks to give errors that the user can understand
+ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG)),)
+$(error No linux-backports defconfig name specified, check your BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG setting)
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)),)
+$(error No linux-backports configuration file specified, check your BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE setting)
+endif
+endif
+
+endif
-- 
1.8.0
