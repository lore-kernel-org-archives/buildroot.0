From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 18 Nov 2012 12:59:38 +0000
Subject: [Buildroot] [PATCH v3] libusb: disable on avr32
Message-ID: <1353243578-6980-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

For target architecture avr32, the gpsd package fails to build when
libusb is selected. The following autobuild failure illustrates the problem.

  http://autobuild.buildroot.net/results/aa3d4763a0e90c995bc8431cf345730ee22e65a1/build-end.log

The issue is that libusb requires timerfd_settime and timerfd_create, but
the underlying syscalls are not implemented on avr32.

This patch disables the libusb package for the avr32 target architecture.

This will also fix autobuild failures such as the following

  http://autobuild.buildroot.net/results/1a17810c2183e389244143dea55b0241c62c0bee/build-end.log

In this case, the pcsc-lite package fails to build on the avr32 architecture,
due to the dependency on libusb.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 v3: Improved dependency information for bluez support in the libedbus package
 v2: Handle reverse dependencies of libusb, as suggested by Peter Korsgaard

 package/ccid/Config.in                |    4 ++--
 package/efl/libedbus/Config.in        |    1 +
 package/libfreefare/Config.in         |    4 ++--
 package/libftdi/Config.in             |    4 ++--
 package/libhid/Config.in              |    3 +--
 package/libiqrf/Config.in             |    4 ++--
 package/libnfc-llcp/Config.in         |    5 ++++-
 package/libnfc/Config.in              |    4 ++--
 package/libusb/Config.in              |    3 ++-
 package/openocd/Config.in             |    4 ++--
 package/pcsc-lite/Config.in           |    1 +
 package/python-nfc/Config.in          |    4 ++++
 package/sconeserver/Config.in         |    2 ++
 package/usb_modeswitch/Config.in      |    4 ++--
 package/usb_modeswitch_data/Config.in |    4 ++++
 package/usbutils/Config.in            |    4 ++--
 16 files changed, 35 insertions(+), 20 deletions(-)

diff --git a/package/ccid/Config.in b/package/ccid/Config.in
index c9b77d1..7e4bd70 100644
--- a/package/ccid/Config.in
+++ b/package/ccid/Config.in
@@ -2,11 +2,11 @@ config BR2_PACKAGE_CCID
 	bool "ccid"
 	select BR2_PACKAGE_PCSC_LITE
 	select BR2_PACKAGE_LIBUSB
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on !BR2_avr32 && BR2_TOOLCHAIN_HAS_THREADS # libusb
 	help
 	  PC/SC driver for USB CCID smart card readers
 
 	  http://pcsclite.alioth.debian.org/ccid.html
 
 comment "ccid needs a toolchain with thread support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS && !BR2_avr32
diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
index 985939e..09b2fc3 100644
--- a/package/efl/libedbus/Config.in
+++ b/package/efl/libedbus/Config.in
@@ -15,6 +15,7 @@ if BR2_PACKAGE_LIBEDBUS
 
 config BR2_PACKAGE_LIBEDBUS_BLUEZ
 	bool "bluez support"
+	depends on !BR2_avr32 && BR2_USE_WCHAR # bluez-utils
 	select BR2_PACKAGE_BLUEZ_UTILS
 	help
 	  Bluetooth support.
diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
index 6877000..930b0e3 100644
--- a/package/libfreefare/Config.in
+++ b/package/libfreefare/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBFREEFARE
 	bool "libfreefare"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on !BR2_avr32 && BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBNFC
 	help
@@ -9,4 +9,4 @@ config BR2_PACKAGE_LIBFREEFARE
 	  http://code.google.com/p/nfc-tools/wiki/libfreefare
 
 comment "libfreefare needs a toolchain with thread support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS && !BR2_avr32
diff --git a/package/libftdi/Config.in b/package/libftdi/Config.in
index 48e9ceb..4a12af0 100644
--- a/package/libftdi/Config.in
+++ b/package/libftdi/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBFTDI
 	bool "libftdi"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on !BR2_avr32 && BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -19,4 +19,4 @@ config BR2_PACKAGE_LIBTFDI_CPP
 endif # BR2_PACKAGE_LIBFTDI
 
 comment "libftdi needs a toolchain with thread support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS && !BR2_avr32
diff --git a/package/libhid/Config.in b/package/libhid/Config.in
index bd1cfcb..f0bfc52 100644
--- a/package/libhid/Config.in
+++ b/package/libhid/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBHID
 	bool "libhid"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	depends on !BR2_avr32 # timerfd not in uClibc-0.9.31
+	depends on !BR2_avr32 && BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
diff --git a/package/libiqrf/Config.in b/package/libiqrf/Config.in
index 7222536..590913c 100644
--- a/package/libiqrf/Config.in
+++ b/package/libiqrf/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBIQRF
 	bool "libiqrf"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on !BR2_avr32 && BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  This library implement specific protocol
@@ -11,4 +11,4 @@ config BR2_PACKAGE_LIBIQRF
 	  https://github.com/nandra/libiqrf
 
 comment "libiqrf needs a toolchain with thread support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS && !BR2_avr32
