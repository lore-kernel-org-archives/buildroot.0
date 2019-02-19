From: jared.bents at rockwellcollins.com <jared.bents@rockwellcollins.com>
Date: Tue, 19 Feb 2019 14:31:57 -0600
Subject: [Buildroot] [PATCH v1 1/1] package/rcw: Optional RCW Generation
Message-ID: <20190219203157.26095-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jared Bents <jared.bents@rockwellcollins.com>

Update to add an optional RCW generation using
BR2_PACKAGE_HOST_RCW_CUSTOM_PATH with no modification
to the RCW package source.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/rcw/Config.in.host | 22 ++++++++++++++++++++++
 package/rcw/rcw.mk         | 31 +++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/package/rcw/Config.in.host b/package/rcw/Config.in.host
index ba40f76de9..95e15fbd83 100644
--- a/package/rcw/Config.in.host
+++ b/package/rcw/Config.in.host
@@ -10,3 +10,25 @@ config BR2_PACKAGE_HOST_RCW
 	  then use this toolset and examples.
 
 	  https://source.codeaurora.org/external/qoriq/qoriq-components/rcw/
+
+if BR2_PACKAGE_HOST_RCW
+
+config BR2_PACKAGE_HOST_RCW_CUSTOM_PATH
+
+	string "RCW Source file paths"
+	help
+	  Path to custom RCW source files. You can provide a
+	  list of rcw paths to copy and build, separated by spaces.
+	  NOTE: If you want to build one common rcw file
+	  (e.g. "X.rcwi") with main rcw file (e.g. "Y.rcw") then
+	  include common rcw file X.rcwi in main rcw file Y.rcw
+	  using "#include"
+
+	  Do not use ".rcw" suffix for common rcw file(s) because this
+	  tool will compile the .rcw into a binary image.
+
+	  This is optional. If left empty, the RCW package will be
+	  included for use in the SDK or with post scripts but the
+	  binary will not be generated.
+
+endif
diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
index f4570b9bde..d33d655e6d 100644
--- a/package/rcw/rcw.mk
+++ b/package/rcw/rcw.mk
@@ -9,7 +9,19 @@ RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
 RCW_SITE_METHOD = git
 RCW_LICENSE = BSD-3-Clause
 RCW_LICENSE_FILES = LICENSE
+HOST_RCW_DEPENDENCIES = host-python
 
+# The name of the file to be deliveried in the BINARIES_DIR
+RCW_DELIVERY_FILE = PBL.bin
+
+# Use the host python
+HOST_PYTHON=$(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR)
+
+# Get the name of the custom rcw file from the custom list
+RCW_PROJECT=$(filter %.rcw,$(notdir $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))))
+
+
+ifeq ($(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH),"")
 # Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
 # could use a post image or SDK to build/install PBL files.
 define HOST_RCW_INSTALL_CMDS
@@ -17,4 +29,23 @@ define HOST_RCW_INSTALL_CMDS
 	cp -a $(@D)/* $(HOST_DIR)/share/rcw
 endef
 
+else
+# Generate rcw using the specified source files from within the build directory.
+# Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
+# could use a SDK to rebuild/install PBL files.
+define HOST_RCW_INSTALL_CMDS
+	mkdir -p $(@D)/custom_board/rcw
+	cp -f $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH)) $(@D)/custom_board/rcw
+	for rcwi in $(filter %.rcwi,$(notdir $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH)))); do \
+		cd $(@D)/custom_board; ln -sf rcw/$${rcwi} $${rcwi} ; \
+	done
+	$(HOST_PYTHON) $(@D)/rcw.py -i $(@D)/custom_board/rcw/${RCW_PROJECT} -I $(@D)/custom_board/ -o $(@D)/$(RCW_DELIVERY_FILE)
+	$(INSTALL) -D -m 0644 $(@D)/$(RCW_DELIVERY_FILE) $(BINARIES_DIR)/$(RCW_DELIVERY_FILE)
+	mkdir -p  $(HOST_DIR)/share/rcw
+	cp -a $(@D)/* $(HOST_DIR)/share/rcw
+	find $(HOST_DIR)/share/rcw -name "*.bin" -delete
+endef
+
+endif
+
 $(eval $(host-generic-package))
-- 
2.18.0
