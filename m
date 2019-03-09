From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  9 Mar 2019 15:51:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: disable locale with
 uclibc
Message-ID: <20190309145125.19822-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/f7be30ffa28b7f367fb5343a7d69dc8bc7c3a170

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/imagemagick/imagemagick.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index b5d0d56284..81e49eb62c 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -40,6 +40,14 @@ IMAGEMAGICK_CONF_OPTS = \
 
 IMAGEMAGICK_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+# Like postgreSQL, imagemagick does not build against uClibc with
+# locales enabled, due to an uClibc bug, see
+# http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html
+# so overwrite automatic detection and disable locale support
+IMAGEMAGICK_CONF_ENV += ac_cv_func_newlocale=no
+endif
+
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 IMAGEMAGICK_CONF_OPTS += --with-fontconfig
 IMAGEMAGICK_DEPENDENCIES += fontconfig
-- 
2.20.1
