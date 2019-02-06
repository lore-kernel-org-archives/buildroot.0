From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  6 Feb 2019 15:37:51 +0100
Subject: [Buildroot] [PATCH] core/pkg-infra: restore completeness of
 packages files lists
Message-ID: <20190206143751.5814-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit 7fb6e782542f (core/instrumentation: shave minutes off the
build time), the built stampfile is used as a reference to detect files
installed by a package.

However, packages may install files keeping their mtime intact, and we
end up not detecting this. For example, the internal skeleton package
will install (e.g.) /etc/passwd with an mtime of when the file was
created in $(TOP_DIR), which could be the time the git repository was
checked out; that mtime is always older than the build stamp file, so
files installed by the skeleton package are never accounted for to that
package, or to any other package for that matters.

We switch to an alternate solution, which consists of storing some extra
metadata per file, so that we can more reasily detect modifications to
the files. Then we compare the state before the package is installed (by
reusing the existing list) and after the package is installed, compare
that to list any new file or modified files (in reality, ignoring
untouched and removed files). Finally, we store the file->package
association in the global list and store the new stat list as the global
list.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Trent Piepho <tpiepho@impinj.com>
---
 package/pkg-generic.mk | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f5cab2b9c2..c07cb32349 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -63,13 +63,20 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 # $(2): base directory to search in
 # $(3): suffix of file  (optional)
 define step_pkg_size_inner
+	@touch $(BUILD_DIR)/packages-file-list$(3).stat
 	@touch $(BUILD_DIR)/packages-file-list$(3).txt
 	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
 	cd $(2); \
-	find . \( -type f -o -type l \) \
-		-newer $($(PKG)_DIR)/.stamp_built \
-		-exec printf '$(1),%s\n' {} + \
+	LC_ALL=C find . -printf '%T@:%i:%#m:%y:%s,%p\n' \
+	|LC_ALL=C sort >$($(PKG)_BUILDDIR)/.files-list$(3).stat
+	comm -13 $(BUILD_DIR)/packages-file-list$(3).stat \
+		$($(PKG)_BUILDDIR)/.files-list$(3).stat \
+		>$($(PKG)_BUILDDIR)/.files-list$(3).new
+	sed -r -e 's/^[^,]+/$(1)/' \
+		$($(PKG)_BUILDDIR)/.files-list$(3).new \
 		>> $(BUILD_DIR)/packages-file-list$(3).txt
+	mv $($(PKG)_BUILDDIR)/.files-list$(3).stat \
+		$(BUILD_DIR)/packages-file-list$(3).stat
 endef
 
 define step_pkg_size
-- 
2.14.1
