From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Jul 2020 22:31:21 +0200
Subject: [Buildroot] [git commit] package/pkg-generic.mk: introduce final
 'install' step
Message-ID: <20200723202658.5E930814D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2a12a8e9fa292ab61d99f963683a97f1283b7a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[yann.morin.1998 at free.fr: remove stampfile on foo-reinstall]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index bcf5d9815c..c9c0d74858 100644
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
@@ -917,6 +932,7 @@ $(1)-clean-for-reinstall:
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 			rm -f $$($(2)_TARGET_RSYNC)
 endif
+			rm -f $$($(2)_TARGET_INSTALL)
 			rm -f $$($(2)_TARGET_INSTALL_STAGING)
 			rm -f $$($(2)_TARGET_INSTALL_TARGET)
 			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
@@ -936,6 +952,7 @@ $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
+$$($(2)_TARGET_INSTALL):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
 $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
