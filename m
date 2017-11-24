From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 17:46:10 +0100
Subject: [Buildroot] [RFCv2 7/7] core: implement per-package SDK and target
In-Reply-To: <20171124164610.6431-1-thomas.petazzoni@free-electrons.com>
References: <20171124164610.6431-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171124164610.6431-8-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit implemnts the core of the move to per-package SDK and
target directories. The main idea is that instead of having a global
output/host and output/target in which all packages install files, we
switch to per-package host and target folders, that only contain their
explicit dependencies.

There are two main benefits:

 - Packages will no longer discover dependencies that they do not
   explicitly indicate in their <pkg>_DEPENDENCIES variable.

 - We can support top-level parallel build properly, because a package
   only "sees" its own host directory and target directory, isolated
   from the build of other packages that can happen in parallel.

It works as follows:

 - A new output/per-package/ folder is created, which will contain one
   sub-folder per package, and inside it, a "host" folder and a
   "target" folder:

   output/per-package/busybox/target
   output/per-package/busybox/host
   output/per-package/host-fakeroot/target
   output/per-package/host-fakeroot/host

   This output/per-package/ folder is PER_PACKAGE_DIR.

 - The global TARGET_DIR and HOST_DIR variable now automatically point
   to the per-package directory when PKG is defined. So whenever a
   package references $(HOST_DIR) or $(TARGET_DIR) in its build
   process, it effectively references the per-package host/target
   directories. Note that STAGING_DIR is a sub-dir of HOST_DIR, so it
   is handled as well.

 - Of course, packages have dependencies, so those dependencies must
   be installed in the per-package host and target folders before
   configuring the package. To do so, we simply rsync (using hard
   links to save space and time) the host and target folders of the
   direct dependencies of the package to the current package host and
   target folders.

   We only need to take care of direct dependencies (and not
   recursively all dependencies), because we accumulate into those
   per-package host and target folders the files installed by the
   dependencies. Note that this only works because we make the
   assumption that one package does *not* overwrite files installed by
   another package.

This is basically enough to make per-package SDK and target work. The
only gotcha is that at the end of the build, output/target and
output/host are empty, which means that:

 - The filesystem image creation code cannot work.

 - We don't have a SDK to build code outside of Buildroot.

In order to fix this, this commit extends the target-finalize step so
that it starts by populating output/target and output/host by
rsync-ing into them the target and host directories of all packages
listed in the $(PACKAGES) variable. It is necessary to do this
sequentially in the target-finalize step and not in each
package. Doing it in package installation means that it can be done in
parallel. In that case, there is a chance that two rsyncs are creating
the same hardlink or directory at the same time, which makes one of
them fail.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v1:
 - Remove the LD_LIBRARY_PATH change since we're now longer relying on
   LD_LIBRARY_PATH to allow host programs to find their libraries.
 - Improve commit log according to Arnout suggestions
 - Remove -u option from rsync calls in the main Makefile, suggested
   by Arnout
 - Drop entirely the definitions of <pkg>_TARGET_DIR,
   <pkg>_STAGING_DIR and <pkg>_HOST_DIR, and instead make the global
   TARGET_DIR, HOST_DIR variables point to the per-package directories
   when PKG is defined. Suggested by Arnout.
---
 Makefile               | 20 ++++++++++++++++----
 package/pkg-generic.mk |  9 +++++++++
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index f32fde7a68..339f8cc291 100644
--- a/Makefile
+++ b/Makefile
@@ -215,7 +215,9 @@ BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
 
 BUILD_DIR := $(BASE_DIR)/build
 BINARIES_DIR := $(BASE_DIR)/images
-TARGET_DIR := $(BASE_DIR)/target
+PER_PACKAGE_DIR := $(BASE_DIR)/per-package
+TARGET_DIR = $(if $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/target,$(BASE_DIR)/target)
+
 # initial definition so that 'make clean' works for most users, even without
 # .config. HOST_DIR will be overwritten later when .config is included.
 HOST_DIR := $(BASE_DIR)/host
@@ -237,7 +239,7 @@ LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
 # dependencies anywhere else
 #
 ################################################################################
-$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
+$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):
 	@mkdir -p $@
 
 BR2_CONFIG = $(CONFIG_DIR)/.config
@@ -437,7 +439,7 @@ LZCAT := $(call qstrip,$(BR2_LZCAT))
 TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
 # packages compiled for the host go here
-HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
+HOST_DIR = $(if $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/host,$(call qstrip,$(BR2_HOST_DIR)))
 
 # Quotes are needed for spaces and all in the original PATH content.
 BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
@@ -666,6 +668,16 @@ $(TARGETS_ROOTFS): target-finalize
 
 .PHONY: target-finalize
 target-finalize: $(PACKAGES)
+	@$(call MESSAGE,"Creating global target directory")
+	$(foreach pkg,$(PACKAGES),\
+		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
+		$(PER_PACKAGE_DIR)/$(pkg)/target/ \
+		$(TARGET_DIR)$(sep))
+	@$(call MESSAGE,"Creating global host directory")
+	$(foreach pkg,$(PACKAGES),\
+		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
+		$(PER_PACKAGE_DIR)/$(pkg)/host/ \
+		$(HOST_DIR)$(sep))
 	@$(call MESSAGE,"Finalizing target directory")
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
@@ -958,7 +970,7 @@ printvars:
 clean:
 	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
-		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
+		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR)
 
 .PHONY: distclean
 distclean: clean
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5b32bdf722..6fde618a74 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -215,6 +215,15 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
 $(BUILD_DIR)/%/.stamp_configured:
 	@$(call step_start,configure)
 	@$(call MESSAGE,"Configuring")
+	@mkdir -p $(HOST_DIR) $(TARGET_DIR) $(STAGING_DIR)
+	$(foreach pkg,$($(PKG)_FINAL_DEPENDENCIES),\
+		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
+		$(PER_PACKAGE_DIR)/$(pkg)/host/ \
+		$(HOST_DIR)$(sep))
+	$(foreach pkg,$($(PKG)_FINAL_DEPENDENCIES),\
+		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
+		$(PER_PACKAGE_DIR)/$(pkg)/target/ \
+		$(TARGET_DIR)$(sep))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
-- 
2.13.6
