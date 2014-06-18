From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 19 Jun 2014 00:10:24 +0200
Subject: [Buildroot] [PATCH] graph-depends: fix when $(O) is a relative path
Message-ID: <1403129424-27129-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The graph-depends commands cd into the CONFIG_DIR and run the script
from there. However, this means that when $(O) is a relative path, it
will no longer be correct.  Therefore, use $(BASE_DIR) instead of $(O).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 5c82355..dd350b6 100644
--- a/Makefile
+++ b/Makefile
@@ -676,8 +676,8 @@ graph-depends:
 	@$(INSTALL) -d $(O)/graphs
 	@cd "$(CONFIG_DIR)"; \
 	$(TOPDIR)/support/scripts/graph-depends $(BR2_GRAPH_DEPS_OPTS) \
-	|tee $(O)/graphs/$(@).dot \
-	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR_GRAPH_OUT)
+	|tee $(BASE_DIR)/graphs/$(@).dot \
+	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(BASE_DIR)/graphs/$(@).$(BR_GRAPH_OUT)
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
-- 
2.0.0
