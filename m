From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:52:19 +0200
Subject: [Buildroot] [git commit] graph-depends: fix when $(O) is a relative
	path
Message-ID: <20140629085247.97CA09D0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=790df63d353b4987a5f2aee5c67ee73378757b06
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The graph-depends commands cd into the CONFIG_DIR and run the script
from there. However, this means that when $(O) is a relative path, it
will no longer be correct.  Therefore, use $(BASE_DIR) instead of $(O).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 4fe370a..9c54992 100644
--- a/Makefile
+++ b/Makefile
@@ -681,8 +681,8 @@ graph-depends: graph-depends-requirements
 	@$(INSTALL) -d $(O)/graphs
 	@cd "$(CONFIG_DIR)"; \
 	$(TOPDIR)/support/scripts/graph-depends $(BR2_GRAPH_DEPS_OPTS) \
-	|tee $(O)/graphs/$(@).dot \
-	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR_GRAPH_OUT)
+	|tee $(BASE_DIR)/graphs/$(@).dot \
+	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(BASE_DIR)/graphs/$(@).$(BR_GRAPH_OUT)
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
