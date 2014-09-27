From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Sep 2014 12:16:50 +0200
Subject: [Buildroot] [PATCH 14/25 v6] docs/manual: allow documents to define
	some hooks, as for a package
In-Reply-To: <cover.1411812968.git.yann.morin.1998@free.fr>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
Message-ID: <a743d5b27ae9337150c1497523aa11f16b9f9c58.1411812968.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow documents to define two hooks:
  - DOC_CHECK_EXTRA_DEPENDENCIES_HOOKS
    to check for extra dependencies required by this document
  - DOC_CHECK_EXTRA_DEPENDENCIES_FMT_HOOKS
    ditto, but for the specific format
  - DOC_POST_EXTRACT_HOOKS:
    to run additional actions to fill-in the build directory

(Replace 'DOC' with the uppercase name of the document, and 'FMT' with
the format.)

This is supposed to replace the current use of overloading the internal
dependency rules, and makes GENDOC behave yet a bit more like the
package infrastructure.

Note that GENDOC_INNER already has the uppercase name as an argument,
whereas GENDOC does not, so the two foreach loops are not exactly
similar (for now.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

---
Changes v5 -> v6:
  - do not use $$ for call to UPPERCASE  (Thomas DS)

Changes v1 -> v2:
  - call post-extract hook in rsync rule
---
 docs/manual/manual.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 26906b5..2ee680e 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -55,10 +55,10 @@ $(1): $(1)-$(5)
 .PHONY: $(1)-$(5)
 $(1)-$(5): $$(O)/docs/$(1)/$(1).$(6)
 
-$(1)-check-dependencies: gendoc-check-dependencies
-
+# Single line, because splitting a foreach is not easy...
 gendoc-check-dependencies-$(5):
 $(1)-check-dependencies-$(5): gendoc-check-dependencies-$(5)
+	$$(Q)$$(foreach hook,$$($(2)_CHECK_DEPENDENCIES_$(call UPPERCASE,$(5))_HOOKS),$$(call $$(hook))$$(sep))
 
 $(2)_$(4)_ASCIIDOC_CONF = $(3)/asciidoc-$(4).conf
 ifneq ($$(wildcard $$($(2)_$(4)_ASCIIDOC_CONF)),)
@@ -110,12 +110,18 @@ endef
 # resources, such as images, are located; must be an absolute path.
 ################################################################################
 define GENDOC
+# Single line, because splitting a foreach is not easy...
+$(pkgname)-check-dependencies: gendoc-check-dependencies
+	$$(Q)$$(foreach hook,$$($(call UPPERCASE,$(pkgname))_CHECK_DEPENDENCIES_HOOKS),$$(call $$(hook))$$(sep))
+
 $$(BUILD_DIR)/docs/$(pkgname):
 	$$(Q)mkdir -p $$@
 
+# Single line, because splitting a foreach is not easy...
 $(pkgname)-rsync: $$(BUILD_DIR)/docs/$(pkgname)
 	$$(Q)$$(call MESSAGE,"Preparing the $(pkgname) sources...")
 	$$(Q)rsync -a $(pkgdir) $$^
+	$$(Q)$$(foreach hook,$$($(call UPPERCASE,$(pkgname))_POST_RSYNC_HOOKS),$$(call $$(hook))$$(sep))
 
 $(pkgname)-prepare-sources: $(pkgname)-rsync
 
-- 
1.9.1
