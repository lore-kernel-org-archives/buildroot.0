From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Oct 2014 19:01:56 +0200
Subject: [Buildroot] [PATCH 22/25 v7] doc/asciidoc: always apply Buildroot's
	AsciiDoc config
In-Reply-To: <cover.1412355549.git.yann.morin.1998@free.fr>
References: <cover.1412355549.git.yann.morin.1998@free.fr>
Message-ID: <b51e19fba14d9312dd95efc9a1e87e30902a4192.1412355549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Thomas: the AsciiDoc options we use ensure we get a sane
output of the document. We want that configuration to be applied to
other documents as well.

Up until now, it was implicit that the configuration was applied to
our manual, becasue we only supported document-specific configuration,
and the configuration we had was in our manual dir, so we got to use it.

But now, we can render other documents, especially ones from
br2-external, and we want those to also use the default configuration
from Buildroot, but still be able to provide their own customisation.

So, always add Buildroot's configuration first, if available, before we
append the document's configuration.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/{manual => conf}/asciidoc-text.conf |  0
 package/doc-asciidoc.mk                  | 18 +++++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 rename docs/{manual => conf}/asciidoc-text.conf (100%)

diff --git a/docs/manual/asciidoc-text.conf b/docs/conf/asciidoc-text.conf
similarity index 100%
rename from docs/manual/asciidoc-text.conf
rename to docs/conf/asciidoc-text.conf
diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index 649ee69..f59f9fa 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -31,6 +31,9 @@ asciidoc-check-dependencies-pdf:
 GENDOC_XSLTPROC_IS_BROKEN = \
 	$(shell xsltproc --maxvars 0 >/dev/null 2>/dev/null || echo y)
 
+# Apply this configuration to all documents
+BR_ASCIIDOC_CONF = docs/conf/asciidoc.conf
+
 ################################################################################
 # ASCIIDOC_INNER -- generates the make targets needed to build a specific type of
 #                   asciidoc documentation.
@@ -60,10 +63,23 @@ asciidoc-check-dependencies-$(5):
 $(1)-check-dependencies-$(5): asciidoc-check-dependencies-$(5)
 	$$(Q)$$(foreach hook,$$($(2)_CHECK_DEPENDENCIES_$$(call UPPERCASE,$(5))_HOOKS),$$(call $$(hook))$$(sep))
 
+# Include Buildroot's AsciiDoc configuration first:
+#  - generic configuration,
+#  - then output-specific configuration
+ifneq ($$(wildcard $$(BR_ASCIIDOC_CONF)),)
+$(2)_$(4)_ASCIIDOC_OPTS += -f $$(BR_ASCIIDOC_CONF)
+endif
+BR_$(4)_ASCIIDOC_CONF = docs/conf/asciidoc-$(4).conf
+ifneq ($$(wildcard $$(BR_$(4)_ASCIIDOC_CONF)),)
+$(2)_$(4)_ASCIIDOC_OPTS += -f $$(BR_$(4)_ASCIIDOC_CONF)
+endif
+
+# Then include the document's AsciiDoc configuration:
+#  - generic configuration,
+#  - then output-specific configuration
 ifneq ($$(wildcard $$($(2)_ASCIIDOC_CONF)),)
 $(2)_$(4)_ASCIIDOC_OPTS += -f $$($(2)_ASCIIDOC_CONF)
 endif
-
 $(2)_$(4)_ASCIIDOC_CONF = $(3)/asciidoc-$(4).conf
 ifneq ($$(wildcard $$($(2)_$(4)_ASCIIDOC_CONF)),)
 $(2)_$(4)_ASCIIDOC_OPTS += -f $$($(2)_$(4)_ASCIIDOC_CONF)
-- 
1.9.1
