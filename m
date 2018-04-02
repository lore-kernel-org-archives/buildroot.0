From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Apr 2018 16:04:03 +0200
Subject: [Buildroot] [git commit] pkg-{download, generic,
 luarocks}: use existing $($(PKG)_DL_DIR)
Message-ID: <20180402141058.3F4BB82586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d506f873e41c88ee9d6d502078afc36f23d86b32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Let the infrastructure use the already existing variable $(PKG)_DL_DIR

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk | 2 +-
 package/pkg-generic.mk  | 8 ++++----
 package/pkg-luarocks.mk | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 2d5f26bfc5..3f525ee5e4 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -96,7 +96,7 @@ define DOWNLOAD
 		-H '$(PKGDIR)/$($(PKG)_RAWNAME).hash' \
 		-n '$($(PKG)_BASENAME_RAW)' \
 		-N '$($(PKG)_RAWNAME)' \
-		-o '$(DL_DIR)/$(notdir $(1))' \
+		-o '$($(PKG)_DL_DIR)/$(notdir $(1))' \
 		$(if $($(PKG)_GIT_SUBMODULES),-r) \
 		$(DOWNLOAD_URIS) \
 		$(QUIET) \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 25a34e6ca2..01d61ac0ad 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -133,7 +133,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 # Only show the download message if it isn't already downloaded
 	$(Q)for p in $($(PKG)_ALL_DOWNLOADS); do \
-		if test ! -e $(DL_DIR)/`basename $$p` ; then \
+		if test ! -e $($(PKG)_DL_DIR)/`basename $$p` ; then \
 			$(call MESSAGE,"Downloading") ; \
 			break ; \
 		fi ; \
@@ -185,7 +185,7 @@ $(BUILD_DIR)/%/.stamp_patched:
 	@$(call step_start,patch)
 	@$(call MESSAGE,"Patching")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
-	$(foreach p,$($(PKG)_PATCH),$(APPLY_PATCHES) $(@D) $(DL_DIR) $(notdir $(p))$(sep))
+	$(foreach p,$($(PKG)_PATCH),$(APPLY_PATCHES) $(@D) $($(PKG)_DL_DIR) $(notdir $(p))$(sep))
 	$(Q)( \
 	for D in $(PATCH_BASE_DIRS); do \
 	  if test -d $${D}; then \
@@ -613,7 +613,7 @@ $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 
 # default extract command
 $(2)_EXTRACT_CMDS ?= \
-	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
+	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$($(2)_DL_DIR)/$$($(2)_SOURCE) | \
 	$$(TAR) --strip-components=$$($(2)_STRIP_COMPONENTS) \
 		-C $$($(2)_DIR) \
 		$$(foreach x,$$($(2)_EXCLUDES),--exclude='$$(x)' ) \
@@ -901,7 +901,7 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 # patches, as they are handled specially afterwards.
 	$$(foreach e,$$($(2)_ACTUAL_SOURCE_TARBALL) $$(notdir $$($(2)_EXTRA_DOWNLOADS)),\
 		$$(Q)support/scripts/hardlink-or-copy \
-			$$(DL_DIR)/$$(e) \
+			$$($(2)_DL_DIR)/$$(e) \
 			$$($(2)_REDIST_SOURCES_DIR)$$(sep))
 # Save patches and generate the series file
 	$$(Q)while read f; do \
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index d762867111..e2b48cfb4c 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -52,7 +52,7 @@ ifndef $(2)_EXTRACT_CMDS
 define $(2)_EXTRACT_CMDS
 	mkdir -p $$($(2)_DIR)/luarocks-extract
 	cd $$($(2)_DIR)/luarocks-extract && \
-		$$(LUAROCKS_RUN_ENV) $$(LUAROCKS_RUN_CMD) unpack --force $$(DL_DIR)/$$($(2)_SOURCE)
+		$$(LUAROCKS_RUN_ENV) $$(LUAROCKS_RUN_CMD) unpack --force $$($(2)_DL_DIR)/$$($(2)_SOURCE)
 	mv $$($(2)_DIR)/luarocks-extract/*/* $$($(2)_DIR)
 endef
 endif
