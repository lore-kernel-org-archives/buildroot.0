From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu,  6 Dec 2012 12:46:29 +0000
Subject: [Buildroot] [PATCH v3] Add support for custom package patches
Message-ID: <1354797989-5888-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Add a configuration item to allow a space-separated list of directories
to be specified, from which custom package patches will be applied.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 v3: Add documentation, as suggested by Samuel Martin. Incorporate further
     improvements suggested by Arnout Vandecappelle
 v2: Incorporate improvements suggested by Arnout Vandecappelle, and
     fix handling of the case where the new configuration item is not set

 Config.in                          |    7 +++++++
 docs/manual/customize-packages.txt |   15 +++++++++++++++
 docs/manual/customize.txt          |    2 ++
 package/pkg-generic.mk             |   29 +++++++++++++++++------------
 4 files changed, 41 insertions(+), 12 deletions(-)
 create mode 100644 docs/manual/customize-packages.txt

diff --git a/Config.in b/Config.in
index b319ac7..25910e5 100644
--- a/Config.in
+++ b/Config.in
@@ -419,6 +419,13 @@ config BR2_PACKAGE_OVERRIDE_FILE
 	  as the source directory for a particular package. See the
 	  Buildroot documentation for more details on this feature.
 
+config BR2_EXTRA_PACKAGE_PATCH_DIRS
+	string "extra package patch directories"
+	help
+	  You may specify a space-separated list of directories containing
+	  extra package patches. Note that any extra patches for a package
+	  will be applied AFTER the Buildroot patch set for the package.
+
 endmenu
 
 source "toolchain/Config.in"
diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
new file mode 100644
index 0000000..4dea34a
--- /dev/null
+++ b/docs/manual/customize-packages.txt
@@ -0,0 +1,15 @@
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
+The +BR2_EXTRA_PACKAGE_PATCH_DIRS+ configuration file option can be
+used to specify a set of extra package patch directories. The option
+should be set to a space-separated list of directories containing the
+extra package patches. Note that any extra patches for a package
+will be applied *after* the Buildroot patch set for the package.
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index 1e6f4e8..a2705e5 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -12,3 +12,5 @@ include::customize-uclibc-config.txt[]
 include::customize-kernel-config.txt[]
 
 include::customize-toolchain.txt[]
+
+include::customize-packages.txt[]
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index fc05dc6..31493b9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -69,6 +69,22 @@ else
 	@true # Nothing to do to source a local package
 endif
 
+# Apply package patches from the specified directory
+define pkg-apply-patch-directory
+	if test -d $(1); then \
+	  if test "$(wildcard $(1)/$(NAMEVER)*.patch*)"; then \
+	    support/scripts/apply-patches.sh $(@D) $(1) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
+	  else \
+	    support/scripts/apply-patches.sh $(@D) $(1) $(RAWNAME)\*.patch $(RAWNAME)\*.patch.$(ARCH) || exit 1; \
+	    if test -d $(1)/$(NAMEVER); then \
+	      support/scripts/apply-patches.sh $(@D) $(1)/$(NAMEVER) \*.patch \*.patch.$(ARCH) || exit 1; \
+	    fi; \
+	  fi; \
+	fi;
+endef
+
+PACKAGE_PATCH_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(call qstrip,$(BR2_EXTRA_PACKAGE_PATCH_DIRS))
+
 # Patch
 #
 # The RAWNAME variable is the lowercased package name, which allows to
@@ -79,18 +95,7 @@ $(BUILD_DIR)/%/.stamp_patched:
 	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(if $($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
-	$(Q)( \
-	if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME); then \
-	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER)*.patch*)"; then \
-	    support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
-	  else \
-	    support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(RAWNAME)\*.patch $(RAWNAME)\*.patch.$(ARCH) || exit 1; \
-	    if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER); then \
-	      support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH) || exit 1; \
-	    fi; \
-	  fi; \
-	fi; \
-	)
+	$(Q)$(foreach patchdir,$(PACKAGE_PATCH_DIRS),$(call pkg-apply-patch-directory,$(patchdir)))
 	$(foreach hook,$($(PKG)_POST_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
-- 
1.7.10.4
