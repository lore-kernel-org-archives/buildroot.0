From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 19:52:16 +0200
Subject: [Buildroot] [git commit] pkg-generic: implement source-check targets
Message-ID: <20150426202108.48BFA81734@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e16ed77c5db07a0b1207970ef2ac5ac0775148b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commits extends the common package infrastructure with the
$(1)-source-check and $(1)-all-source-check targets.

The $(1)-source-check target simply calls the newly added
SOURCE_CHECK macro on all items to be downloaded.

The $(1)-all-source-check target will depend on the
$(1)-all-source-check targets of all dependent packages and the
$(1)-source-check target of the current package, which allows to do a
recursive source-check in the dependency tree.

[Thomas: move the code around a bit to avoid repeating the
<pkg>_OVERRIDE_SRCDIR condition, as suggested by Yann.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |   16 +++++++++++++++-
 1 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d7e3ca9..a3f4c41 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -550,6 +550,12 @@ $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
 
 $(1)-source:		$$($(2)_TARGET_SOURCE)
 
+$(1)-source-check:
+	$$(foreach p,$$($(2)_SOURCE) $$($(2)_EXTRA_DOWNLOADS) $$($(2)_PATCH),\
+		$$(if $$(findstring ://,$$(p)),\
+			$$(call SOURCE_CHECK,$$(p)),\
+			$$(call SOURCE_CHECK,$$($(2)_SITE:/=)/$$(p)))$$(sep))
+
 $(1)-external-deps:
 	@for p in $$($(2)_SOURCE) $$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS) ; do \
 		echo `basename $$$$p` ; \
@@ -573,6 +579,9 @@ $(1)-rsync:		$$($(2)_TARGET_RSYNC)
 
 $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
 
+$(1)-source-check:
+	test -d $$($(2)_OVERRIDE_SRCDIR)
+
 $(1)-external-deps:
 	@echo "file://$$($(2)_OVERRIDE_SRCDIR)"
 endif
@@ -593,6 +602,9 @@ $(1)-graph-depends: graph-depends-requirements
 $(1)-all-source:	$(1)-source
 $(1)-all-source:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source)
 
+$(1)-all-source-check:	$(1)-source-check
+$(1)-all-source-check:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source-check)
+
 $(1)-all-external-deps:	$(1)-external-deps
 $(1)-all-external-deps:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-external-deps)
 
@@ -788,6 +800,7 @@ endif
 	$(1)-all-external-deps \
 	$(1)-all-legal-info \
 	$(1)-all-source \
+	$(1)-all-source-check \
 	$(1)-build \
 	$(1)-clean-for-rebuild \
 	$(1)-clean-for-reconfigure \
@@ -811,7 +824,8 @@ endif
 	$(1)-rsync \
 	$(1)-show-depends \
 	$(1)-show-version \
-	$(1)-source
+	$(1)-source \
+	$(1)-source-check
 
 endif # $(2)_KCONFIG_VAR
 endef # inner-generic-package
