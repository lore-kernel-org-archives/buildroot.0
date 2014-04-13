From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Apr 2014 22:42:37 +0200
Subject: [Buildroot] [PATCH 1/6] Makefile: rename non-user-facing variable
In-Reply-To: <cover.1397421554.git.yann.morin.1998@free.fr>
References: <cover.1397421554.git.yann.morin.1998@free.fr>
Message-ID: <edda631ee353ed31dfd24226b33f9d0dfe40a939.1397421554.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Variables should be prefixed with BR_ when they are not user-facing.

As a side effect, the new variable is prettier than the previous one. :-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile               | 8 ++++----
 package/pkg-generic.mk | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 41c51c6..b0eec7f 100644
--- a/Makefile
+++ b/Makefile
@@ -149,7 +149,7 @@ endif
 
 # Need that early, before we scan packages
 # Avoids doing the $(or...) everytime
-_BR2_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
+BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
 
 BUILD_DIR:=$(BASE_DIR)/build
 BINARIES_DIR:=$(BASE_DIR)/images
@@ -662,18 +662,18 @@ graph-build: $(O)/build/build-time.log
 	@install -d $(O)/graphs
 	$(foreach o,name build duration,./support/scripts/graph-build-time \
 					--type=histogram --order=$(o) --input=$(<) \
-					--output=$(O)/graphs/build.hist-$(o).$(_BR2_GRAPH_OUT) \
+					--output=$(O)/graphs/build.hist-$(o).$(BR_GRAPH_OUT) \
 					$(if $(BR2_GRAPH_ALT),--alternate-colors)$(sep))
 	$(foreach t,packages steps,./support/scripts/graph-build-time \
 				   --type=pie-$(t) --input=$(<) \
-				   --output=$(O)/graphs/build.pie-$(t).$(_BR2_GRAPH_OUT) \
+				   --output=$(O)/graphs/build.pie-$(t).$(BR_GRAPH_OUT) \
 				   $(if $(BR2_GRAPH_ALT),--alternate-colors)$(sep))
 
 graph-depends:
 	@$(INSTALL) -d $(O)/graphs
 	@cd "$(CONFIG_DIR)"; \
 	$(TOPDIR)/support/scripts/graph-depends \
-	|dot -T$(_BR2_GRAPH_OUT) -o $(O)/graphs/$(@).$(_BR2_GRAPH_OUT)
+	|dot -T$(BR_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR_GRAPH_OUT)
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 339c3eb..b3a4c17 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -496,7 +496,7 @@ $(1)-graph-depends:
 			@$(INSTALL) -d $(O)/graphs
 			@cd "$(CONFIG_DIR)"; \
 			$(TOPDIR)/support/scripts/graph-depends $(1) \
-			|dot -T$(_BR2_GRAPH_OUT) -o $(O)/graphs/$$(@).$(_BR2_GRAPH_OUT)
+			|dot -T$(BR_GRAPH_OUT) -o $(O)/graphs/$$(@).$(BR_GRAPH_OUT)
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
-- 
1.8.3.2
