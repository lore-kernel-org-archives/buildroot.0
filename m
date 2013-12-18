From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Wed, 18 Dec 2013 04:25:01 -0600
Subject: [Buildroot] [PATCH v6 1/2] Support for multiple BR2_GLOBAL_PATCH_DIR
Message-ID: <1387362302-12198-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding support for specifying multiple directories in
BR2_GLOBAL_PATCH_DIR. This will allow for a layered approach for the
patching of a package.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>

---
Changes v3 -> v6:
  - None

Changes v2 -> v3:
  - changed the generation of patch directories to use 'addsuffix'
    instead of a foreach loop. (suggested by Arnout)

Changes v1 -> v2:
  - change wording in Config.in help (suggested by Thomas D)
---
 Config.in              |   20 ++++++++++++--------
 package/pkg-generic.mk |    5 ++++-
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/Config.in b/Config.in
index 2b401cb..d55e57c 100644
--- a/Config.in
+++ b/Config.in
@@ -461,18 +461,22 @@ config BR2_PACKAGE_OVERRIDE_FILE
 	  Buildroot documentation for more details on this feature.
 
 config BR2_GLOBAL_PATCH_DIR
-	string "global patch directory"
+	string "global patch directories"
 	help
-	  You may specify a directory containing global package patches.
-	  For a specific version <packageversion> of a specific package
-	  <packagename>, patches are applied as follows.
+	  You may specify a space separated list of one or more directories
+	  containing global package patches. For a specific version
+	  <packageversion> of a specific package <packagename>, patches are
+	  applied as follows:
 
-	  First, the default Buildroot patch set for the package is applied.
+	  First, the default Buildroot patch set for the package is applied
+	  from the package's directory in Buildroot.
 
-	  If the directory $(BR2_GLOBAL_PATCH_DIR)/<packagename>/<packageversion>
-	  exists, then all *.patch files in the directory will be applied.
+	  Then for every directory - <global-patch-dir> - that exists in
+	  BR2_GLOBAL_PATCH_DIR, if the directory
+	  <global-patch-dir>/<packagename>/<packageversion>/ exists, then all
+	  *.patch files in this directory will be applied.
 
-	  Otherwise, if the directory $(BR2_GLOBAL_PATCH_DIR)/<packagename> exists,
+	  Otherwise, if the directory <global-patch-dir>/<packagename> exists,
 	  then all *.patch files in the directory will be applied.
 
 endmenu
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 45b808a..66034ba 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -134,8 +134,11 @@ endif
 # The RAWNAME variable is the lowercased package name, which allows to
 # find the package directory (typically package/<pkgname>) and the
 # prefix of the patches
+#
+# For BR2_GLOBAL_PATCH_DIR, only generate if it is defined
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
-$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(call qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)
+$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS =  $($(PKG)_DIR_PREFIX)/$(RAWNAME)
+$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS += $(addsuffix /$(RAWNAME),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call step_start,patch)
 	@$(call MESSAGE,"Patching")
-- 
1.7.9.5
