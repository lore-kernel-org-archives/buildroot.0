From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Mar 2013 08:33:18 +0100
Subject: [Buildroot] [git commit] Makefile: simplify target skeleton copying
Message-ID: <20130326074214.D6DFF9B2CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13c07c79a401a8821b3224bc00c60c097f011add
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We already use the .root stamp file to remember if we have copied the
skeleton, so we can remove the /bin check.

Likewise, we should always have a TARGET_SKELETON (or explicitly error
out otherwise), so remove that check as well.

Finally, now that we're using rsync to do the copy, we might as well
use its exclude support instead of cleaning up unwanted files afterwards.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 62311ed..c95bb1e 100644
--- a/Makefile
+++ b/Makefile
@@ -429,14 +429,9 @@ endif
 
 $(BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
-	if ! [ -d "$(TARGET_DIR)/bin" ]; then \
-		if [ -d "$(TARGET_SKELETON)" ]; then \
-			rsync -au $(TARGET_SKELETON)/ $(TARGET_DIR)/; \
-		fi; \
-	fi
+	rsync -au --exclude=.empty --exclude=CVS --exclude=.svn --exclude='*~' \
+		$(TARGET_SKELETON)/ $(TARGET_DIR)/
 	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
-	-find $(TARGET_DIR) -type d -name CVS -print0 -o -name .svn -print0 | xargs -0 rm -rf
-	-find $(TARGET_DIR) -type f \( -name .empty -o -name '*~' \) -print0 | xargs -0 rm -rf
 	touch $@
 
 $(TARGET_DIR): $(BUILD_DIR)/.root
