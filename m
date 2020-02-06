From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu,  6 Feb 2020 14:32:25 -0300
Subject: [Buildroot] [PATCH 2/2] package/skeleton-init-sysv: conditionally
 enable swapon/swapoff in inittab
In-Reply-To: <20200206173225.25677-1-unixmania@gmail.com>
References: <20200206173225.25677-1-unixmania@gmail.com>
Message-ID: <20200206173225.25677-3-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

The default inittab files added by busybox and sysvinit run 'swapon -a'
during init and 'swapoff -a' during shutdown but those programs are not
guaranteed to be available, so the boot log may become polluted by error
messages like this:

    swapon: not found

To avoid this, make the swapon/swapoff lines in inittab optional.

- Add a BR2_SYSTEM_HAS_SWAPON_SWAPOFF config to inform that swapon and
  swapoff are available.

- Add a BR2_PACKAGE_BUSYBOX_SWAPON_SWAPOFF config that depends on
  BR2_USE_MMU and selects BR2_SYSTEM_HAS_SWAPON_SWAPOFF. Build the
  Busybox swapon/swapoff utilities based on this new option.

- Make UTIL_LINUX_BINARIES select BR2_SYSTEM_HAS_SWAPON_SWAPOFF config.

- Add a targe-finalize hook to skeleton-init-sysv that comments-out or
  enables the swapon/swapoff lines in /etc/inittab, based on the value
  of BR2_SYSTEM_HAS_SWAPON_SWAPOFF.

Based on a previous patch sent by Thomas De Schampheleire.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
CC: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/Config.in                        |  6 ++++++
 package/busybox/busybox.mk                       | 14 ++++++++++++++
 package/skeleton-init-sysv/skeleton-init-sysv.mk | 12 ++++++++++++
 package/util-linux/Config.in                     |  1 +
 system/Config.in                                 |  6 ++++++
 5 files changed, 39 insertions(+)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 5e5c586762..9103256494 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -68,6 +68,12 @@ config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
 comment "Busybox individual binaries need a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
+config BR2_PACKAGE_BUSYBOX_SWAPON_SWAPOFF
+	bool
+	default y
+	depends on BR2_USE_MMU
+	select BR2_SYSTEM_HAS_SWAPON_SWAPOFF # used by skeleton-init-sysv
+
 config BR2_PACKAGE_BUSYBOX_WATCHDOG
 	bool "Install the watchdog daemon startup script"
 	help
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 6283bc96ea..920ba55237 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -248,6 +248,19 @@ define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_SWAPON_SWAPOFF),y)
+define BUSYBOX_SET_SWAPON_SWAPOFF
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SWAPON,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SWAPOFF,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_SWAPONOFF_LABEL,$(BUSYBOX_BUILD_CONFIG))
+endef
+else
+define BUSYBOX_SET_SWAPON_SWAPOFF
+	$(call KCONFIG_DISABLE_OPT,CONFIG_SWAPON,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_DISABLE_OPT,CONFIG_SWAPOFF,$(BUSYBOX_BUILD_CONFIG))
+endef
+endif
+
 # Only install our logging scripts if no other package does it.
 ifeq ($(BR2_PACKAGE_SYSKLOGD)$(BR2_PACKAGE_RSYSLOG)$(BR2_PACKAGE_SYSLOG_NG),)
 define BUSYBOX_INSTALL_LOGGING_SCRIPT
@@ -339,6 +352,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_SET_SELINUX)
 	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
+	$(BUSYBOX_SET_SWAPON_SWAPOFF)
 endef
 
 define BUSYBOX_BUILD_CMDS
diff --git a/package/skeleton-init-sysv/skeleton-init-sysv.mk b/package/skeleton-init-sysv/skeleton-init-sysv.mk
index c89c2dc1fd..50d05c85cb 100644
--- a/package/skeleton-init-sysv/skeleton-init-sysv.mk
+++ b/package/skeleton-init-sysv/skeleton-init-sysv.mk
@@ -19,4 +19,16 @@ define SKELETON_INIT_SYSV_INSTALL_TARGET_CMDS
 	$(call SYSTEM_RSYNC,$(SKELETON_INIT_SYSV_PKGDIR)/skeleton,$(TARGET_DIR))
 endef
 
+ifeq ($(BR2_SYSTEM_HAS_SWAPON_SWAPOFF),y)
+define SKELETON_INIT_SYSV_SWAPON_SWAPOFF_INITTAB
+	$(SED) '/^#.*\/sbin\/swap/s/^#\+[[:blank:]]*//' $(TARGET_DIR)/etc/inittab
+endef
+else
+define SKELETON_INIT_SYSV_SWAPON_SWAPOFF_INITTAB
+	$(SED) '/^[^#].*\/sbin\/swap/s/^/#/' $(TARGET_DIR)/etc/inittab
+endef
+endif
+
+SKELETON_INIT_SYSV_TARGET_FINALIZE_HOOKS += SKELETON_INIT_SYSV_SWAPON_SWAPOFF_INITTAB
+
 $(eval $(generic-package))
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 996f0cd7fa..0401ba12ee 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -49,6 +49,7 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_SYSTEM_HAS_SWAPON_SWAPOFF # used by skeleton-init-sysv
 	help
 	  Install the basic set of util-linux binaries.
 
diff --git a/system/Config.in b/system/Config.in
index c8c5be40e0..dd7ca7cf63 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -305,6 +305,12 @@ config BR2_SYSTEM_BIN_SH
 	default "mksh"    if BR2_SYSTEM_BIN_SH_MKSH
 	default "zsh"     if BR2_SYSTEM_BIN_SH_ZSH
 
+# swapon/swapoff can be provided by either busybox or util-linux.
+# This is used by skeleton-init-sysv to enable/disable swapon/swapoff in
+# /etc/inittab.
+config BR2_SYSTEM_HAS_SWAPON_SWAPOFF
+	bool
+
 menuconfig BR2_TARGET_GENERIC_GETTY
 	bool "Run a getty (login prompt) after boot"
 	default y
-- 
2.18.2
