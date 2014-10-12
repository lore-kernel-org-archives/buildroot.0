From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:27 +0200
Subject: [Buildroot] [git commit] docs/manual: always look for resources in
	destination directory
Message-ID: <20141012072420.04D57B1909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8618763223d40f6ef8cb8ecdd29602784e06cba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our manual does not use external filters in asciidoc, so we are happy
with just looking for resources from our source tree.

However, other documents (like ones in br2-external) may use such
filters, to generate diagrams, graphs...

External filters generate their output files in the output directory, so
we must also look for resources in there.

Note: external filters in asccidoc are used thus:
    ["filter-name"]
    ----
    Text to be rendered
    ----

In the future, our own manual may even make use of filters to include
some of the graphs we generate, to store in the documentation.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index e9e0516..0b88fd8 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -86,6 +86,8 @@ $$(O)/docs/$(1)/$(1).$(6):
 		to make through the command line: \
 		'PATH=/path/to/custom-xsltproc/bin:$$$${PATH} make $(1)-pdf')
 else
+# -r $(@D) is there for documents that use external filters; those filters
+# generate code at the same location it finds the document's source files.
 $$(O)/docs/$(1)/$(1).$(6): $$($(2)_SOURCES) \
 			   $(1)-check-dependencies \
 			   $(1)-check-dependencies-$(5) \
@@ -93,7 +95,7 @@ $$(O)/docs/$(1)/$(1).$(6): $$($(2)_SOURCES) \
 	$$(Q)$$(call MESSAGE,"Generating $(7) $(1)...")
 	$$(Q)mkdir -p $$(@D)
 	$$(Q)a2x $(8) -f $(4) -d book -L \
-		$$(foreach r,$$($(2)_RESOURCES),-r $$(r)) \
+		$$(foreach r,$$($(2)_RESOURCES),-r $$(r)) -r $$(@D) \
 		$$($(2)_$(4)_A2X_OPTS) \
 		--asciidoc-opts="$$($(2)_$(4)_ASCIIDOC_OPTS)" \
 		$$(BUILD_DIR)/docs/$(1)/$(1).txt
