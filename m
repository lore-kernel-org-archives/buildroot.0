From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 21:35:44 +0100
Subject: [Buildroot] [git commit] cairo: enable opengl for cairo-gl
Message-ID: <20160326203554.82DA47FFD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99b115e081167013d51cc0e5b415a1c66175128a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If OpenGL is enabled then enable cairo-gl.
However if GLESv2 is also present we must choose which implementation to
use.
Since normally OpenGL is more featured, has more dependencies and
wouldn't be present "by accident" it seems like the logical choice to
win over it.

This feature is useful for webkitgtk's accelerated 2d canvas.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
