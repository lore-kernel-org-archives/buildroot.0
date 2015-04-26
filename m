From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 19:50:40 +0200
Subject: [Buildroot] [git commit] pkg-generic: take into account patch
	dependencies in source, external-deps and legal-info
Message-ID: <20150426202108.0DE1F81734@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=671b0e167d25b187aa43129631423acb3047fa04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The $(1)-all-{source,external-deps,legal-info} targets currently only
take care of the dependencies in <pkg>_DEPENDENCIES, but not
<pkg>_PATCH_DEPENDENCIES. This patch fixes that by introducing a
<pkg>_FINAL_ALL_DEPENDENCIES. It also reworks the $(1)-show-depends
target to make use of <pkg>_FINALL_ALL_DEPENDENCIES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 455bdf1..dd8c4c9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -431,6 +431,7 @@ endif
 # Eliminate duplicates in dependencies
 $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
 $(2)_FINAL_PATCH_DEPENDENCIES = $$(sort $$($(2)_PATCH_DEPENDENCIES))
+$(2)_FINAL_ALL_DEPENDENCIES = $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))
 
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
@@ -583,7 +584,7 @@ $(1)-show-version:
 			@echo $$($(2)_VERSION)
 
 $(1)-show-depends:
-			@echo $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))
+			@echo $$($(2)_FINAL_ALL_DEPENDENCIES)
 
 $(1)-graph-depends: graph-depends-requirements
 			@$$(INSTALL) -d $$(GRAPHS_DIR)
@@ -592,11 +593,14 @@ $(1)-graph-depends: graph-depends-requirements
 			|tee $$(GRAPHS_DIR)/$$(@).dot \
 			|dot $$(BR2_GRAPH_DOT_OPTS) -T$$(BR_GRAPH_OUT) -o $$(GRAPHS_DIR)/$$(@).$$(BR_GRAPH_OUT)
 
-$(1)-all-source:       $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-source) $(1)-source
+$(1)-all-source:	$(1)-source
+$(1)-all-source:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source)
 
-$(1)-all-external-deps:        $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-external-deps) $(1)-external-deps
+$(1)-all-external-deps:	$(1)-external-deps
+$(1)-all-external-deps:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-external-deps)
 
-$(1)-all-legal-info:   $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-legal-info) $(1)-legal-info
+$(1)-all-legal-info:	$(1)-legal-info
+$(1)-all-legal-info:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-legal-info)
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
