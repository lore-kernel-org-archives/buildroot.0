From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 31 Mar 2020 17:21:26 -0700
Subject: [Buildroot] [PATCH 04/12] package/libgtk3: enable
 gobject-introspection support
In-Reply-To: <20200401002134.1779241-1-aduskett@gmail.com>
References: <20200401002134.1779241-1-aduskett@gmail.com>
Message-ID: <20200401002134.1779241-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt --enable-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libgtk3/libgtk3.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 7df4426fa6..dbb975dbfd 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -20,7 +20,6 @@ LIBGTK3_CONF_ENV = \
 
 LIBGTK3_CONF_OPTS = \
 	--disable-glibtest \
-	--disable-introspection \
 	--enable-explicit-deps=no
 HOST_LIBGTK3_CONF_OPTS = --disable-introspection
 
@@ -43,6 +42,13 @@ else
 LIBGTK3_CONF_OPTS += --disable-x11-backend
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBGTK3_CONF_OPTS += --enable-introspection
+LIBGTK3_DEPENDENCIES += gobject-introspection
+else
+LIBGTK3_CONF_OPTS += --disable-introspection
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
 LIBGTK3_DEPENDENCIES += wayland wayland-protocols libxkbcommon
 LIBGTK3_CONF_OPTS += --enable-wayland-backend
-- 
2.25.1
