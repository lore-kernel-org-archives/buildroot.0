From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2016 17:02:37 +0100
Subject: [Buildroot] [PATCH 2/6 v2] package/libgtk3: break a circular
	dependency
In-Reply-To: <cover.1453651102.git.yann.morin.1998@free.fr>
References: <cover.1453651102.git.yann.morin.1998@free.fr>
Message-ID: <230c0632cd310b88fab208d1010c5ee7deef57aa.1453651102.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently have a circular dependency chain:

    cups -> avahi -> libgtk3 -> cups

The cups -> avahi dependency makes sense, as cups would be able to use
Bonjour and mDNS to find printers, so we want to keep that dependency.

The avahi -> libgtk3 chain also makes some sense, to provide a GUI
frontend for avahi.

Since the libgtk3 -> cups does not look that it would be tremendously
useful, that's the one we drop in this patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libgtk3/libgtk3.mk | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index d268b56..26301be 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -22,7 +22,8 @@ LIBGTK3_CONF_OPTS = \
 	--disable-glibtest \
 	--enable-explicit-deps=no \
 	--enable-gtk2-dependency \
-	--disable-introspection
+	--disable-introspection \
+	--disable-cups
 
 LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk libglib2 cairo pango gdk-pixbuf
 
@@ -96,14 +97,6 @@ else
 LIBGTK3_CONF_OPTS += --disable-xkb
 endif
 
-ifeq ($(BR2_PACKAGE_CUPS),y)
-LIBGTK3_CONF_OPTS += --enable-cups
-LIBGTK3_CONF_ENV += ac_cv_path_CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config
-LIBGTK3_DEPENDENCIES += cups
-else
-LIBGTK3_CONF_OPTS += --disable-cups
-endif
-
 ifeq ($(BR2_PACKAGE_LIBGTK3_DEMO),y)
 LIBGTK3_DEPENDENCIES += hicolor-icon-theme shared-mime-info
 else
-- 
1.9.1
