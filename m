From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:39 +0100
Subject: [Buildroot] [PATCH v6 17/28] core/pkg-infra: Fix package file
 statistics for parallel build
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-18-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When activating top level parallel build, multiple processes may
try to modify the various *files-list* files in the common build/
directory at the same time. This can cause racy build failures.

The fix here is to use flock to ensure exclusive execution of the
statistics gathering code. For this to work it is assumed that the
target/staging/host directories are isolated, which is true for
per-package builds.
For standard sequential builds, the locking is of course unnecessary
but no conditional handling is implemented  since the runtime cost is
expected to be next to nothing.

For flock to work, the statistics gathering code must be run in a
single subshell. Otherwise the lockfile descriptor would be closed
after the subshell (= the Makefile line where it was opened) ends
and thus the lock would be released before even entering the critical
code section.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/pkg-generic.mk | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 268d999efb..d18805e2d0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -64,20 +64,22 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 # $(3): suffix of file  (optional)
 define step_pkg_size_inner
 	@touch $(BUILD_DIR)/.files-list$(3).stat
-	@touch $(BUILD_DIR)/packages-file-list$(3).txt
-	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
+	exec 3>$(BUILD_DIR)/packages-file-list$(3).txt; \
+	flock -x 3; \
+	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt; \
 	cd $(2); \
 	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
-		| LC_ALL=C sort > $(BUILD_DIR)/.files-list$(3).new
+		| LC_ALL=C sort > $(BUILD_DIR)/.files-list$(3).new; \
 	LC_ALL=C comm -13 \
 		$(BUILD_DIR)/.files-list$(3).stat \
 		$(BUILD_DIR)/.files-list$(3).new \
-		> $($(PKG)_BUILDDIR)/.files-list$(3).txt
+		> $($(PKG)_BUILDDIR)/.files-list$(3).txt; \
 	sed -r -e 's/^[^,]+/$(1)/' \
 		$($(PKG)_BUILDDIR)/.files-list$(3).txt \
-		>> $(BUILD_DIR)/packages-file-list$(3).txt
+		>> $(BUILD_DIR)/packages-file-list$(3).txt; \
 	mv $(BUILD_DIR)/.files-list$(3).new \
-		$(BUILD_DIR)/.files-list$(3).stat
+		$(BUILD_DIR)/.files-list$(3).stat; \
+	exec 3>&-
 endef
 
 define step_pkg_size
-- 
2.25.0
