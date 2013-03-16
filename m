From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sat, 16 Mar 2013 20:49:02 +0000
Subject: [Buildroot] [PATCH] rework patch model
Message-ID: <1363466942-21510-1-git-send-email-spdawson@gmail.com>
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
 Config.in              |    7 +++++++
 package/pkg-generic.mk |   16 ++++++++--------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/Config.in b/Config.in
index a2c305f..3008374 100644
--- a/Config.in
+++ b/Config.in
@@ -437,6 +437,13 @@ config BR2_PACKAGE_OVERRIDE_FILE
 	  as the source directory for a particular package. See the
 	  Buildroot documentation for more details on this feature.
 
+config BR2_GLOBAL_PATCH_DIR
+	string "global patch directory"
+	help
+	  You may specify a directory containing global package patches.
+	  Note that any global patches for a package will be applied AFTER
+	  the default Buildroot patch set for the package.
+
 endmenu
 
 source "toolchain/Config.in"
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
