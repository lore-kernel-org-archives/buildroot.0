From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Apr 2016 00:27:20 +0200
Subject: [Buildroot] [PATCH 02/13 v6] core/legal-info: use the helper to
	install source archives
In-Reply-To: <cover.1461881416.git.yann.morin.1998@free.fr>
References: <cover.1461881416.git.yann.morin.1998@free.fr>
Message-ID: <049c6d8a781651f1ad91d9e76554c572fc5d63a9.1461881416.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

.. and use $(Q) instead of a hard-coded @.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v5 -> v6:
  - directly call the helper script  (Thomas, Arnout)
  - drop Luca's and Arnout's tags, as the code did change a bit

Changes v4 -> v5:
  - s/Copy/Save/ because we're not really copying

Changes v2 -> v3:
  - comment the @ -> $(Q) change  (Arnout)
---
 package/pkg-generic.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3904c09..5c2e46d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -803,9 +803,9 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
 	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
 endif
-# Copy the source tarball (just hardlink if possible)
-	@cp -l $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))) 2>/dev/null || \
-	    cp $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
+# Save the source tarball
+	$$(Q)$$(HARDLINK_OR_COPY) $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
+				  $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
 endif # redistribute
 
 endif # other packages
-- 
1.9.1
