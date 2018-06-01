From: Stefan Becker <chemobejk@gmail.com>
Date: Fri,  1 Jun 2018 15:58:59 +0300
Subject: [Buildroot] [PATCH proposal/next 1/2] package/busybox: add host
 variant
In-Reply-To: <20180601125900.26400-1-chemobejk@gmail.com>
References: <c55c7a49-77e9-f174-5c90-c8baa950d7da@mind.be>
 <20180601125900.26400-1-chemobejk@gmail.com>
Message-ID: <20180601125900.26400-2-chemobejk@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build stripped down version of busybox for the build host to provide
"mkpasswd" for the build.

This is a replacement for host-mkpasswd.

Signed-off-by: Stefan Becker <chemobejk@gmail.com>
---
 fs/common.mk                                  |  2 +-
 package/Config.in.host                        |  2 +-
 package/busybox/Config.in.host                |  2 ++
 package/busybox/busybox.mk                    | 28 +++++++++++++++++++
 .../skeleton-init-common.mk                   |  2 +-
 5 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 package/busybox/Config.in.host

diff --git a/fs/common.mk b/fs/common.mk
index 9baf367729..42d5dff569 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -63,7 +63,7 @@ ROOTFS_COMMON_TARGET_DIR = $(FS_DIR)/target
 
 ROOTFS_COMMON_DEPENDENCIES = \
 	host-fakeroot host-makedevs \
-	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
+	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-busybox)
 
 $(ROOTFS_COMMON_TAR): ROOTFS=COMMON
 $(ROOTFS_COMMON_TAR): FAKEROOT_SCRIPT=$(FS_DIR)/fakeroot.fs
diff --git a/package/Config.in.host b/package/Config.in.host
index 38543e7390..c524333671 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -2,6 +2,7 @@ menu "Host utilities"
 
 	source "package/aespipe/Config.in.host"
 	source "package/android-tools/Config.in.host"
+	source "package/busybox/Config.in.host"
 	source "package/cargo/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
@@ -31,7 +32,6 @@ menu "Host utilities"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
 	source "package/mfgtools/Config.in.host"
-	source "package/mkpasswd/Config.in.host"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
 	source "package/mxsldr/Config.in.host"
diff --git a/package/busybox/Config.in.host b/package/busybox/Config.in.host
new file mode 100644
index 0000000000..93774bdf60
--- /dev/null
+++ b/package/busybox/Config.in.host
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_HOST_MKPASSWD
+	bool "host mkpasswd"
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 75fe7e137b..aa89f1cc33 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -302,4 +302,32 @@ $(error No BusyBox configuration file specified, check your BR2_PACKAGE_BUSYBOX_
 endif
 endif
 
+#
+# Host version of busybox to provide "mkpasswd" for the build
+#
+HOST_BUSYBOX_BUILD_CONFIG = $(HOST_BUSYBOX_DIR)/.config
+define HOST_BUSYBOX_CONFIGURE_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) allnoconfig
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MKPASSWD,$(HOST_BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USE_BB_CRYPT,$(HOST_BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USE_BR_CRYPT_SHA,$(HOST_BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BUILD_LIBBUSYBOX,$(HOST_BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_INDIVIDUAL,$(HOST_BUSYBOX_BUILD_CONFIG))
+endef
+
+define HOST_BUSYBOX_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) busybox
+endef
+
+define HOST_BUSYBOX_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) \
+		CONFIG_PREFIX="$(HOST_DIR)" \
+		EXTRA_LDFLAGS="-Wl,-rpath,$(HOST_DIR)/lib" \
+		-C $(@D) install
+	rm -f $(HOST_DIR)/bin/sh $(HOST_DIR)/bin/busybox
+endef
+
 $(eval $(kconfig-package))
+$(eval $(host-generic-package))
+
+MKPASSWD = $(HOST_DIR)/bin/mkpasswd
diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
index e8a0522052..99c87e3861 100644
--- a/package/skeleton-init-common/skeleton-init-common.mk
+++ b/package/skeleton-init-common/skeleton-init-common.mk
@@ -63,7 +63,7 @@ ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(SKELETON_INIT_COMMON_ROOT_PASSWD)),)
 SKELETON_INIT_COMMON_ROOT_PASSWORD = '$(SKELETON_INIT_COMMON_ROOT_PASSWD)'
 else ifneq ($(SKELETON_INIT_COMMON_ROOT_PASSWD),)
 # This variable will only be evaluated in the finalize stage, so we can
-# be sure that host-mkpasswd will have already been built by that time.
+# be sure that host-busybox will have already been built by that time.
 SKELETON_INIT_COMMON_ROOT_PASSWORD = "`$(MKPASSWD) -m "$(SKELETON_INIT_COMMON_PASSWD_METHOD)" "$(SKELETON_INIT_COMMON_ROOT_PASSWD)"`"
 endif
 else # !BR2_TARGET_ENABLE_ROOT_LOGIN
-- 
2.17.0
