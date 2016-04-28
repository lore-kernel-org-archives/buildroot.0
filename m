From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Apr 2016 00:27:29 +0200
Subject: [Buildroot] [PATCH 11/13 v6] core/legal-info: also save extra
	downloads
In-Reply-To: <cover.1461881416.git.yann.morin.1998@free.fr>
References: <cover.1461881416.git.yann.morin.1998@free.fr>
Message-ID: <e6fffb4abe2c68b78c8815eda7728bdcf62ca6bb.1461881416.git.yann.morin.1998@free.fr>
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
 package/pkg-generic.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 65c0db5..68a33ce 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -822,9 +822,11 @@ else
 # Other packages
 
 ifeq ($$($(2)_REDISTRIBUTE),YES)
-# Save the source tarball
-	$$(Q)$$(HARDLINK_OR_COPY) $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) \
-				  $$($(2)_REDIST_SOURCES_DIR)
+# Save the source tarball and any extra downloads, but not
+# patches, as they are handled specially afterwards.
+	$$(foreach e,$$($(2)_ACTUAL_SOURCE_TARBALL) $$(notdir $$($(2)_EXTRA_DOWNLOADS)),\
+		$$(Q)$$(HARDLINK_OR_COPY) $$(DL_DIR)/$$(e) \
+					  $$($(2)_REDIST_SOURCES_DIR)$$(sep))
 # Save patches and generate the series file
 	$$(Q)while read f; do \
 		$$(HARDLINK_OR_COPY) $$$${f} $$($(2)_REDIST_SOURCES_DIR) || exit 1; \
-- 
1.9.1
