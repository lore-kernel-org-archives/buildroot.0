From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Jun 2017 11:52:57 +0200
Subject: [Buildroot] [git commit] doc-asciidoc: add missing .PHONY
	declarations
Message-ID: <20170615100005.ABBB28019A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e016b79c4e3822be5aa14e3edde1dc92eee757b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/doc-asciidoc.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index cb6e616..be92496 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -1,5 +1,6 @@
 # we can't use suitable-host-package here because that's not available in
 # the context of 'make release'
+.PHONY: asciidoc-check-dependencies
 asciidoc-check-dependencies:
 	$(Q)if [ -z "$(shell support/dependencies/check-host-asciidoc.sh)" ]; then \
 		echo "You need a sufficiently recent asciidoc on your host" \
@@ -58,8 +59,9 @@ $(1): $(1)-$(5)
 .PHONY: $(1)-$(5)
 $(1)-$(5): $$(O)/docs/$(1)/$(1).$(6)
 
-# Single line, because splitting a foreach is not easy...
 asciidoc-check-dependencies-$(5):
+.PHONY: $(1)-check-dependencies-$(5)
+# Single line, because splitting a foreach is not easy...
 $(1)-check-dependencies-$(5): asciidoc-check-dependencies-$(5)
 	$$(Q)$$(foreach hook,$$($(2)_CHECK_DEPENDENCIES_$$(call UPPERCASE,$(5))_HOOKS),$$(call $$(hook))$$(sep))
 
@@ -141,6 +143,7 @@ endef
 ################################################################################
 define ASCIIDOC
 # Single line, because splitting a foreach is not easy...
+.PHONY: $(1)-check-dependencies
 $(1)-check-dependencies: asciidoc-check-dependencies $$($(2)_DEPENDENCIES)
 	$$(Q)$$(foreach hook,$$($(2)_CHECK_DEPENDENCIES_HOOKS),$$(call $$(hook))$$(sep))
 
@@ -153,6 +156,7 @@ $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced:
 	$$(Q)rsync -a $(3) $$(@D)
 	$$(Q)$$(foreach hook,$$($(2)_POST_RSYNC_HOOKS),$$(call $$(hook))$$(sep))
 
+.PHONY: $(1)-prepare-sources
 $(1)-prepare-sources: $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced
 
 $(2)_ASCIIDOC_CONF = $(3)/asciidoc.conf