diff --git a/package/libnfc-llcp/Config.in b/package/libnfc-llcp/Config.in
index f557926..efa2e31 100644
--- a/package/libnfc-llcp/Config.in
+++ b/package/libnfc-llcp/Config.in
@@ -1,9 +1,12 @@
 config BR2_PACKAGE_LIBNFC_LLCP
 	bool "libnfc-llcp"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on !BR2_avr32 && BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBNFC
 	help
 	  Library extending libnfc with support for Logical Link Control
 	  Protocol.
 
 	  http://code.google.com/p/nfc-tools/source/browse/trunk/libnfc-llcp/
+
+comment "libnfc-llcp needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS && !BR2_avr32
diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
index 159578f..8249294 100644
--- a/package/libnfc/Config.in
+++ b/package/libnfc/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBNFC
 	bool "libnfc"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on !BR2_avr32 && BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -14,4 +14,4 @@ config BR2_PACKAGE_LIBNFC_EXAMPLES
 	select BR2_PACKAGE_READLINE
 
 comment "libnfc needs a toolchain with thread support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS && !BR2_avr32
diff --git a/package/libusb/Config.in b/package/libusb/Config.in
index 2eed3fa..cbaeac6 100644
--- a/package/libusb/Config.in
+++ b/package/libusb/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBUSB
 	bool "libusb"
+	depends on !BR2_avr32 # timerfd not in uClibc-0.9.31
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Userspace library for accessing USB devices
@@ -7,4 +8,4 @@ config BR2_PACKAGE_LIBUSB
 	  http://libusb.sourceforge.net/
 
 comment "libusb needs a toolchain with thread support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS && !BR2_avr32
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index 4ea66a5..6ef50a7 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_OPENOCD
 	bool "openocd"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on !BR2_avr32 && BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -30,4 +30,4 @@ config BR2_PACKAGE_OPENOCD_VSLLINK
 endif # BR2_PACKAGE_OPENOCD
 
 comment "openocd needs a toolchain with thread support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS && !BR2_avr32
diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
index 621cc66..26aa33c 100644
--- a/package/pcsc-lite/Config.in
+++ b/package/pcsc-lite/Config.in
@@ -11,6 +11,7 @@ if BR2_PACKAGE_PCSC_LITE
 config BR2_PACKAGE_PCSC_LITE_FORCE_LIBUSB
 	bool "use libusb"
 	depends on !BR2_PACKAGE_UDEV
+	depends on !BR2_avr32 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Select Y if you want to support usb smart card readers.
diff --git a/package/python-nfc/Config.in b/package/python-nfc/Config.in
index c928ba1..9b5555c 100644
--- a/package/python-nfc/Config.in
+++ b/package/python-nfc/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_PYTHON_NFC
 	bool "python-nfc"
 	depends on BR2_PACKAGE_PYTHON
+	depends on !BR2_avr32 && BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  Python module for near field communication.
 
 	  https://launchpad.net/nfcpy
+
+comment "python-nfc needs a toolchain with thread support"
+	depends on BR2_PACKAGE_PYTHON && !BR2_TOOLCHAIN_HAS_THREADS && !BR2_avr32
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index a7e5c75..023219b 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -38,6 +38,8 @@ config BR2_PACKAGE_SCONESERVER_MYSQL
 
 config BR2_PACKAGE_SCONESERVER_BLUETOOTH
 	bool "bluetooth"
+	depends on !BR2_avr32 && BR2_USE_WCHAR && \
+		BR2_TOOLCHAIN_HAS_THREADS # bluez-utils
 	select BR2_PACKAGE_BLUEZ_UTILS
 	help
 	  Bluetooth module for Sconeserver
diff --git a/package/usb_modeswitch/Config.in b/package/usb_modeswitch/Config.in
index a27b3ee..83e7fd8 100644
--- a/package/usb_modeswitch/Config.in
+++ b/package/usb_modeswitch/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_USB_MODESWITCH
 	bool "usb_modeswitch"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on !BR2_avr32 && BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -10,4 +10,4 @@ config BR2_PACKAGE_USB_MODESWITCH
 	  http://www.draisberghof.de/usb_modeswitch/
 
 comment "usb_modeswitch needs a toolchain with thread support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS && !BR2_avr32
diff --git a/package/usb_modeswitch_data/Config.in b/package/usb_modeswitch_data/Config.in
index 8698bb6..a3aa19f 100644
--- a/package/usb_modeswitch_data/Config.in
+++ b/package/usb_modeswitch_data/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_USB_MODESWITCH_DATA
 	bool "usb_modeswitch_data"
+	depends on !BR2_avr32 && BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_USB_MODESWITCH
 	# tcl is a runtime dependency
 	select BR2_PACKAGE_TCL
@@ -10,3 +11,6 @@ config BR2_PACKAGE_USB_MODESWITCH_DATA
 	  function automatically
 
 	  http://www.draisberghof.de/usb_modeswitch/
+
+comment "usb_modeswitch_data needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS && !BR2_avr32
diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index fd9926c..a35d4db 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_USBUTILS
 	bool "usbutils"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on !BR2_avr32 && BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  USB enumeration utilities
@@ -18,4 +18,4 @@ config BR2_PACKAGE_USBUTILS_ZLIB
 	  to decompress the file every time it's run.
 
 comment "usbutils needs a toolchain with thread support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS && !BR2_avr32
-- 
1.7.10.4
