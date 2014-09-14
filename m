From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 13:07:45 +0200
Subject: [Buildroot] [PATCH 11/23 v5] docs/manual: allow a document to
	declare where its ressources are
In-Reply-To: <cover.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <1f71d24171ef5068ba5ca9c8e8edfe3f10ddc726.1410692670.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avoids hard-coding document's ressources in GENDOC_INNER, so we can
generate another document with different ressources (if any).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 docs/manual/manual.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index a37f5e7..befd1ed 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -106,7 +106,8 @@ $$(O)/docs/$(1)/$(1).$(5): $$($$(call UPPERCASE,$(1))_SOURCES) \
 			   $(1)-prepare-sources
 	$$(Q)$$(call MESSAGE,"Generating $(6) $(1)...")
 	$$(Q)mkdir -p $$(@D)
-	$$(Q)a2x $(7) -f $(3) -d book -L -r $$(TOPDIR)/docs/images \
+	$$(Q)a2x $(7) -f $(3) -d book -L \
+		$$(foreach r,$$($(2)_RESSOURCES),-r $$(r)) \
 		$$($(2)_$(3)_A2X_OPTS) \
 		--asciidoc-opts="$$($(2)_$(3)_ASCIIDOC_OPTS)" \
 		$$(BUILD_DIR)/$(1)/$(1).txt
@@ -119,6 +120,8 @@ endef
 # GENDOC -- generates the make targets needed to build asciidoc documentation.
 #
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
+# The variable <DOCUMENT_NAME>_RESSOURCES defines where the document's
+# resources, such as images, are located; must be an absolute path.
 ################################################################################
 define GENDOC
 $$(BUILD_DIR)/$(pkgname):
@@ -148,4 +151,5 @@ $(pkgname)-clean:
 endef
 
 MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
+MANUAL_RESSOURCES = $(TOPDIR)/docs/images
 $(eval $(call GENDOC))
-- 
1.9.1
