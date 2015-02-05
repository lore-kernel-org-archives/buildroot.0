From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Feb 2015 22:19:59 +0100
Subject: [Buildroot] [PATCHv3 4/5] Makefile: implement a size-stats target
In-Reply-To: <1423171200-24583-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1423171200-24583-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1423171200-24583-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit implements a size-stats target that calls the script of
the same name to generate the graph and CSV files related to package
and file sizes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Makefile b/Makefile
index 6d4ae38..faa2e38 100644
--- a/Makefile
+++ b/Makefile
@@ -680,6 +680,17 @@ graph-depends: graph-depends-requirements
 	|tee $(BASE_DIR)/graphs/$(@).dot \
 	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(BASE_DIR)/graphs/$(@).$(BR_GRAPH_OUT)
 
+size-stats:
+	@[ -f $(O)/build/packages-file-list.txt ] || \
+		{ echo "ERROR: No package size information available, please rebuild with BR2_COLLECT_FILE_SIZE_STATS" ; exit 1; }
+	@$(INSTALL) -d $(GRAPHS_DIR)
+	@cd "$(CONFIG_DIR)"; \
+	$(TOPDIR)/support/scripts/size-stats --builddir $(BASE_DIR) \
+		--graph $(BASE_DIR)/graphs/graph-size.$(BR_GRAPH_OUT) \
+		--file-size-csv $(BASE_DIR)/build/file-size-stats.csv \
+		--package-size-csv $(BASE_DIR)/build/package-size-stats.csv \
+		--skeleton-path $(TARGET_SKELETON)
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
@@ -896,6 +907,7 @@ endif
 	@echo '  manual-epub            - build manual in ePub'
 	@echo '  graph-build            - generate graphs of the build times'
 	@echo '  graph-depends          - generate graph of the dependency tree'
+	@echo '  size-stats             - generate stats of the filesystem size'
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
-- 
2.1.0
