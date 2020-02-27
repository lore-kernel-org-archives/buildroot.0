From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 22:46:20 +0100
Subject: [Buildroot] [git commit] package/pkg-generic: make file list logic
 parallel build compatible
Message-ID: <20200227215246.53AA38EDD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e2be4db8ab01d479177a3a187c22525752195ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current solution used to collect the list of files installed by
packages does not work for top-level parallel build. Indeed, we rely
on a file created after the installation of the previous package to
build the list of files installed by the current package.

This works well when packages are built sequentially, but badly fails
when using top-level parallel build.

More specifically, top-level parallel build can fail with:

comm: /home/thomas/buildroot/output/build/.files-list-host.new: No such file or directory

Because that file has been removed concurrently by the build process
of another package.

This commit reworks the logic in a very straight-forward way. Before
the installation of each package, we store the list of files that are
already installed and store it in the package build directory. After
the installation of each package, we store again that list of files,
calculate the difference with the before file, and store that as the
list of files installed by that package, still in the package build
directory.

At the end of the build, in target-finalize we collect all the
collected information into the global package file lists, that
continue to be installed in the same location as before, with the same
name.

There are however some differences:

 (1) The files are no longer ordered in build order, but by alphabetic
     ordering of packages. Indeed, "build order" no longer makes any
     sense in the context of top-level parallel build.

 (2) Some files which were incorrectly tracked are no longer
     tracked. For example, the toolchain package is a target package,
     but it installs files in $(HOST_DIR). In the previous logic, the
     files installed by the toolchain package in $(HOST_DIR) were
     incorrectly affected to the next host package that was installed
     after the toolchain package. With our new logic, those files are
     no longer tracked at all. To fix this, we would have to change
     the logic to scan HOST_DIR/TARGET_DIR/STAGING_DIR for all
     installation steps, not just for the install-host, install-target
     and install-staging steps respecitively. But the result was
     already incorrect anyway, and therefore this should be fixed
     separately.

Note that the check_bin_arch hook needs to be adjusted: it was using
the global package-file-list.txt file, but this file is now created
only at the very end of the build. So instead, we use the current
package .file-list.txt file to know which packages have been installed
by the current package in $(TARGET_DIR).

Fixes:

  http://autobuild.buildroot.net/results/4e60fa31b1cd08bc7fdf9c5dd3a3f4941e029ba3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile               | 15 +++++--------
 package/pkg-generic.mk | 59 +++++++++++++++++++++++---------------------------
 2 files changed, 33 insertions(+), 41 deletions(-)

diff --git a/Makefile b/Makefile
index e9c2741fed..c8017b61ec 100644
--- a/Makefile
+++ b/Makefile
@@ -804,15 +804,12 @@ endif # merged /usr
 
 	touch $(TARGET_DIR)/usr
 
-# AFTER ALL FILE-CHANGING ACTIONS:
-# Update timestamps in internal file list to fix attribution of files
-# to packages on subsequent builds
-	@$(call step_pkg_size_file_list,$(TARGET_DIR))
-	@$(call step_pkg_size_finalize)
-	@$(call step_pkg_size_file_list,$(STAGING_DIR),-staging)
-	@$(call step_pkg_size_finalize,-staging)
-	@$(call step_pkg_size_file_list,$(HOST_DIR),-host)
-	@$(call step_pkg_size_finalize,-host)
+	cat $(sort $(wildcard $(BUILD_DIR)/*/.files-list.txt)) > \
+		$(BUILD_DIR)/packages-file-list.txt
+	cat $(sort $(wildcard $(BUILD_DIR)/*/.files-list-host.txt)) > \
+		$(BUILD_DIR)/packages-file-list-host.txt
+	cat $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.txt)) > \
+		$(BUILD_DIR)/packages-file-list-staging.txt
 
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6687ac9198..7b240ca012 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -57,50 +57,45 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 
 # Hooks to collect statistics about installed files
 
