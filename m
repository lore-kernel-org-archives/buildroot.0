From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:22:41 +0100
Subject: [Buildroot] [git commit branch/next] gdk-pixbuf: copy loaders.cache
	later on
Message-ID: <20170223212245.1475B80406@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f4e1656bc1176442671104acde1e4033377636e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Trying to copy loaders.cache from host-gdk-pixbuf to the gdk-pixbuf
build directory in the post-patch hook is too early when using TLP (it
breaks horribly) since host-gdk-pixbuf isn't built yet during the
massive unpack/patch cycle.
Switch it to the pre-build hook instead which ensures that gdk-pixbuf
dependencies were already built.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
