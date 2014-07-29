From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 28 Jul 2014 21:35:34 -0400
Subject: [Buildroot] [PATCH 1/1] flex: delete broken flex++ symlink from
	target
Message-ID: <1406597734-1902-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When flex is built for the target without installing the
flex binary, a flex++ symlink installed by flex's Makefile
points to the missing flex executable.  This mod adds
a post target install hook to remove the broken symlink.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/flex/flex.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 17f651b..cd92dd7 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -29,6 +29,12 @@ define FLEX_DISABLE_PROGRAM
 endef
 FLEX_POST_PATCH_HOOKS += FLEX_DISABLE_PROGRAM
 
+# flex++ symlink is broken when flex binary is not installed
+define FLEX_REMOVE_BROKEN_SYMLINK
+	rm -f $(TARGET_DIR)/usr/bin/flex++
+endef
+FLEX_POST_INSTALL_TARGET_HOOKS += FLEX_REMOVE_BROKEN_SYMLINK
+
 endif
 
 $(eval $(autotools-package))
-- 
1.7.9.5
