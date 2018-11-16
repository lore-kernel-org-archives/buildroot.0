From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Nov 2018 23:28:50 +0100
Subject: [Buildroot] [git commit] package/openocd: add missing host-pkgconf
 dependency
Message-ID: <20181116222612.06A4F8381A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=915c136c5c9abeb683b59fad4a0e05a25c1a1cc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure.ac script uses PKG_CHECK_MODULES(), and we autoreconf
the package, so host-pkgconf should be listed in the dependencies.

This issue is seen either with per-package folders, or by doing a
clean build with just "make openocd":

>>> openocd 0.10.0 Configuring
>>> openocd 0.10.0 Autoreconfiguring
[...]
configure.ac:12: error: possibly undefined macro: AC_MSG_WARN
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:201: error: possibly undefined macro: AC_DEFINE
configure.ac:582: error: possibly undefined macro: AC_MSG_NOTICE

Even if the message seems unrelated, it's really the lack of pkg.m4
from host-pkgconf that causes the issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openocd/openocd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 548d8b81a0..ca13d99366 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -31,6 +31,7 @@ OPENOCD_CONF_OPTS = \
 # the dependencies they need.
 
 OPENOCD_DEPENDENCIES = \
+	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBFTDI1),libftdi1) \
 	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
 	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
