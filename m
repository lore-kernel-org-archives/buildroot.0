From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 12 Dec 2018 10:15:17 +0100
Subject: [Buildroot] [PATCH v2,1/1] ccid: fix build with pkgconf 1.5.3
Message-ID: <20181212091517.23861-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

ccid uses the usbdropdir variable from libpcsclite.pc to decide where to
install things. Since DESTDIR is prepended to the install destination,
this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the usbdropdir to use
explicitly instead of relying on libpcsclite.pc.

Fixes:
 - http://autobuild.buildroot.org/results/4d4c1ba7f5d00d1b927ac01ef9851468abfbdff2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Drop patch to remove DESTDIR and use --enable-usbdropdir

 package/ccid/ccid.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index c9b95a6234..73da9c4b8f 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -11,6 +11,7 @@ CCID_LICENSE = LGPL-2.1+
 CCID_LICENSE_FILES = COPYING
 CCID_INSTALL_STAGING = YES
 CCID_DEPENDENCIES = pcsc-lite host-pkgconf libusb
+CCID_CONF_OPTS = --enable-usbdropdir=/usr/lib/pcsc/drivers
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 define CCID_INSTALL_UDEV_RULES
-- 
2.14.1
