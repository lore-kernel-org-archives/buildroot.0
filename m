From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:21:39 +0100
Subject: [Buildroot] [git commit] acsccid: fix build with pkgconf 1.5.3
Message-ID: <20181213201743.3EE9E8B755@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0aae93f5c91f8f2e420c9b080124dfc11cf9605
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
