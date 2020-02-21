From: Francois Gervais <fgervais@distech-controls.com>
Date: Fri, 21 Feb 2020 09:40:23 -0500
Subject: [Buildroot] [PATCH 1/1] package/rcw: allow not having custom rcwi
 files
Message-ID: <20200221144023.25481-1-fgervais@distech-controls.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A project could quite possibly have a custom rcw file
that does not rely on any custom rcw include files (rcwi).

Allow the build to succeed if this is the case.

Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
---
 package/rcw/rcw.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
index 36d2da61b5..c1fb63b91b 100644
--- a/package/rcw/rcw.mk
+++ b/package/rcw/rcw.mk
@@ -25,7 +25,9 @@ endif
 
 define HOST_RCW_ADD_CUSTOM_RCW_FILES
 	mkdir -p $(@D)/custom_board/rcw
-	cp -f $(filter-out %.rcw,$(RCW_FILES)) $(@D)/custom_board
+	if [ -n "$(filter-out %.rcw,$(RCW_FILES))" ]; then \
+		cp -f $(filter-out %.rcw,$(RCW_FILES)) $(@D)/custom_board; \
+	fi
 	cp -f $(filter %.rcw,$(RCW_FILES)) $(@D)/custom_board/rcw
 endef
 HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES
-- 
2.20.1
