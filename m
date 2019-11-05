From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  5 Nov 2019 17:46:40 +0100
Subject: [Buildroot] [PATCH next v8 1/6] core: implement per-package SDK and
 target
In-Reply-To: <20191105164646.23820-1-thomas.petazzoni@bootlin.com>
References: <20191105164646.23820-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191105164646.23820-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit implements the core of the move to per-package SDK and
target directories. The main idea is that instead of having a global
output/host and output/target in which all packages install files, we
switch to per-package host and target directories, that only contain
their explicit dependencies.

There are two main benefits:

 - Packages will now see only the dependencies they explicitly list in
   their <pkg>_DEPENDENCIES variable, and the recursive dependencies
   thereof.

 - We can support top-level parallel build properly, because a package
   only "sees" its own host directory and target directory, isolated
   from the build of other packages that can happen in parallel.

It works as follows:

 - A new output/per-package/ directory is created, which will contain
   one sub-directory per package, and inside it, a "host" directory
   and a "target" directory:

   output/per-package/busybox/target
   output/per-package/busybox/host
   output/per-package/host-fakeroot/target
   output/per-package/host-fakeroot/host

   This output/per-package/ directory is PER_PACKAGE_DIR.

 - The global TARGET_DIR and HOST_DIR variable now automatically point
   to the per-package directory when PKG is defined. So whenever a
   package references $(HOST_DIR) or $(TARGET_DIR) in its build
   process, it effectively references the per-package host/target
   directories. Note that STAGING_DIR is a sub-dir of HOST_DIR, so it
   is handled as well.

 - Of course, packages have dependencies, so those dependencies must
   be installed in the per-package host and target directories. To do
   so, we simply rsync (using hard links to save space and time) the
   host and target directories of the direct dependencies of the
   package to the current package host and target directories.

   We only need to take care of direct dependencies (and not
   recursively all dependencies), because we accumulate into those
   per-package host and target directories the files installed by the
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

This change to per-package directories has an impact on the RPATH
built into the host binaries, as those RPATH now point to various
per-package host directories, and no longer to the global host
directory. We do not try to rewrite such RPATHs during the build as
having such RPATHs is perfectly fine, but we still need to handle two
fallouts from this change:

 - The check-host-rpath script, which verifies at the end of each
   package installation that it has the appropriate RPATH, is modified
   to understand that a RPATH to $(PER_PACKAGE_DIR)/<pkg>/host/lib is
   a correct RPAT.

 - The fix-rpath script, which mungles the RPATH mainly for the SDK
   preparation, is modified to rewrite the RPATH to not point to
   per-package directories. Indeed the patchelf --make-rpath-relative
   call only works if the RPATH points to the ROOTDIR passed as
   argument, and this ROOTDIR is the global host directory. Rewriting
   the RPATH to not point to per-package host directories prior to
   this is an easy solution to this issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in                        | 18 ++++++++++++++++++
 Makefile                         | 28 +++++++++++++++++-----------
 package/pkg-generic.mk           |  7 ++++++-
 package/pkg-utils.mk             | 26 ++++++++++++++++++++++++++
 support/scripts/check-host-rpath | 32 +++++++++++++++++++++++++++-----
 support/scripts/fix-rpath        | 29 ++++++++++++++++++++++-------
 6 files changed, 116 insertions(+), 24 deletions(-)

diff --git a/Config.in b/Config.in
index 010b0774e3..5a4239bc9a 100644
--- a/Config.in
+++ b/Config.in
@@ -690,6 +690,24 @@ config BR2_REPRODUCIBLE
 	  This is labeled as an experimental feature, as not all
 	  packages behave properly to ensure reproducibility.
 
+config BR2_PER_PACKAGE_DIRECTORIES
+	bool "Use per-package directories (experimental)"
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
+	  packages behave properly with per-package directories.
+
 endmenu
 
 comment "Security Hardening Options"
diff --git a/Makefile b/Makefile
index bab34ab9b5..823c219c86 100644
--- a/Makefile
+++ b/Makefile
@@ -204,6 +204,7 @@ BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
 BUILD_DIR := $(BASE_DIR)/build
 BINARIES_DIR := $(BASE_DIR)/images
 BASE_TARGET_DIR := $(BASE_DIR)/target
+PER_PACKAGE_DIR := $(BASE_DIR)/per-package
 # initial definition so that 'make clean' works for most users, even without
 # .config. HOST_DIR will be overwritten later when .config is included.
 HOST_DIR := $(BASE_DIR)/host
@@ -452,12 +453,13 @@ XZCAT := $(call qstrip,$(BR2_XZCAT))
 LZCAT := $(call qstrip,$(BR2_LZCAT))
 TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
-# packages compiled for the host go here
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+HOST_DIR = $(if $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/host,$(call qstrip,$(BR2_HOST_DIR)))
+TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(if $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/target,$(BASE_TARGET_DIR)))
+else
 HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
