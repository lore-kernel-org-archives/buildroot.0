From: Steinhilber, Markus <Markus.Steinhilber@erbe-med.com>
Date: Mon, 18 Feb 2019 13:59:42 +0000
Subject: [Buildroot] [PATCH 1/1] boot/barebox: add renaming functionality to
 barebox image copy
Message-ID: <2748BB04F99E7E45A3203C831E8B20FE34D35B88@SERBE4I2.intra.erbe-med.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now barebox images are copied to the output/images directory with their default name. This is a problem if the barebox and barebox-aux images have the same name. Also, you need to rename the images in a post-build script if you need certain file names.

With this patch there is a new option in the barebox and barebox-aux config, which allows you to copy the image files with target names of your choice. See the help text of the option for a more detailed explanation.

Signed-off-by: Markus Steinhilber <markus.steinhilber@erbe-med.com>
---
 boot/barebox/barebox-aux/Config.in | 18 ++++++++++++++++++
 boot/barebox/barebox.mk            | 23 ++++++++++++++++++++---
 boot/barebox/barebox/Config.in     | 18 ++++++++++++++++++
 3 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/boot/barebox/barebox-aux/Config.in b/boot/barebox/barebox-aux/Config.in
index d39d24f763..11e595241a 100644
--- a/boot/barebox/barebox-aux/Config.in
+++ b/boot/barebox/barebox-aux/Config.in
@@ -39,6 +39,24 @@ config BR2_TARGET_BAREBOX_AUX_IMAGE_FILE
          - barebox.bin for barebox versions older than 2012.10.
          - barebox-flash-image for later versions.

+config BR2_TARGET_BAREBOX_AUX_IMAGE_FILE_TARGETS
+       string "Image file copy target names"
+       help
+         Space-separated list of target file names used when copying
+         the image files from BR2_TARGET_BAREBOX_IMAGE_FILE to the
+         images directory.
+
+         The target names are applied in their order in the list. So the
+         first file in BR2_TARGET_BAREBOX_IMAGE_FILE is named after the
+         first entry in this list and so on.
+
+         If left empty or the number of names is smaller than the number
+         of files in BR2_TARGET_BAREBOX_IMAGE_FILE the original file
+         name is kept.
+
+         If BR2_TARGET_BAREBOX_IMAGE_FILE is left empty, the default file
+         is named after the first entry in this list.
+
 config BR2_TARGET_BAREBOX_AUX_CUSTOM_ENV
        bool "Generate an environment image"
        help
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk index 9e8a9f67b5..2fb547c58d 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -110,14 +110,31 @@ define $(1)_BUILD_CMDS  endef

 $(1)_IMAGE_FILES = $$(call qstrip,$$(BR2_TARGET_$(1)_IMAGE_FILE))
+$(1)_IMAGE_FILES_TARGETS = $$(call
+qstrip,$$(BR2_TARGET_$(1)_IMAGE_FILE_TARGETS))

 define $(1)_INSTALL_IMAGES_CMDS
+       image_files_array=($$($(1)_IMAGE_FILES)); \
+       image_targets_array=($$($(1)_IMAGE_FILES_TARGETS)); \
        if test -n "$$($(1)_IMAGE_FILES)"; then \
-               cp -L $$(foreach image,$$($(1)_IMAGE_FILES),$$(@D)/$$(image)) $$(BINARIES_DIR) ; \
+               if test -n "$$($(1)_IMAGE_FILES_TARGETS)"; then \
+                       for index in $$$${!image_files_array[*]}; do \
+                               cp -L $$(@D)/$$$${image_files_array[$$$$index]} $$(BINARIES_DIR)/$$$${image_targets_array[$$$$index]}; \
+                       done; \
+               else \
+                       cp -L $$(foreach image,$$($(1)_IMAGE_FILES),$$(@D)/$$(image)) $$(BINARIES_DIR) ; \
+               fi \
        elif test -h $$(@D)/barebox-flash-image ; then \
-               cp -L $$(@D)/barebox-flash-image $$(BINARIES_DIR)/barebox.bin ; \
+               if test -n "$$($(1)_IMAGE_FILES_TARGETS)"; then \
+                       cp -L $$(@D)/barebox-flash-image $$(BINARIES_DIR)/$$$${image_targets_array[0]} ; \
+               else \
+                       cp -L $$(@D)/barebox-flash-image $$(BINARIES_DIR)/barebox.bin ; \
+               fi \
        else \
-               cp $$(@D)/barebox.bin $$(BINARIES_DIR);\
+               if test -n "$$($(1)_IMAGE_FILES_TARGETS)"; then \
+                       cp $$(@D)/barebox.bin $$(BINARIES_DIR)/$$$${image_targets_array[0]};\
+               else \
+                       cp $$(@D)/barebox.bin $$(BINARIES_DIR);\
+               fi \
        fi
        $$($(1)_INSTALL_CUSTOM_ENV)
 endef
diff --git a/boot/barebox/barebox/Config.in b/boot/barebox/barebox/Config.in index 958e294e40..0096695ea5 100644
--- a/boot/barebox/barebox/Config.in
+++ b/boot/barebox/barebox/Config.in
@@ -39,6 +39,24 @@ config BR2_TARGET_BAREBOX_IMAGE_FILE
          - barebox.bin for barebox versions older than 2012.10.
          - barebox-flash-image for later versions.

+config BR2_TARGET_BAREBOX_IMAGE_FILE_TARGETS
+       string "Image file copy target names"
+       help
+         Space-separated list of target file names used when copying
+         the image files from BR2_TARGET_BAREBOX_IMAGE_FILE to the
+         images directory.
+
+         The target names are applied in their order in the list. So the
+         first file in BR2_TARGET_BAREBOX_IMAGE_FILE is named after the
+         first entry in this list and so on.
+
+         If left empty or the number of names is smaller than the number
+         of files in BR2_TARGET_BAREBOX_IMAGE_FILE the original file
+         name is kept.
+
+         If BR2_TARGET_BAREBOX_IMAGE_FILE is left empty, the default file
+         is named after the first entry in this list.
+
 config BR2_TARGET_BAREBOX_BAREBOXENV
        bool "bareboxenv tool in target"
        help
--
2.11.0

________________________________

Erbe Elektromedizin GmbH Firmensitz: 72072 Tuebingen Geschaeftsfuehrer: Christian O. Erbe, Reiner Thede Registergericht: Stuttgart HRB 380137
