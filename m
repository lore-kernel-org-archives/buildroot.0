From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Jul 2020 22:31:21 +0200
Subject: [Buildroot] [git commit] package/pkg-generic.mk: create directories
 upfront in the configure step
Message-ID: <20200723202658.69BDE814D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2dbb0660fb4d89f8eac86fcff08e9b3d0a705917
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We currently create HOST_DIR, TARGET_DIR, STAGING_DIR and BINARIES_DIR
in their respective installation steps. However, as we are about to
change how the logic to capture files installed by packages is
implemented, we will need these directories to exist at the configure
step to keep things simple.

Note that when BR2_PER_PACKAGE_DIRECTORIES=y, the HOST_DIR, TARGET_DIR
and STAGING_DIR are anyway already created at the configure step, when
populating the per-package HOST_DIR and TARGET_DIR. This also means
that we can drop the "mkdir" from per-package-rsync.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr:
  - create directories after MESSAGE
  - use $(Q) not @
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 5 +----
 package/pkg-utils.mk   | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c9c0d74858..6b3a3f73d9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -251,6 +251,7 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
 $(BUILD_DIR)/%/.stamp_configured:
 	@$(call step_start,configure)
 	@$(call MESSAGE,"Configuring")
+	$(Q)mkdir -p $(HOST_DIR) $(TARGET_DIR) $(STAGING_DIR) $(BINARIES_DIR)
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
 	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -271,7 +272,6 @@ $(BUILD_DIR)/%/.stamp_built::
 
 # Install to host dir
 $(BUILD_DIR)/%/.stamp_host_installed:
-	@mkdir -p $(HOST_DIR)
 	@$(call step_start,install-host)
 	@$(call MESSAGE,"Installing to host directory")
 	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
@@ -301,7 +301,6 @@ $(BUILD_DIR)/%/.stamp_host_installed:
 # empty when we use an internal toolchain.
 #
 $(BUILD_DIR)/%/.stamp_staging_installed:
-	@mkdir -p $(STAGING_DIR)
 	@$(call step_start,install-staging)
 	@$(call MESSAGE,"Installing to staging directory")
 	$(foreach hook,$($(PKG)_PRE_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
@@ -344,7 +343,6 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 
 # Install to images dir
 $(BUILD_DIR)/%/.stamp_images_installed:
-	@mkdir -p $(BINARIES_DIR)
 	@$(call step_start,install-image)
 	@$(call MESSAGE,"Installing to images directory")
 	$(foreach hook,$($(PKG)_PRE_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
@@ -355,7 +353,6 @@ $(BUILD_DIR)/%/.stamp_images_installed:
 
 # Install to target dir
 $(BUILD_DIR)/%/.stamp_target_installed:
-	@mkdir -p $(TARGET_DIR)
 	@$(call step_start,install-target)
 	@$(call MESSAGE,"Installing to target")
 	$(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index d88a14ab0f..b17b5465af 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -163,7 +163,6 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 # $2: 'host' or 'target'
 # $3: destination directory
 define per-package-rsync
-	mkdir -p $(3)
 	$(foreach pkg,$(1),\
 		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 		$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
