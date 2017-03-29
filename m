From: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
Date: Wed, 29 Mar 2017 10:51:18 -0400
Subject: [Buildroot] [RFC 2/4] system: add option to pass genimage config
	files
In-Reply-To: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
Message-ID: <20170329145120.11863-3-etienne.phelip@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new Kconfig entry to allow users to provide a list of genimage
config files.

A new target is added to the Makefile in order to execute the
support/scripts/genimage.sh script for each provided config files.

The new target-genimage target depends on target-post-image, thus
update the world target dependency.

Signed-off-by: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
---
 Makefile         |  9 +++++++--
 system/Config.in | 11 +++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index cceae92..71c750c 100644
--- a/Makefile
+++ b/Makefile
@@ -546,11 +546,11 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
-world: target-post-image
+world: target-genimage
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars help \
-	list-defconfigs target-finalize target-post-image source-check
+	list-defconfigs target-finalize target-post-image target-genimage source-check
 
 # Populating the staging with the base directories is handled by the skeleton package
 $(STAGING_DIR):
@@ -719,6 +719,11 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
+target-genimage: target-post-image
+	@$(foreach c, $(call qstrip,$(BR2_GENIMAGE_CFG_FILES)), \
+		$(call MESSAGE,"Executing genimage with config $(c)"); \
+		$(EXTRA_ENV) ./support/scripts/genimage.sh -c $(c)$(sep))
+
 source: $(foreach p,$(PACKAGES),$(p)-all-source)
 
 _external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
diff --git a/system/Config.in b/system/Config.in
index 3ddf843..d95ba43 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -564,4 +564,15 @@ config BR2_ROOTFS_POST_SCRIPT_ARGS
 	  directory / images directory. The arguments in this option will be
 	  passed *after* those.
 
+config BR2_GENIMAGE_CFG_FILES
+	string "genimage config files passed to genimage"
+	depends on BR2_PACKAGE_HOST_GENIMAGE
+	default ""
+	help
+	  Specify a space-separated list of genimage config files to used by
+	  genimage after the post-image script has been executed.
+
+	  This can be used to generate multiple binary image for one or more
+	  mediums (e.g. SD card and flash).
+
 endmenu
-- 
2.9.3
