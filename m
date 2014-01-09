From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Jan 2014 21:16:30 +0100
Subject: [Buildroot] [git commit] Makefile: support running graph-depends
	from out-of-tree
Message-ID: <20140109205952.04CBF9AD4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56eb3944d5d6d58b0125b22da7dcaeff5c0d3d1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile               |    3 ++-
 package/pkg-generic.mk |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 6faa698..7624f59 100644
--- a/Makefile
+++ b/Makefile
@@ -647,7 +647,8 @@ graph-build: $(O)/build/build-time.log
 
 graph-depends:
 	@$(INSTALL) -d $(O)/graphs
-	@./support/scripts/graph-depends \
+	@cd "$(CONFIG_DIR)"; \
+	$(TOPDIR)/support/scripts/graph-depends \
 	|dot -T$(BR2_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR2_GRAPH_OUT)
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b519d69..1b99c2a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -470,7 +470,8 @@ $(1)-show-depends:
 
 $(1)-graph-depends:
 			@$(INSTALL) -d $(O)/graphs
-			@./support/scripts/graph-depends $(1) \
+			@cd "$(CONFIG_DIR)"; \
+			$(TOPDIR)/support/scripts/graph-depends $(1) \
 			|dot -T$(BR2_GRAPH_OUT) -o $(O)/graphs/$$(@).$(BR2_GRAPH_OUT)
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
