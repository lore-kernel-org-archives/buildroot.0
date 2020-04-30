From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 30 Apr 2020 11:52:40 +0200
Subject: [Buildroot] [PATCH 03/11] package/pkg-generic.mk: introduce final
 'install' step
In-Reply-To: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
References: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200430095249.782597-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently have four different install steps: target installation,
staging installation, images installation and host installation. These
steps are directly triggered from the $(1)-install make target, so
there is no place where we can run some logic once all installation
steps have completed.

However, as part of improving the reliability of the logic done in
step_pkg_size_before and step_pkg_size_after to detect the files
installed by packages, we would in fact need to run some logic after
all installation steps have completed. This will allow us to make sure
that all files are detected, even if a host package installs something
in the target directory, or if a target package installs something in
the host directory.

To achieve this, this commit implements a new stamp file,
.stamp_installed, which is a step that depends on all four install
steps. Currently, this step does nothing except creating the stamp
file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index fc43807bb0..43f6f86b40 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -374,6 +374,11 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call step_end,install-target)
 	$(Q)touch $@
 
+# Final installation step, completed when all installation steps
+# (host, images, staging, target) have completed
+$(BUILD_DIR)/%/.stamp_installed:
+	$(Q)touch $@
+
 # Remove package sources
 $(BUILD_DIR)/%/.stamp_dircleaned:
 	$(if $(BR2_PER_PACKAGE_DIRECTORIES),rm -Rf $(PER_PACKAGE_DIR)/$(NAME))
@@ -705,6 +710,7 @@ $(2)_FINAL_RECURSIVE_RDEPENDENCIES = $$(sort \
 	$$($(2)_FINAL_RECURSIVE_RDEPENDENCIES__X))
 
 # define sub-target stamps
+$(2)_TARGET_INSTALL =           $$($(2)_DIR)/.stamp_installed
 $(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
 $(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
 $(2)_TARGET_INSTALL_IMAGES =	$$($(2)_DIR)/.stamp_images_installed
@@ -760,14 +766,23 @@ endif
 
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
+$(1)-install:		$$($(2)_TARGET_INSTALL)
 
 ifeq ($$($(2)_TYPE),host)
-$(1)-install:	        $(1)-install-host
+$$($(2)_TARGET_INSTALL): $$($(2)_TARGET_INSTALL_HOST)
 else
 $(2)_INSTALL_STAGING	?= NO
 $(2)_INSTALL_IMAGES	?= NO
 $(2)_INSTALL_TARGET	?= YES
-$(1)-install:		$(1)-install-staging $(1)-install-target $(1)-install-images
+ifeq ($$($(2)_INSTALL_TARGET),YES)
+$$($(2)_TARGET_INSTALL): $$($(2)_TARGET_INSTALL_TARGET)
+endif
+ifeq ($$($(2)_INSTALL_STAGING),YES)
+$$($(2)_TARGET_INSTALL): $$($(2)_TARGET_INSTALL_STAGING)
+endif
+ifeq ($$($(2)_INSTALL_IMAGES),YES)
+$$($(2)_TARGET_INSTALL): $$($(2)_TARGET_INSTALL_IMAGES)
+endif
 endif
 
 ifeq ($$($(2)_INSTALL_TARGET),YES)
@@ -936,6 +951,7 @@ $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
+$$($(2)_TARGET_INSTALL):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
 $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
-- 
2.25.4
