From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:40 +0200
Subject: [Buildroot] [PATCH 26/35] pkg-generic: implement source-check
	targets
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-27-git-send-email-thomas.petazzoni@free-electrons.com>
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
 package/pkg-generic.mk | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4ec9a06..8afcff1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -574,6 +574,16 @@ endif
 $(1)-show-version:
 			@echo $$($(2)_VERSION)
 
+$(1)-source-check:
+ifeq ($$($(2)_OVERRIDE_SRCDIR),)
+	$$(foreach p,$$($(2)_SOURCE) $$($(2)_EXTRA_DOWNLOADS) $$($(2)_PATCH),\
+		$$(if $$(findstring ://,$(p)),\
+			$$(call SOURCE_CHECK,$(p)),\
+			$$(call SOURCE_CHECK,$$($(2)_SITE:/=)/$(p))))
+else
+	test -d $$($(2)_OVERRIDE_SRCDIR)
+endif
+
 $(1)-show-depends:
 			@echo $$($(2)_FINAL_DEPENDENCIES)
 
@@ -586,6 +596,8 @@ $(1)-graph-depends: graph-depends-requirements
 
 $(1)-all-source:       $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-source) $(1)-source
 
+$(1)-all-source-check:       $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-source-check) $(1)-source-check
+
 $(1)-all-external-deps:        $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-external-deps) $(1)-external-deps
 
 $(1)-all-legal-info:   $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-legal-info) $(1)-legal-info
@@ -781,7 +793,8 @@ endif
 	$(1)-source $(1)-rsync $(1)-show-depends $(1)-graph-depends \
 	$(1)-external-deps $(1)-all-source $(1)-all-external-deps \
 	$(1)-all-legal-info $(1)-dirclean $(1)-clean-for-rebuild \
-	$(1)-rebuild $(1)-clean-for-reconfigure $(1)-reconfigure
+	$(1)-rebuild $(1)-clean-for-reconfigure $(1)-reconfigure \
+	$(1)-source-check $(1)-all-source-check
 
 endif # $(2)_KCONFIG_VAR
 endef # inner-generic-package
-- 
2.1.0
