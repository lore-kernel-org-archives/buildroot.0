From: Avishay Orpaz <avishorp@gmail.com>
Date: Fri, 9 Mar 2012 01:02:57 +0200
Subject: [Buildroot] [PATCH] User defined configuration file name
Message-ID: <CAMkyJgBx7VKJ9=iDyUYgez_Nc2DHARRz7V5in_8R3BuEfJKbpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow using a configuration file other than the default .config by setting
the DOTCONFIG variable

Signed-off-by: Avishay Orpaz <avishorp@gmail.com>
----
diff --git a/Makefile b/Makefile
index d508888..598cd5f 100644
--- a/Makefile
+++ b/Makefile
@@ -81,9 +81,12 @@ EXTRAMAKEARGS = O=$(O)
 NEED_WRAPPER=y
 endif

+# Default buildroot configuration file
+DOTCONFIG=$(CONFIG_DIR)/.config
+
 # Pull in the user's configuration file
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
--include $(CONFIG_DIR)/.config
+-include $(DOTCONFIG)
 endif

 # Override BR2_DL_DIR if shell variable defined
@@ -307,7 +310,7 @@ include support/dependencies/dependencies.mk

 # We also need the various per-package makefiles, which also add
 # each selected package to TARGETS if that package was selected
-# in the .config file.
+# in the configuration file file.
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 include toolchain/toolchain-buildroot.mk
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
@@ -370,8 +373,8 @@ dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR)
$(STAGING_DIR) $(TARGET_DIR) \

 $(BASE_TARGETS): dirs $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake

-$(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
-    $(MAKE) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)"
HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
+$(BUILD_DIR)/buildroot-config/auto.conf: $(DOTCONFIG)
+    $(MAKE) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)"
HOSTCXX="$(HOSTCXX_NOCCACHE)" DOTCONFIG=$(DOTCONFIG) silentoldconfig

 prepare: $(BUILD_DIR)/buildroot-config/auto.conf

@@ -534,7 +537,7 @@ COMMON_CONFIG_ENV = \
     KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
     KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
     KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
-    BUILDROOT_CONFIG=$(CONFIG_DIR)/.config
+    BUILDROOT_CONFIG=$(DOTCONFIG)

 xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
     @mkdir -p $(BUILD_DIR)/buildroot-config
@@ -574,7 +577,7 @@ allnoconfig: $(BUILD_DIR)/buildroot-config/conf
outputmakefile

 randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
     @mkdir -p $(BUILD_DIR)/buildroot-config
-    @grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config >
$(CONFIG_DIR)/.config.nopkg
+    @grep -v BR2_PACKAGE_ $(DOTCONFIG) > $(CONFIG_DIR)/.config.nopkg
     @$(COMMON_CONFIG_ENV) \
         KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
         $< --randconfig $(CONFIG_CONFIG_IN)
@@ -582,7 +585,7 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/conf
outputmakefile

 allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
     @mkdir -p $(BUILD_DIR)/buildroot-config
-    @grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config >
$(CONFIG_DIR)/.config.nopkg
+    @grep -v BR2_PACKAGE_ $(DOTCONFIG) > $(CONFIG_DIR)/.config.nopkg
     @$(COMMON_CONFIG_ENV) \
         KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
         $< --allyesconfig $(CONFIG_CONFIG_IN)
@@ -590,7 +593,7 @@ allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf
outputmakefile

 allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
     @mkdir -p $(BUILD_DIR)/buildroot-config
-    @grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config >
$(CONFIG_DIR)/.config.nopkg
+    @grep -v BR2_PACKAGE_ $(DOTCONFIG) > $(CONFIG_DIR)/.config.nopkg
     @$(COMMON_CONFIG_ENV) \
         KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
         $< --allnoconfig $(CONFIG_CONFIG_IN)
@@ -643,14 +646,14 @@ endif
 ifeq ($(O),output)
     rm -rf $(O)
 endif
-    rm -rf $(CONFIG_DIR)/.config $(CONFIG_DIR)/.config.old
$(CONFIG_DIR)/.auto.deps
+    rm -rf $(DOTCONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps

 cross: $(BASE_TARGETS)

 help:
     @echo 'Cleaning:'
     @echo '  clean                  - delete all files created by build'
-    @echo '  distclean              - delete all non-source files
(including .config)'
+    @echo '  distclean              - delete all non-source files
(including the config file)'
     @echo
     @echo 'Build:'
     @echo '  all                    - make world'
@@ -660,7 +663,7 @@ help:
     @echo '  nconfig                - interactive ncurses-based
configurator'
     @echo '  xconfig                - interactive Qt-based configurator'
     @echo '  gconfig                - interactive GTK-based configurator'
-    @echo '  oldconfig              - resolve any unresolved symbols in
.config'
+    @echo '  oldconfig              - resolve any unresolved symbols in
the config file'
     @echo '  randconfig             - New config with random answer to all
options'
     @echo '  defconfig              - New config with default answer to
all options'
     @echo '  savedefconfig          - Save current config as ./defconfig
(minimal config)'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120309/cf9309b7/attachment.html>
