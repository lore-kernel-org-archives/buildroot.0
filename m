From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Dec 2013 18:39:12 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: expose 'graph-depends' to
	generate a graph of the dependency tree
In-Reply-To: <cover.1388252053.git.yann.morin.1998@free.fr>
References: <cover.1388252053.git.yann.morin.1998@free.fr>
Message-ID: <094af59856bba61eaea98f85c0169193c42c64e4.1388252053.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Generate the graph of the complete dependency tree by calling:
    make graph-depends

It's also possible to generate the graph-depends for a single package:
    make PKG-graph-depends

The graphs are generated in $(O)/graphs/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile               | 7 +++++++
 package/pkg-generic.mk | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/Makefile b/Makefile
index 98ca798..8107865 100644
--- a/Makefile
+++ b/Makefile
@@ -642,6 +642,11 @@ graph-build: $(O)/build/build-time.log
 				   --output=$(O)/graphs/build.pie-$(t).pdf \
 				   $(if $(GRAPH_ALT),--alternate-colors)$(sep))
 
+graph-depends:
+	@$(INSTALL) -d $(O)/graphs
+	@./support/scripts/graph-depends \
+	|dot -Tpdf -o $(O)/graphs/$(@).pdf
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
@@ -814,6 +819,7 @@ help:
 	@echo '  toolchain              - build toolchain'
 	@echo '  <package>-rebuild      - force recompile <package>'
 	@echo '  <package>-reconfigure  - force reconfigure <package>'
+	@echo '  <package>-graph-depends    - generate graph of the dependency tree for package'
 	@echo
 	@echo 'Configuration:'
 	@echo '  menuconfig             - interactive curses-based configurator'
@@ -855,6 +861,7 @@ endif
 	@echo '  manual-text            - build manual in text'
 	@echo '  manual-epub            - build manual in ePub'
 	@echo '  graph-build            - generate graphs of the build times'
+	@echo '  graph-depends          - generate graph of the dependency tree'
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 66034ba..8005ce9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -468,6 +468,11 @@ endif
 $(1)-show-depends:
 			@echo $$($(2)_DEPENDENCIES)
 
+$(1)-graph-depends:
+			@$(INSTALL) -d $(O)/graphs
+			@./support/scripts/graph-depends $(1) \
+			|dot -Tpdf -o $(O)/graphs/$$(@).pdf
+
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
 $(1)-clean-for-rebuild:
-- 
1.8.1.2
