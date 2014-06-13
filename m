From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 13 Jun 2014 19:06:48 +0200
Subject: [Buildroot] [PATCH 2/2] Makefile: test if "dot" exists in
	graph-build and <pkg>-graph-depends
In-Reply-To: <1402679208-8304-1-git-send-email-fabio.porcedda@gmail.com>
References: <1402679208-8304-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1402679208-8304-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because the "dot" command availability was checked only for the
"graph-depends" target so move the check to the "graph-prerequisites"
target to be able to check the "dot" command availability for all the
graph generation targets.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile               | 8 ++++++--
 package/pkg-generic.mk | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 86acbbf..3e395b5 100644
--- a/Makefile
+++ b/Makefile
@@ -658,7 +658,11 @@ legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
 show-targets:
 	@echo $(HOST_DEPS) $(TARGETS_HOST_DEPS) $(TARGETS) $(TARGETS_ROOTFS)
 
-graph-build: $(O)/build/build-time.log
+graph-prerequisites:
+	@dot -? >/dev/null 2>&1 || \
+		(echo "ERROR: The 'dot' program from Graphviz is needed for graph-depends" >&2; exit 1)
+
+graph-build: $(O)/build/build-time.log graph-prerequisites
 	@install -d $(O)/graphs
 	$(foreach o,name build duration,./support/scripts/graph-build-time \
 					--type=histogram --order=$(o) --input=$(<) \
@@ -669,7 +673,7 @@ graph-build: $(O)/build/build-time.log
 				   --output=$(O)/graphs/build.pie-$(t).$(BR_GRAPH_OUT) \
 				   $(if $(BR2_GRAPH_ALT),--alternate-colors)$(sep))
 
-graph-depends:
+graph-depends: graph-prerequisites
 	@dot -? >/dev/null 2>&1 || \
 		(echo "ERROR: The 'dot' program from Graphviz is needed for graph-depends" >&2; exit 1)
 	@$(INSTALL) -d $(O)/graphs
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ccd7f3b..752392d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -531,7 +531,7 @@ endif
 $(1)-show-depends:
 			@echo $$($(2)_FINAL_DEPENDENCIES)
 
-$(1)-graph-depends:
+$(1)-graph-depends: graph-prerequisites
 			@$(INSTALL) -d $(O)/graphs
 			@cd "$(CONFIG_DIR)"; \
 			$(TOPDIR)/support/scripts/graph-depends -p $(1) $(BR2_GRAPH_DEPS_OPTS) \
-- 
2.0.0
