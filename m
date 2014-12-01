From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  1 Dec 2014 22:41:40 +0100
Subject: [Buildroot] [PATCHv2 4/4] Makefile: implement a size-stats target
In-Reply-To: <1417470100-32657-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417470100-32657-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417470100-32657-5-git-send-email-thomas.petazzoni@free-electrons.com>
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
 Makefile | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Makefile b/Makefile
index ad018c8..56b2b93 100644
--- a/Makefile
+++ b/Makefile
@@ -677,6 +677,16 @@ graph-depends: graph-depends-requirements
 	|tee $(BASE_DIR)/graphs/$(@).dot \
 	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(BASE_DIR)/graphs/$(@).$(BR_GRAPH_OUT)
 
+size-stats:
+	@[ -f $(O)/build/packages-file-list.txt ] || \
+		{ echo "ERROR: No package size information available, please rebuild with BR2_COLLECT_FILE_SIZE_STATS" ; exit 1; }
+	@$(INSTALL) -d $(O)/graphs
+	@cd "$(CONFIG_DIR)"; \
+	$(TOPDIR)/support/scripts/graph-size --builddir $(O) \
+		--graph $(O)/graphs/graph-size.$(BR_GRAPH_OUT) \
+		--file-size-csv $(O)/build/file-size-stats.csv \
+		--package-size-csv $(O)/build/package-size-stats.csv
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
@@ -889,6 +899,7 @@ endif
 	@echo '  manual-epub            - build manual in ePub'
 	@echo '  graph-build            - generate graphs of the build times'
 	@echo '  graph-depends          - generate graph of the dependency tree'
+	@echo '  size-stats             - generate stats of the filesystem size'
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
-- 
2.1.0
