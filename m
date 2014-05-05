From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 05 May 2014 15:04:20 +0200
Subject: [Buildroot] [PATCH v4] infra: Add PRE_*_HOOKS for every step
Message-ID: <b6ca647bbdf790bdfdb7.1399295060@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Add PRE_*_HOOKS to all the different steps through which a package may go.

This will help avoid using POST_*_HOOKS to do tasks that should be done
in the PRE_*_HOOKS of the next step.
Otherwise, when the user would do a make foo-re<step>, this would not do
what was really intented, the POST_*_HOOK of the preceding step not
being executed.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
[ThomasDS: rebase, add images hooks to manual]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Changes v3 -> v4 (ThomasDS)
  - Rebase
  - Add 'images' hooks to manual
Changes v2 -> v3
  - Fix a mis-match in the number of spaces used to indent (Yann E.
    Morin)
Changes v1 -> v2
  - Move the PRE_*_HOOKS after the message (Arnout Vandecappelle)
  - PRE_LEGAL_HOOKS executed even if condition is not met (Arnout Vandecappelle)

---
 docs/manual/adding-packages-hooks.txt |  20 ++++++++++++++++++++
 package/pkg-generic.mk                |  22 ++++++++++++++++++++--
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
--- a/docs/manual/adding-packages-hooks.txt
+++ b/docs/manual/adding-packages-hooks.txt
@@ -13,17 +13,37 @@ of the package construction.
 
 The following hook points are available:
 
+* +LIBFOO_PRE_DOWNLOAD_HOOKS+
 * +LIBFOO_POST_DOWNLOAD_HOOKS+
+
+* +LIBFOO_PRE_EXTRACT_HOOKS+
 * +LIBFOO_POST_EXTRACT_HOOKS+
+
+* +LIBFOO_PRE_RSYNC_HOOKS+
 * +LIBFOO_POST_RSYNC_HOOKS+
+
 * +LIBFOO_PRE_PATCH_HOOKS+
 * +LIBFOO_POST_PATCH_HOOKS+
+
 * +LIBFOO_PRE_CONFIGURE_HOOKS+
 * +LIBFOO_POST_CONFIGURE_HOOKS+
+
+* +LIBFOO_PRE_BUILD_HOOKS+
 * +LIBFOO_POST_BUILD_HOOKS+
+
+* +LIBFOO_PRE_INSTALL_HOOKS+ (for host packages only)
 * +LIBFOO_POST_INSTALL_HOOKS+ (for host packages only)
+
+* +LIBFOO_PRE_INSTALL_STAGING_HOOKS+ (for target packages only)
 * +LIBFOO_POST_INSTALL_STAGING_HOOKS+ (for target packages only)
+
+* +LIBFOO_PRE_INSTALL_TARGET_HOOKS+ (for target packages only)
 * +LIBFOO_POST_INSTALL_TARGET_HOOKS+ (for target packages only)
+
+* +LIBFOO_PRE_INSTALL_IMAGES_HOOKS+
+* +LIBFOO_POST_INSTALL_IMAGES_HOOKS+
+
+* +LIBFOO_PRE_LEGAL_INFO_HOOKS+
 * +LIBFOO_POST_LEGAL_INFO_HOOKS+
 
 These variables are 'lists' of variable names containing actions to be
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -70,6 +70,7 @@ endif
 
 # Retrieve the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
+	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 ifeq ($(DL_MODE),DOWNLOAD)
 # Only show the download message if it isn't already downloaded
 	$(Q)if test ! -e $(DL_DIR)/$($(PKG)_SOURCE); then \
@@ -101,6 +102,7 @@ endif
 $(BUILD_DIR)/%/.stamp_extracted:
 	@$(call step_start,extract)
 	@$(call MESSAGE,"Extracting")
