From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 Dec 2018 16:54:34 +0100
Subject: [Buildroot] [PATCH v2,
 1/2] alsa-utils: fix udev build with pkgconf 1.5.3
Message-ID: <20181214155435.31884-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

alsa-utils uses the udevdir variable from udev.pc to decide where to
install things. Since DESTDIR is prepended to the install destination,
this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the udevrulesdir to
use explicitly instead of relying on udev.pc.

Fixes:
 - http://autobuild.buildroot.org/results/d8ad140ae52b4fe8e153de3835f3f17e92b58e53

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Baruch Siach):
 - remove udev build-time dependency

 package/alsa-utils/alsa-utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 0bf2b432bd..8b2d335be4 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -28,6 +28,10 @@ ALSA_UTILS_CONF_OPTS = \
 	--disable-rst2man \
 	--with-curses=$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncursesw,ncurses)
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+ALSA_UTILS_CONF_OPTS += --with-udev-rules-dir=/usr/lib/udev/rules.d
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSALOOP),y)
 ALSA_UTILS_CONF_OPTS += --enable-alsaloop
 else
-- 
2.14.1
