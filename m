From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 14 Feb 2020 20:57:33 +0100
Subject: [Buildroot] [PATCH] core: fix packages-file-list.txt after an
 incremental build
Message-ID: <20200214195734.32081-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The package instrumentation step 'step_pkg_size' is populating the files:
    output/build/packages-file-list.txt
    output/build/packages-file-list-staging.txt
    output/build/packages-file-list-host.txt
by comparing the list of files before and after installation of a package,
with some clever tricks to detect changes to existing files etc.

As an optimization, instead of gathering this list before and after each
package, where the 'after-state' of one package is the same as the
'before-state' of the next package, only the 'after-state' is used and
is shared between packages.

This works fine, except at the end of the build, as explained next.

In the target-finalize step, many files will be touched. For example, files
like /etc/hosts, /etc/os-release, but also all object files that are
stripped, and all files touched by post-build scripts or created by rootfs
overlays. This means that the 'after-state' of the last package does not
reflect the actual situation after target-finalize is run.

For a single complete build this poses no problem. But, if one incrementally
rebuilds a package after the initial build, e.g. with 'make foo-rebuild',
then all changes that happened in target-finalize at the end of the initial
build (the 'after-state' of the last package built) will be detected as
changes caused by the rebuild of package foo. As a result, all these files
will incorrectly be treated as 'owned' by package foo.

Correct this situation by capturing a new state at the end of
target-finalize, so that the 'before-state' of an incremental build will be
correct.

Note: the reasoning above talks about packages-file-list.txt and
target-finalize, but also applies to
packages-file-list-staging.txt/staging-finalize and
packages-file-list-host.txt/host-finalize.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 Makefile               | 10 ++++++++++
 package/pkg-generic.mk | 23 ++++++++++++++++++-----
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index a52f1c75fd..af24630d2f 100644
--- a/Makefile
+++ b/Makefile
@@ -801,6 +801,16 @@ endif # merged /usr
 
 	touch $(TARGET_DIR)/usr
 
+# AFTER ALL FILE-CHANGING ACTIONS:
+# Update timestamps in internal file list to fix attribution of files
+# to packages on subsequent builds
+	$(call step_pkg_size_file_list,$(TARGET_DIR))
+	$(call step_pkg_size_finalize)
+	$(call step_pkg_size_file_list,$(STAGING_DIR),-staging)
+	$(call step_pkg_size_finalize,-staging)
+	$(call step_pkg_size_file_list,$(HOST_DIR),-host)
+	$(call step_pkg_size_finalize,-host)
+
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
 	@rm -f $(ROOTFS_COMMON_TAR)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 268d999efb..2f11e3903f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -57,6 +57,22 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 
 # Hooks to collect statistics about installed files
 
+# Helper function to create the file list -- also used from target-finalize
+# $(1): base directory to search in
+# $(2): suffix of file  (optional)
+define step_pkg_size_file_list
+	cd $(1); \
+	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
+		| LC_ALL=C sort > $(BUILD_DIR)/.files-list$(2).new
+endef
+# Helper function to mark the latest file list as the reference for next
+# iteration -- also used from target-finalize
+# $(1): suffix of file  (optional)
+define step_pkg_size_finalize
+	mv $(BUILD_DIR)/.files-list$(1).new \
+		$(BUILD_DIR)/.files-list$(1).stat
+endef
+
 # The suffix is typically empty for the target variant, for legacy backward
 # compatibility.
 # $(1): package name
@@ -66,9 +82,7 @@ define step_pkg_size_inner
 	@touch $(BUILD_DIR)/.files-list$(3).stat
 	@touch $(BUILD_DIR)/packages-file-list$(3).txt
 	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
-	cd $(2); \
-	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
-		| LC_ALL=C sort > $(BUILD_DIR)/.files-list$(3).new
+	$(call step_pkg_size_file_list,$(2),$(3))
 	LC_ALL=C comm -13 \
 		$(BUILD_DIR)/.files-list$(3).stat \
 		$(BUILD_DIR)/.files-list$(3).new \
@@ -76,8 +90,7 @@ define step_pkg_size_inner
 	sed -r -e 's/^[^,]+/$(1)/' \
 		$($(PKG)_BUILDDIR)/.files-list$(3).txt \
 		>> $(BUILD_DIR)/packages-file-list$(3).txt
-	mv $(BUILD_DIR)/.files-list$(3).new \
-		$(BUILD_DIR)/.files-list$(3).stat
+	$(call step_pkg_size_finalize,$(3))
 endef
 
 define step_pkg_size
-- 
2.24.1
