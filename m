From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  7 Jan 2014 19:27:53 +0100
Subject: [Buildroot] [PATCH] Makefile: support running graph-depends from
	out-of-tree
Message-ID: <1389119273-18621-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile               | 3 ++-
 package/pkg-generic.mk | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 4320e7b..dd21133 100644
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
index b519d69..279303e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -470,7 +470,8 @@ $(1)-show-depends:
 
 $(1)-graph-depends:
 			@$(INSTALL) -d $(O)/graphs
-			@./support/scripts/graph-depends $(1) \
+			@cd "$(CONFIG_DIR))"; \
+			$(TOPDIR)/support/scripts/graph-depends $(1) \
 			|dot -T$(BR2_GRAPH_OUT) -o $(O)/graphs/$$(@).$(BR2_GRAPH_OUT)
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
-- 
1.8.1.2
