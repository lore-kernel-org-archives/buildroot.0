From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 17 Mar 2013 11:08:09 +0000
Subject: [Buildroot] [PATCH v2] rework patch model
Message-ID: <1363518489-1065-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

At the Buildroot Developers Meeting (4-5 February 2013, in Brussels) a change
to the patch logic was discussed. See 

http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013

for details. In summary:

* For patches stored in the package directory, if package/<pkg>/<version>/ does exist, apply package/<pkg>/<version>/*.patch, otherwise, apply package/<pkg>/*.patch
* For patches stored in the global patches directory, if $(GLOBAL_PATCH_DIR)/<pkg>/<version>/ does exist, apply $(GLOBAL_PATCH_DIR)/<pkg>/<version>/*.patch, otherwise, apply $(GLOBAL_PATCH_DIR)/<pkg>/*.patch

This patch adds the new BR2_GLOBAL_PATCH_DIR configuration item, and reworks
the generic package infrastructure to implement the new patch logic.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 v2: Add documentation, as suggested by Baruch Siach

 Config.in                          |   15 +++++++++++++++
 docs/manual/customize-packages.txt |   23 +++++++++++++++++++++++
 docs/manual/customize.txt          |    2 ++
 package/pkg-generic.mk             |   16 ++++++++--------
 4 files changed, 48 insertions(+), 8 deletions(-)
 create mode 100644 docs/manual/customize-packages.txt

diff --git a/Config.in b/Config.in
index a2c305f..03c4a3e 100644
--- a/Config.in
+++ b/Config.in
@@ -437,6 +437,21 @@ config BR2_PACKAGE_OVERRIDE_FILE
 	  as the source directory for a particular package. See the
 	  Buildroot documentation for more details on this feature.
 
+config BR2_GLOBAL_PATCH_DIR
+	string "global patch directory"
+	help
+	  You may specify a directory containing global package patches.
+	  For a specific version <version> of a specific package <pkg>, patches
+	  are applied as follows.
+
+	  First, the default Buildroot patch set for the package is applied.
+
+	  If the directory $(BR2_GLOBAL_PATCH_DIR)/<pkg>/<version> exists, then
+	  all *.patch files in the directory will be applied.
+
+	  Otherwise, if the directory $(BR2_GLOBAL_PATCH_DIR)/<pkg> exists, then
+	  all *.patch files in the directory will be applied.
+
 endmenu
 
 source "toolchain/Config.in"
diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
new file mode 100644
index 0000000..9e158c7
--- /dev/null
+++ b/docs/manual/customize-packages.txt
@@ -0,0 +1,23 @@
+// -*- mode:doc -*- ;
+
+[[packages-custom]]
+Customizing packages
+~~~~~~~~~~~~~~~~~~~~
+
+It is sometimes useful to apply 'extra' patches to packages - over and
+above those provided in Buildroot. This might be used to support custom
+features in a project, for example, or when working on a new architecture.
+
+The +BR2_GLOBAL_PATCH_DIR+ configuration file option can be
+used to specify a directory containing global package patches.
+
+For a specific version <version> of a specific package <pkg>, patches
+are applied as follows.
+
+First, the default Buildroot patch set for the package is applied.
+
+If the directory $(BR2_GLOBAL_PATCH_DIR)/<pkg>/<version> exists, then
+all *.patch files in the directory will be applied.
+
+Otherwise, if the directory $(BR2_GLOBAL_PATCH_DIR)/<pkg> exists, then
+all *.patch files in the directory will be applied.
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index 3b1a5a7..0456ef1 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -15,3 +15,5 @@ include::customize-kernel-config.txt[]
 include::customize-toolchain.txt[]
 
 include::customize-store.txt[]
+
+include::customize-packages.txt[]
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 57b0fd0..db0b025 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -82,21 +82,21 @@ endif
 # find the package directory (typically package/<pkgname>) and the
 # prefix of the patches
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
+$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(call qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(p)$(sep))
 	$(Q)( \
-	if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME); then \
-	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER)*.patch*)"; then \
-	    support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
-	  else \
-	    support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(RAWNAME)\*.patch $(RAWNAME)\*.patch.$(ARCH) || exit 1; \
-	    if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER); then \
-	      support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH) || exit 1; \
+	for D in $(PATCH_BASE_DIRS); do \
+	  if test -d $${D}; then \
+	    if test -d $${D}/$($(PKG)_VERSION); then \
+	      support/scripts/apply-patches.sh $(@D) $${D}/$($(PKG)_VERSION) \*.patch \*.patch.$(ARCH) || exit 1; \
+	    else \
+	      support/scripts/apply-patches.sh $(@D) $${D} \*.patch \*.patch.$(ARCH) || exit 1; \
 	    fi; \
 	  fi; \
-	fi; \
+	done; \
 	)
 	$(foreach hook,$($(PKG)_POST_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
-- 
1.7.10.4
