From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Oct 2014 19:01:55 +0200
Subject: [Buildroot] [PATCH 21/25 v7] doc/asciidoc: allow documents to pass
	a global asciidoc configuration
In-Reply-To: <cover.1412355549.git.yann.morin.1998@free.fr>
References: <cover.1412355549.git.yann.morin.1998@free.fr>
Message-ID: <97b7efd68381a008f9c2f0ffae72bd8dbe54f62b.1412355549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, a document can specify an output-specific configuration, like
the text output, that hides images references, and formats hyperlinks.

But sometimes it is required that a specific configuration is used for
all the output formats, to always apply the same markup rules in all
documents (like using the [specialwords] section.)

Also look for a file named 'asciidoc.conf' in the document's directory.
If that file exists, add it to the asciidoc options (before the
output-specific config, so the latter takes precedence over the former.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Change v6 -> v7:
  - fix commit log about config file precedence  (Samuel)
  - 'sometimes' typo  (Thomas DS)
---
 package/doc-asciidoc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index 9a18270..649ee69 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -60,6 +60,10 @@ asciidoc-check-dependencies-$(5):
 $(1)-check-dependencies-$(5): asciidoc-check-dependencies-$(5)
 	$$(Q)$$(foreach hook,$$($(2)_CHECK_DEPENDENCIES_$$(call UPPERCASE,$(5))_HOOKS),$$(call $$(hook))$$(sep))
 
+ifneq ($$(wildcard $$($(2)_ASCIIDOC_CONF)),)
+$(2)_$(4)_ASCIIDOC_OPTS += -f $$($(2)_ASCIIDOC_CONF)
+endif
+
 $(2)_$(4)_ASCIIDOC_CONF = $(3)/asciidoc-$(4).conf
 ifneq ($$(wildcard $$($(2)_$(4)_ASCIIDOC_CONF)),)
 $(2)_$(4)_ASCIIDOC_OPTS += -f $$($(2)_$(4)_ASCIIDOC_CONF)
@@ -132,6 +136,8 @@ $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced:
 
 $(1)-prepare-sources: $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced
 
+$(2)_ASCIIDOC_CONF = $(3)/asciidoc.conf
+
 $(call ASCIIDOC_INNER,$(1),$(2),$(3),xhtml,html,html,HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
 
-- 
1.9.1
