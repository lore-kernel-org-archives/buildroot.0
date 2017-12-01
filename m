From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  1 Dec 2017 21:53:42 +0100
Subject: [Buildroot] [RFCv3 05/15] pkg-generic: add .stamp_installed step
In-Reply-To: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171201205352.24287-6-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The installation to target, staging and images as well as the host
installation are all done in 4 different make targets. We don't have
any place currently to run something at the end of a package
installation, i.e once all of target/staging/images (for target) or
host (for host) installation have completed.

We will need such a step to fix the RPATH of binaries in the host
directory. Indeed, while normally only host packages should install
things in $(HOST_DIR), in practice a number of target packages (ex:
qt4, qt5base) do install things in $(HOST_DIR).

Therefore, we want to run our RPATH fixing logic at the end of all
installation steps. To achieve this, this commit introduces a new make
target, .stamp_installed, which depends on
.stamp_{target,staging,images}_installed for target packages and
.stamp_host_installed for host packages.

This new step currently doesn't do anything, but the actual logic is
added in a follow-up commit.

This change in fact makes the overall step sequencing more logical:
for all steps the dependencies were done on the stamp file targets,
except for the install step where we were using phony targets to make
$(1)-install depends on $(1)-install-{target,staging,images,host}. So
now, the phony targets $(1)-install-{target,staging,images,host} are
only human-readable targets that are shortcuts to the corresponding
stamp file targets, and not usded anymore for the step
sequencing. This makes them more consistent with the other phony
$(1)-{build,configure,patch,...} phony targets.

It also makes $(1)-install-host more consistent with other phony
targets: $(1)-install-target only existed if the package had
<pkg>_INSTALL_TARGET = YES, but $(1)-install-host existed
unconditionally. Now it only exists if it's a host package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v2:
 - None
Changes since v1:
 - New patch.
---
 package/pkg-generic.mk | 44 +++++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 0019814276..2b821e9bdf 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -340,6 +340,12 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call step_end,install-target)
 	$(Q)touch $@
 
+# Finalize installation
+$(BUILD_DIR)/%/.stamp_installed:
+	@$(call step_start,install)
+	@$(call step_end,install)
+	$(Q)touch $@
+
 # Remove package sources
 $(BUILD_DIR)/%/.stamp_dircleaned:
 	rm -Rf $(@D)
@@ -595,6 +601,7 @@ $(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
 $(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
 $(2)_TARGET_INSTALL_IMAGES =	$$($(2)_DIR)/.stamp_images_installed
 $(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
+$(2)_TARGET_INSTALL =      	$$($(2)_DIR)/.stamp_installed
 $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
 $(2)_TARGET_RSYNC =	        $$($(2)_DIR)/.stamp_rsynced
@@ -642,38 +649,40 @@ $(2)_ROOTFS_POST_CMD_HOOKS      ?=
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
 
+$(1)-install:			$$($(2)_TARGET_INSTALL)
+
 ifeq ($$($(2)_TYPE),host)
-$(1)-install:	        $(1)-install-host
-else
-$(1)-install:		$(1)-install-staging $(1)-install-target $(1)-install-images
-endif
+
+$(1)-install-host:		$$($(2)_TARGET_INSTALL_HOST)
+$$($(2)_TARGET_INSTALL):	$$($(2)_TARGET_INSTALL_HOST)
+
+else # host vs. target
 
 ifeq ($$($(2)_INSTALL_TARGET),YES)
 $(1)-install-target:		$$($(2)_TARGET_INSTALL_TARGET)
-$$($(2)_TARGET_INSTALL_TARGET):	$$($(2)_TARGET_BUILD)
-else
-$(1)-install-target:
+$$($(2)_TARGET_INSTALL):	$$($(2)_TARGET_INSTALL_TARGET)
 endif
 
 ifeq ($$($(2)_INSTALL_STAGING),YES)
-$(1)-install-staging:			$$($(2)_TARGET_INSTALL_STAGING)
-$$($(2)_TARGET_INSTALL_STAGING):	$$($(2)_TARGET_BUILD)
-# Some packages use install-staging stuff for install-target
-$$($(2)_TARGET_INSTALL_TARGET):		$$($(2)_TARGET_INSTALL_STAGING)
-else
-$(1)-install-staging:
+$(1)-install-staging:		$$($(2)_TARGET_INSTALL_STAGING)
+$$($(2)_TARGET_INSTALL):	$$($(2)_TARGET_INSTALL_STAGING)
 endif
 
 ifeq ($$($(2)_INSTALL_IMAGES),YES)
 $(1)-install-images:		$$($(2)_TARGET_INSTALL_IMAGES)
-$$($(2)_TARGET_INSTALL_IMAGES):	$$($(2)_TARGET_BUILD)
-else
-$(1)-install-images:
+$$($(2)_TARGET_INSTALL):	$$($(2)_TARGET_INSTALL_IMAGES)
 endif
 
-$(1)-install-host:		$$($(2)_TARGET_INSTALL_HOST)
+endif # host vs.target
+
+$$($(2)_TARGET_INSTALL_TARGET):	$$($(2)_TARGET_BUILD)
+$$($(2)_TARGET_INSTALL_STAGING):$$($(2)_TARGET_BUILD)
+$$($(2)_TARGET_INSTALL_IMAGES):	$$($(2)_TARGET_BUILD)
 $$($(2)_TARGET_INSTALL_HOST):	$$($(2)_TARGET_BUILD)
 
+# Some packages use install-staging stuff for install-target
+$$($(2)_TARGET_INSTALL_TARGET):		$$($(2)_TARGET_INSTALL_STAGING)
+
 $(1)-build:		$$($(2)_TARGET_BUILD)
 $$($(2)_TARGET_BUILD):	$$($(2)_TARGET_CONFIGURE)
 
@@ -813,6 +822,7 @@ $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
+$$($(2)_TARGET_INSTALL):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
 $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
-- 
2.13.6
