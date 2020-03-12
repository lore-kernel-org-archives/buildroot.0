From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Mar 2020 10:15:29 +0100
Subject: [Buildroot] [PATCH 1/2] package/pkg-generic.mk: create folders
 before calling hooks
Message-ID: <20200312091530.287681-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit 0e2be4db8ab01d479177a3a187c22525752195ae
("package/pkg-generic: make file list logic parallel build
compatible"), the logic to create the list of files installed by a
particular package was significantly reworked to be compatible with
top-level parallel build.

Before this commit, there was only a after-install step of listing the
files in HOST_DIR/TARGET_DIR/STAGING_DIR. But after this commit, we
now have a before-install logic and an after-install logic.

It turns out that when the before-install logic is called for the very
first host package, $(HOST_DIR) doesn't exist yet, and therefore the
cd $(2) fails, with an error message:

/bin/sh: line 0: cd: /home/thomas/buildroot/output/host: No such file or directory

In fact, $(HOST_DIR), $(STAGING_DIR), $(TARGET_DIR) and
$(BINARIES_DIR) are created by the make rules for host installation,
staging installation, target installation and images installation, but
*after* calling the step_start hooks.

So, we simply fix this problem by creating the directories *before*
calling the step_start hooks.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
This is different solution than the one initially proposed at
http://patchwork.ozlabs.org/patch/1252046/, following some discussion
with Yann E. Morin on IRC. Since the creation of the directories is
already done somewhere, it makes sense to rely on that rather than
adding more code to create them in a difference place.

This patch needs to be backported to 2020.02.x.
---
 package/pkg-generic.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c1b9fe2e59..47238f2649 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -273,9 +273,9 @@ $(BUILD_DIR)/%/.stamp_built::
 
 # Install to host dir
 $(BUILD_DIR)/%/.stamp_host_installed:
+	@mkdir -p $(HOST_DIR)
 	@$(call step_start,install-host)
 	@$(call MESSAGE,"Installing to host directory")
-	@mkdir -p $(HOST_DIR)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
@@ -303,9 +303,9 @@ $(BUILD_DIR)/%/.stamp_host_installed:
 # empty when we use an internal toolchain.
 #
 $(BUILD_DIR)/%/.stamp_staging_installed:
+	@mkdir -p $(STAGING_DIR)
 	@$(call step_start,install-staging)
 	@$(call MESSAGE,"Installing to staging directory")
-	@mkdir -p $(STAGING_DIR)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_STAGING_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
@@ -345,8 +345,8 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 
 # Install to images dir
 $(BUILD_DIR)/%/.stamp_images_installed:
-	@$(call step_start,install-image)
 	@mkdir -p $(BINARIES_DIR)
+	@$(call step_start,install-image)
 	@$(call MESSAGE,"Installing to images directory")
 	$(foreach hook,$($(PKG)_PRE_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_IMAGES_CMDS)
@@ -356,9 +356,9 @@ $(BUILD_DIR)/%/.stamp_images_installed:
 
 # Install to target dir
 $(BUILD_DIR)/%/.stamp_target_installed:
+	@mkdir -p $(TARGET_DIR)
 	@$(call step_start,install-target)
 	@$(call MESSAGE,"Installing to target")
-	@mkdir -p $(TARGET_DIR)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_TARGET_CMDS)
 	$(if $(BR2_INIT_SYSTEMD),\
-- 
2.24.1
