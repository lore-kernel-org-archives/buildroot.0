From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 19:24:33 +0200
Subject: [Buildroot] [git commit] Makefile: test if "dot" exists in
	"<pkg>-graph-depends"
Message-ID: <20140622172441.065359D04E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3c1c647ff9b45d8664036e2003bd5ebaa3f9ccd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To be able to check the "dot" command availability in
"<pkg>-graph-depends" move the check to the "graph-depends-requirements" rule.
Also don't use a subshell for the exit command to be sure that the error
will be returned by the shell.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile               |    6 ++++--
 package/pkg-generic.mk |    2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 14fca2b..4fe370a 100644
--- a/Makefile
+++ b/Makefile
@@ -673,9 +673,11 @@ graph-build: $(O)/build/build-time.log
 				   --output=$(O)/graphs/build.pie-$(t).$(BR_GRAPH_OUT) \
 				   $(if $(BR2_GRAPH_ALT),--alternate-colors)$(sep))
 
-graph-depends:
+graph-depends-requirements:
 	@dot -? >/dev/null 2>&1 || \
-		(echo "ERROR: The 'dot' program from Graphviz is needed for graph-depends" >&2; exit 1)
+		{ echo "ERROR: The 'dot' program from Graphviz is needed for graph-depends" >&2; exit 1; }
+
+graph-depends: graph-depends-requirements
 	@$(INSTALL) -d $(O)/graphs
 	@cd "$(CONFIG_DIR)"; \
 	$(TOPDIR)/support/scripts/graph-depends $(BR2_GRAPH_DEPS_OPTS) \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 457d873..4a011cc 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -556,7 +556,7 @@ endif
 $(1)-show-depends:
 			@echo $$($(2)_FINAL_DEPENDENCIES)
 
-$(1)-graph-depends:
+$(1)-graph-depends: graph-depends-requirements
 			@$$(INSTALL) -d $$(O)/graphs
 			@cd "$$(CONFIG_DIR)"; \
 			$$(TOPDIR)/support/scripts/graph-depends -p $(1) $$(BR2_GRAPH_DEPS_OPTS) \
