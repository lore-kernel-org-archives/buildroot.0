From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:49:23 +0100
Subject: [Buildroot] [PATCH 10/16 v5] core/legal-info: also save patches
In-Reply-To: <cover.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <3347ff97809da3bd58a77d034c856129841eff76.1457718289.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the legal-info infra only saves the source archive of a
package. However, that's not enough as we may apply some patches on
packages sources.

We do suggest users to also redistribute the Buildroot sources as part
of their compliance distribution, so the patches bundled in Buildroot
would indeed be included in the compliance distribution.

However, that's still not enough, since we may download some patches, or
the user may use a global patch directory. Patches in there might not
end up in the compliance distribution, and there are risks of
non-conformity.

So, always include patches alongside the source archive.

To ensure reproducibility, we also generate a series file, so patches
can be re-applied in the correct order.

We get the list of patches to include from the list of patches that were
applied by the package infrastructure (via the apply-patches support
script). So, we need to get packages properly extracted and patched
before we can save their legal-info, not just in the case they define
_LICENSE_FILES.

Update the legal-info header accordingly.

Note: this means that, when a package is not patched and defines no
LICENSE_FILES, we will extract and patch it for nothing. There is no
easy way to know whether we have to patch a package or not. We can only
either duplicate the logic to detect patches (bad) or rely on the infra
actually patching the package. Also, a vast majority of packages are
either patched, or define _LICENSE_FILES, so it is best and easiest to
always extract and patch them prior to legal-info.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v3 -> v4:
  - typo  (Luca)

Changes v2 -> v3:
  - also mention that patches have been saved  (Luca)

Changes v1 -> v2:
  - don't recompute rawname-version needlessly  (Luca)
---
 package/pkg-generic.mk           | 13 ++++++++-----
 support/legal-info/README.header |  9 +++++----
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4515b40..3a6f62b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -778,12 +778,10 @@ $(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
 endif
 $(2)_MANIFEST_LICENSE_FILES ?= not saved
 
-# If the package declares _LICENSE_FILES, we need to extract it,
-# for overriden, local or normal remote packages alike, whether
-# we want to redistribute it or not.
-ifneq ($$($(2)_LICENSE_FILES),)
+# We need to extract and patch a package to be able to retrieve its
+# license files (if any) and the list of patches applied to it (if
+# any).
 $(1)-legal-info: $(1)-patch
-endif
 
 # We only save the sources of packages we want to redistribute, that are
 # non-overriden (local or true override).
@@ -828,6 +826,11 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 	$$(Q)$$(call hardlink-copy,\
 		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
 		     $$($(2)_REDIST_SOURCES_DIR))
+# Save patches and generate the series file
+	$$(Q)while read f; do \
+		$$(call hardlink-copy,$$$${f},$$($(2)_REDIST_SOURCES_DIR)) || exit 1; \
+		printf "%s\n" "$$$${f##*/}" >>$$($(2)_REDIST_SOURCES_DIR)/series || exit 1; \
+	done <$$($(2)_DIR)/.applied_patches_list
 endif # redistribute
 
 endif # other packages
diff --git a/support/legal-info/README.header b/support/legal-info/README.header
index d07c45d..418de14 100644
--- a/support/legal-info/README.header
+++ b/support/legal-info/README.header
@@ -14,10 +14,11 @@ This material is composed of the following items.
    compiled programs.
    Note: this may have not been saved due to technical limitations, you may
    need to collect it manually.
- * The source code for all packages; this has been saved in the sources/
-   subdirectory (except for the non-redistributable packages, which have not
-   been saved); patches applied to some packages by Buildroot are included in
-   the Buildroot sources and were not duplicated in the sources/ subdirectory.
+ * The original source code for all packages; this has been saved in the
+   sources/ subdirectory (except for the non-redistributable packages, which
+   have not been saved). Patches that were applied are also saved, along
+   with a file named 'series' that lists the patches in the order they were
+   applied.
  * A manifest file listing the configured packages and related information.
  * The license text of the packages; they have been saved in the licenses/
    subdirectory.
-- 
1.9.1
