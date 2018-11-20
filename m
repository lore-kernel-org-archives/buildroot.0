From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Nov 2018 17:35:20 +0100
Subject: [Buildroot] [PATCH next v5 7/9] core: implement per-package SDK and
 target
In-Reply-To: <20181120163522.4281-1-thomas.petazzoni@bootlin.com>
References: <20181120163522.4281-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181120163522.4281-8-thomas.petazzoni@bootlin.com>
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
   be installed in the per-package host and target folders. To do so,
   we simply rsync (using hard links to save space and time) the host
   and target folders of the direct dependencies of the package to the
   current package host and target folders.

   We only need to take care of direct dependencies (and not
   recursively all dependencies), because we accumulate into those
   per-package host and target folders the files installed by the
   dependencies. Note that this only works because we make the
   assumption that one package does *not* overwrite files installed by
   another package.

   This is done for "extract dependencies" at the beginning of the
   extract step, and for "normal dependencies" at the beginning of the
   configure step.

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

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in                        | 18 ++++++++++++++++
 Makefile                         | 37 +++++++++++++++++++++++++++-----
 fs/common.mk                     |  2 +-
 package/pkg-generic.mk           | 20 ++++++++++++++++-
 support/scripts/check-host-rpath |  5 ++++-
 5 files changed, 74 insertions(+), 8 deletions(-)

diff --git a/Config.in b/Config.in
index f965e9d6d8..70eaab900f 100644
--- a/Config.in
+++ b/Config.in
@@ -696,6 +696,24 @@ config BR2_REPRODUCIBLE
 	  This is labeled as an experimental feature, as not all
 	  packages behave properly to ensure reproducibility.
 
+config BR2_PER_PACKAGE_FOLDERS
+	bool "Use per-package folders (experimental)"
+	help
+	  This option will change the build process of Buildroot
+	  package to use per-package target and host directories.
+
+	  This is useful for two related purposes:
+
+	    - Cleanly isolate the build of each package, so that a
+	      given package only "sees" the dependencies it has
+	      explicitly expressed, and not other packages that may
+	      have by chance been built before.
+
+	    - Enable top-level parallel build.
+
+	  This is labeled as an experimental feature, as not all
+	  packages behave properly with per-package folders.
+
 endmenu
 
 comment "Security Hardening Options"
diff --git a/Makefile b/Makefile
index 23032988a5..f3c0e2326e 100644
--- a/Makefile
+++ b/Makefile
@@ -207,7 +207,8 @@ BINARIES_DIR := $(BASE_DIR)/images
 # The target directory is common to all packages,
 # but there is one that is specific to each filesystem.
 BASE_TARGET_DIR := $(BASE_DIR)/target
-TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(BASE_TARGET_DIR))
+PER_PACKAGE_DIR := $(BASE_DIR)/per-package
+
 # initial definition so that 'make clean' works for most users, even without
 # .config. HOST_DIR will be overwritten later when .config is included.
 HOST_DIR := $(BASE_DIR)/host
@@ -230,6 +231,7 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(BR2_CONFIG)
 endif
 
+ifeq ($(BR2_PER_PACKAGE_FOLDERS),)
 # Parallel execution of this Makefile is disabled because it changes
 # the packages building order, that can be a problem for two reasons:
 # - If a package has an unspecified optional dependency and that
@@ -245,6 +247,13 @@ endif
 # use the -j<jobs> option when building, e.g:
 #      make -j$((`getconf _NPROCESSORS_ONLN`+1))
 .NOTPARALLEL:
+endif
+
+ifeq ($(BR2_PER_PACKAGE_FOLDERS),y)
+TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(if $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/target,$(BASE_TARGET_DIR)))
+else
+TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(BASE_TARGET_DIR))
+endif
 
 # timezone and locale may affect build output
 ifeq ($(BR2_REPRODUCIBLE),y)
@@ -455,7 +464,11 @@ LZCAT := $(call qstrip,$(BR2_LZCAT))
 TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
 # packages compiled for the host go here
+ifeq ($(BR2_PER_PACKAGE_FOLDERS),y)
+HOST_DIR = $(if $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/host,$(call qstrip,$(BR2_HOST_DIR)))
+else
 HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
+endif
 
 ifneq ($(HOST_DIR),$(BASE_DIR)/host)
 HOST_DIR_SYMLINK = $(BASE_DIR)/host
@@ -701,14 +714,28 @@ $(TARGETS_ROOTFS): target-finalize
 # Avoid the rootfs name leaking down the dependency chain
 target-finalize: ROOTFS=
 
-host-finalize: $(HOST_DIR_SYMLINK)
+host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
+ifeq ($(BR2_PER_PACKAGE_FOLDERS),y)
+	@$(call MESSAGE,"Creating global host directory")
+	$(foreach pkg,$(PACKAGES),\
+		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
+		$(PER_PACKAGE_DIR)/$(pkg)/host/ \
+		$(HOST_DIR)$(sep))
+endif
 
 .PHONY: staging-finalize
 staging-finalize:
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
 
 .PHONY: target-finalize
