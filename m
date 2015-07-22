From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jul 2015 16:58:54 +0200
Subject: [Buildroot] [PATCH 3/4 v8] package/linux-backports: new package
In-Reply-To: <cover.1437576751.git.yann.morin.1998@free.fr>
References: <cover.1437576751.git.yann.morin.1998@free.fr>
Message-ID: <fc089d79e34b8b07a9e1e04c7a9cb0c179554ce7.1437576751.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Petr Vorel <petr.vorel@gmail.com>

https://backports.wiki.kernel.org

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v7 -> v8:  (Yann)
  - fix option ordering and prompts in Config.in
  - drop editors, only menuconfig is available
  - add licensing information
  - bump to 4.1.1-1, drop 4.0.1-1 patch
  - move custom error message before call to kconfig-package
  - use $(BR_BUILDING) instead of custom, wrong test on 'make source'
  - drop intermediate variable to set LINUX_BACKPORTS_KCONFIG_FILE
  - qstrip all variables from Config.in
  - fix dependencies (tricky, needs kernel to be configured)
  - check kernel is >= 3.0

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
 package/Config.in                            |  1 +
 package/linux-backports/Config.in            | 52 +++++++++++++++++
 package/linux-backports/linux-backports.hash |  2 +
 package/linux-backports/linux-backports.mk   | 85 ++++++++++++++++++++++++++++
 4 files changed, 140 insertions(+)
 create mode 100644 package/linux-backports/Config.in
 create mode 100644 package/linux-backports/linux-backports.hash
 create mode 100644 package/linux-backports/linux-backports.mk

diff --git a/package/Config.in b/package/Config.in
index 9942e3a..db84cd7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -372,6 +372,7 @@ endif
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
 	source "package/libump/Config.in"
+	source "package/linux-backports/Config.in"
 	source "package/lirc-tools/Config.in"
 	source "package/lm-sensors/Config.in"
 	source "package/lshw/Config.in"
diff --git a/package/linux-backports/Config.in b/package/linux-backports/Config.in
new file mode 100644
index 0000000..e858a45
--- /dev/null
+++ b/package/linux-backports/Config.in
@@ -0,0 +1,52 @@
+comment "linux-backports needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_LINUX_BACKPORTS
+	bool "linux-backports"
+	depends on BR2_LINUX_KERNEL
+	help
+	  The linux-backports package includes many Linux drivers from
+	  recent kernels, backported to older ones.
+
+	  This version of linux-backports supports kernels starting from 3.0.
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
+	bool "Using an in-tree defconfig file"
+
+config BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG
+	bool "Using a custom (def)config file"
+
+endchoice
+
+config BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG
+	string "Defconfig name"
+	depends on BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG
+	help
+	  Name of the backports defconfig file to use, without the
+	  leading defconfig-. The defconfig is located in defconfigs/
+	  directory in the backports tree.
+
+config BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG
+	help
+	  Path to the backports configuration file
+
+	  Note: this can be a defconfig file or a complete .config file,
+	  which can later be saved back with make linux-update-(def)config.
+
+config BR2_PACKAGE_LINUX_BACKPORTS_CONFIG_FRAGMENT_FILES
+	string "Additional configuration fragment files"
+	help
+	  A space-separated list of configuration fragment files, that
+	  will be merged to the main linux-backports configuration file.
+
+endif # BR2_PACKAGE_LINUX_BACKPORTS
diff --git a/package/linux-backports/linux-backports.hash b/package/linux-backports/linux-backports.hash
new file mode 100644
index 0000000..0d41067
--- /dev/null
+++ b/package/linux-backports/linux-backports.hash
@@ -0,0 +1,2 @@
+# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v4.1.1/sha256sums.asc
+sha256 7fca160665b801796ce50def18f2fd6def1c4452290e93ec5332444fb2021bd6  backports-4.1.1-1.tar.xz
diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
new file mode 100644
index 0000000..790d7e4
--- /dev/null
+++ b/package/linux-backports/linux-backports.mk
@@ -0,0 +1,85 @@
+################################################################################
+#
+# linux-backports
+#
+################################################################################
+
+LINUX_BACKPORTS_VERSION_MAJOR = 4.1.1
+LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
+LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
+LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
+LINUX_BACKPORTS_LICENSE = GPLv2
+LINUX_BACKPORTS_LICENSE_FILES = COPYING
+
+LINUX_BACKPORTS_DEPENDENCIES = linux
+
+LINUX_BACKPORTS_MAKE_OPTS = \
+	$(LINUX_MAKE_FLAGS) \
+	KLIB_BUILD=$(LINUX_DIR) \
+	KLIB=$(TARGET_DIR)
+
+ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
+LINUX_BACKPORTS_KCONFIG_FILE = $(LINUX_BACKPORTS_DIR)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))
+else ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
+LINUX_BACKPORTS_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE))
+endif
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
+LINUX_BACKPORTS_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CONFIG_FRAGMENT_FILES))
+LINUX_BACKPORTS_KCONFIG_OPTS = $(LINUX_BACKPORTS_MAKE_OPTS)
+
+# Checks to give errors that the user can understand
+ifeq ($(BR_BUILDING),y)
+
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
+endif # BR_BUILDING
+
+$(eval $(kconfig-package))
+
+# linux-backports' own .config file needs options from the kernel's own
+# .config file. The dependencies handling in the infrastructure does not
+# allow to express this kind of dependencies. Besides, linux.mk might
+# not have been parsed yet, so the Linux build dir is not yet known and
+# the LINUX_VERSION variable is not yet set, so we must re-construct that
+# manually here... :-(
+#
+# It must also come after the call to kconfig-package, so we get
+# LINUX_BACKPORTS_DIR properly defined.
+#
+# Thus, we need to have this specially-crafted, hand-made dependency...
+#
+# Furthermore, we want to check the kernel version, since linux-backports
+# only supports kernels >= 3.0. To avoid overriding linux-backports'
+# .config rule define in the kconfig-package infra, we use an intermediate
+# rule.
+#
+$(LINUX_BACKPORTS_DIR)/.config: linux-backports-check-kernel-version
+
+linux-backports-check-kernel-version: $(BUILD_DIR)/linux-$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))/.config
+	$(Q)LINUX_VERSION_PROBED=$(LINUX_VERSION_PROBED); \
+	if [ $${LINUX_VERSION_PROBED%%.*} -lt 3 ]; then \
+		printf "Linux version '%s' is too old for linux-backports (needs 3.0 or later)\n" \
+			"$${LINUX_VERSION_PROBED}"; \
+		exit 1; \
+	fi
-- 
1.9.1
