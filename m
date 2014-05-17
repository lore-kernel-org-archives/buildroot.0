From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 May 2014 23:36:06 +0200
Subject: [Buildroot] [git commit] graph-depends: rename the variable to pass
	the max depth
Message-ID: <20140517213714.648A19CC58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=287a88286b0e5335438955f8acc6f3abbfe5c1a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There will soon be new options to the graph-depends script, which we
can only sanely pass via environment variables.

Currently, we use such an environment variable to pass the maximum depth
of the dependency graph; the name of that variable is explicit that it
contains just the depth.

However, there has been so far no release of Buildroot which would make
use of that variable, so no user should have come to rely on it.

Rename that variable so it is less specific, and more generic, so it can
be used to pass more options to graph-depends.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                     |    3 +--
 docs/manual/common-usage.txt |   14 ++++++++++++--
 package/pkg-generic.mk       |    2 +-
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 6d97262..d91231c 100644
--- a/Makefile
+++ b/Makefile
@@ -150,7 +150,6 @@ endif
 # Need that early, before we scan packages
 # Avoids doing the $(or...) everytime
 BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
-BR_GRAPH_DEPTH := $(or $(BR2_GRAPH_DEPTH),0)
 
 BUILD_DIR := $(BASE_DIR)/build
 BINARIES_DIR := $(BASE_DIR)/images
@@ -675,7 +674,7 @@ graph-build: $(O)/build/build-time.log
 graph-depends:
 	@$(INSTALL) -d $(O)/graphs
 	@cd "$(CONFIG_DIR)"; \
-	$(TOPDIR)/support/scripts/graph-depends -d $(BR_GRAPH_DEPTH) \
+	$(TOPDIR)/support/scripts/graph-depends $(BR2_GRAPH_DEPS_OPTS) \
 	|tee $(O)/graphs/$(@).dot \
 	|dot -T$(BR_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR_GRAPH_OUT)
 
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 3d5842d..772982a 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -92,8 +92,8 @@ to +make+ or set in the environment:
   build-time graphs
 * +BR2_GRAPH_OUT+ to set the filetype of generated graphs, either +pdf+ (the
   default), or +png+.
-* +BR2_GRAPH_DEPTH+ (an integer) to limit the depth of the dependency graph.
-  The default, +0+, is to not limit the depth.
+* +BR2_GRAPH_DEPS_OPTS+ to pass extra options to the dependency graph; see
+  xref:graph-depends[] for the accepted options
 
 An example that uses config files located in the toplevel directory and
 in your $HOME:
@@ -198,6 +198,16 @@ supported.
 BR2_GRAPH_OUT=svg make graph-depends
 --------------------------------
 
+The +graph-depends+ behaviour can be controlled by setting options in the
++BR2_GRAPH_DEPS_OPTS+ environment variable. The accepted options are:
+
+* +--depth N+, +-d N+, to limit the dependency depth to +N+ levels. The
+  default, +0+, means no limit.
+
+--------------------------------
+BR2_GRAPH_DEPS_OPTS='-d 3' make graph-depends
+--------------------------------
+
 === Graphing the build duration
 
 [[graph-duration]]
diff --git a/foo b/foo
new file mode 100644
index 0000000..e69de29
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6eca6d4..426d269 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -512,7 +512,7 @@ $(1)-show-depends:
 $(1)-graph-depends:
 			@$(INSTALL) -d $(O)/graphs
 			@cd "$(CONFIG_DIR)"; \
-			$(TOPDIR)/support/scripts/graph-depends -p $(1) -d $(BR_GRAPH_DEPTH) \
+			$(TOPDIR)/support/scripts/graph-depends -p $(1) $(BR2_GRAPH_DEPS_OPTS) \
 			|tee $(O)/graphs/$$(@).dot \
 			|dot -T$(BR_GRAPH_OUT) -o $(O)/graphs/$$(@).$(BR_GRAPH_OUT)
 
