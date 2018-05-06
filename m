From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 May 2018 11:42:29 +0200
Subject: [Buildroot] [PATCH 1/1] libnice: add gstreamer support
Message-ID: <20180506094229.25363-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnice/libnice.mk | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index e023728f44..49c29f9a60 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -10,8 +10,19 @@ LIBNICE_LICENSE = MPL-1.1 or LGPL-2.1
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
 LIBNICE_DEPENDENCIES = gnutls libglib2 host-pkgconf
 LIBNICE_INSTALL_STAGING = YES
-LIBNICE_CONF_OPTS = \
-	--without-gstreamer \
-	--without-gstreamer-0.10
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
+LIBNICE_CONF_OPTS += --with-gstreamer-0.10
+LIBNICE_DEPENDENCIES += gst-plugins-base
+else
+LIBNICE_CONF_OPTS += --without-gstreamer-0.10
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
+LIBNICE_CONF_OPTS += --with-gstreamer
+LIBNICE_DEPENDENCIES += gst1-plugins-base
+else
+LIBNICE_CONF_OPTS += --without-gstreamer
+endif
 
 $(eval $(autotools-package))
-- 
2.14.1
