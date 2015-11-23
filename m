From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:43 +0100
Subject: [Buildroot] [PATCH 13/51] core/legal-info: also save patches
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <1eb83a36a7550616342ee9c69059059b111f3f78.1448289515.git.yann.morin.1998@free.fr>
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
_LICENSE_FILES (however, we need not extract and patch a package if it
is set to be ignored for redistribution).

Update the legal-info header accordingly.

Note: this means that, when a (non-ignored) package is not patched and
defines no LICENSE_FILES, we will extract and patch it for nothing.
There is no easy way to know whether we have to patch a package or not.
We can only either duplicate the logic to detect patches (bad) or rely
on the infra actually patching the package.  Also, a vast majority of
packages are either patched, or define _LICENSE_FILES, so it is best and
easiest to always extract and patch them prior to legal-info.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/pkg-generic.mk           | 12 +++++++++---
 support/legal-info/README.header |  3 +--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 07ff820..723d1a6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -749,12 +749,14 @@ $(2)_MANIFEST_LICENSE_FILES ?= not saved
 
 # If the package declares _LICENSE_FILES, we need to extract it,
 # for overriden, local or normal remote packages alike, whether
-# we want to redistribute it or not, but not if we want to ignore it.
+# we want to redistribute it or not.
+# To get the list of patches applied to a package, we need to
+# patch it.
+# If we want to ignore the package, we need not extract or patch
+# it, however.
 ifneq ($$($(2)_REDISTRIBUTE),IGNORE)
-ifneq ($$($(2)_LICENSE_FILES),)
 $(1)-legal-info: $(1)-patch
 endif
-endif
 
 # We only save the sources of packages we want to redistribute, that are
 # non-local, and non-overriden. So only store, in the manifest, the tarball
@@ -815,6 +817,10 @@ endif
 	$$(Q)$$(call hardlink-copy,\
 		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
 		     $$($(2)_REDIST_SOURCES_DIR))
+	$$(Q)while read f; do \
+		$$(call hardlink-copy,$$$${f},$$($(2)_REDIST_SOURCES_DIR)) || exit 1; \
+		printf "%s\n" "$$$${f##*/}" >>$$($(2)_REDIST_SOURCES_DIR)/series || exit 1; \
+	done <$$($(2)_DIR)/.applied_patches_list
 endif # redistribute
 
 endif # other packages
diff --git a/support/legal-info/README.header b/support/legal-info/README.header
index 3321adb..90fc445 100644
--- a/support/legal-info/README.header
+++ b/support/legal-info/README.header
@@ -16,8 +16,7 @@ This material is composed of the following items.
    collect it manually.
  * The source code for all packages; this has been saved in the sources/
    subdirectory (except for the proprietary packages, which have not been
-   saved); patches applied to some packages by Buildroot are included in the
-   Buildroot sources and were not duplicated in the sources/ subdirectory.
+   saved).
  * A manifest file listing the configured packages and related information.
  * The license text of the packages; they have been saved in the licenses/
    subdirectory.
-- 
1.9.1
