From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Dec 2013 00:12:50 +0100
Subject: [Buildroot] [PATCH 2/4] Makefile: expose target 'graph-build' to
	generate the build-time graphs
In-Reply-To: <cover.1388185918.git.yann.morin.1998@free.fr>
References: <cover.1388185918.git.yann.morin.1998@free.fr>
Message-ID: <15a33a00829b298726e449f89bb255783e87e9db.1388185918.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Generate the build-time graphs by calling:
    make graph-build

This generates the graphs in $(O)/graphs/

It is possible to use the alternate color-scheme by setting the variable
GRAPH_ALT=1 on the command line:
    make GRAPH_ALT=1 graph-build

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Makefile b/Makefile
index 3190541..9df72e9 100644
--- a/Makefile
+++ b/Makefile
@@ -631,6 +631,19 @@ legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
 show-targets:
 	@echo $(TARGETS)
 
+graph-build: $(O)/build/build-time.log
+	@install -d $(O)/graphs
+	$(foreach o,name build duration,./support/scripts/graph-build-time \
+					--type=histogram --order=$(o) \
+					--output=$(O)/graphs/build.hist-$(o).pdf \
+					$(if $(GRAPH_ALT),--alternate-colors) \
+					<$(<)$(sep))
+	$(foreach t,packages steps,./support/scripts/graph-build-time \
+				   --type=pie-$(t) \
+				   --output=$(O)/graphs/build.pie-$(t).pdf \
+				   $(if $(GRAPH_ALT),--alternate-colors) \
+				   <$(<)$(sep))
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
@@ -843,6 +856,7 @@ endif
 	@echo '  manual-pdf             - build manual in PDF'
 	@echo '  manual-text            - build manual in text'
 	@echo '  manual-epub            - build manual in ePub'
+	@echo '  graph-build            - generate graphs of the build times'
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
@@ -852,6 +866,7 @@ endif
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
+	@echo '  make GRAPH_ALT=1       - use alternate color-scheme for build-time graphs'
 	@echo
 	@echo 'Built-in configs:'
 	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
-- 
1.8.1.2
