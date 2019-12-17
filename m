From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 17 Dec 2019 20:31:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/openocd: selects jimtcl
Message-ID: <20191217193118.581852-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Selects jimtcl instead of using the bundled one

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openocd/Config.in  |  1 +
 package/openocd/openocd.mk | 10 +++-------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index abba07e889..448872061b 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPENOCD
 	bool "openocd"
+	select BR2_PACKAGE_JIMTCL
 	help
 	  OpenOCD - Open On-Chip Debugger
 
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index d35ed77cd1..29e4f4b31f 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -11,18 +11,13 @@ OPENOCD_LICENSE = GPL-2.0+
 OPENOCD_LICENSE_FILES = COPYING
 # 0002-configure-enable-build-on-uclinux.patch patches configure.ac
 OPENOCD_AUTORECONF = YES
-
-# The bundled jimtcl really wants to find a existing $CXX, so feed it
-# false when we do not have one.
-OPENOCD_CONF_ENV = \
-	$(if $(BR2_INSTALL_LIBSTDCPP),,CXX=false) \
-	CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 
 OPENOCD_CONF_OPTS = \
 	--oldincludedir=$(STAGING_DIR)/usr/include \
 	--includedir=$(STAGING_DIR)/usr/include \
 	--disable-doxygen-html \
-	--with-jim-shared=no \
+	--disable-internal-jimtcl \
 	--disable-shared \
 	--enable-dummy \
 	--disable-werror
@@ -32,6 +27,7 @@ OPENOCD_CONF_OPTS = \
 
 OPENOCD_DEPENDENCIES = \
 	host-pkgconf \
+	jimtcl \
 	$(if $(BR2_PACKAGE_LIBFTDI1),libftdi1) \
 	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
 	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
-- 
2.24.0
