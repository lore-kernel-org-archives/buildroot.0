From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 22 Apr 2020 00:49:42 -0600
Subject: [Buildroot] [PATCH 1/1] package/apcupsd: always depend on threads
Message-ID: <20200422064942.77442-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/aa2ad7bdb37da611a4ec863ed2e986f34ea5228b/build-end.log

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/apcupsd/Config.in | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/apcupsd/Config.in b/package/apcupsd/Config.in
index 2849736a1a..e3fcc1e014 100644
--- a/package/apcupsd/Config.in
+++ b/package/apcupsd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_APCUPSD
 	bool "apcupsd"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	help
 	  A daemon for controlling APC UPSes.
@@ -26,16 +27,12 @@ config BR2_PACKAGE_APCUPSD_MODBUS
 
 config BR2_PACKAGE_APCUPSD_MODBUS_USB
 	bool "modbus usb"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	select BR2_PACKAGE_APCUPSD_MODBUS
 	help
 	  Compile MODBUS/USB driver code
 
-comment "modbus usb support needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
 config BR2_PACKAGE_APCUPSD_NET
 	bool "net"
 	help
@@ -53,17 +50,13 @@ config BR2_PACKAGE_APCUPSD_SNMP
 
 config BR2_PACKAGE_APCUPSD_USB
 	bool "usb"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  Compile USB UPS code
 
-comment "usb support needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
 endif
 
-comment "apcupsd needs a toolchain w/ C++"
+comment "apcupsd needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.20.1
