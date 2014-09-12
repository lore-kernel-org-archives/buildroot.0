From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 12 Sep 2014 17:50:10 +0200
Subject: [Buildroot] [PATCH 11/12] directfb: allow SVG support
In-Reply-To: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
Message-ID: <1410537011-29662-12-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DirectFB SVG support rely on Cairo and Cairo depends on DirectFB.

Since Cairo DirectFB backend is marked as experimental, this patch choose to
disable this backend when DirectFB SVG support is enable.

In add, this patch may solve some tricky situations between DirectFB and Cairo
(see http://sysmic.org/~jezz/results/c2f11fc0) and improve build reproducibility.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/cairo/cairo.mk       | 5 ++++-
 package/directfb/Config.in   | 5 +++++
 package/directfb/directfb.mk | 7 +++++++
 3 files changed, 16 insertions(+), 1 deletion(-)

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
index e3c93a1..dc01228 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -125,6 +125,11 @@ config BR2_PACKAGE_DIRECTFB_PNG
 	default y
 	select BR2_PACKAGE_LIBPNG
 
+config BR2_PACKAGE_DIRECTFB_SVG
+	bool "enable SVG support"
+	default y
+	select BR2_PACKAGE_CAIRO
+
 config BR2_PACKAGE_DIRECTFB_DITHER_RGB16
 	bool "enable advanced dithering of RGB16 surfaces"
 	help
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 3ae7f3e..dd2ca99 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -116,6 +116,13 @@ else
 DIRECTFB_CONF_OPT += --disable-jpeg
 endif
 
+ifeq ($(BR2_PACKAGE_DIRECTFB_SVG),y)
+DIRECTFB_CONF_OPT += --enable-svg
+DIRECTFB_DEPENDENCIES += cairo
+else
+DIRECTFB_CONF_OPT += --disable-svg
+endif
+
 ifeq ($(BR2_PACKAGE_DIRECTFB_IMLIB2),y)
 DIRECTFB_CONF_OPT += --enable-imlib2
 DIRECTFB_DEPENDENCIES += imlib2
-- 
2.1.0
