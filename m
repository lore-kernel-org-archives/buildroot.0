From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 12 Dec 2018 21:13:08 +0100
Subject: [Buildroot] [PATCH 1/1] iwd: fix dbus build with pkgconf 1.5.3
Message-ID: <20181212201308.18393-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

iwd uses the datadir variable from dbus-1.pc to decide where to install
things. Since DESTDIR is prepended to the install destination, this will
end up in the wrong location.

Until a better solution is found in pkgconf, pass the usbdropdir to use
explicitly instead of relying on dbus-1.pc.

Fixes:
 - http://autobuild.buildroot.org/results/2b9e28264248f073cc9973bd4c7a89363ec9c0c3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/iwd/iwd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 2ff8f88cf8..1cfc05be41 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -22,7 +22,7 @@ endef
 IWD_POST_PATCH_HOOKS += IWD_MKDIR_BUILD_AUX
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-IWD_CONF_OPTS += --enable-dbus-policy
+IWD_CONF_OPTS += --enable-dbus-policy --with-dbus-datadir=/usr/share
 IWD_DEPENDENCIES += dbus
 else
 IWD_CONF_OPTS += --disable-dbus-policy
-- 
2.14.1
