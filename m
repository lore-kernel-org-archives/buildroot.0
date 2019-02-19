From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Feb 2019 21:03:51 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] core/pkg-infra: restore
 completeness of packages files lists
Message-ID: <20190219200744.C324388F39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e1e909a70d42a4ef3a35e2e76501ae75ed3e824
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

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

The format used for the .stat file is:

mtime:inode:perms:filetype:size,filename

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Trent Piepho <tpiepho@impinj.com>

[Peter: rename files, reformat, only look for files and symlinks and pass
	LC_ALL=C to comm as pointed out by Thomas De Schampheleire]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 3c8f0d9efae92772c90521322a083e4f73985dd1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d25f0f9afe..18c2d2cf6d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -63,13 +63,21 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 # $(2): base directory to search in
 # $(3): suffix of file  (optional)
 define step_pkg_size_inner
+	@touch $(BUILD_DIR)/.files-list$(3).stat
 	@touch $(BUILD_DIR)/packages-file-list$(3).txt
 	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
 	cd $(2); \
-	find . \( -type f -o -type l \) \
-		-newer $($(PKG)_DIR)/.stamp_built \
-		-exec printf '$(1),%s\n' {} + \
+	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
+		| LC_ALL=C sort > $(BUILD_DIR)/.files-list$(3).new
+	LC_ALL=C comm -13 \
+		$(BUILD_DIR)/.files-list$(3).stat \
+		$(BUILD_DIR)/.files-list$(3).new \
+		> $($(PKG)_BUILDDIR)/.files-list$(3).txt
+	sed -r -e 's/^[^,]+/$(1)/' \
+		$($(PKG)_BUILDDIR)/.files-list$(3).txt \
 		>> $(BUILD_DIR)/packages-file-list$(3).txt
+	mv $(BUILD_DIR)/.files-list$(3).new \
+		$(BUILD_DIR)/.files-list$(3).stat
 endef
 
 define step_pkg_size
