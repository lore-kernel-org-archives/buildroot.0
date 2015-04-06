From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 11:26:11 +0200
Subject: [Buildroot] [git commit] pkg-generic: implement <pkg>-all-{source,
	legal-info, external-deps} targets
Message-ID: <20150406093206.CA831800FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3831c976d0bc0df47429894cc5dfcf5dc69d5366
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to implement the global 'make source', 'make legal-info' and
'make external-deps' using the package infrastructure logic, this
commit introduces a set of per-package targets that allow to
recursively run the source/legal-info/external-deps actions on the
dependencies of a given package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1c19947..9070f8b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -587,6 +587,12 @@ $(1)-graph-depends: graph-depends-requirements
 			|tee $$(GRAPHS_DIR)/$$(@).dot \
 			|dot $$(BR2_GRAPH_DOT_OPTS) -T$$(BR_GRAPH_OUT) -o $$(GRAPHS_DIR)/$$(@).$$(BR_GRAPH_OUT)
 
+$(1)-all-source:       $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-source) $(1)-source
+
+$(1)-all-external-deps:        $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-external-deps) $(1)-external-deps
+
+$(1)-all-legal-info:   $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-legal-info) $(1)-legal-info
+
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
 $(1)-clean-for-reinstall:
