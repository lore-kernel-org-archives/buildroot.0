From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 26 Mar 2016 16:35:07 -0300
Subject: [Buildroot] [PATCH 1/5] cairo: enable opengl for cairo-gl
In-Reply-To: <1459020911-20593-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459020911-20593-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459020911-20593-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If OpenGL is enabled then enable cairo-gl.
However if GLESv2 is also present we must choose which implementation to
use.
Since normally OpenGL is more featured, has more dependencies and
wouldn't be present "by accident" it seems like the logical choice to
win over it.

This feature is useful for webkitgtk's accelerated 2d canvas.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cairo/cairo.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index ab0c2e8..b798995 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -79,11 +79,17 @@ else
 CAIRO_CONF_OPTS += --disable-gobject
 endif
 
+# Can use GL or GLESv2 but not both
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+CAIRO_CONF_OPTS += --enable-gl --disable-glesv2
+CAIRO_DEPENDENCIES += libgl
+else
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
-CAIRO_CONF_OPTS += --enable-glesv2
+CAIRO_CONF_OPTS += --disable-gl --enable-glesv2
 CAIRO_DEPENDENCIES += libgles
 else
-CAIRO_CONF_OPTS += --disable-glesv2
+CAIRO_CONF_OPTS += --disable-gl --disable-glesv2
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
-- 
2.7.3
