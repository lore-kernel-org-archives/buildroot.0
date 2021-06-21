From: Herve Codina <herve.codina@bootlin.com>
Date: Mon, 21 Jun 2021 16:11:29 +0200
Subject: [Buildroot] [PATCH 14/15] Makefile: Breaks hardlinks in global
 {TARGET, HOST}_DIR on per-package build
In-Reply-To: <20210621141130.48654-1-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
Message-ID: <20210621141130.48654-15-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this patch, a make <pkg>_rebuild detects overwrites. Indeed, in
target_finalize steps some modifications are done on installed files (ie
strip or TARGET_FINALIZE_HOOKS for instance).

In order to avoid these modifications seen from per-package {TARGET,HOST}_DIR
and so been analyzed as some overwrites, global {TARGET,HOST}_DIR is built
using a full copy of the involved per-package files instead of hardlinks.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 50bc6b4503..fe6e3f95af 100644
--- a/Makefile
+++ b/Makefile
@@ -749,7 +749,7 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 define per-package-rsync-delta
 	mkdir -p $(3)
 	$(foreach pkg,$(1),\
-		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(strip $(2))/ \
+		rsync -a \
 		--filter='merge $($(call UPPERCASE,$(pkg))_DIR)/$(strip $(4))' \
 		$(PER_PACKAGE_DIR)/$(pkg)/$(strip $(2))/ \
 		$(3)$(sep))
-- 
2.31.1
