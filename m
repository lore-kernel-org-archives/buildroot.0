From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 31 Mar 2020 17:21:24 -0700
Subject: [Buildroot] [PATCH 02/12] package/pango: enable
 gobject-introspection support
In-Reply-To: <20200401002134.1779241-1-aduskett@gmail.com>
References: <20200401002134.1779241-1-aduskett@gmail.com>
Message-ID: <20200401002134.1779241-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt --enable-introspection for both host
and target.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/pango/pango.mk | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 48edd18b05..046501da30 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -12,8 +12,8 @@ PANGO_INSTALL_STAGING = YES
 PANGO_LICENSE = LGPL-2.0+
 PANGO_LICENSE_FILES = COPYING
 
-PANGO_CONF_OPTS = -Duse_fontconfig=true -Dintrospection=false
-HOST_PANGO_CONF_OPTS = -Duse_fontconfig=true -Dintrospection=false
+PANGO_CONF_OPTS = -Duse_fontconfig=true
+HOST_PANGO_CONF_OPTS = -Duse_fontconfig=true
 
 PANGO_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
@@ -33,6 +33,16 @@ HOST_PANGO_DEPENDENCIES = \
 	host-fontconfig \
 	host-freetype
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+PANGO_CONF_OPTS += -Dintrospection=true
+HOST_PANGO_CONF_OPTS += -Dintrospection=true
+PANGO_DEPENDENCIES += gobject-introspection
+HOST_PANGO_DEPENDENCIES += host-gobject-introspection
+else
+PANGO_CONF_OPTS += -Dintrospection=false
+HOST_PANGO_CONF_OPTS += -Dintrospection=false
+endif
+
 ifeq ($(BR2_PACKAGE_XORG7),y)
 PANGO_DEPENDENCIES += xlib_libX11
 endif
-- 
2.25.1
