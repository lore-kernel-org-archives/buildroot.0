From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 12 Dec 2018 21:52:06 +0100
Subject: [Buildroot] [PATCH 1/1] bluez5_utils: fix build with pkgconf 1.5.3
Message-ID: <20181212205206.32255-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

bluez5_utils uses the sysconfdir variable from dbus-1.pc to decide where
to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the sysconfdir to use
explicitly instead of relying on dbus-1.pc.

Fixes:
 - http://autobuild.buildroot.org/results/498e7e368fbb3d69c2f311e3e5bc213e507b8023

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bluez5_utils/bluez5_utils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index f5b827cc30..15c9b670a7 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -20,7 +20,8 @@ BLUEZ5_UTILS_DEPENDENCIES = \
 BLUEZ5_UTILS_CONF_OPTS = \
 	--enable-tools \
 	--enable-library \
-	--disable-cups
+	--disable-cups \
+	--with-dbusconfdir=/etc
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-obex
-- 
2.14.1
