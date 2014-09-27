From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Sep 2014 12:16:46 +0200
Subject: [Buildroot] [PATCH 10/25 v6] docs/manual: allow a document to
	declare where its resources are
In-Reply-To: <cover.1411812968.git.yann.morin.1998@free.fr>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
Message-ID: <bc3c6441832dd5ec8c40ff76e98914aa33473d24.1411812968.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avoids hard-coding document's resources in GENDOC_INNER, so we can
generate another document with different resources (if any).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

---
Changes v5 -> v6:
  - s/ressources/resources/g  (Thomas DS, Samuel)
---
 docs/manual/manual.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index b0ae2da..f5af504 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -106,7 +106,8 @@ $$(O)/docs/$(1)/$(1).$(5): $$($(call UPPERCASE,$(1))_SOURCES) \
 			   $(1)-prepare-sources
 	$$(Q)$$(call MESSAGE,"Generating $(6) $(1)...")
 	$$(Q)mkdir -p $$(@D)
-	$$(Q)a2x $(7) -f $(3) -d book -L -r $$(TOPDIR)/docs/images \
+	$$(Q)a2x $(7) -f $(3) -d book -L \
+		$$(foreach r,$$($(2)_RESOURCES),-r $$(r)) \
 		$$($(2)_$(3)_A2X_OPTS) \
 		--asciidoc-opts="$$($(2)_$(3)_ASCIIDOC_OPTS)" \
 		$$(BUILD_DIR)/docs/$(1)/$(1).txt
@@ -119,6 +120,8 @@ endef
 # GENDOC -- generates the make targets needed to build asciidoc documentation.
 #
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
+# The variable <DOCUMENT_NAME>_RESOURCES defines where the document's
+# resources, such as images, are located; must be an absolute path.
 ################################################################################
 define GENDOC
 $$(BUILD_DIR)/docs/$(pkgname):
@@ -148,4 +151,5 @@ $(pkgname)-clean:
 endef
 
 MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
+MANUAL_RESOURCES = $(TOPDIR)/docs/images
 $(eval $(call GENDOC))
-- 
1.9.1