-# Helper function to create the file list -- also used from target-finalize
-# $(1): base directory to search in
-# $(2): suffix of file  (optional)
-define step_pkg_size_file_list
-	cd $(1); \
+# $(1): package name
+# $(2): base directory to search in
+# $(3): suffix of file (optional)
+define step_pkg_size_before
+	cd $(2); \
 	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
-		| LC_ALL=C sort > $(BUILD_DIR)/.files-list$(2).new
-endef
-
-# Helper function to mark the latest file list as the reference for next
-# iteration -- also used from target-finalize
-# $(1): suffix of file  (optional)
-define step_pkg_size_finalize
-	mv $(BUILD_DIR)/.files-list$(1).new \
-		$(BUILD_DIR)/.files-list$(1).stat
+		| LC_ALL=C sort > $($(PKG)_BUILDDIR)/.files-list$(3).before
 endef
 
-# The suffix is typically empty for the target variant, for legacy backward
-# compatibility.
 # $(1): package name
 # $(2): base directory to search in
-# $(3): suffix of file  (optional)
-define step_pkg_size_inner
-	@touch $(BUILD_DIR)/.files-list$(3).stat
-	@touch $(BUILD_DIR)/packages-file-list$(3).txt
-	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
-	$(call step_pkg_size_file_list,$(2),$(3))
+# $(3): suffix of file (optional)
+define step_pkg_size_after
+	cd $(2); \
+	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
+		| LC_ALL=C sort > $($(PKG)_BUILDDIR)/.files-list$(3).after
 	LC_ALL=C comm -13 \
-		$(BUILD_DIR)/.files-list$(3).stat \
-		$(BUILD_DIR)/.files-list$(3).new \
+		$($(PKG)_BUILDDIR)/.files-list$(3).before \
+		$($(PKG)_BUILDDIR)/.files-list$(3).after \
+		| sed -r -e 's/^[^,]+/$(1)/' \
 		> $($(PKG)_BUILDDIR)/.files-list$(3).txt
-	sed -r -e 's/^[^,]+/$(1)/' \
-		$($(PKG)_BUILDDIR)/.files-list$(3).txt \
-		>> $(BUILD_DIR)/packages-file-list$(3).txt
-	$(call step_pkg_size_finalize,$(3))
+	rm -f $($(PKG)_BUILDDIR)/.files-list$(3).before
+	rm -f $($(PKG)_BUILDDIR)/.files-list$(3).after
 endef
 
 define step_pkg_size
+	$(if $(filter start-install-target,$(1)-$(2)),\
+		$(call step_pkg_size_before,$(3),$(TARGET_DIR)))
+	$(if $(filter start-install-staging,$(1)-$(2)),\
+		$(call step_pkg_size_before,$(3),$(STAGING_DIR),-staging))
+	$(if $(filter start-install-host,$(1)-$(2)),\
+		$(call step_pkg_size_before,$(3),$(HOST_DIR),-host))
+
 	$(if $(filter end-install-target,$(1)-$(2)),\
-		$(call step_pkg_size_inner,$(3),$(TARGET_DIR)))
+		$(call step_pkg_size_after,$(3),$(TARGET_DIR)))
 	$(if $(filter end-install-staging,$(1)-$(2)),\
-		$(call step_pkg_size_inner,$(3),$(STAGING_DIR),-staging))
+		$(call step_pkg_size_after,$(3),$(STAGING_DIR),-staging))
 	$(if $(filter end-install-host,$(1)-$(2)),\
-		$(call step_pkg_size_inner,$(3),$(HOST_DIR),-host))
+		$(call step_pkg_size_after,$(3),$(HOST_DIR),-host))
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
 
@@ -108,7 +103,7 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
 define check_bin_arch
 	$(if $(filter end-install-target,$(1)-$(2)),\
 		support/scripts/check-bin-arch -p $(3) \
-			-l $(BUILD_DIR)/packages-file-list.txt \
+			-l $($(PKG)_BUILDDIR)/.files-list.txt \
 			$(foreach i,$($(PKG)_BIN_ARCH_EXCLUDE),-i "$(i)") \
 			-r $(TARGET_READELF) \
 			-a $(BR2_READELF_ARCH_NAME))
