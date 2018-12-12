From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 12 Dec 2018 23:22:38 +0100
Subject: [Buildroot] [PATCH 1/1] clamav: add optional systemd dependency
Message-ID: <20181212222238.23908-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

clamav has an optional systemd dependency

Moreover, since the bump to 1.5.3, pkgconf prepends the sysroot to all
absolute paths found in the .pc file. This is correct when the paths
refer to something in STAGING_DIR (e.g. libdir, includedir), but not
when it refers to something used for the target.

clamav uses the systemdsystemunitdir variable from systemd.pc to decide
where to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the
systemdsystemunitdir to use explicitly instead of relying on systemd.pc.

Fixes:
 - http://autobuild.buildroot.org/results/fe526c60542527112e6441e453b4df5de49242d9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/clamav/clamav.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 50990abad6..25ae240545 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -85,4 +85,11 @@ else
 CLAMAV_CONF_OPTS += --without-pcre
 endif
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+CLAMAV_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
+CLAMAV_DEPENDENCIES += systemd
+else
+CLAMAV_CONF_OPTS += --with-systemdsystemunitdir=no
+endif
+
 $(eval $(autotools-package))
-- 
2.14.1