-target-finalize: $(PACKAGES) host-finalize
+target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
+ifeq ($(BR2_PER_PACKAGE_FOLDERS),y)
+	@$(call MESSAGE,"Creating global target directory")
+	$(foreach pkg,$(PACKAGES),\
+		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
+		$(PER_PACKAGE_DIR)/$(pkg)/target/ \
+		$(TARGET_DIR)$(sep))
+endif
 	@$(call MESSAGE,"Finalizing target directory")
 	# Check files that are touched by more than one package
 	./support/scripts/check-uniq-files -t target $(BUILD_DIR)/packages-file-list.txt
@@ -972,7 +999,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 
 # staging and target directories do NOT list these as
 # dependencies anywhere else
-$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
+$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):
 	@mkdir -p $@
 
 # outputmakefile generates a Makefile in the output directory, if using a
@@ -1011,7 +1038,7 @@ printvars:
 clean:
 	rm -rf $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
-		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
+		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR)
 
 .PHONY: distclean
 distclean: clean
diff --git a/fs/common.mk b/fs/common.mk
index 96658428ba..fc4be3cc05 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -172,7 +172,7 @@ rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS_ROOTFS += rootfs-$(1)
-PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES))
+PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES)) $(ROOTFS_COMMON_DEPENDENCIES)
 endif
 
 # Check for legacy POST_TARGETS rules
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9b4db845b6..884b868a9a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -98,7 +98,7 @@ GLOBAL_INSTRUMENTATION_HOOKS += check_bin_arch
 # have a proper DT_RPATH or DT_RUNPATH tag
 define check_host_rpath
 	$(if $(filter install-host,$(2)),\
-		$(if $(filter end,$(1)),support/scripts/check-host-rpath $(3) $(HOST_DIR)))
+		$(if $(filter end,$(1)),support/scripts/check-host-rpath $(3) $(HOST_DIR) $(PER_PACKAGE_DIR)))
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += check_host_rpath
 
@@ -126,6 +126,21 @@ endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_user
 endif
 
+# $1: deps
+ifeq ($(BR2_PER_PACKAGE_FOLDERS),y)
+define prepare-per-package-folder
+	mkdir -p $(HOST_DIR) $(TARGET_DIR)
+	$(foreach pkg,$(1),\
+		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
+		$(PER_PACKAGE_DIR)/$(pkg)/host/ \
+		$(HOST_DIR)$(sep))
+	$(foreach pkg,$(1),\
+		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
+		$(PER_PACKAGE_DIR)/$(pkg)/target/ \
+		$(TARGET_DIR)$(sep))
+endef
+endif
+
 ################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
 ################################################################################
@@ -133,6 +148,7 @@ endif
 # Retrieve the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
 	@$(call step_start,download)
+	$(call prepare-per-package-folder,$($(PKG)_FINAL_DOWNLOAD_DEPENDENCIES))
 	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 # Only show the download message if it isn't already downloaded
 	$(Q)for p in $($(PKG)_ALL_DOWNLOADS); do \
@@ -159,6 +175,7 @@ $(BUILD_DIR)/%/.stamp_actual_downloaded:
 $(BUILD_DIR)/%/.stamp_extracted:
 	@$(call step_start,extract)
 	@$(call MESSAGE,"Extracting")
+	$(call prepare-per-package-folder,$($(PKG)_FINAL_EXTRACT_DEPENDENCIES))
 	$(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
 	$($(PKG)_EXTRACT_CMDS)
@@ -219,6 +236,7 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
 $(BUILD_DIR)/%/.stamp_configured:
 	@$(call step_start,configure)
 	@$(call MESSAGE,"Configuring")
+	$(call prepare-per-package-folder,$($(PKG)_FINAL_DEPENDENCIES))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 6c5767da05..787a1763b0 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -11,6 +11,7 @@ export LC_ALL=C
 main() {
     local pkg="${1}"
     local hostdir="${2}"
+    local perpackagedir="${3}"
     local file ret
 
     # Remove duplicate and trailing '/' for proper match
@@ -20,7 +21,7 @@ main() {
     while read file; do
         is_elf "${file}" || continue
         elf_needs_rpath "${file}" "${hostdir}" || continue
-        check_elf_has_rpath "${file}" "${hostdir}" && continue
+        check_elf_has_rpath "${file}" "${hostdir}" "${perpackagedir}" && continue
         if [ ${ret} -eq 0 ]; then
             ret=1
             printf "***\n"
@@ -57,6 +58,7 @@ elf_needs_rpath() {
 check_elf_has_rpath() {
     local file="${1}"
     local hostdir="${2}"
+    local perpackagedir="${3}"
     local rpath dir
 
     while read rpath; do
@@ -65,6 +67,7 @@ check_elf_has_rpath() {
             dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
             [ "${dir}" = "${hostdir}/lib" ] && return 0
             [ "${dir}" = "\$ORIGIN/../lib" ] && return 0
+            [[ ${dir} =~ ${perpackagedir}/[^/]*/host/lib ]] && return 0
         done
     done < <( readelf -d "${file}"                                              \
               |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
-- 
2.19.1
