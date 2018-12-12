From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 12 Dec 2018 20:52:56 +0100
Subject: [Buildroot] [PATCH 1/1] acsccid: fix build with pkgconf 1.5.3
Message-ID: <20181212195256.4217-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

acsccid uses the usbdropdir variable from libpcsclite.pc to decide where
to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the usbdropdir to use
explicitly instead of relying on libpcsclite.pc.

Fixes:
 - http://autobuild.buildroot.org/results/9dc76478d81ea2469900a4b4aab0e31fee9c4032

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/acsccid/acsccid.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
index 06a04185e2..a59a16d76f 100644
--- a/package/acsccid/acsccid.mk
+++ b/package/acsccid/acsccid.mk
@@ -11,5 +11,6 @@ ACSCCID_LICENSE = LGPL-2.1+
 ACSCCID_LICENSE_FILES = COPYING
 ACSCCID_INSTALL_STAGING = YES
 ACSCCID_DEPENDENCIES = pcsc-lite host-flex host-pkgconf libusb
+ACSCCID_CONF_OPTS = --enable-usbdropdir=/usr/lib/pcsc/drivers
 
 $(eval $(autotools-package))
-- 
2.14.1
