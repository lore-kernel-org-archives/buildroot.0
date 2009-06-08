From: Daniel Mack <daniel@caiaq.de>
Date: Mon,  8 Jun 2009 16:57:59 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: allow multiple values for
	TARGET_SKELETON
Message-ID: <1244473080-8195-1-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For platforms that need to provide a target fs skeleton for some files,
multiple entries for the the variable TARGET_SKELETON are handy.

A platform code can then contain the target/generic/ skeleton and only
provide path to the delta files.

The only thing to take care for is that none of those file names
contains spaces, but that's condsidered evil anyway and should not
happen.

Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 Makefile |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 76dd2cd..2edde72 100644
--- a/Makefile
+++ b/Makefile
@@ -329,9 +329,9 @@ endif
 $(PROJECT_BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
 	if ! [ -d "$(TARGET_DIR)/bin" ]; then \
-		if [ -d "$(TARGET_SKELETON)" ]; then \
-			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
-		fi; \
+		for dir in $(TARGET_SKELETON); do \
+			test -d $$dir && cp -fa $$dir/* $(TARGET_DIR)/; \
+		done; \
 		touch $(STAGING_DIR)/.fakeroot.00000; \
 	fi
 	-find $(TARGET_DIR) -type d -name CVS -o -name .svn -print0 | xargs -0 rm -rf
-- 
1.6.3.1
