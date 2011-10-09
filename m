From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Oct 2011 18:17:27 +0200
Subject: [Buildroot] [PATCH 1/2] package: instrument to gather timing data
In-Reply-To: <cover.1318176666.git.thomas.petazzoni@free-electrons.com>
References: <cover.1318176666.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0cbf021419332c37bd77e661c97cfc881329f1bb.1318176666.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instrument the package infrastructure to generate a
$(O)/build-time.data file which contains one line for each step of
each package and the corresponding duration in milliseconds.

The instrumentation is not perfect yet, as it doesn't account for
packages with overriden source directory and the build-time.data is
never removed, so results will accumulate if several partial builds
are done.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index b5ef57b..605b518 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -254,6 +254,18 @@ define sep
 
 endef
 
+define savetime
+       echo $$(($$(date +%s%N)/1000000)) > $(O)/.br.time
+endef
+
+define outputtime
+       newtime=`echo $$(($$(date +%s%N)/1000000))` ; \
+       oldtime=`cat $(O)/.br.time` ; \
+       rm -f .br.time	      ; \
+       timediff=$$(($$newtime-$$oldtime)) ; \
+       echo "$(1),$(2),$$timediff" >> $(O)/build-time.data
+endef
+
 ################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
 ################################################################################
@@ -278,10 +290,12 @@ endif
 $(BUILD_DIR)/%/.stamp_extracted:
 	@$(call MESSAGE,"Extracting")
 	$(Q)mkdir -p $(@D)
+	$(call savetime)
 	$($(PKG)_EXTRACT_CMDS)
 # some packages have messed up permissions inside
 	$(Q)chmod -R +rw $(@D)
 	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
+	$(call outputtime,$($(PKG)_NAME),extract)
 	$(Q)touch $@
 
 # Rsync the source directory if the <pkg>_OVERRIDE_SRCDIR feature is
@@ -311,6 +325,7 @@ endif
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
+	$(call savetime)
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(if $($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
 	$(Q)( \
@@ -326,49 +341,62 @@ $(BUILD_DIR)/%/.stamp_patched:
 	fi; \
 	)
 	$(foreach hook,$($(PKG)_POST_PATCH_HOOKS),$(call $(hook))$(sep))
+	$(call outputtime,$($(PKG)_NAME),patch)
 	$(Q)touch $@
 
 # Configure
 $(BUILD_DIR)/%/.stamp_configured:
+	$(call savetime)
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	@$(call MESSAGE,"Configuring")
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
+	$(call outputtime,$($(PKG)_NAME),configure)
 	$(Q)touch $@
 
 # Build
 $(BUILD_DIR)/%/.stamp_built::
 	@$(call MESSAGE,"Building")
+	$(call savetime)
 	$($(PKG)_BUILD_CMDS)
 	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
+	$(call outputtime,$($(PKG)_NAME),build)
 	$(Q)touch $@
 
 # Install to host dir
 $(BUILD_DIR)/%/.stamp_host_installed:
 	@$(call MESSAGE,"Installing to host directory")
+	$(call savetime)
 	$($(PKG)_INSTALL_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
+	$(call outputtime,$($(PKG)_NAME),install-host)
 	$(Q)touch $@
 
 # Install to staging dir
 $(BUILD_DIR)/%/.stamp_staging_installed:
 	@$(call MESSAGE,"Installing to staging directory")
+	$(call savetime)
 	$($(PKG)_INSTALL_STAGING_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
+	$(call outputtime,$($(PKG)_NAME),install-staging)
 	$(Q)touch $@
 
 # Install to images dir
 $(BUILD_DIR)/%/.stamp_images_installed:
 	@$(call MESSAGE,"Installing to images directory")
+	$(call savetime)
 	$($(PKG)_INSTALL_IMAGES_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
+	$(call outputtime,$($(PKG)_NAME),install-images)
 	$(Q)touch $@
 
 # Install to target dir
 $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call MESSAGE,"Installing to target")
+	$(call savetime)
 	$($(PKG)_INSTALL_TARGET_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
+	$(call outputtime,$($(PKG)_NAME),install-target)
 	$(Q)touch $@
 
 # Clean package
-- 
1.7.4.1
