From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Sep 2014 09:22:27 +0200
Subject: [Buildroot] [git commit] directfb: allow SVG support
Message-ID: <20140913074255.B963E9D688@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=daf4820c8527c54dfbc44d4982ad04dff9650e04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DirectFB SVG support rely on Cairo and Cairo depends on DirectFB.

Since Cairo DirectFB backend is marked as experimental, this patch choose to
disable this backend when DirectFB SVG support is enable.

In add, this patch may solve some tricky situations between DirectFB and Cairo
(see http://sysmic.org/~jezz/results/c2f11fc0) and improve build reproducibility.

[Peter: propagate atomics dependency, needs libsvg-cairo, add cairo includes]
Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cairo/cairo.mk       |    5 ++++-
 package/directfb/Config.in   |    6 ++++++
 package/directfb/directfb.mk |    9 +++++++++
 3 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index a4c71b6..bcc0c26 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -48,7 +48,10 @@ CAIRO_CONF_OPT = \
 
 CAIRO_DEPENDENCIES = host-pkgconf fontconfig pixman
 
-ifeq ($(BR2_PACKAGE_DIRECTFB),y)
+# DirectFB svg support rely on Cairo and Cairo DirectFB support depends on
+# DirectFB. Break circular dependency by disabling DirectFB support in Cairo
+# (which is experimental)
+ifeq ($(BR2_PACKAGE_DIRECTFB)x$(BR2_PACKAGE_DIRECTFB_SVG),yx)
 	CAIRO_CONF_OPT += --enable-directfb
 	CAIRO_DEPENDENCIES += directfb
 else
diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index e3c93a1..d53f756 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -125,6 +125,12 @@ config BR2_PACKAGE_DIRECTFB_PNG
 	default y
 	select BR2_PACKAGE_LIBPNG
 
+config BR2_PACKAGE_DIRECTFB_SVG
+	bool "enable SVG support"
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	default y
+	select BR2_PACKAGE_LIBSVG_CAIRO
+
 config BR2_PACKAGE_DIRECTFB_DITHER_RGB16
 	bool "enable advanced dithering of RGB16 surfaces"
 	help
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 3ae7f3e..32144ec 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -116,6 +116,15 @@ else
 DIRECTFB_CONF_OPT += --disable-jpeg
 endif
 
+ifeq ($(BR2_PACKAGE_DIRECTFB_SVG),y)
+DIRECTFB_CONF_OPT += --enable-svg
+# needs some help to find cairo includes
+DIRECTFB_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -I$(STAGING_DIR)/usr/include/cairo"
+DIRECTFB_DEPENDENCIES += libsvg-cairo
+else
+DIRECTFB_CONF_OPT += --disable-svg
+endif
+
 ifeq ($(BR2_PACKAGE_DIRECTFB_IMLIB2),y)
 DIRECTFB_CONF_OPT += --enable-imlib2
 DIRECTFB_DEPENDENCIES += imlib2
