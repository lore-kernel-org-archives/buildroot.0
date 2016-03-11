From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:49:25 +0100
Subject: [Buildroot] [PATCH 12/16 v5] core/legal-info: also save extra
	downloads
In-Reply-To: <cover.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <0e4f63ef1f47edce58214cd21d9e5f177731979f.1457718289.git.yann.morin.1998@free.fr>
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
Changes v2 -> v3:
  - typo  (Luca)
  - incorporate the post-commit log message (the part about the
    side-effect) into the commit log itself, it makes sense to not
    forget about that
---
 package/pkg-generic.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ed139fb..bc39ead 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -822,10 +822,12 @@ else
 # Other packages
 
 ifeq ($$($(2)_REDISTRIBUTE),YES)
-# Save the source tarball
-	$$(Q)$$(call hardlink-copy,\
-		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
-		     $$($(2)_REDIST_SOURCES_DIR))
+# Save the source tarball and any extra downloads, but not
+# patches, as they are handled specially afterwards.
+	$$(foreach e,$$($(2)_ACTUAL_SOURCE_TARBALL) $$(notdir $$($(2)_EXTRA_DOWNLOADS)),\
+			$$(Q)$$(call hardlink-copy,\
+				$$(DL_DIR)/$$(e),\
+				$$($(2)_REDIST_SOURCES_DIR))$$(sep))
 # Save patches and generate the series file
 # Because patches may come from various places (bundled in Buildroot,
 # from one or more global-patch-dir), there might be collisions on the
-- 
1.9.1
