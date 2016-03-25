From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Mar 2016 14:35:32 -0300
Subject: [Buildroot] [PATCH 1/3] gdk-pixbuf: don't update cache for
	static-only
Message-ID: <1458927334-3890-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There won't be any need/files to scan for. Fixes:
http://autobuild.buildroot.net/results/5a7/5a7c158c8c2e49d5ca3b11ef3190cf0edd812ec5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 02c4aa9..e77fd15 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -51,6 +51,7 @@ endif
 # here after building and installing to target.
 # And since the cache file will contain absolute target directory names
 # we need to sanitize (strip) them.
+ifeq ($(BR2_STATIC_LIBS),)
 define GDK_PIXBUF_UPDATE_CACHE
 	GDK_PIXBUF_MODULEDIR=$(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders \
 		$(HOST_DIR)/usr/bin/gdk-pixbuf-query-loaders \
@@ -59,6 +60,7 @@ define GDK_PIXBUF_UPDATE_CACHE
 		$(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
 endef
 GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS += GDK_PIXBUF_UPDATE_CACHE
+endif
 
 # Tests don't build correctly with uClibc
 define GDK_PIXBUF_DISABLE_TESTS
-- 
2.7.3
