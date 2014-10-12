From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:27 +0200
Subject: [Buildroot] [git commit] docs/manual: allow documents to define
	some hooks, as for a package
Message-ID: <20141012072419.E29A0B1909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b34e68369652c306a70a134004638139f901ca4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Acked-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.mk |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index f6ef71e..ee7887c 100644
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
+	$$(Q)$$(foreach hook,$$($(2)_CHECK_DEPENDENCIES_$$(call UPPERCASE,$(5))_HOOKS),$$(call $$(hook))$$(sep))
 
 $(2)_$(4)_ASCIIDOC_CONF = $(3)/asciidoc-$(4).conf
 ifneq ($$(wildcard $$($(2)_$(4)_ASCIIDOC_CONF)),)
@@ -110,12 +110,18 @@ endef
 # resources, such as images, are located; must be an absolute path.
 ################################################################################
 define GENDOC
+# Single line, because splitting a foreach is not easy...
+$(pkgname)-check-dependencies: gendoc-check-dependencies
+	$$(Q)$$(foreach hook,$$($$(call UPPERCASE,$(pkgname))_CHECK_DEPENDENCIES_HOOKS),$$(call $$(hook))$$(sep))
+
 $$(BUILD_DIR)/docs/$(pkgname):
 	$$(Q)mkdir -p $$@
 
+# Single line, because splitting a foreach is not easy...
 $(pkgname)-rsync: $$(BUILD_DIR)/docs/$(pkgname)
 	$$(Q)$$(call MESSAGE,"Preparing the $(pkgname) sources...")
 	$$(Q)rsync -a $(pkgdir) $$^
+	$$(Q)$$(foreach hook,$$($$(call UPPERCASE,$(pkgname))_POST_RSYNC_HOOKS),$$(call $$(hook))$$(sep))
 
 $(pkgname)-prepare-sources: $(pkgname)-rsync
 