-
-# The target directory is common to all packages,
-# but there is one that is specific to each filesystem.
 TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(BASE_TARGET_DIR))
+endif
 
 ifneq ($(HOST_DIR),$(BASE_DIR)/host)
 HOST_DIR_SYMLINK = $(BASE_DIR)/host
@@ -593,8 +595,8 @@ world: target-post-image
 .PHONY: prepare-sdk
 prepare-sdk: world
 	@$(call MESSAGE,"Rendering the SDK relocatable")
-	$(TOPDIR)/support/scripts/fix-rpath host
-	$(TOPDIR)/support/scripts/fix-rpath staging
+	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath host
+	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath staging
 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
 	mkdir -p $(HOST_DIR)/share/buildroot
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
@@ -727,15 +729,19 @@ $(TARGETS_ROOTFS): target-finalize
 # Avoid the rootfs name leaking down the dependency chain
 target-finalize: ROOTFS=
 
-host-finalize: $(HOST_DIR_SYMLINK)
+.PHONY: host-finalize
+host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
+	@$(call MESSAGE,"Finalizing host directory")
+	$(call per-package-rsync,$(sort $(PACKAGES)),host,$(HOST_DIR))
 
 .PHONY: staging-finalize
 staging-finalize:
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
 
 .PHONY: target-finalize
-target-finalize: $(PACKAGES) host-finalize
+target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
 	@$(call MESSAGE,"Finalizing target directory")
+	$(call per-package-rsync,$(sort $(PACKAGES)),target,$(TARGET_DIR))
 	# Check files that are touched by more than one package
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
@@ -776,7 +782,7 @@ endif
 	ln -sf ../usr/lib/os-release $(TARGET_DIR)/etc
 
 	@$(call MESSAGE,"Sanitizing RPATH in target tree")
-	$(TOPDIR)/support/scripts/fix-rpath target
+	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath target
 
 # For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
 # counterparts are appropriately setup as symlinks ones to the others.
@@ -1014,7 +1020,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 # staging and target directories do NOT list these as
 # dependencies anywhere else
-$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
+$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):
 	@mkdir -p $@
 
 # outputmakefile generates a Makefile in the output directory, if using a
@@ -1046,7 +1052,7 @@ printvars:
 clean:
 	rm -rf $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
-		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
+		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR)
 
 .PHONY: distclean
 distclean: clean
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 893faba22a..b7b211e6e4 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -106,7 +106,7 @@ GLOBAL_INSTRUMENTATION_HOOKS += check_bin_arch
 # have a proper DT_RPATH or DT_RUNPATH tag
 define check_host_rpath
 	$(if $(filter install-host,$(2)),\
-		$(if $(filter end,$(1)),support/scripts/check-host-rpath $(3) $(HOST_DIR)))
+		$(if $(filter end,$(1)),support/scripts/check-host-rpath $(3) $(HOST_DIR) $(PER_PACKAGE_DIR)))
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += check_host_rpath
 
@@ -141,6 +141,7 @@ endif
 # Retrieve the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
 	@$(call step_start,download)
+	$(call prepare-per-package-directory,$($(PKG)_FINAL_DOWNLOAD_DEPENDENCIES))
 	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 # Only show the download message if it isn't already downloaded
 	$(Q)for p in $($(PKG)_ALL_DOWNLOADS); do \
@@ -167,6 +168,7 @@ $(BUILD_DIR)/%/.stamp_actual_downloaded:
 $(BUILD_DIR)/%/.stamp_extracted:
 	@$(call step_start,extract)
 	@$(call MESSAGE,"Extracting")
+	$(call prepare-per-package-directory,$($(PKG)_FINAL_EXTRACT_DEPENDENCIES))
 	$(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
 	$($(PKG)_EXTRACT_CMDS)
@@ -227,6 +229,7 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
 $(BUILD_DIR)/%/.stamp_configured:
 	@$(call step_start,configure)
 	@$(call MESSAGE,"Configuring")
+	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -349,6 +352,7 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 
 # Remove package sources
 $(BUILD_DIR)/%/.stamp_dircleaned:
+	$(if $(BR2_PER_PACKAGE_DIRECTORIES),rm -Rf $(PER_PACKAGE_DIR)/$(NAME))
 	rm -Rf $(@D)
 
 ################################################################################
@@ -926,6 +930,7 @@ $$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_ACTUAL_SOURCE):		PKG=$(2)
 $$($(2)_TARGET_ACTUAL_SOURCE):		PKGDIR=$(pkgdir)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
