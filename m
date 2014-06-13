From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jun 2014 14:17:19 +0200
Subject: [Buildroot] [PATCH] Makefile: test if dot exists before using it in
	graph-depends
Message-ID: <1402661839-319-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'graph-depends' logic uses the 'dot' program from Graphviz to draw
the dependency graph, but it doesn't check its existence before
starting the generation of the graph, which can lead to user confusion
as reported in:

 http://lists.busybox.net/pipermail/buildroot/2014-June/099278.html

With this commit, we first test if the 'dot' program is available, and
if it's not, we error out with a clear error message:

$ make graph-depends
ERROR: The 'dot' program from Graphviz is needed for graph-depends
make: *** [graph-depends] Error 1

Reported-by: Dallas Clement <dallas.a.clement@gmail.com>
Cc: Dallas Clement <dallas.a.clement@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 5501068..db8fd15 100644
--- a/Makefile
+++ b/Makefile
@@ -674,6 +674,8 @@ graph-build: $(O)/build/build-time.log
 				   $(if $(BR2_GRAPH_ALT),--alternate-colors)$(sep))
 
 graph-depends:
+	@dot -? >/dev/null 2>&1 || \
+		(echo "ERROR: The 'dot' program from Graphviz is needed for graph-depends"; exit 1)
 	@$(INSTALL) -d $(O)/graphs
 	@cd "$(CONFIG_DIR)"; \
 	$(TOPDIR)/support/scripts/graph-depends $(BR2_GRAPH_DEPS_OPTS) \
-- 
2.0.0
