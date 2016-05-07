From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  7 May 2016 18:14:34 +0200
Subject: [Buildroot] [PATCH 09/13 v7] core/legal-info: also save extra
	downloads
In-Reply-To: <cover.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <66a5a152ccbbd6bae8f776c21d53d05c35444ad4.1462637351.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages, like perl, download extra files that end up as part of
the source that Buildroot builds. Up until now, those files were not
saved in the legal-info output.

Add those files to the legal-info output.

The unfortunate side-effect is that we will also save the secondary
archive for the external blackfin toolchains; however, we already do
save the binary release of some external toolchains when they do not
provide actual source archives.

This is inherently bad, as those are not source archives, but solving
this is a bigger concern, for another series...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v6 -> v7:
  - directly call the wrapper
  - fix after re-ordering patches

Changes v2 -> v3:
  - typo  (Luca)
  - incorporate the post-commit log message (the part about the
    side-effect) into the commit log itself, it makes sense to not
    forget about that
---
 package/pkg-generic.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 13455d1..a720930 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -804,10 +804,12 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
 	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
 endif
-# Save the source tarball
-	$$(Q)support/scripts/hardlink-or-copy \
-		$$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) \
-		$$($(2)_REDIST_SOURCES_DIR)
+# Save the source tarball and any extra downloads, but not
+# patches, as they are handled specially afterwards.
+	$$(foreach e,$$($(2)_ACTUAL_SOURCE_TARBALL) $$(notdir $$($(2)_EXTRA_DOWNLOADS)),\
+		$$(Q)support/scripts/hardlink-or-copy \
+			$$(DL_DIR)/$$(e) \
+			$$($(2)_REDIST_SOURCES_DIR)$$(sep))
 # Save patches and generate the series file
 	$$(Q)while read f; do \
 		support/scripts/hardlink-or-copy \
-- 
2.7.4
