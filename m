From: Stany MARCEL <stanypub@gmail.com>
Date: Tue,  1 Nov 2011 01:53:38 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: Correct test for external tools
	symlink creation
Message-ID: <1320108819-2344-1-git-send-email-stanypub@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the external tools chain is installed in a path that match one of
the first case test, all symlink are created to the external
wrapper. The proposed solution is to test only the base name not the
full path.

Signed-off-by: Stany MARCEL <stanypub@gmail.com>
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
-- 
1.7.1
