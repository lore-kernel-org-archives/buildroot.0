From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2015 19:35:19 +0100
Subject: [Buildroot] [PATCH 10/13 v2] core/legal-info: also save extra
	downloads
In-Reply-To: <cover.1450031251.git.yann.morin.1998@free.fr>
References: <cover.1450031251.git.yann.morin.1998@free.fr>
Message-ID: <97333826d04c0cf0b6696c44ab2d8d79d1bfca75.1450031251.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages, like perl, download extra files that end up as part of
the source that Biuldroot builds. Up until now, those files were not
saved in the legal-info output.

Add those files to the legal-info output.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
The unfortnate side-effect is that we will also save the secondary
archive for the external blackfin toolchains; however, we already to
save the binary release of some external toolchains when they do not
provide actual source archives.

This is inherently bad, but solving this is a bigger concern, for
another series...
---
 package/pkg-generic.mk | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f873e9c..7468e54 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -821,10 +821,13 @@ else
 # Other packages
 
 ifeq ($$($(2)_REDISTRIBUTE),YES)
-# Copy the source tarball
-	$$(Q)$$(call hardlink-copy,\
-		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
-		     $$($(2)_REDIST_SOURCES_DIR))
+# Copy the source tarball and eny extra downloads, but not
+# patches, as they are handled specially afterwards.
+	$$(foreach e,$$($(2)_ACTUAL_SOURCE_TARBALL) $$(notdir $$($(2)_EXTRA_DOWNLOADS)),\
+			$$(Q)$$(call hardlink-copy,\
+				$$(DL_DIR)/$$(e),\
+				$$($(2)_REDIST_SOURCES_DIR))$$(sep))
+# Copy patches and generate the series file
 	$$(Q)while read f; do \
 		$$(call hardlink-copy,$$$${f},$$($(2)_REDIST_SOURCES_DIR)) || exit 1; \
 		printf "%s\n" "$$$${f##*/}" >>$$($(2)_REDIST_SOURCES_DIR)/series || exit 1; \
-- 
1.9.1
