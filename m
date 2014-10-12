From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:27 +0200
Subject: [Buildroot] [git commit] docs/manual: allow a document to declare
	where its resources are
Message-ID: <20141012072419.BA946B1909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=059190e7457db1cf11c7510cdfe2d4b8a467e309
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Avoids hard-coding document's resources in GENDOC_INNER, so we can
generate another document with different resources (if any).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 40bb1b1..7b06d47 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -106,7 +106,8 @@ $$(O)/docs/$(1)/$(1).$(5): $$($(2)_SOURCES) \
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
