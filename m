From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Nov 2012 10:58:46 -0800
Subject: [Buildroot] [git commit] libpcap: fix static build
Message-ID: <20121128185907.CEE2D97266@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de75da8b13e53f995811a48316882efd753d428d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libpcap package contained some interesting attempts to support a
static-only build, but it was not working:

 http://autobuild.buildroot.org/results/01038d3b970092d894d2bae80679247e65722785/build-end.log

In fact the configure.in of libpcap has provision to support
--enable-shared/--disable-shared, but the generated configure script
in the libpcap package has not been regenerated with the configure.in
changes.

So basically, enabling LIBPCAP_AUTORECONF=YES ensures that the
configure script gets generated, which brings us a working
--enable-shared / --disable-shared.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libpcap/libpcap.mk |   15 ++++++++++-----
 1 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 7a1d32f..d35c228 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -10,11 +10,16 @@ LIBPCAP_LICENSE = BSD-3c
 LIBPCAP_LICENSE_FILES = LICENSE
 LIBPCAP_INSTALL_STAGING = YES
 
-# doesn't have an install-strip
-LIBPCAP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" \
-	$(if $(BR2_PREFER_STATIC_LIB),install,install-shared)
-LIBPCAP_INSTALL_STAGING_OPT= DESTDIR="$(STAGING_DIR)" install \
-	$(if $(BR2_PREFER_STATIC_LIB),,install-shared)
+# The configure.in file contains the necessary code to handle
+# --enable-shared/--disable-shared properly, but the configure script
+# bundled with the libpcap tarball is not up-to-date with the
+# configure.in file. In order to get proper handling of
+# --enable-shared/--disable-shared, which is needed when doing a
+# static library build, we autoreconfigure this package. This can be
+# removed when bumping libpcap, after checking that the bundled
+# configure script correctly handles --enable-shared/--disable-shared.
+LIBPCAP_AUTORECONF = YES
+
 LIBPCAP_DEPENDENCIES = zlib \
 	$(if $(BR2_PACKAGE_LIBUSB),libusb)
 LIBPCAP_CONF_ENV = ac_cv_linux_vers=2 \
