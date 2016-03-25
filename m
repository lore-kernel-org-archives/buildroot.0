From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Mar 2016 20:57:53 +0100
Subject: [Buildroot] [git commit] gdk-pixbuf: don't update cache for
	static-only
Message-ID: <20160325200621.EEF23803C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e93f02beddb4dc2187316618809a97b1a151eaf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There won't be any need/files to scan for. Fixes:
http://autobuild.buildroot.net/results/5a7/5a7c158c8c2e49d5ca3b11ef3190cf0edd812ec5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
