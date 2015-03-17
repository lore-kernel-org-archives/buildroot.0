From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue, 17 Mar 2015 18:51:55 -0400
Subject: [Buildroot] [PATCH 1/5] Makefile: add media image generation
In-Reply-To: <1426632719-4807-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1426632719-4807-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <1426632719-4807-2-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds an optional and minimalist support for building medium
images, through a new "target-media-image" step of the build system.

This initial support features, but is not limited to, the "genimage"
host tool, which eases the definition of flash media, partition layout
and final images through a simple syntax.

This patch adds a new BR2_TARGET_MEDIA_GENIMAGE_CFG Kconfig entry to the
"System configuration" menu, which is a space-separated list of config
files (definitions can be split in different files).

BR2_TARGET_MEDIA_GENIMAGE_HOST_DEPENDENCIES is meant to auto-select the
packages that genimage may use, such as mkdosfs or mcopy.

A new support/media directory contains a genimage wrapper, and a new
"Media image generation" section has been added to the manual.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 Makefile                              |  9 +++++++--
 docs/manual/customize-media-image.txt | 36 +++++++++++++++++++++++++++++++++++
 docs/manual/customize.txt             |  4 ++++
 support/media/genimage                | 23 ++++++++++++++++++++++
 system/Config.in                      | 26 +++++++++++++++++++++++++
 5 files changed, 96 insertions(+), 2 deletions(-)
 create mode 100644 docs/manual/customize-media-image.txt
 create mode 100755 support/media/genimage

diff --git a/Makefile b/Makefile
index af043a3..3e0ec32 100644
--- a/Makefile
+++ b/Makefile
@@ -430,11 +430,11 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
-world: target-post-image
+world: target-media-image
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars \
-	target-finalize target-post-image \
+	target-finalize target-post-image target-media-image \
 	$(TARGETS) $(TARGETS_ROOTFS) \
 	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
@@ -626,6 +626,11 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
+target-media-image: target-post-image
+	@$(foreach cfg, $(call qstrip,$(BR2_TARGET_MEDIA_GENIMAGE_CFG)), \
+		$(call MESSAGE,"Generating media image from $(cfg)"); \
+		$(EXTRA_ENV) support/media/genimage $(cfg)$(sep))
+
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 external-deps:
diff --git a/docs/manual/customize-media-image.txt b/docs/manual/customize-media-image.txt
new file mode 100644
index 0000000..ee39914
--- /dev/null
+++ b/docs/manual/customize-media-image.txt
@@ -0,0 +1,36 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+=== Media image generation
+
+*Media image generation* allows to define final images for medium such 
+as disk, SD card or flash, _after_ filesystem images, kernel and 
+bootloader have been created, and eventually tweaked by custom scripts 
+(xref:_customization_emphasis_after_emphasis_the_images_have_been_created[]).
+
+Image generation completes the build process and can for example be used 
+to define a fully bootable image (including partition layout, with the 
+bootloader, some firmware files, a kernel and rootfs, at specific 
+offsets, etc.), ready to be dumped on a boot medium.
+
+Actually, the host tool used to generate this image is *genimage*. It
+allows complex definitions as described above, through a convenient
+syntax. The genimage documentation is located at:
+http://git.pengutronix.de/?p=genimage.git;a=blob_plain;f=README.
+
+To enable this feature, specify a space-separated list of genimage 
+config files in config option +BR2_TARGET_MEDIA_GENIMAGE_CFG+ (in the 
++System configuration+ menu). You may indeed want to split the 
+configuration for the different partitions and final image(s). If you 
+specify a relative path, it will be relative to the root of the 
+Buildroot tree.
+
+You can find several examples of genimage configuration, by searching 
+for +BR2_TARGET_MEDIA_GENIMAGE_CFG+ in the +configs+ directory.
+
+Just like post-build and post-image scripts, genimage is run with the
+main Buildroot tree as current working directory. The genimage input and
+output directory are configured to the path of the Buildroot +images+
+output directory. This means that rootfs or others images can be
+specified relative to this directory, and generated media images will be 
+copied there.
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index 484413e..288365e 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -23,6 +23,8 @@ Typical actions you may need to perform for a given project are:
 * adding custom user accounts (using +BR2_ROOTFS_USERS_TABLES+)
 * running arbitrary commands after generating the filesystem image
   (using +BR2_ROOTFS_POST_IMAGE_SCRIPT+)
+* defining media image(s) to generate at the end of the process (using
+  +BR2_TARGET_MEDIA_IMAGE_GENIMAGE_CFG+)
 * adding project-specific patches to some packages (using
   +BR2_GLOBAL_PATCH_DIR+)
 * adding project-specific packages
@@ -53,6 +55,8 @@ include::customize-users-tables.txt[]
 
 include::customize-post-image.txt[]
 
+include::customize-media-image.txt[]
+
 include::customize-patches.txt[]
 
 include::customize-packages.txt[]
diff --git a/support/media/genimage b/support/media/genimage
new file mode 100755
index 0000000..11c72ec
--- /dev/null
+++ b/support/media/genimage
@@ -0,0 +1,23 @@
+#!/usr/bin/env bash
+
+# We want to catch any unexpected failure, and exit immediately
+set -e
+
+# Media image generation helper for genimage
+#
+# Call it as:
+#   .../genimage GENIMAGE_CFG
+
+GENIMAGE_CFG="${1}"
+GENIMAGE_DIR="$(mktemp -d output/.genimage.XXXXXXXXXX)"
+
+mkdir -p "${GENIMAGE_DIR}"/{root,tmp}
+
+"${HOST_DIR}/usr/bin/genimage" \
+    --rootpath "${GENIMAGE_DIR}/root" \
+    --tmppath "${GENIMAGE_DIR}/tmp" \
+    --inputpath "${BINARIES_DIR}" \
+    --outputpath "${BINARIES_DIR}" \
+    --config "${GENIMAGE_CFG}"
+
+rm -rf "${GENIMAGE_DIR}"
diff --git a/system/Config.in b/system/Config.in
index 9973cc2..479ac4a 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -452,4 +452,30 @@ config BR2_ROOTFS_POST_SCRIPT_ARGS
 	  directory / images directory. The arguments in this option will be
 	  passed *after* those.
 
+config BR2_TARGET_MEDIA_GENIMAGE_CFG
+	string "genimage config files to prepare media images"
+	default ""
+	help
+	  Specify a space-separated list of configuration files for genimage
+	  to be run after the build has finished and after Buildroot has
+	  packed the files into selected filesystem images.
+
+	  This can for example be used to generate an SD card image with a
+	  vfat boot partition and a ext4 rootfs, or a flash image with
+	  bootloader and kernel at specific offsets.
+
+	  genimage is executed from the main Buildroot source directory,
+	  with input and output paths configured to output/images.
+
+	  The genimage documentation is located at:
+	  http://git.pengutronix.de/?p=genimage.git;a=blob_plain;f=README.
+
+config BR2_TARGET_MEDIA_GENIMAGE_HOST_DEPENDENCIES
+	bool "genimage host dependencies"
+	default y
+	depends on BR2_TARGET_MEDIA_GENIMAGE_CFG != ""
+	select BR2_PACKAGE_HOST_GENIMAGE
+	select BR2_PACKAGE_HOST_DOSFSTOOLS
+	select BR2_PACKAGE_HOST_MTOOLS
+
 endmenu
-- 
2.3.3
