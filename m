From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 17 Jun 2014 11:33:54 +0200
Subject: [Buildroot] [PATCH 2/2] Makefile: test if "dot" exists in
	"<pkg>-graph-depends"
In-Reply-To: <1402997634-2783-1-git-send-email-fabio.porcedda@gmail.com>
References: <1402997634-2783-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1402997634-2783-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be able to check the "dot" command availability in
"<pkg>-graph-depends" move the check to the "graph-depends-requirements" rule.
Also don't use a subshell for the exit command to be sure that the error
will be returned by the shell.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---

Notes:
    v2:
     - Remove the check for graph-build (Yann and Thomas)
     - Remove the previuous code for checking the "dot"
       command avaiability (Yann)
     - Don't use a subshell (Yann)

 Makefile               | 6 ++++--
 package/pkg-generic.mk | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 86acbbf..a27502b 100644
--- a/Makefile
+++ b/Makefile
@@ -669,9 +669,11 @@ graph-build: $(O)/build/build-time.log
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
-- 
2.0.0
