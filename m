From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Nov 2011 11:46:07 +0100
Subject: [Buildroot] [git commit] toolchain: Correct test for external tools
	symlink creation
Message-ID: <20111102114938.B6FBE8F415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d64c4ed3f787802d2b3953a5db787984d9a6626e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the external tools chain is installed in a path that match one of
the first case test, all symlink are created to the external
wrapper. The proposed solution is to test only the base name not the
full path.

Signed-off-by: Stany MARCEL <stanypub@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/ext-tool.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 8287916..572917f 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -318,9 +318,9 @@ $(STAMP_DIR)/ext-toolchain-installed: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 $(HOST_DIR)/usr/bin/ext-toolchain-wrapper: $(STAMP_DIR)/ext-toolchain-installed
 	mkdir -p $(HOST_DIR)/usr/bin; cd $(HOST_DIR)/usr/bin; \
 	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
-		case "$$i" in \
+		base=$${i##*/}; \
+		case "$$base" in \
 		*cc|*cc-*|*++|*++-*|*cpp) \
-			base=$${i##*/}; \
 			ln -sf $(@F) $$base; \
 			;; \
 		*) \
