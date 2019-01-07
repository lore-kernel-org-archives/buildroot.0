From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2019 23:05:25 +0100
Subject: [Buildroot] [PATCH 03/19] infra/pkg-generic: introduce new
 stampfile at the beginning of all steps
In-Reply-To: <cover.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <61434bbb54154c9020084939907fff50b4539a21.1546898693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we use the existing stampfiles as a standard make feature to
organise the dependency tree between steps and packages, and so that a
step that successfully finished is not re-done in a later build.

Additionally, there is one stampfile that gained extra use in the recent
past: since 7fb6e782542f (core/instrumentation: shave minutes off the
build time) the built stampfile is now used as a reference to detect
files installed by a package.

However, this falls short during development, when a user may want to
re-install a built-early package without rebuilding it (i.e. make
foo-reinstall). In this case, the built stampfile is not touched, and is
still dated from way back when the package was first built. As such,
almost all files in target (or staging or host) are newer than that, and
so those files are all now accounted for to that package, when in fact
only a minor subset may be accountable to it.

So, we need to introduce a new way to memorise the beginning of a step,
so that we can properly find files installed by a package, even during
development.

To that goal, we introduce a new per-step stampfile, which gets touched
early in the step, and which can now serve as a starting point in time
for that step.

This new stampfile is named after the existing stampfile, with an
appended '_before' tag to it, and thus is always $@_before (note that,
in Makefiles, variables are always 1-char, unless they are in
parenthesis, so $@_before is exactly $(@)_before, but since we use $@
everywhere, we keep using it here, even though it can be slightly
confusing).

Reported-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6581ffa5e8..1b8febe8c5 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -141,6 +141,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 		fi ; \
 	done
 	$(Q)mkdir -p $(@D)
+	$(Q)touch $@_before
 	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 	$(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
@@ -160,6 +161,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
 	@$(call step_start,extract)
 	@$(call MESSAGE,"Extracting")
 	$(Q)mkdir -p $(@D)
+	$(Q)touch $@_before
 	$(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_EXTRACT_CMDS)
 # some packages have messed up permissions inside
@@ -174,6 +176,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call step_start,rsync)
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	@mkdir -p $(@D)
+	$(Q)touch $@_before
 	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
 	rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $($(PKG)_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)
@@ -193,6 +196,7 @@ $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS += $(addsuffix /$(RAWNAME),$(call
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call step_start,patch)
 	@$(call MESSAGE,"Patching")
+	$(Q)touch $@_before
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(foreach p,$($(PKG)_PATCH),$(APPLY_PATCHES) $(@D) $($(PKG)_DL_DIR) $(notdir $(p))$(sep))
 	$(Q)( \
@@ -219,6 +223,7 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
 $(BUILD_DIR)/%/.stamp_configured:
 	@$(call step_start,configure)
 	@$(call MESSAGE,"Configuring")
+	$(Q)touch $@_before
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -229,6 +234,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 $(BUILD_DIR)/%/.stamp_built::
 	@$(call step_start,build)
 	@$(call MESSAGE,"Building")
+	$(Q)touch $@_before
 	$(foreach hook,$($(PKG)_PRE_BUILD_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_BUILD_CMDS)
 	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
@@ -239,6 +245,7 @@ $(BUILD_DIR)/%/.stamp_built::
 $(BUILD_DIR)/%/.stamp_host_installed:
 	@$(call step_start,install-host)
 	@$(call MESSAGE,"Installing to host directory")
+	$(Q)touch $@_before
 	@mkdir -p $(HOST_DIR)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_CMDS)
@@ -269,6 +276,7 @@ $(BUILD_DIR)/%/.stamp_host_installed:
 $(BUILD_DIR)/%/.stamp_staging_installed:
 	@$(call step_start,install-staging)
 	@$(call MESSAGE,"Installing to staging directory")
+	$(Q)touch $@_before
 	@mkdir -p $(STAGING_DIR)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_STAGING_CMDS)
@@ -303,6 +311,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 $(BUILD_DIR)/%/.stamp_images_installed:
 	@$(call step_start,install-image)
 	@$(call MESSAGE,"Installing to images directory")
+	$(Q)touch $@_before
 	@mkdir -p $(BINARIES_DIR)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_IMAGES_CMDS)
@@ -314,6 +323,7 @@ $(BUILD_DIR)/%/.stamp_images_installed:
 $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call step_start,install-target)
 	@$(call MESSAGE,"Installing to target")
+	$(Q)touch $@_before
 	@mkdir -p $(TARGET_DIR)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_TARGET_CMDS)
-- 
2.14.1
