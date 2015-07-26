From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:40:11 +0200
Subject: [Buildroot] [git commit] package/linux-backports: new package
Message-ID: <20150726134108.0AA5281D2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=538898d5ed6e14db8bcc4f01aee216919f100d6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backports provide drivers released on newer kernels backported for usage
on older kernels.

There are two versions of linux-backports: one that supports Linux
kernels >= 3.0 and one supports even older kernels. We're only packaging
the version that supports >= 3.0.

linux-backports needs to have access to the kernel's .config to extract
information it reintroduces as blind options in generated Kconfig
snippets for its own menuconfig. However, Buildroot offers no way to
express this kind of dependency.

So we need to hand-write a dependency from linux-backports' own .config
to linux' .config .

Since linux.mk has not already been sourced by the time we source
linux-backports.mk, we are missing the definition for LINUX_DIR, so we
can not use it our rule.

Fortunately, make provides so-called "secondary expansion", by which
rules which dependencies include a $$-dereferenced variable wil lbe
re-evaluated after all the rest of the Makefiles have been parsed.

So, we use that secondary expansion to post-pone evaluation of that
dependency so we can use LINUX_DIR.

Note: reconstructing LINUX_DIR by hand does not work, because of the
custom archives, git tree, or override-srcdir.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |    1 +
 package/linux-backports/Config.in            |   52 +++++++++++++++
 package/linux-backports/linux-backports.hash |    2 +
 package/linux-backports/linux-backports.mk   |   87 ++++++++++++++++++++++++++
 4 files changed, 142 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 070ec6a..2697e56 100644
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
index 0000000..e4ac9f4
--- /dev/null
+++ b/package/linux-backports/linux-backports.mk
@@ -0,0 +1,87 @@
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
+# not have been parsed yet, so the Linux build dir LINUX_DIR is not yet
+# known. Thus, we use a "secondary expansion" so the rule is re-evaluated
+# after all Makefiles are parsed, and thus at that time we will have the
+# LINUX_DIR variable set to the proper value.
+#
+# Furthermore, we want to check the kernel version, since linux-backports
+# only supports kernels >= 3.0. To avoid overriding linux-backports'
+# .config rule defined in the kconfig-package infra, we use an
+# intermediate stamp-file.
+#
+# Finally, it must also come after the call to kconfig-package, so we get
+# LINUX_BACKPORTS_DIR properly defined (because the target part of the
+# rule is not re-evaluated).
+#
+$(LINUX_BACKPORTS_DIR)/.config: $(LINUX_BACKPORTS_DIR)/.stamp_check_kernel_version
+
+.SECONDEXPANSION:
+$(LINUX_BACKPORTS_DIR)/.stamp_check_kernel_version: $$(LINUX_DIR)/.config
+	$(Q)LINUX_VERSION_PROBED=$(LINUX_VERSION_PROBED); \
+	if [ $${LINUX_VERSION_PROBED%%.*} -lt 3 ]; then \
+		printf "Linux version '%s' is too old for linux-backports (needs 3.0 or later)\n" \
+			"$${LINUX_VERSION_PROBED}"; \
+		exit 1; \
+	fi
+	$(Q)touch $(@)
