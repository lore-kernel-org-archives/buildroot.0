From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:22:39 +0100
Subject: [Buildroot] [git commit] libv4l: fix udev build with pkgconf 1.5.3
Message-ID: <20181213201842.B11A58CA71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06e934268db02164ad1504e774c2775a512e7285
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

libv4l uses the udevdir variable from libudev.pc to decide where
to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the udevdir to use
explicitly instead of relying on libudev.pc.

Fixes:
 - http://autobuild.buildroot.org/results/597cd814225c2af9b896a1f25f98cdff33fd810a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libv4l/libv4l.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 6b5b7bd2ee..6df69c19f0 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -45,6 +45,7 @@ LIBV4L_DEPENDENCIES += libgl
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+LIBV4L_CONF_OPTS += --with-udevdir=/usr/lib/udev
 LIBV4L_DEPENDENCIES += udev
 endif
 
