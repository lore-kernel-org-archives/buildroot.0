From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2016 17:02:36 +0100
Subject: [Buildroot] [PATCH 1/6 v2] package/libgtk2: break a circular
	dependency
In-Reply-To: <cover.1453651102.git.yann.morin.1998@free.fr>
References: <cover.1453651102.git.yann.morin.1998@free.fr>
Message-ID: <b493e6d4ca04b6171c2c7613f9abfdd6c0129861.1453651102.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently have a circular dependency chain:

    avahi -> libglade -> libgtk2 -> cups -> avahi

The cups -> avahi dependency makes sense, as cups would be able to use
Bonjour and mDNS to find printers, so we want to keep that dependency.

The avahi -> libglade -> libgtk2 chain also makes some sense, to provide
a GUI frontend for avahi.

Since the libgtk2 -> cups does not look that it would be tremendously
useful, that's the one we drop in this patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libgtk2/libgtk2.mk | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 17cdfcb..d6ffaec 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -28,7 +28,9 @@ LIBGTK2_CONF_OPTS += \
 	--with-x \
 	--x-includes=$(STAGING_DIR)/usr/include/X11 \
 	--x-libraries=$(STAGING_DIR)/usr/lib \
-	--with-gdktarget=x11
+	--with-gdktarget=x11 \
+	--disable-cups
+
 LIBGTK2_DEPENDENCIES += \
 	fontconfig xlib_libX11 xlib_libXext xlib_libXrender
 
@@ -84,12 +86,6 @@ else
 LIBGTK2_CONF_OPTS += --without-libtiff
 endif
 
-ifeq ($(BR2_PACKAGE_CUPS),y)
-LIBGTK2_DEPENDENCIES += cups
-else
-LIBGTK2_CONF_OPTS += --disable-cups
-endif
-
 ifeq ($(BR2_PACKAGE_LIBGTK2_DEMO),)
 define LIBGTK2_POST_INSTALL_TWEAKS
 	rm -rf $(TARGET_DIR)/usr/share/gtk-2.0/demo $(TARGET_DIR)/usr/bin/gtk-demo
-- 
1.9.1
