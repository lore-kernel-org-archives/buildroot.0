From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Feb 2017 16:44:48 -0300
Subject: [Buildroot] [PATCH next] gdk-pixbuf: copy loaders.cache later on
Message-ID: <20170223194448.3785-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trying to copy loaders.cache from host-gdk-pixbuf to the gdk-pixbuf
build directory in the post-patch hook is too early when using TLP (it
breaks horribly) since host-gdk-pixbuf isn't built yet during the
massive unpack/patch cycle.
Switch it to the pre-build hook instead which ensures that gdk-pixbuf
dependencies were already built.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index e4d3658..0f4eeb1 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -80,7 +80,7 @@ define GDK_PIXBUF_COPY_LOADERS_CACHE
 	cp -f $(HOST_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache \
 		$(@D)/gdk-pixbuf
 endef
-GDK_PIXBUF_POST_PATCH_HOOKS += GDK_PIXBUF_COPY_LOADERS_CACHE
+GDK_PIXBUF_PRE_BUILD_HOOKS += GDK_PIXBUF_COPY_LOADERS_CACHE
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.10.2
