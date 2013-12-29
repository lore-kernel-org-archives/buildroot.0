From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 12:13:12 +0100
Subject: [Buildroot] [git commit] Makefile: expose target 'graph-build' to
	generate the build-time graphs
Message-ID: <20131229111620.893699C226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e16bf922524bb46f00bfc8f77ccf42e59eff989b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Generate the build-time graphs by calling:
    make graph-build

This generates the graphs in $(O)/graphs/

It is possible to use the alternate color-scheme by setting the variable
GRAPH_ALT=1 on the command line:
    make GRAPH_ALT=1 graph-build

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                     |   12 ++++++++++++
 docs/manual/common-usage.txt |    2 ++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 3190541..98ca798 100644
--- a/Makefile
+++ b/Makefile
@@ -631,6 +631,17 @@ legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
 show-targets:
 	@echo $(TARGETS)
 
+graph-build: $(O)/build/build-time.log
+	@install -d $(O)/graphs
+	$(foreach o,name build duration,./support/scripts/graph-build-time \
+					--type=histogram --order=$(o) --input=$(<) \
+					--output=$(O)/graphs/build.hist-$(o).pdf \
+					$(if $(GRAPH_ALT),--alternate-colors)$(sep))
+	$(foreach t,packages steps,./support/scripts/graph-build-time \
+				   --type=pie-$(t) --input=$(<) \
+				   --output=$(O)/graphs/build.pie-$(t).pdf \
+				   $(if $(GRAPH_ALT),--alternate-colors)$(sep))
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
@@ -843,6 +854,7 @@ endif
 	@echo '  manual-pdf             - build manual in PDF'
 	@echo '  manual-text            - build manual in text'
 	@echo '  manual-epub            - build manual in ePub'
+	@echo '  graph-build            - generate graphs of the build times'
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 1290dfc..7c76942 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -86,6 +86,8 @@ to +make+ or set in the environment:
   Note that the Buildroot download directory can also be set from the
   configuration interface, so through the Buildroot +.config+ file; this
   is the recommended way of setting it.
+* +GRAPH_ALT+, if set and non-empty, to use an alternate color-scheme in
+  build-time graphs
 
 An example that uses config files located in the toplevel directory and
 in your $HOME:
