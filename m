From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Sep 2014 12:16:52 +0200
Subject: [Buildroot] [PATCH 16/25 v6] docs/manual: always look for resources
	in destination directory
In-Reply-To: <cover.1411812968.git.yann.morin.1998@free.fr>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
Message-ID: <e702f65c92fdba984da7fc58d184fb25679972aa.1411812968.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
Changes v5 -> v6:
  - comment in the code the reason for -r  (Thomas DS)

---
Note: this is to work around a deficiency (bug?) in asccidoc. Asciidoc
actually tells the filter where to put the output files, but forgets to
look in there when it needs to link to those files...
---
 docs/manual/manual.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 94f7551..8e55035 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -86,6 +86,8 @@ $$(O)/docs/$(1)/$(1).$(6):
 		to make through the command line: \
 		'PATH=/path/to/custom-xsltproc/bin:$$$${PATH} make $(1)-pdf')
 else
+# -r $(@D) is there for documents that use external filters; those filters
+# generate code at the same location it finds the document's source files.
 $$(O)/docs/$(1)/$(1).$(6): $$($(call UPPERCASE,$(1))_SOURCES) \
 			   $(1)-check-dependencies \
 			   $(1)-check-dependencies-$(5) \
@@ -93,7 +95,7 @@ $$(O)/docs/$(1)/$(1).$(6): $$($(call UPPERCASE,$(1))_SOURCES) \
 	$$(Q)$$(call MESSAGE,"Generating $(7) $(1)...")
 	$$(Q)mkdir -p $$(@D)
 	$$(Q)a2x $(8) -f $(4) -d book -L \
-		$$(foreach r,$$($(2)_RESOURCES),-r $$(r)) \
+		$$(foreach r,$$($(2)_RESOURCES),-r $$(r)) -r $$(@D) \
 		$$($(2)_$(4)_A2X_OPTS) \
 		--asciidoc-opts="$$($(2)_$(4)_ASCIIDOC_OPTS)" \
 		$$(BUILD_DIR)/docs/$(1)/$(1).txt
-- 
1.9.1
