From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 12:00:13 +0100
Subject: [Buildroot] [git commit] package/openocd: allow CMSIS-DAP support
Message-ID: <20190206105902.4A68581333@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5097295a4d3a176012a05eaa2824d1982865bfa8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit aa441aa84c38ad5319c4ff7fb27c84530e19c204 ("openocd: bump to
version 0.8.0"), some logic in openocd.mk was added to enable
CMSIS-DAP when BR2_PACKAGE_OPENOCD_CMSIS_DAP is enabled, but this
option was not created, because hidapi was not packaged in
Buildroot. This package now exists, so we can create
BR2_PACKAGE_OPENOCD_CMSIS_DAP and really make it possible to build
CMSIS DAP support.

Signed-off-by: Matt Wood <mattwood2000@gmail.com>
[Thomas:
 - rework commit log
 - add missing "depends on" in Config.in]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openocd/Config.in  | 11 +++++++++++
 package/openocd/openocd.mk |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index 6cba7a04c8..d8af37b7f9 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -9,6 +9,17 @@ if BR2_PACKAGE_OPENOCD
 
 comment "Adapters"
 
+config BR2_PACKAGE_OPENOCD_CMSIS_DAP
+	bool "CMSIS-DAP compliant debuggers"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_PACKAGE_HAS_UDEV # hidapi
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_HIDAPI
+	help
+          Enable support for CMSIS-DAP compliant debuggers (i.e
+          Atmel/Microchip EDBG, etc.)
+
 config BR2_PACKAGE_OPENOCD_FTDI
 	bool "MPSSE mode of FTDI based devices"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index ca13d99366..d35ed77cd1 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -35,7 +35,8 @@ OPENOCD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBFTDI1),libftdi1) \
 	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
 	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
-	$(if $(BR2_PACKAGE_LIBHID),libhid)
+	$(if $(BR2_PACKAGE_LIBHID),libhid) \
+	$(if $(BR2_PACKAGE_HIDAPI),hidapi)
 
 # Adapters
 OPENOCD_CONF_OPTS += \
