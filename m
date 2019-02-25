From: jared.bents at rockwellcollins.com <jared.bents@rockwellcollins.com>
Date: Mon, 25 Feb 2019 10:10:46 -0600
Subject: [Buildroot] [PATCH v2 1/1] package/rcw: Optional RCW Generation
Message-ID: <20190225161046.2345-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jared Bents <jared.bents@rockwellcollins.com>

Update to add an optional RCW generation using
BR2_PACKAGE_HOST_RCW_CUSTOM_PATH with no modification
to the RCW package source.

--
[v1 -> v2]: * Removed host-python dependency
            * Updated help for BR2_PACKAGE_HOST_RCW_CUSTOM_PATH
            * Added error for number of .rcw not equal to 1
            * Removed symlinks
            * Split large install command into different commands
            * Resolved utils/check-package warnings

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/rcw/Config.in.host | 16 ++++++++++++++++
 package/rcw/rcw.mk         | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/package/rcw/Config.in.host b/package/rcw/Config.in.host
index ba40f76de9..34f211a8ff 100644
--- a/package/rcw/Config.in.host
+++ b/package/rcw/Config.in.host
@@ -10,3 +10,19 @@ config BR2_PACKAGE_HOST_RCW
 	  then use this toolset and examples.
 
 	  https://source.codeaurora.org/external/qoriq/qoriq-components/rcw/
+
+if BR2_PACKAGE_HOST_RCW
+
+config BR2_PACKAGE_HOST_RCW_CUSTOM_PATH
+	string "RCW Source file paths"
+	help
+	  Space-separated list of .rcw and .rcwi files, that will be
+	  used to generate a RCW binary. The entire list of .rcwi files
+	  used by the .rcw file must be specified. There must be a
+	  single .rcw file in the list.
+
+	  This is optional. If left empty, the RCW package will be
+	  included for use in the SDK or with post scripts but the
+	  binary will not be generated.
+
+endif
diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
index f4570b9bde..1b7a73f6e5 100644
--- a/package/rcw/rcw.mk
+++ b/package/rcw/rcw.mk
@@ -10,11 +10,43 @@ RCW_SITE_METHOD = git
 RCW_LICENSE = BSD-3-Clause
 RCW_LICENSE_FILES = LICENSE
 
+# The name of the file to be deliveried in the BINARIES_DIR
+RCW_DELIVERY_FILE = PBL.bin
+
+# Get the name of the custom rcw file from the custom list
+RCW_PROJECT = $(filter %.rcw,$(notdir $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))))
+
+# Error if there is more than one .rcw file
+ifneq ($(RCW_PROJECT),)
+ifneq ($(words $(RCW_PROJECT)),1)
+$(error BR2_PACKAGE_HOST_RCW_CUSTOM_PATH)
+endif
+endif
+
+ifneq ($(RCW_PROJECT),)
+define HOST_RCW_ADD_CUSTOM_RCW_FILES
+	mkdir -p $(@D)/custom_board/rcw
+	cp -f $(filter %.rcwi,$(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))) $(@D)/custom_board
+	cp -f $(filter %.rcw,$(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))) $(@D)/custom_board/rcw
+endef
+HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES
+
+define HOST_RCW_BUILD_CMDS
+	python $(@D)/rcw.py -i $(@D)/custom_board/rcw/$(RCW_PROJECT) -I $(@D)/custom_board -o $(@D)/$(RCW_DELIVERY_FILE)
+endef
+
+define HOST_RCW_INSTALL_DELIVERY_FILE
+	$(INSTALL) -D -m 0644 $(@D)/$(RCW_DELIVERY_FILE) $(BINARIES_DIR)/$(RCW_DELIVERY_FILE)
+endef
+endif
+
 # Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
 # could use a post image or SDK to build/install PBL files.
 define HOST_RCW_INSTALL_CMDS
 	mkdir -p  $(HOST_DIR)/share/rcw
 	cp -a $(@D)/* $(HOST_DIR)/share/rcw
+	$(HOST_RCW_INSTALL_DELIVERY_FILE)
+	find $(HOST_DIR)/share/rcw -name "*.bin" -delete
 endef
 
 $(eval $(host-generic-package))
-- 
2.18.0
