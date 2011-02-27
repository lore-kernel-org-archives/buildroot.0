From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 27 Feb 2011 15:37:24 +0100
Subject: [Buildroot] [PATCH 2 of 2] Add config-update target to save
 buildroot configuration, e.g. to defconfig
In-Reply-To: <patchbomb.1298817442@localhost6.localdomain6>
References: <patchbomb.1298817442@localhost6.localdomain6>
Message-ID: <2e0e0d1708ae7d8034e9.1298817444@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add build target config-update that allows saving a buildroot configuration
to a backup location, e.g. the appropriate defconfig. The location to backup
to is specified with a new buildroot configuration option.
This facilitates the work of developers adding support for a specific board
to buildroot.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 Config.in |  11 +++++++++++
 Makefile  |   9 +++++++++
 2 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
--- a/Config.in
+++ b/Config.in
@@ -10,6 +10,17 @@
 	string
 	option env="BR2_VERSION_FULL"
 
+config BR2_BACKUP_CONFIG
+	string "Backup configuration file"
+	default ""
+	help
+	  If you set a configuration file here and run 'make config-update',
+	  the buildroot configuration will be copied to that file.
+	  This can be useful if you want to put the buildroot configuration
+	  under version control.
+	  If you are working on a specific board, it may be a good idea to
+	  specify the board_defconfig file here.
+
 source "target/Config.in.arch"
 
 menu "Build options"
diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -598,6 +598,7 @@
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
+	@sed -i 's,BR2_BACKUP_CONFIG.*,BR2_BACKUP_CONFIG="$(TOPDIR)/configs/$@",' $(CONFIG_DIR)/.config
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
@@ -609,6 +610,14 @@
 
 endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
+ifneq ($(BR2_BACKUP_CONFIG),"")
+config-update: $(CONFIG_DIR)/.config
+	cp -f $(CONFIG_DIR)/.config $(BR2_BACKUP_CONFIG)
+else
+config-update: ;
+endif
+
+
 #############################################################
 #
 # Cleanup and misc junk
