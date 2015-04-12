From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 18:37:56 +0200
Subject: [Buildroot] [PATCHv2 12/21] pkg-generic: implement source-check
	targets
In-Reply-To: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1428856685-4403-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commits extends the common package infrastructure with the
$(1)-source-check and $(1)-all-source-check targets.

The $(1)-source-check target simply calls the newly added
SOURCE_CHECK macro on all items to be downloaded.

The $(1)-all-source-check target will depend on the
$(1)-all-source-check targets of all dependent packages and the
$(1)-source-check target of the current package, which allows to do a
recursive source-check in the dependency tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 11edb34..b45b86e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -577,6 +577,16 @@ endif
 $(1)-show-version:
 			@echo $$($(2)_VERSION)
 
+$(1)-source-check:
+ifeq ($$($(2)_OVERRIDE_SRCDIR),)
+	$$(foreach p,$$($(2)_SOURCE) $$($(2)_EXTRA_DOWNLOADS) $$($(2)_PATCH),\
+		$$(if $$(findstring ://,$$(p)),\
+			$$(call SOURCE_CHECK,$$(p)),\
+			$$(call SOURCE_CHECK,$$($(2)_SITE:/=)/$$(p))))
+else
+	test -d $$($(2)_OVERRIDE_SRCDIR)
+endif
+
 $(1)-show-depends:
 			@echo $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))
 
@@ -589,6 +599,8 @@ $(1)-graph-depends: graph-depends-requirements
 
 $(1)-all-source:       $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-source) $(1)-source
 
+$(1)-all-source-check:       $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-source-check) $(1)-source-check
+
 $(1)-all-external-deps:        $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-external-deps) $(1)-external-deps
 
 $(1)-all-legal-info:   $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-legal-info) $(1)-legal-info
@@ -782,6 +794,7 @@ endif
 	$(1)-all-external-deps \
 	$(1)-all-legal-info \
 	$(1)-all-source \
+	$(1)-all-source-check \
 	$(1)-build \
 	$(1)-clean-for-rebuild \
 	$(1)-clean-for-reconfigure \
@@ -805,7 +818,8 @@ endif
 	$(1)-rsync \
 	$(1)-show-depends \
 	$(1)-show-version \
-	$(1)-source
+	$(1)-source \
+	$(1)-source-check
 
 endif # $(2)_KCONFIG_VAR
 endef # inner-generic-package
-- 
2.1.0
