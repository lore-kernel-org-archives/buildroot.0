From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Feb 2016 23:21:54 +0100
Subject: [Buildroot] [PATCH 04/16 v4] core/legal-info: use the macro to
	install source archives
In-Reply-To: <cover.1454536753.git.yann.morin.1998@free.fr>
References: <cover.1454536753.git.yann.morin.1998@free.fr>
Message-ID: <3978b9ef7d3e63f4326b7b995a72ad0c23afffd7.1454536753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

.. and use $(Q) instead of a hard-coded @.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Change v2 -> v3;
  - comment the @ -> $(Q) change  (Arnout)
---
 package/pkg-generic.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1e024d3..893ee07 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -804,9 +804,10 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
 	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
 endif
-# Copy the source tarball (just hardlink if possible)
-	@cp -l $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))) 2>/dev/null || \
-	    cp $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
+# Copy the source tarball
+	$$(Q)$$(call hardlink-copy,\
+		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
+		     $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))))
 endif # redistribute
 
 endif # other packages
-- 
1.9.1
