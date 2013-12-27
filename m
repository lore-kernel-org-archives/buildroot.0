From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Dec 2013 00:12:51 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: expose 'graph-depends' to
	generate a graph of the dependency tree
In-Reply-To: <cover.1388185918.git.yann.morin.1998@free.fr>
References: <cover.1388185918.git.yann.morin.1998@free.fr>
Message-ID: <0fad080c135d79abdbe042514e30b393c25f5a77.1388185918.git.yann.morin.1998@free.fr>
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
 Makefile               | 13 +++++++++++++
 package/pkg-generic.mk |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/Makefile b/Makefile
index 9df72e9..f09f744 100644
--- a/Makefile
+++ b/Makefile
@@ -644,6 +644,18 @@ graph-build: $(O)/build/build-time.log
 				   $(if $(GRAPH_ALT),--alternate-colors) \
 				   <$(<)$(sep))
 
+graph-depends:
+	@install -d $(O)/graphs
+	@./support/scripts/graph-depends \
+	|dot -Tpdf -o $(O)/graphs/graph-depends.pdf
+	-o $(O)/graphs/graph-depends.pdf
+
+%-graph-depends:
+	@install -d $(O)/graphs
+	@./support/scripts/graph-depends $(@:-graph-depends=) \
+	|dot -Tpdf \
+	-o $(O)/graphs/$(@).pdf
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
@@ -857,6 +869,7 @@ endif
 	@echo '  manual-text            - build manual in text'
 	@echo '  manual-epub            - build manual in ePub'
 	@echo '  graph-build            - generate graphs of the build times'
+	@echo '  graph-depends          - generate graph of the dependency tree'
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 66034ba..aa7e4ef 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -468,6 +468,9 @@ endif
 $(1)-show-depends:
 			@echo $$($(2)_DEPENDENCIES)
 
+# For auto-completion, handled in top-level Makefile
+$(1)-graph-depends:
+
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
 $(1)-clean-for-rebuild:
-- 
1.8.1.2
