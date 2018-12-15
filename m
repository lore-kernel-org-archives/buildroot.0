From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 Dec 2018 18:46:52 +0100
Subject: [Buildroot] [PATCH 1/1] bluez_utils: fix systemd build wih pkgconf
 1.5.3
Message-ID: <20181215174652.1498-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

bluez_utils uses the systemdsystemunit variable from systemd.pc to
decide where to install things. Since DESTDIR is prepended to the
install destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the systemdunitdir to
use explicitly instead of relying on systemd.pc.

Fixes:
 - http://autobuild.buildroot.org/results/0771dc2c956ebdf87de1cc54465538912301833b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bluez_utils/bluez_utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index 256f012df9..e9f55f3aa1 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -58,4 +58,8 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 BLUEZ_UTILS_CONF_OPTS += --disable-pie
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+BLUEZ_UTILS_CONF_OPTS += --with-systemdunitdir=/usr/lib/systemd/system
+endif
+
 $(eval $(autotools-package))
-- 
2.14.1
