From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 22 May 2015 07:29:51 +0300
Subject: [Buildroot] [PATCH 1/2] gdk-pixbuf: fix static build with libtiff
Message-ID: <aaa8912d0c6e0b54281fbc749d45982210ec6f18.1432268992.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/ce6/ce61d5aaf5dfdda92fcecb08a30b6093926d6f01/
http://autobuild.buildroot.net/results/76b/76b550da06fe547716f089e46d96a1406043268a/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 0977d92c0316..eb30215d7936 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -33,7 +33,9 @@ endif
 ifneq ($(BR2_PACKAGE_TIFF),y)
 GDK_PIXBUF_CONF_OPTS += --without-libtiff
 else
-GDK_PIXBUF_DEPENDENCIES += tiff
+GDK_PIXBUF_DEPENDENCIES += tiff host-pkgconf
+GDK_PIXBUF_CONF_ENV += \
+	LIBS='$(shell $(PKG_CONFIG_HOST_BINARY) --libs libtiff-4)'
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-- 
2.1.4
