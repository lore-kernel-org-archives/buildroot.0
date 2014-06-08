From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 16:43:32 +0200
Subject: [Buildroot] [git commit] graph-depends: add option to pass
	arbitrary dot options
Message-ID: <20140608145131.9EF8B9CB8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cca66f877997c34d0c28d00f8dcfee049db5c19
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kids nowaday seem to prefer a left-to-right drawing rather than the
more conventional and historical top-down drawing.

Rather than multiply the number of environment variables, just add
a single one where the user can pass arbitrary dot options, such as:

    make BR2_GRAPH_DOT_OPTS=-Grankdir=LR graph-depends

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile               |    2 +-
 package/pkg-generic.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 0b4264a..08696f7 100644
--- a/Makefile
+++ b/Makefile
@@ -675,7 +675,7 @@ graph-depends:
 	@cd "$(CONFIG_DIR)"; \
 	$(TOPDIR)/support/scripts/graph-depends $(BR2_GRAPH_DEPS_OPTS) \
 	|tee $(O)/graphs/$(@).dot \
-	|dot -T$(BR_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR_GRAPH_OUT)
+	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR_GRAPH_OUT)
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5116ed9..c6c367c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -533,7 +533,7 @@ $(1)-graph-depends:
 			@cd "$(CONFIG_DIR)"; \
 			$(TOPDIR)/support/scripts/graph-depends -p $(1) $(BR2_GRAPH_DEPS_OPTS) \
 			|tee $(O)/graphs/$$(@).dot \
-			|dot -T$(BR_GRAPH_OUT) -o $(O)/graphs/$$(@).$(BR_GRAPH_OUT)
+			|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(O)/graphs/$$(@).$(BR_GRAPH_OUT)
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
