From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:49:16 +0100
Subject: [Buildroot] [PATCH 03/16 v5] core/legal-info: use the macro to
	install source archives
In-Reply-To: <cover.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <5d70983621c061f7514e0d53eee8f89de416ead2.1457718289.git.yann.morin.1998@free.fr>
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
Changes v4 -> v5:
  - s/Copy/Save/ because we're not really copying

Changes v2 -> v3:
  - comment the @ -> $(Q) change  (Arnout)
---
 package/pkg-generic.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3904c09..f47dc7e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -803,9 +803,10 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
 	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
 endif
-# Copy the source tarball (just hardlink if possible)
-	@cp -l $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))) 2>/dev/null || \
-	    cp $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
+# Save the source tarball
+	$$(Q)$$(call hardlink-copy,\
+		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
+		     $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))))
 endif # redistribute
 
 endif # other packages
-- 
1.9.1
