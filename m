From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Mar 2020 08:38:01 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] Makefile: fix package
 file list if FOO_SUBDIR is set
Message-ID: <20200328072643.ACA5988777@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f283e563978d3ff93f0407048c30c2d35e75f925
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

If a package sets a FOO_SUBDIR (meaning its sources are not under
output/build/foo-123 but under output/build/foo-123/$(FOO_SUBDIR)), the
.files-list.txt file were also created under FOO_SUBDIR, due to which the
logic in the Makefile would not find it.

Change the instrumentation steps so that the file list is directly under the
package dir, ignoring the subdir.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9f876c7f16a0aef8aa86ef5873b8db07aa00dce5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 47238f2649..20b07a7fa9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -63,7 +63,7 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 define step_pkg_size_before
 	cd $(2); \
 	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
-		| LC_ALL=C sort > $($(PKG)_BUILDDIR)/.files-list$(3).before
+		| LC_ALL=C sort > $($(PKG)_DIR)/.files-list$(3).before
 endef
 
 # $(1): package name
@@ -72,14 +72,14 @@ endef
 define step_pkg_size_after
 	cd $(2); \
 	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
-		| LC_ALL=C sort > $($(PKG)_BUILDDIR)/.files-list$(3).after
+		| LC_ALL=C sort > $($(PKG)_DIR)/.files-list$(3).after
 	LC_ALL=C comm -13 \
-		$($(PKG)_BUILDDIR)/.files-list$(3).before \
-		$($(PKG)_BUILDDIR)/.files-list$(3).after \
+		$($(PKG)_DIR)/.files-list$(3).before \
+		$($(PKG)_DIR)/.files-list$(3).after \
 		| sed -r -e 's/^[^,]+/$(1)/' \
-		> $($(PKG)_BUILDDIR)/.files-list$(3).txt
-	rm -f $($(PKG)_BUILDDIR)/.files-list$(3).before
-	rm -f $($(PKG)_BUILDDIR)/.files-list$(3).after
+		> $($(PKG)_DIR)/.files-list$(3).txt
+	rm -f $($(PKG)_DIR)/.files-list$(3).before
+	rm -f $($(PKG)_DIR)/.files-list$(3).after
 endef
 
 define step_pkg_size
@@ -103,7 +103,7 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
 define check_bin_arch
 	$(if $(filter end-install-target,$(1)-$(2)),\
 		support/scripts/check-bin-arch -p $(3) \
-			-l $($(PKG)_BUILDDIR)/.files-list.txt \
+			-l $($(PKG)_DIR)/.files-list.txt \
 			$(foreach i,$($(PKG)_BIN_ARCH_EXCLUDE),-i "$(i)") \
 			-r $(TARGET_READELF) \
 			-a $(BR2_READELF_ARCH_NAME))
