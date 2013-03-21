From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 21 Mar 2013 10:20:22 +0000
Subject: [Buildroot] [PATCH] new patch model improvements
Message-ID: <1363861222-6940-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Following the patch model rework, Arnout Vandecappelle has suggested a few
simplifications and improvements to the documentation; this patch incorporates
these suggested simplifications and improvements.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 docs/manual/customize-packages.txt |    5 +++++
 package/pkg-generic.mk             |   11 +++++------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
index 1820c54..1e5acfa 100644
--- a/docs/manual/customize-packages.txt
+++ b/docs/manual/customize-packages.txt
@@ -21,3 +21,8 @@ exists, then all +*.patch+ files in the directory will be applied.
 
 Otherwise, if the directory +$(BR2_GLOBAL_PATCH_DIR)/<packagename>+
 exists, then all +*.patch+ files in the directory will be applied.
+
+Note that, within a given directory, patches are applied in alphabetical
+order. Therefore, it is advisable to name patches
++<packagename>-<number>-<description>.patch+, where +<number>+ is a
+numerical value that enforces the patch application order.
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index afb90bf..23c79f5 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -82,18 +82,17 @@ endif
 # find the package directory (typically package/<pkgname>) and the
 # prefix of the patches
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
-$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(call qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(p)$(sep))
 	$(Q)( \
-	for D in $(PATCH_BASE_DIRS); do \
-	  if test -d $${D}; then \
-	    if test -d $${D}/$($(PKG)_VERSION); then \
-	      support/scripts/apply-patches.sh $(@D) $${D}/$($(PKG)_VERSION) \*.patch \*.patch.$(ARCH) || exit 1; \
+	for D in $($(PKG)_DIR_PREFIX) $(call qstrip,$(BR2_GLOBAL_PATCH_DIR)); do \
+	  if test -d $${D}/$(RAWNAME); then \
+	    if test -d $${D}/$(RAWNAME)/$($(PKG)_VERSION); then \
+	      support/scripts/apply-patches.sh $(@D) $${D}/$(RAWNAME)/$($(PKG)_VERSION) \*.patch \*.patch.$(ARCH) || exit 1; \
 	    else \
-	      support/scripts/apply-patches.sh $(@D) $${D} \*.patch \*.patch.$(ARCH) || exit 1; \
+	      support/scripts/apply-patches.sh $(@D) $${D}/$(RAWNAME) \*.patch \*.patch.$(ARCH) || exit 1; \
 	    fi; \
 	  fi; \
 	done; \
-- 
1.7.10.4
