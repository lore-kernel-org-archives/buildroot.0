From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Feb 2018 08:38:14 +0100
Subject: [Buildroot] [git commit] gdk-pixbuf: unbreak gdk-pixbuf
 loaders.cache
Message-ID: <20180204074254.20D5088338@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f3246a1d6911c72a96e4f305e6d11178d1c2181
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix gdk-pixbuf broken by host package moved to /lib instead of /usr/lib
Regression occured following commit 19ba17ee3ba946ac86 (Globally replace
$(HOST_DIR)/usr/lib with $(HOST_DIR)/lib).

The host package loader.cache now refer to $(HOST_DIR)/lib, and the target
one should refer to /usr/lib.

Fix it by adjusting the sed invocation.

[Peter: extend commit message]
Signed-off-by: Pierre CROKAERT <pct@crookies.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index e36761cb8d..33de2e3d3a 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -64,7 +64,7 @@ define GDK_PIXBUF_UPDATE_CACHE
 	GDK_PIXBUF_MODULEDIR=$(HOST_DIR)/lib/gdk-pixbuf-2.0/2.10.0/loaders \
 		$(HOST_DIR)/bin/gdk-pixbuf-query-loaders \
 		> $(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
-	$(SED) "s,$(HOST_DIR),,g" \
+	$(SED) "s,$(HOST_DIR)/lib,/usr/lib,g" \
 		$(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
 endef
 GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS += GDK_PIXBUF_UPDATE_CACHE