+$$($(2)_TARGET_DIRCLEAN):		NAME=$(1)
 
 # Compute the name of the Kconfig option that correspond to the
 # package being enabled. We handle three cases: the special Linux
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 63b19e812b..d38971caf6 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -135,6 +135,32 @@ clean-json = $(strip \
 	)))) \
 )
 
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+# rsync the contents of per-package directories
+# $1: space-separated list of packages to rsync from
+# $2: 'host' or 'target'
+# $3: destination directory
+define per-package-rsync
+	mkdir -p $(3)
+	$(foreach pkg,$(1),\
+		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
+		$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
+		$(3)$(sep))
+endef
+
+# prepares the per-package HOST_DIR and TARGET_DIR of the current
+# package, by rsync the host and target directories of the
+# dependencies of this package. The list of dependencies is passed as
+# argument, so that this function can be used to prepare with
+# different set of dependencies (download, extract, configure, etc.)
+#
+# $1: space-separated list of packages to rsync from
+define prepare-per-package-directory
+	$(call per-package-rsync,$(1),host,$(HOST_DIR))
+	$(call per-package-rsync,$(1),target,$(TARGET_DIR))
+endef
+endif
+
 #
 # legal-info helper functions
 #
diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index c8939569e2..9a3866982b 100755
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
@@ -44,6 +45,15 @@ is_elf() {
 # needs such an RPATH if at least of the libraries used by the ELF
 # executable is available in the host library directory. This function
 # returns 0 when a RPATH is needed, 1 otherwise.
+#
+# With per-package directory support, ${hostdir} will point to the
+# current package per-package host directory, and this is where this
+# function will check if the libraries needed by the executable are
+# located (or not). In practice, the ELF executable RPATH may point to
+# another package per-package host directory, but that is fine because
+# if such an executable is within the current package per-package host
+# directory, its libraries will also have been copied into the current
+# package per-package host directory.
 elf_needs_rpath() {
     local file="${1}"
     local hostdir="${2}"
@@ -62,13 +72,19 @@ elf_needs_rpath() {
 # This function checks whether at least one of the RPATH of the given
 # ELF executable (first argument) properly points to the host library
 # directory (second argument), either through an absolute RPATH or a
-# relative RPATH. Having such a RPATH will make sure the ELF
-# executable will find at runtime the shared libraries it depends
-# on. This function returns 0 when a proper RPATH was found, or 1
-# otherwise.
+# relative RPATH. In the context of per-package directory support,
+# ${hostdir} (second argument) points to the current package host
+# directory. However, it is perfectly valid for an ELF binary to have
+# a RPATH pointing to another package per-package host directory,
+# which is why such RPATH is also accepted (the per-package directory
+# gets passed as third argument). Having a RPATH pointing to the host
+# directory will make sure the ELF executable will find at runtime the
+# shared libraries it depends on. This function returns 0 when a
+# proper RPATH was found, or 1 otherwise.
 check_elf_has_rpath() {
     local file="${1}"
     local hostdir="${2}"
+    local perpackagedir="${3}"
     local rpath dir
 
     while read rpath; do
@@ -77,6 +93,12 @@ check_elf_has_rpath() {
             dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
             [ "${dir}" = "${hostdir}/lib" ] && return 0
             [ "${dir}" = "\$ORIGIN/../lib" ] && return 0
+	    # This check is done even for builds where
+	    # BR2_PER_PACKAGE_DIRECTORIES is disabled. In this case,
+	    # PER_PACKAGE_DIR and therefore ${perpackagedir} points to
+	    # a non-existent directory, and this check will always be
+	    # false.
+            [[ ${dir} =~ ${perpackagedir}/[^/]+/host/lib ]] && return 0
         done
     done < <( readelf -d "${file}"                                              \
               |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index fa138ca15a..9fc9ef8514 100755
--- a/support/scripts/fix-rpath
+++ b/support/scripts/fix-rpath
@@ -127,14 +127,29 @@ main() {
 
     while read file ; do
         # check if it's an ELF file
-        if ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1; then
-            # make files writable if necessary
-            changed=$(chmod -c u+w "${file}")
-            # call patchelf to sanitize the rpath
-            ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
-            # restore the original permission
-            test "${changed}" != "" && chmod u-w "${file}"
+        rpath=$(${PATCHELF} --print-rpath "${file}" 2>&1)
+        if test $? -ne 0 ; then
+            continue
         fi
+
+        # make files writable if necessary
+        changed=$(chmod -c u+w "${file}")
+
+        # With per-package directory support, most RPATH of host
+        # binaries will point to per-package directories. This won't
+        # work with the --make-rpath-relative ${rootdir} invocation as
+        # the per-package host directory is not within ${rootdir}. So,
+        # we rewrite all RPATHs pointing to per-package directories so
+        # that they point to the global host directry.
+        changed_rpath=$(echo ${rpath} | sed "s@${PER_PACKAGE_DIR}/[^/]+/host@${HOST_DIR}@")
+        if test "${rpath}" != "${changed_rpath}" ; then
+            ${PATCHELF} --set-rpath ${changed_rpath} "${file}"
+        fi
+
+        # call patchelf to sanitize the rpath
+        ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
+        # restore the original permission
+        test "${changed}" != "" && chmod u-w "${file}"
     done < <(find "${rootdir}" ${find_args[@]})
 
     # Restore patched patchelf utility
-- 
2.21.0
