From: Avishay Orpaz <avishorp@gmail.com>
Date: Mon, 23 Jul 2012 17:57:42 +0300
Subject: [Buildroot] [PATCH] Added local package support
Message-ID: <CAMkyJgASQJkgf7oXD+9M-UU0p3fTQB2PkXtkiFyLmkty3H8y+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added local package support.
 Local packages are packages that are local to the build and not
distributed with buildroot.
 They are placed in a directory named "locals" (by default) and follow the
same rules
 as other packages (Config.in, <pkgname>.mk, patches ..). Their
configuration options
 are automatically collected and placed under the "Local Packages" menu in
x/menu/.../config.

---
 Makefile          |   48 ++++++++++++++++++++++++++++++------------------
 package/Config.in |    4 ++++
 2 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/Makefile b/Makefile
index 639fdaa..e9342e9 100644
--- a/Makefile
+++ b/Makefile
@@ -192,6 +192,7 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does
not exist))

 BUILD_DIR:=$(BASE_DIR)/build

+LOCAL_PACKAGES_DIR:=locals

 ifeq ($(BR2_HAVE_DOT_CONFIG),y)

@@ -315,6 +316,9 @@ endif

 include package/*/*.mk

+# Include local packages
+include $(LOCAL_PACKAGES_DIR)/*/*.mk
+
 include boot/common.mk
 include target/Makefile.in
 include linux/linux.mk
@@ -565,43 +569,51 @@ COMMON_CONFIG_ENV = \
     KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
     BUILDROOT_CONFIG=$(CONFIG_DIR)/.config

-xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
+LOCALS_CONFIG_FILE = .locals.Config.in
+
+$(LOCALS_CONFIG_FILE):
+    rm -f $(@)
+    find $(LOCAL_PACKAGES_DIR)  \
+    -regex '^$(LOCAL_PACKAGES_DIR)/[^/]*/Config.in$$' \
+    -exec cat {} \; >> $@ || true
+
+xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
$(LOCALS_CONFIG_FILE)
     @mkdir -p $(BUILD_DIR)/buildroot-config
     @$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)

-gconfig: $(BUILD_DIR)/buildroot-config/gconf outputmakefile
+gconfig: $(BUILD_DIR)/buildroot-config/gconf outputmakefile
$(LOCALS_CONFIG_FILE)
     @mkdir -p $(BUILD_DIR)/buildroot-config
     @$(COMMON_CONFIG_ENV) srctree=$(TOPDIR) $< $(CONFIG_CONFIG_IN)

-menuconfig: $(BUILD_DIR)/buildroot-config/mconf outputmakefile
+menuconfig: $(BUILD_DIR)/buildroot-config/mconf outputmakefile
$(LOCALS_CONFIG_FILE)
     @mkdir -p $(BUILD_DIR)/buildroot-config
     @$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)

-nconfig: $(BUILD_DIR)/buildroot-config/nconf outputmakefile
+nconfig: $(BUILD_DIR)/buildroot-config/nconf outputmakefile
$(LOCALS_CONFIG_FILE)
     @mkdir -p $(BUILD_DIR)/buildroot-config
     @$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)

-config: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+config: $(BUILD_DIR)/buildroot-config/conf outputmakefile
$(LOCALS_CONFIG_FILE)
     @mkdir -p $(BUILD_DIR)/buildroot-config
     @$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)

-oldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+oldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
$(LOCALS_CONFIG_FILE)
     mkdir -p $(BUILD_DIR)/buildroot-config
     @$(COMMON_CONFIG_ENV) $< --oldconfig $(CONFIG_CONFIG_IN)

-randconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+randconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
$(LOCALS_CONFIG_FILE)
     @mkdir -p $(BUILD_DIR)/buildroot-config
     @$(COMMON_CONFIG_ENV) $< --randconfig $(CONFIG_CONFIG_IN)

-allyesconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+allyesconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
$(LOCALS_CONFIG_FILE)
     @mkdir -p $(BUILD_DIR)/buildroot-config
     @$(COMMON_CONFIG_ENV) $< --allyesconfig $(CONFIG_CONFIG_IN)

-allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
$(LOCALS_CONFIG_FILE)
     @mkdir -p $(BUILD_DIR)/buildroot-config
     @$(COMMON_CONFIG_ENV) $< --allnoconfig $(CONFIG_CONFIG_IN)

-randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
$(LOCALS_CONFIG_FILE)
     @mkdir -p $(BUILD_DIR)/buildroot-config
     @grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config >
$(CONFIG_DIR)/.config.nopkg
     @$(COMMON_CONFIG_ENV) \
@@ -609,7 +621,7 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/conf
outputmakefile
         $< --randconfig $(CONFIG_CONFIG_IN)
     @rm -f $(CONFIG_DIR)/.config.nopkg

-allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
$(LOCALS_CONFIG_FILE)
     @mkdir -p $(BUILD_DIR)/buildroot-config
     @grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config >
$(CONFIG_DIR)/.config.nopkg
     @$(COMMON_CONFIG_ENV) \
@@ -617,7 +629,7 @@ allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf
outputmakefile
         $< --allyesconfig $(CONFIG_CONFIG_IN)
     @rm -f $(CONFIG_DIR)/.config.nopkg

-allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
$(LOCALS_CONFIG_FILE)
     @mkdir -p $(BUILD_DIR)/buildroot-config
     @grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config >
$(CONFIG_DIR)/.config.nopkg
     @$(COMMON_CONFIG_ENV) \
@@ -625,19 +637,19 @@ allnopackageconfig:
$(BUILD_DIR)/buildroot-config/conf outputmakefile
         $< --allnoconfig $(CONFIG_CONFIG_IN)
     @rm -f $(CONFIG_DIR)/.config.nopkg

-silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
$(LOCALS_CONFIG_FILE)
     @mkdir -p $(BUILD_DIR)/buildroot-config
     $(COMMON_CONFIG_ENV) $< --silentoldconfig $(CONFIG_CONFIG_IN)

-defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
$(LOCALS_CONFIG_FILE)
     @mkdir -p $(BUILD_DIR)/buildroot-config
     @$(COMMON_CONFIG_ENV) $< --defconfig$(if
$(BR2_DEFCONFIG),=$(BR2_DEFCONFIG)) $(CONFIG_CONFIG_IN)

-%_defconfig: $(BUILD_DIR)/buildroot-config/conf
$(TOPDIR)/configs/%_defconfig outputmakefile
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf
$(TOPDIR)/configs/%_defconfig outputmakefile $(LOCALS_CONFIG_FILE)
     @mkdir -p $(BUILD_DIR)/buildroot-config
     @$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@
$(CONFIG_CONFIG_IN)

-savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
$(LOCALS_CONFIG_FILE)
     @mkdir -p $(BUILD_DIR)/buildroot-config
     @$(COMMON_CONFIG_ENV) $< --savedefconfig=$(CONFIG_DIR)/defconfig
$(CONFIG_CONFIG_IN)

@@ -664,7 +676,7 @@ endif
 clean:
     rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
         $(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \
-        $(LEGAL_INFO_DIR)
+        $(LEGAL_INFO_DIR) $(LOCALS_CONFIG_FILE)

 distclean: clean
 ifeq ($(DL_DIR),$(TOPDIR)/dl)
@@ -760,5 +772,5 @@ print-version:

 include docs/manual/manual.mk

-.PHONY: $(noconfig_targets)
+.PHONY: $(noconfig_targets) $(LOCALS_CONFIG_FILE)

diff --git a/package/Config.in b/package/Config.in
index f664b8e..06a779c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -695,4 +695,8 @@ source "package/vim/Config.in"
 endif
 endmenu

+menu "Local Packages"
+source ".locals.Config.in"
+endmenu
+
 endmenu
-- 
1.7.1
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120723/8bbd2a98/attachment-0001.html>
