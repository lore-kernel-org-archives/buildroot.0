From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Sep 2015 23:15:04 +0200
Subject: [Buildroot] [PATCHv5 3/4] Makefile: implement a size-stats target
In-Reply-To: <1441228505-23235-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1441228505-23235-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1441228505-23235-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit implements a size-stats target that calls the script of
the same name to generate the graph and CSV files related to package
and file sizes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Ryan Barnett <ryanbarnett3@gmail.com>
Tested-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Makefile b/Makefile
index 9a6e9c0..4a33495 100644
--- a/Makefile
+++ b/Makefile
@@ -685,6 +685,13 @@ graph-depends: graph-depends-requirements
 	|tee $(GRAPHS_DIR)/$(@).dot \
 	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(GRAPHS_DIR)/$(@).$(BR_GRAPH_OUT)
 
+size-stats:
+	$(Q)mkdir -p $(GRAPHS_DIR)
+	$(Q)$(TOPDIR)/support/scripts/size-stats --builddir $(BASE_DIR) \
+		--graph $(BASE_DIR)/graphs/graph-size.$(BR_GRAPH_OUT) \
+		--file-size-csv $(BASE_DIR)/build/file-size-stats.csv \
+		--package-size-csv $(BASE_DIR)/build/package-size-stats.csv
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
@@ -903,6 +910,7 @@ endif
 	@echo '  manual-epub            - build manual in ePub'
 	@echo '  graph-build            - generate graphs of the build times'
 	@echo '  graph-depends          - generate graph of the dependency tree'
+	@echo '  size-stats             - generate stats of the filesystem size'
 	@echo '  list-defconfigs        - list all defconfigs (pre-configured minimal systems)'
 	@echo
 	@echo 'Miscellaneous:'
-- 
2.5.1
