From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 16:42:46 +0200
Subject: [Buildroot] [PATCHv3 02/18] pkg-generic: take into account patch
	dependencies in source, external-deps and legal-info
In-Reply-To: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1429972982-25495-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The $(1)-all-{source,external-deps,legal-info} targets currently only
take care of the dependencies in <pkg>_DEPENDENCIES, but not
<pkg>_PATCH_DEPENDENCIES. This patch fixes that.

Long term, we might want to refactor this to have a single variable
containing all dependencies. But this requires more work in
pkg-generic than we want to do at the moment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 455bdf1..de63f2f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -592,11 +592,20 @@ $(1)-graph-depends: graph-depends-requirements
 			|tee $$(GRAPHS_DIR)/$$(@).dot \
 			|dot $$(BR2_GRAPH_DOT_OPTS) -T$$(BR_GRAPH_OUT) -o $$(GRAPHS_DIR)/$$(@).$$(BR_GRAPH_OUT)
 
-$(1)-all-source:       $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-source) $(1)-source
-
-$(1)-all-external-deps:        $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-external-deps) $(1)-external-deps
-
-$(1)-all-legal-info:   $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-legal-info) $(1)-legal-info
+$(1)-all-source:	$$(foreach p, \
+				$$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES), \
+				$$(p)-all-source) \
+			$(1)-source
+
+$(1)-all-external-deps:	$$(foreach p, \
+				$$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES), \
+				$$(p)-all-external-deps) \
+			$(1)-external-deps
+
+$(1)-all-legal-info:	$$(foreach p, \
+				$$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES), \
+				$$(p)-all-legal-info) \
+			$(1)-legal-info
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
-- 
2.1.0
