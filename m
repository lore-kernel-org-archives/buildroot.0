From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Jun 2020 10:34:38 +0200
Subject: [Buildroot] [PATCH 2/2] package/pango: add gobject-introspection
 support
In-Reply-To: <20200606083438.1317261-1-fontaine.fabrice@gmail.com>
References: <20200606083438.1317261-1-fontaine.fabrice@gmail.com>
Message-ID: <20200606083438.1317261-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will fix the following build failure when enabling introspection on
libgtk2:

Couldn't find include 'Pango-1.0.gir' (search path: '['/home/fabrice/buildroot/output/host/bin/../mipsel-buildroot-linux-gnu/sysroot/usr/bin/../share/gir-1.0', '../gdk', '/home/fabrice/buildroot/output/host/share', '/usr/share/gnome/gir-1.0', '/usr/local/share/gir-1.0', '/usr/share/gir-1.0', '/home/fabrice/buildroot/output/host/share/gir-1.0', '/usr/share/gir-1.0']')

Fixes:
 - http://autobuild.buildroot.org/results//86c6f55e0bd1a0fe3b70c9e97193aaad94d72a7f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pango/pango.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 48edd18b05..1b12c09b22 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -12,7 +12,7 @@ PANGO_INSTALL_STAGING = YES
 PANGO_LICENSE = LGPL-2.0+
 PANGO_LICENSE_FILES = COPYING
 
-PANGO_CONF_OPTS = -Duse_fontconfig=true -Dintrospection=false
+PANGO_CONF_OPTS = -Duse_fontconfig=true
 HOST_PANGO_CONF_OPTS = -Duse_fontconfig=true -Dintrospection=false
 
 PANGO_DEPENDENCIES = \
@@ -33,6 +33,13 @@ HOST_PANGO_DEPENDENCIES = \
 	host-fontconfig \
 	host-freetype
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+PANGO_CONF_OPTS += -Dintrospection=true
+PANGO_DEPENDENCIES += gobject-introspection
+else
+PANGO_CONF_OPTS += -Dintrospection=false
+endif
+
 ifeq ($(BR2_PACKAGE_XORG7),y)
 PANGO_DEPENDENCIES += xlib_libX11
 endif
-- 
2.26.2