+	$(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
 	$($(PKG)_EXTRACT_CMDS)
 # some packages have messed up permissions inside
@@ -114,6 +116,7 @@ endif
 $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
+	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
 	rsync -au $(RSYNC_VCS_EXCLUSIONS) $(SRCDIR)/ $(@D)
 	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
@@ -162,8 +165,8 @@ endif
 # Configure
 $(BUILD_DIR)/%/.stamp_configured:
 	@$(call step_start,configure)
+	@$(call MESSAGE,"Configuring")
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
-	@$(call MESSAGE,"Configuring")
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
@@ -173,6 +176,7 @@ endif
 $(BUILD_DIR)/%/.stamp_built::
 	@$(call step_start,build)
 	@$(call MESSAGE,"Building")
+	$(foreach hook,$($(PKG)_PRE_BUILD_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_BUILD_CMDS)
 	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
@@ -182,6 +186,7 @@ endif
 $(BUILD_DIR)/%/.stamp_host_installed:
 	@$(call step_start,install-host)
 	@$(call MESSAGE,"Installing to host directory")
+	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
@@ -191,6 +196,7 @@ endif
 $(BUILD_DIR)/%/.stamp_staging_installed:
 	@$(call step_start,install-staging)
 	@$(call MESSAGE,"Installing to staging directory")
+	$(foreach hook,$($(PKG)_PRE_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_STAGING_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
@@ -206,6 +212,7 @@ endif
 # Install to images dir
 $(BUILD_DIR)/%/.stamp_images_installed:
 	@$(call step_start,install-image)
+	$(foreach hook,$($(PKG)_PRE_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	@$(call MESSAGE,"Installing to images directory")
 	+$($(PKG)_INSTALL_IMAGES_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
@@ -216,6 +223,7 @@ endif
 $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call step_start,install-target)
 	@$(call MESSAGE,"Installing to target")
+	$(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	$(if $(BR2_INIT_SYSTEMD),\
 		$($(PKG)_INSTALL_INIT_SYSTEMD))
 	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
@@ -387,19 +395,28 @@ endif
 	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $(DL_DIR)/$$($(2)_SOURCE) | \
 	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)
 
-# post-steps hooks
+# pre/post-steps hooks
+$(2)_PRE_DOWNLOAD_HOOKS         ?=
 $(2)_POST_DOWNLOAD_HOOKS        ?=
+$(2)_PRE_EXTRACT_HOOKS          ?=
 $(2)_POST_EXTRACT_HOOKS         ?=
+$(2)_PRE_RSYNC_HOOKS            ?=
 $(2)_POST_RSYNC_HOOKS           ?=
 $(2)_PRE_PATCH_HOOKS            ?=
 $(2)_POST_PATCH_HOOKS           ?=
 $(2)_PRE_CONFIGURE_HOOKS        ?=
 $(2)_POST_CONFIGURE_HOOKS       ?=
+$(2)_PRE_BUILD_HOOKS            ?=
 $(2)_POST_BUILD_HOOKS           ?=
+$(2)_PRE_INSTALL_HOOKS          ?=
 $(2)_POST_INSTALL_HOOKS         ?=
+$(2)_PRE_INSTALL_STAGING_HOOKS  ?=
 $(2)_POST_INSTALL_STAGING_HOOKS ?=
+$(2)_PRE_INSTALL_TARGET_HOOKS   ?=
 $(2)_POST_INSTALL_TARGET_HOOKS  ?=
+$(2)_PRE_INSTALL_IMAGES_HOOKS   ?=
 $(2)_POST_INSTALL_IMAGES_HOOKS  ?=
+$(2)_PRE_LEGAL_INFO_HOOKS       ?=
 $(2)_POST_LEGAL_INFO_HOOKS      ?=
 
 # human-friendly targets and target sequencing
@@ -570,6 +587,7 @@ endif
 # legal-info: produce legally relevant info.
 $(1)-legal-info:
 # Packages without a source are assumed to be part of Buildroot, skip them.
+	$(foreach hook,$($(2)_PRE_LEGAL_INFO_HOOKS),$(call $(hook))$(sep))
 ifneq ($(call qstrip,$$($(2)_SOURCE)),)
 
 ifeq ($$($(2)_SITE_METHOD),local)
