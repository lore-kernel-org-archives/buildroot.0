From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 16:59:11 +0100
Subject: [Buildroot] [PATCH] graphs: rename user-facing variables
Message-ID: <1393171151-5638-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Rename the GRAPH_OUT and GRAPH_ALT variables according to our
recently-agreed naming scheme for user-facing variables:
  - GRAPH_OUT -> BR2_GRAPH_OUT
  - GRAPH_ALT -> BR2_GRAPH_ALT

The documentation part of the rename is handled by Thomas as
part of his manual fixing spree. ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile               | 12 ++++++------
 package/pkg-generic.mk |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 502991f..312babd 100644
--- a/Makefile
+++ b/Makefile
@@ -136,7 +136,7 @@ endif
 
 # Need that early, before we scan packages
 # Avoids doing the $(or...) everytime
-BR2_GRAPH_OUT := $(or $(GRAPH_OUT),pdf)
+_BR2_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
 
 BUILD_DIR:=$(BASE_DIR)/build
 STAMP_DIR:=$(BASE_DIR)/stamps
@@ -651,18 +651,18 @@ graph-build: $(O)/build/build-time.log
 	@install -d $(O)/graphs
 	$(foreach o,name build duration,./support/scripts/graph-build-time \
 					--type=histogram --order=$(o) --input=$(<) \
-					--output=$(O)/graphs/build.hist-$(o).$(BR2_GRAPH_OUT) \
-					$(if $(GRAPH_ALT),--alternate-colors)$(sep))
+					--output=$(O)/graphs/build.hist-$(o).$(_BR2_GRAPH_OUT) \
+					$(if $(BR2_GRAPH_ALT),--alternate-colors)$(sep))
 	$(foreach t,packages steps,./support/scripts/graph-build-time \
 				   --type=pie-$(t) --input=$(<) \
-				   --output=$(O)/graphs/build.pie-$(t).$(BR2_GRAPH_OUT) \
-				   $(if $(GRAPH_ALT),--alternate-colors)$(sep))
+				   --output=$(O)/graphs/build.pie-$(t).$(_BR2_GRAPH_OUT) \
+				   $(if $(BR2_GRAPH_ALT),--alternate-colors)$(sep))
 
 graph-depends:
 	@$(INSTALL) -d $(O)/graphs
 	@cd "$(CONFIG_DIR)"; \
 	$(TOPDIR)/support/scripts/graph-depends \
-	|dot -T$(BR2_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR2_GRAPH_OUT)
+	|dot -T$(_BR2_GRAPH_OUT) -o $(O)/graphs/$(@).$(_BR2_GRAPH_OUT)
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 555c3c2..5efd9ab 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -470,7 +470,7 @@ $(1)-graph-depends:
 			@$(INSTALL) -d $(O)/graphs
 			@cd "$(CONFIG_DIR)"; \
 			$(TOPDIR)/support/scripts/graph-depends $(1) \
-			|dot -T$(BR2_GRAPH_OUT) -o $(O)/graphs/$$(@).$(BR2_GRAPH_OUT)
+			|dot -T$(_BR2_GRAPH_OUT) -o $(O)/graphs/$$(@).$(_BR2_GRAPH_OUT)
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
-- 
1.8.3.2
