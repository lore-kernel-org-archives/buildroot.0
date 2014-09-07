From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  8 Sep 2014 01:39:14 +0200
Subject: [Buildroot] [PATCH 15/18 v4] docs/manual: allow documents to define
	some hooks, as for a package
In-Reply-To: <cover.1410132603.git.yann.morin.1998@free.fr>
References: <cover.1410132603.git.yann.morin.1998@free.fr>
Message-ID: <05dca7f844f35041c1203e36a8adc878d22804f0.1410132603.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow documents to define two hooks:
  - DOC_EXTRA_CHECK_DEPENDENCIES
    to check for extra dependencies required by this document
  - DOC_EXTRA_CHECK_DEPENDENCIES_FMT
    ditto, but for the specific format
  - DOC_POST_EXTRACT_HOOKS:
    to run additional actions to fill-in the build directory

(Replace 'DOC' with the uppercase name of the document, and 'FMT' with
the format.)

This is supposed to replace the current use of overloading the internal
dependency rules, and makes GENDOC behave yet a bit more like the
package infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 docs/manual/manual.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index cd944fa..119010b 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -55,10 +55,9 @@ $(1): $(1)-$(5)
 .PHONY: $(1)-$(5)
 $(1)-$(5): $$(O)/docs/$(1)/$(1).$(6)
 
-$(1)-check-dependencies: gendoc-check-dependencies
-
 gendoc-check-dependencies-$(5):
 $(1)-check-dependencies-$(5): gendoc-check-dependencies-$(5)
+	$$(Q)$$(foreach hook,$$($$(call UPPERCASE,$(pkgname))_EXTRA_CHECK_DEPENDENCIES_$(5)),$$(call $$(hook))$$(sep))
 
 $(2)_$(4)_ASCIIDOC_CONF = $(3)/asciidoc-$(4).conf
 ifneq ($$(wildcard $$($(2)_$(4)_ASCIIDOC_CONF)),)
@@ -110,6 +109,10 @@ endef
 # resources, such as images, are located; must be an absolute path.
 ################################################################################
 define GENDOC
+# Single line, because splitting a foreach is not easy...
+$(pkgname)-check-dependencies: gendoc-check-dependencies
+	$$(Q)$$(foreach hook,$$($$(call UPPERCASE,$(pkgname))_EXTRA_CHECK_DEPENDENCIES),$$(call $$(hook))$$(sep))
+
 $$(BUILD_DIR)/$(pkgname):
 	$$(Q)mkdir -p $$@
 
@@ -117,7 +120,9 @@ $(pkgname)-rsync: $$(BUILD_DIR)/$(pkgname)
 	$$(Q)$$(call MESSAGE,"Preparing the $(pkgname) sources...")
 	$$(Q)rsync -a $(pkgdir) $$^
 
+# Single line, because splitting a foreach is not easy...
 $(pkgname)-prepare-sources: $(pkgname)-rsync
+	$$(Q)$$(foreach hook,$$($$(call UPPERCASE,$(pkgname))_POST_EXTRACT_HOOKS),$$(call $$(hook))$$(sep))
 
 $(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),xhtml,html,html,HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
-- 
1.9.1
