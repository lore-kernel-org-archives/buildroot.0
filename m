From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 22:34:17 +0200
Subject: [Buildroot] [git commit] libgphoto2: new package
Message-ID: <20170413203533.924ED826F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4ffda0649b033c2e3f6af0df02b634c0269e07d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for libgphoto2 core library designed to allow access to
digital camera.

Signed-off-by: Kevin JOLY <kevin.joly@sensefly.com>
Cc: Romain Naour <romain.naour@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Romain Naour <romain.naour@gmail.com>
[Thomas:
 - Use downloads.sourceforge.net
 - Remove final dot at end of <pkg>_LICENSE variable
 - Minor tweaks in comments.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/libgphoto2/Config.in       | 14 ++++++++++
 package/libgphoto2/libgphoto2.hash |  6 +++++
 package/libgphoto2/libgphoto2.mk   | 55 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 79 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9550094..cdb24d0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -957,6 +957,9 @@ F:	package/cpuload/
 F:	package/bwm-ng/
 F:	package/ramsmp/
 
+N:	Kevin Joly <kevin.joly@sensefly.com>
+F:	package/libgphoto2/
+
 N:	Laurent Cans <laurent.cans@gmail.com>
 F:	package/aircrack-ng/
 
diff --git a/package/Config.in b/package/Config.in
index d0e7af1..6a0f6f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1086,6 +1086,7 @@ menu "Hardware handling"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
 	source "package/libftdi1/Config.in"
+	source "package/libgphoto2/Config.in"
 	source "package/libgpiod/Config.in"
 	source "package/libgudev/Config.in"
 	source "package/libhid/Config.in"
diff --git a/package/libgphoto2/Config.in b/package/libgphoto2/Config.in
new file mode 100644
index 0000000..fc60dd6
--- /dev/null
+++ b/package/libgphoto2/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBGPHOTO2
+	bool "libgphoto2"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBXML2
+	help
+	  libgphoto2 is the core library designed to allow access to
+	  digital camera by external programs.
+
+	  http://gphoto.org/proj/libgphoto2/
+
+comment "libgphoto needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgphoto2/libgphoto2.hash b/package/libgphoto2/libgphoto2.hash
new file mode 100644
index 0000000..1afe275
--- /dev/null
+++ b/package/libgphoto2/libgphoto2.hash
@@ -0,0 +1,6 @@
+# https://sourceforge.net/projects/gphoto/files/libgphoto/2.5.13/
+md5 73bf5b3d94c8c6f5fad9ea6b5e561843 libgphoto2-2.5.13.tar.bz2
+sha1 cef2d2f1930f8ada16a63aca15683188231a626a libgphoto2-2.5.13.tar.bz2
+
+# Locally calculated hash
+sha256 ceaacbdf187d1cd1aed5336991f46b0100f6960b6c8383f9aeab98f1f64780ef libgphoto2-2.5.13.tar.bz2
diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
new file mode 100644
index 0000000..f6dadf1
--- /dev/null
+++ b/package/libgphoto2/libgphoto2.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# libgphoto2
+#
+################################################################################
+
+LIBGPHOTO2_VERSION = 2.5.13
+LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.bz2
+# Project is maintained on github but github tarball doesn't have
+# configure, so use tarballs from SourceForge
+LIBGPHOTO2_SITE = https://downloads.sourceforge.net/project/gphoto/libgphoto/$(LIBGPHOTO2_VERSION)
+LIBGPHOTO2_LICENSE = LGPL-2.1+, GPL-2.0 (adc65), GPL-2.0+ (some camlibs), \
+	LGPL-2.0 (sipix), LGPL-3.0+ (pentax), BSD-3-Clause (ax203/tinyjpeg)
+# There is a single license file for the LGPL-2.1, no license files
+# for other licenses
+LIBGPHOTO2_LICENSE_FILES = COPYING
+LIBGPHOTO2_INSTALL_STAGING = YES
+
+LIBGPHOTO2_DEPENDENCIES = libxml2 libusb libtool host-pkgconf
+
+LIBGPHOTO2_CONF_ENV = udevscriptdir=/lib/udev
+LIBGPHOTO2_CONF_OPTS += --without-rpmbuild --disable-gp2ddb --disable-internal-docs
+
+ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
+# libusb-compat is not actually used, but it is detected, so add it
+# here to guarantee reproducible builds
+LIBGPHOTO2_DEPENDENCIES += libusb-compat
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEXIF),y)
+LIBGPHOTO2_DEPENDENCIES += libexif
+LIBGPHOTO2_CONF_OPTS += --with-libexif=auto
+else
+LIBGPHOTO2_CONF_OPTS += --with-libexif=no
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+LIBGPHOTO2_DEPENDENCIES += jpeg
+LIBGPHOTO2_CONF_OPTS += --with-jpeg
+else
+LIBGPHOTO2_CONF_OPTS += --without-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_GD),y)
+LIBGPHOTO2_DEPENDENCIES += gd
+LIBGPHOTO2_CONF_OPTS += --with-gdlib=auto
+else
+LIBGPHOTO2_CONF_OPTS += --with-gdlib=no
+endif
+
+ifeq ($(BR2_PACKAGE_LOCKDEV),y)
+LIBGPHOTO2_DEPENDENCIES += lockdev
+endif
+
+$(eval $(autotools-package))
