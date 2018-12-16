From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 Dec 2018 11:29:09 +0100
Subject: [Buildroot] [PATCH 1/1] connman: fix systemd build wih pkgconf 1.5.3
Message-ID: <20181216102909.32124-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

connman uses the tmpfilesdir variable from systemd.pc to decide where to
install things. Since DESTDIR is prepended to the install destination,
this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the tmpfilesdir to use
explicitly instead of relying on systemd.pc.

Fixes:
 - http://autobuild.buildroot.org/results/6a13e6dfc58b2b3f8fbad6d6d6462370a75a8ad4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/connman/connman.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index b67d1c4b86..ce73c5acc1 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -13,6 +13,7 @@ CONNMAN_LICENSE = GPL-2.0
 CONNMAN_LICENSE_FILES = COPYING
 CONNMAN_CONF_OPTS += \
 	--with-dbusconfdir=/etc \
+	--with-tmpfilesdir=/usr/lib/tmpfiles.d \
 	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug) \
 	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet) \
 	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi) \
-- 
2.14.1
