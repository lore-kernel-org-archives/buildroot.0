From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 15:33:44 +0200
Subject: [Buildroot] [PATCHv6 3/4] Makefile: implement a graph-size target
In-Reply-To: <1445088825-19300-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1445088825-19300-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1445088825-19300-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit implements a graph-size target that calls the script of
the same name to generate the graph and CSV files related to package
and file sizes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Makefile b/Makefile
index 181d446..c871393 100644
--- a/Makefile
+++ b/Makefile
@@ -686,6 +686,13 @@ graph-depends: graph-depends-requirements
 	|tee $(GRAPHS_DIR)/$(@).dot \
 	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(GRAPHS_DIR)/$(@).$(BR_GRAPH_OUT)
 
+graph-size:
+	$(Q)mkdir -p $(GRAPHS_DIR)
+	$(Q)$(TOPDIR)/support/scripts/size-stats --builddir $(BASE_DIR) \
+		--graph $(GRAPHS_DIR)/graph-size.$(BR_GRAPH_OUT) \
+		--file-size-csv $(GRAPHS_DIR)/file-size-stats.csv \
+		--package-size-csv $(GRAPHS_DIR)/package-size-stats.csv
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
@@ -903,6 +910,7 @@ endif
 	@echo '  manual-epub            - build manual in ePub'
 	@echo '  graph-build            - generate graphs of the build times'
 	@echo '  graph-depends          - generate graph of the dependency tree'
+	@echo '  graph-size             - generate stats of the filesystem size'
 	@echo '  list-defconfigs        - list all defconfigs (pre-configured minimal systems)'
 	@echo
 	@echo 'Miscellaneous:'
-- 
2.6.2
