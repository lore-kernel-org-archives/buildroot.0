From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Dec 2019 08:47:52 -0000
Subject: [Buildroot] [git commit] package/rcw: add option to generate the RCW
Message-ID: <20191202083932.81C607FE84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d351bfb2bd39b6e15925a29ba7b81e630c5044dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the rcw tools is built, it is probably to generate the RCW (Reset
Configuration Word) of the target. So it makes sense to do this directly
in the Buildroot infra and install it in the images directory, just like
we do for e.g. device tree blobs.

Add an option BR2_PACKAGE_HOST_RCW_CUSTOM_PATH that allows to specify
the source for the RCW. And while we're at it, make it possible to
specify multiple .rcw and .rcwi files, just like for device trees.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
[Arnout:
  * Reword help text and commit message
  * Remove definition of RCW_DELIVERY_FILE
  * Define and use RCW_FILES
  * Enclose everything in ifneq($(RCW_FILES),)
  * Enclose error in ifeq($(BR_BUILDING),y)
  * Add actual error message
  * Don't limit to only %.rcwi files
  * Don't delete *.bin
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rcw/Config.in.host | 16 ++++++++++++++++
 package/rcw/rcw.mk         | 30 ++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/package/rcw/Config.in.host b/package/rcw/Config.in.host
index ba40f76de9..a9253958d9 100644
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
+	  This is optional. If left empty, the rcw package will be
+	  included for use in the SDK or with post scripts but no
+	  RCW binary will not be generated.
+
+endif
diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
index f4570b9bde..36d2da61b5 100644
--- a/package/rcw/rcw.mk
+++ b/package/rcw/rcw.mk
@@ -10,11 +10,41 @@ RCW_SITE_METHOD = git
 RCW_LICENSE = BSD-3-Clause
 RCW_LICENSE_FILES = LICENSE
 
+RCW_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))
+
+ifneq ($(RCW_FILES),)
+# Get the name of the custom rcw file from the custom list
+RCW_PROJECT = $(notdir $(filter %.rcw,$(RCW_FILES)))
+
+# Error if there are no or more than one .rcw file
+ifeq ($(BR_BUILDING),y)
+ifneq ($(words $(RCW_PROJECT)),1)
+$(error BR2_PACKAGE_HOST_RCW_CUSTOM_PATH must have exactly one .rcw file)
+endif
+endif
+
+define HOST_RCW_ADD_CUSTOM_RCW_FILES
+	mkdir -p $(@D)/custom_board/rcw
+	cp -f $(filter-out %.rcw,$(RCW_FILES)) $(@D)/custom_board
+	cp -f $(filter %.rcw,$(RCW_FILES)) $(@D)/custom_board/rcw
+endef
+HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES
+
+define HOST_RCW_BUILD_CMDS
+	python $(@D)/rcw.py -i $(@D)/custom_board/rcw/$(RCW_PROJECT) -I $(@D)/custom_board -o $(@D)/PBL.bin
+endef
+
+define HOST_RCW_INSTALL_DELIVERY_FILE
+	$(INSTALL) -D -m 0644 $(@D)/PBL.bin $(BINARIES_DIR)/PBL.bin
+endef
+endif
+
 # Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
 # could use a post image or SDK to build/install PBL files.
 define HOST_RCW_INSTALL_CMDS
 	mkdir -p  $(HOST_DIR)/share/rcw
 	cp -a $(@D)/* $(HOST_DIR)/share/rcw
+	$(HOST_RCW_INSTALL_DELIVERY_FILE)
 endef
 
 $(eval $(host-generic-package))
