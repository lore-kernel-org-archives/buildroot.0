From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 27 Jul 2016 13:02:48 -0500
Subject: [Buildroot] [PATCH v3] asciidoc: use absolute path for resources
Message-ID: <1469642568-26660-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Atul Singh <atul.singh.mandla@rockwellcollins.com>

One of the "features" of a2x is that the '-r|--resource' flag imports
resources relative to the [SOURCE_FILE], not the CWD. The current
implementation tries to import resources from the destination dir $(@D),
which works fine for out-of-tree builds because $(@D) is an absolute
path, however in-tree builds treat $(@D) as a relative path, which breaks
because a2x treats $(@D) relative to SOURCE_FILE.

Use the make command $(abspath names...) to convert the dest dir to an
absolute path before passing it as a resource.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
Signed-off-by: Atul Singh Mandla <atul.singh.mandla@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

---
v1 -> v2
[Yann
 - Removed extra spaces before the $$(foreach and --resource
 - Updated commit message to be $(@D) vs $(D)

v2 -> v3
[Matt
 - Fixed my rebase and resent patch
---
 package/doc-asciidoc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index 6ab5ad2..4f765b8 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -117,7 +117,8 @@ $$(O)/docs/$(1)/$(1).$(6): $$($(2)_SOURCES) \
 	$$(Q)$$(call MESSAGE,"Generating $(7) $(1)...")
 	$$(Q)mkdir -p $$(@D)
 	$$(Q)a2x $(8) -f $(4) -d book -L \
-		$$(foreach r,$$($(2)_RESOURCES),-r $$(r)) -r $$(@D) \
+		$$(foreach r,$$($(2)_RESOURCES) $$(@D), \
+			--resource="$$(abspath $$(r))") \
 		$$($(2)_$(4)_A2X_OPTS) \
 		--asciidoc-opts="$$($(2)_$(4)_ASCIIDOC_OPTS)" \
 		$$(BUILD_DIR)/docs/$(1)/$(1).txt
-- 
1.9.1
