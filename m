From: Pierre CROKAERT <pct@crookies.net>
Date: Sat, 20 Jan 2018 11:46:19 +0100
Subject: [Buildroot] [PATCH 1/1] Fix gdk-pixbuf broken by host package moved
 to /lib instead of /usr/lib Regression occured following commit
 19ba17ee3ba946ac865849df89d7c2988ea5aca9: "Globally replace
 $(HOST_DIR)/usr/lib with $(HOST_DIR)/lib" The host package loader.cache now
 references shared objects in /lib but target files are still in /usr/lib so
 sed has to be fixed accordingly.
Message-ID: <1516445179-11479-1-git-send-email-pct@crookies.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre CROKAERT <pct@crookies.net>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index e36761c..33de2e3 100644
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
-- 
2.7.4
