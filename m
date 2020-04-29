From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 23:13:10 +0200
Subject: [Buildroot] [git commit] package/apcupsd: pass additional libusb
 libs for static build
Message-ID: <20200429205843.2143190B3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3c9a41462a9a2a614978157ae4f2cbd26d66b21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default apcupsd only passes libs for libusb-compat, this is not
sufficient for static builds which also require libusb libs.

Fixes:
http://autobuild.buildroot.net/results/747/7472fec82983f5b9c2f92578b2b20b746a8d20ae/build-end.log

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apcupsd/apcupsd.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
index ff9cc9242f..410bce9aec 100644
--- a/package/apcupsd/apcupsd.mk
+++ b/package/apcupsd/apcupsd.mk
@@ -10,8 +10,12 @@ APCUPSD_LICENSE = GPL-2.0
 APCUPSD_LICENSE_FILES = COPYING
 APCUPSD_CONF_OPTS = --disable-test
 
-ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
-APCUPSD_CONF_ENV = ac_cv_path_usbcfg=$(STAGING_DIR)/usr/bin/libusb-config
+ifneq ($(BR2_PACKAGE_APCUPSD_MODBUS_USB)$(BR2_PACKAGE_APCUPSD_USB),)
+APCUPSD_CONF_ENV += ac_cv_path_usbcfg=$(STAGING_DIR)/usr/bin/libusb-config
+ifeq ($(BR2_STATIC_LIBS),y)
+APCUPSD_DEPENDENCIES += host-pkgconf
+APCUPSD_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libusb`"
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_APCUPSD_APCSMART),y)
