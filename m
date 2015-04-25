From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 16:42:51 +0200
Subject: [Buildroot] [PATCHv3 07/18] pkg-generic: implement source-check
	targets
In-Reply-To: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1429972982-25495-8-git-send-email-thomas.petazzoni@free-electrons.com>
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
 package/pkg-generic.mk | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a12b868..5a9bcf1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -579,6 +579,16 @@ endif
 $(1)-show-version:
 			@echo $$($(2)_VERSION)
 
+$(1)-source-check:
+ifeq ($$($(2)_OVERRIDE_SRCDIR),)
+	$$(foreach p,$$($(2)_SOURCE) $$($(2)_EXTRA_DOWNLOADS) $$($(2)_PATCH),\
+		$$(if $$(findstring ://,$$(p)),\
+			$$(call SOURCE_CHECK,$$(p)),\
+			$$(call SOURCE_CHECK,$$($(2)_SITE:/=)/$$(p)))$$(sep))
+else
+	test -d $$($(2)_OVERRIDE_SRCDIR)
+endif
+
 $(1)-show-depends:
 			@echo $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))
 
@@ -594,6 +604,11 @@ $(1)-all-source:	$$(foreach p, \
 				$$(p)-all-source) \
 			$(1)-source
 
+$(1)-all-source-check:	$$(foreach p, \
+				$$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES), \
+				$$(p)-all-source-check) \
+			$(1)-source-check
+
 $(1)-all-external-deps:	$$(foreach p, \
 				$$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES), \
 				$$(p)-all-external-deps) \
@@ -793,6 +808,7 @@ endif
 	$(1)-all-external-deps \
 	$(1)-all-legal-info \
 	$(1)-all-source \
+	$(1)-all-source-check \
 	$(1)-build \
 	$(1)-clean-for-rebuild \
 	$(1)-clean-for-reconfigure \
@@ -816,7 +832,8 @@ endif
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
