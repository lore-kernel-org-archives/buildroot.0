From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 23:50:39 +0200
Subject: [Buildroot] [git commit] graphs: store and keep intermediate 'dot'
	program for graph-depends
Message-ID: <20140419215315.B53E29C910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=994fcc4a2b028fdbbe995622860964dacb44c4e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, graph-depends (and PKG-graph-depends) do not store the
intermediate 'dot' program.

Some users would like to get the dot program to be able to further
customise the generated graphs (eg. modify the layout, colorise some
of the packages...)

So, store the intermediate dot program alongside the generated graph.

Reported-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile               |    1 +
 package/pkg-generic.mk |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 42adf7c..dd47f77 100644
--- a/Makefile
+++ b/Makefile
@@ -670,6 +670,7 @@ graph-depends:
 	@$(INSTALL) -d $(O)/graphs
 	@cd "$(CONFIG_DIR)"; \
 	$(TOPDIR)/support/scripts/graph-depends -d $(BR_GRAPH_DEPTH) \
+	|tee $(O)/graphs/$(@).dot \
 	|dot -T$(BR_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR_GRAPH_OUT)
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8a62d4c..cf02210 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -496,6 +496,7 @@ $(1)-graph-depends:
 			@$(INSTALL) -d $(O)/graphs
 			@cd "$(CONFIG_DIR)"; \
 			$(TOPDIR)/support/scripts/graph-depends -p $(1) -d $(BR_GRAPH_DEPTH) \
+			|tee $(O)/graphs/$$(@).dot \
 			|dot -T$(BR_GRAPH_OUT) -o $(O)/graphs/$$(@).$(BR_GRAPH_OUT)
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
