From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Nov 2012 14:11:31 +0100
Subject: [Buildroot] [PATCH] libpcap: fix static build
Message-ID: <1353503491-4732-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/libpcap/libpcap.mk |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 7a1d32f..468b064 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -9,12 +9,8 @@ LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3c
 LIBPCAP_LICENSE_FILES = LICENSE
 LIBPCAP_INSTALL_STAGING = YES
+LIBPCAP_AUTORECONF = YES
 
-# doesn't have an install-strip
-LIBPCAP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" \
-	$(if $(BR2_PREFER_STATIC_LIB),install,install-shared)
-LIBPCAP_INSTALL_STAGING_OPT= DESTDIR="$(STAGING_DIR)" install \
-	$(if $(BR2_PREFER_STATIC_LIB),,install-shared)
 LIBPCAP_DEPENDENCIES = zlib \
 	$(if $(BR2_PACKAGE_LIBUSB),libusb)
 LIBPCAP_CONF_ENV = ac_cv_linux_vers=2 \
-- 
1.7.9.5
