From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 28 Apr 2020 03:31:39 -0600
Subject: [Buildroot] [PATCH 1/1] package/apcupsd: pass additional libusb
 libs for static build
Message-ID: <20200428093139.115983-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default apcupsd only passes libs for libusb-compat, this is not
sufficient for static builds which also require libusb libs.

Fixes:
http://autobuild.buildroot.net/results/747/7472fec82983f5b9c2f92578b2b20b746a8d20ae/build-end.log

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/apcupsd/apcupsd.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
index ff9cc9242f..a0fda19cf3 100644
--- a/package/apcupsd/apcupsd.mk
+++ b/package/apcupsd/apcupsd.mk
@@ -10,8 +10,11 @@ APCUPSD_LICENSE = GPL-2.0
 APCUPSD_LICENSE_FILES = COPYING
 APCUPSD_CONF_OPTS = --disable-test
 
-ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
+ifneq ($(BR2_PACKAGE_APCUPSD_MODBUS_USB)$(BR2_PACKAGE_APCUPSD_USB),)
 APCUPSD_CONF_ENV = ac_cv_path_usbcfg=$(STAGING_DIR)/usr/bin/libusb-config
+ifeq ($(BR2_STATIC_LIBS),y)
+APCUPSD_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libusb`"
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_APCUPSD_APCSMART),y)
-- 
2.20.1
