From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2020 22:01:59 +0100
Subject: [Buildroot] [git commit] package/libusb: needs gcc >= 4.9
Message-ID: <20201213204613.EEBA5815BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a26801c9fad1c7749200e22e9dfdeaeeb65f76e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libusb depends on gcc >= 4.9 because of _Thread_local since version
1.0.24 and
https://github.com/libusb/libusb/commit/9a1bc8cafb904c20a869c74ad6d657686a1c4bb1

Fixes:
 - http://autobuild.buildroot.org/results/7b7f4b31095f8a7eecb347b574391003a2def8bc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/acsccid/Config.in                  |  7 ++++---
 package/apcupsd/Config.in                  |  6 ++++--
 package/avrdude/Config.in                  |  6 ++++--
 package/cc-tool/Config.in                  |  7 +++++--
 package/ccid/Config.in                     |  6 ++++--
 package/dfu-util/Config.in                 |  6 ++++--
 package/dfu-util/Config.in.host            |  4 ++++
 package/dump1090/Config.in                 |  6 ++++--
 package/gr-osmosdr/Config.in               |  4 ++++
 package/hackrf/Config.in                   |  6 ++++--
 package/hidapi/Config.in                   |  7 +++++--
 package/hplip/Config.in                    |  5 +++--
 package/imx-usb-loader/Config.in           |  6 ++++--
 package/imx-usb-loader/Config.in.host      |  5 +++++
 package/kodi/Config.in                     |  4 ++++
 package/libftdi/Config.in                  |  6 ++++--
 package/libftdi1/Config.in                 |  6 ++++--
 package/libgphoto2/Config.in               |  6 ++++--
 package/libhid/Config.in                   |  6 ++++--
 package/libiio/Config.in                   |  6 ++++--
 package/libiqrf/Config.in                  |  6 ++++--
 package/libnfc/Config.in                   |  6 ++++--
 package/libphidget/Config.in               |  7 ++++---
 package/librtlsdr/Config.in                |  6 ++++--
 package/libusb/Config.in                   |  6 ++++--
 package/mfgtools/Config.in.host            |  5 +++++
 package/mxsldr/Config.in.host              |  5 +++++
 package/omxplayer/Config.in                |  6 ++++--
 package/openfpgaloader/Config.in           |  7 +++++--
 package/openjdk/Config.in                  |  7 +++++--
 package/openocd/Config.in                  | 28 +++++++++++++++++++++++-----
 package/openocd/Config.in.host             |  4 ++++
 package/pcsc-lite/Config.in                |  4 ++++
 package/phidgetwebservice/Config.in        |  7 ++++---
 package/python-libusb1/Config.in           |  6 ++++--
 package/python-nfc/Config.in               |  6 ++++--
 package/python-pylibftdi/Config.in         |  6 ++++--
 package/python-pyusb/Config.in             |  6 ++++--
 package/qemu/Config.in.host                |  4 ++++
 package/raspberrypi-usbboot/Config.in.host |  5 +++++
 package/sispmctl/Config.in                 |  6 ++++--
 package/sunxi-tools/Config.in              |  6 ++++--
 package/sunxi-tools/Config.in.host         |  5 +++++
 package/tegrarcm/Config.in.host            |  5 +++++
 package/uhd/Config.in                      | 12 ++++++++++++
 package/uhubctl/Config.in                  |  6 ++++--
 package/upower/Config.in                   |  6 ++++--
 package/usb_modeswitch/Config.in           |  6 ++++--
 package/usb_modeswitch_data/Config.in      |  6 ++++--
 package/usbredir/Config.in                 |  6 ++++--
 50 files changed, 236 insertions(+), 80 deletions(-)

diff --git a/package/acsccid/Config.in b/package/acsccid/Config.in
index 74dd6de295..a926be6e16 100644
--- a/package/acsccid/Config.in
+++ b/package/acsccid/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ACSCCID
 	bool "acsccid"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pcsc-lite, libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	depends on BR2_USE_MMU # pcsc-lite
 	depends on !BR2_STATIC_LIBS # pcsc-lite
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -14,7 +15,7 @@ config BR2_PACKAGE_ACSCCID
 
 	  http://acsccid.sourceforge.net/
 
-comment "acsccid needs a toolchain w/ threads, dynamic library"
+comment "acsccid needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/apcupsd/Config.in b/package/apcupsd/Config.in
index 4bc523eed4..f87f6a8b55 100644
--- a/package/apcupsd/Config.in
+++ b/package/apcupsd/Config.in
@@ -28,14 +28,16 @@ config BR2_PACKAGE_APCUPSD_MODBUS
 config BR2_PACKAGE_APCUPSD_MODBUS_USB
 	bool "modbus usb"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	select BR2_PACKAGE_APCUPSD_MODBUS
 	help
 	  Compile MODBUS/USB driver code
 
-comment "modbus usb support needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "modbus usb support needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_APCUPSD_NET
 	bool "net"
diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index a5680b0028..fba4253ad8 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_AVRDUDE
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
@@ -14,6 +15,7 @@ config BR2_PACKAGE_AVRDUDE
 
 	  https://github.com/kcuzner/avrdude
 
-comment "avrdude needs a uClibc or glibc toolchain w/ threads, wchar, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+comment "avrdude needs a uClibc or glibc toolchain w/ threads, wchar, dynamic library, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR \
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/cc-tool/Config.in b/package/cc-tool/Config.in
index 033128843d..2661592d7f 100644
--- a/package/cc-tool/Config.in
+++ b/package/cc-tool/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CC_TOOL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR # boost-filesystem
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
@@ -16,5 +17,7 @@ config BR2_PACKAGE_CC_TOOL
 
 	  https://github.com/dashesy/cc-tool/
 
-comment "cc-tool needs a toolchain w/ C++, threads, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+comment "cc-tool needs a toolchain w/ C++, threads, wchar, gcc >= 4.9 "
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/ccid/Config.in b/package/ccid/Config.in
index 599bcc042a..aae5a7181c 100644
--- a/package/ccid/Config.in
+++ b/package/ccid/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CCID
 	bool "ccid"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	depends on BR2_USE_MMU # pcsc-lite
 	depends on !BR2_STATIC_LIBS # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
@@ -10,6 +11,7 @@ config BR2_PACKAGE_CCID
 
 	  https://ccid.apdu.fr/
 
-comment "ccid needs a toolchain w/ threads, dynamic library"
+comment "ccid needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/dfu-util/Config.in b/package/dfu-util/Config.in
index 201c8a7cfd..71c1a1687c 100644
--- a/package/dfu-util/Config.in
+++ b/package/dfu-util/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DFU_UTIL
 	bool "dfu-util"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Dfu-util is the host side implementation of the DFU 1.0
@@ -9,5 +10,6 @@ config BR2_PACKAGE_DFU_UTIL
 
 	  http://dfu-util.sourceforge.net/
 
-comment "dfu-util needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "dfu-util needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/dfu-util/Config.in.host b/package/dfu-util/Config.in.host
index ea47a36c7b..1bf9275f97 100644
--- a/package/dfu-util/Config.in.host
+++ b/package/dfu-util/Config.in.host
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_HOST_DFU_UTIL
 	bool "host dfu-util"
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
 	help
 	  Dfu-util is the host side implementation of the DFU 1.0
 	  specification of the USB forum. DFU is intended to download
 	  and upload firmware to devices connected over USB.
 
 	  http://dfu-util.sourceforge.net/
+
+comment "host dfu-util needs a toolchain w/ host gcc >= 4.9"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/dump1090/Config.in b/package/dump1090/Config.in
index c796faef91..8f17929235 100644
--- a/package/dump1090/Config.in
+++ b/package/dump1090/Config.in
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_DUMP1090
 	bool "dump1090"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # librtlsdr
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # librtlsdr -> libusb
 	select BR2_PACKAGE_LIBRTLSDR
 	help
 	  Dump1090 is a simple Mode S decoder for RTLSDR devices
 
 	  https://github.com/MalcolmRobb/dump1090
 
-comment "dump1090 needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "dump1090 needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/gr-osmosdr/Config.in b/package/gr-osmosdr/Config.in
index a38082af98..04fa10be80 100644
--- a/package/gr-osmosdr/Config.in
+++ b/package/gr-osmosdr/Config.in
@@ -25,10 +25,14 @@ config BR2_PACKAGE_GR_OSMOSDR_IQFILE
 
 config BR2_PACKAGE_GR_OSMOSDR_RTLSDR
 	bool "Osmocom RTLSDR support"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # librtlsdr -> libusb
 	select BR2_PACKAGE_LIBRTLSDR
 	help
 	  Enable Osmocom RTLSDR support
 
+comment "Osmocom RTLSDR support needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_GR_OSMOSDR_RTLSDR_TCP
 	bool "RTLSDR TCP Client support"
 	help
diff --git a/package/hackrf/Config.in b/package/hackrf/Config.in
index b86790f2b0..05d01adc96 100644
--- a/package/hackrf/Config.in
+++ b/package/hackrf/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_HACKRF
 	bool "hackrf"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_FFTW
 	select BR2_PACKAGE_FFTW_SINGLE
 	select BR2_PACKAGE_LIBUSB
@@ -10,5 +11,6 @@ config BR2_PACKAGE_HACKRF
 
 	  https://github.com/mossmann/hackrf/tree/master/host
 
-comment "hackrf needs a toolchain w/ threads, dynamic library"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+comment "hackrf needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
index d7d8cd53d7..061c7883f7 100644
--- a/package/hidapi/Config.in
+++ b/package/hidapi/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_HIDAPI
 	bool "hidapi"
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBGUDEV
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -14,5 +15,7 @@ config BR2_PACKAGE_HIDAPI
 
 	  http://github.com/libusb/hidapi/
 
-comment "hidapi needs udev /dev management and a toolchain w/ NPTL threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_HAS_UDEV
+comment "hidapi needs udev /dev management and a toolchain w/ NPTL, threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_PACKAGE_HAS_UDEV || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/hplip/Config.in b/package/hplip/Config.in
index f4e0fe7530..bab29303e5 100644
--- a/package/hplip/Config.in
+++ b/package/hplip/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_HPLIP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_CUPS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	depends on !BR2_STATIC_LIBS # libdl
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_JPEG
@@ -17,7 +18,7 @@ config BR2_PACKAGE_HPLIP
 
 	  http://hplipopensource.com/
 
-comment "hplip needs a toolchain w/ C++, threads, dynamic library"
+comment "hplip needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.9"
 	depends on BR2_PACKAGE_CUPS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/imx-usb-loader/Config.in b/package/imx-usb-loader/Config.in
index 1cc0dd8c25..9a152e0918 100644
--- a/package/imx-usb-loader/Config.in
+++ b/package/imx-usb-loader/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IMX_USB_LOADER
 	bool "imx-usb-loader"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  This package contains tools to download and execute code
@@ -9,5 +10,6 @@ config BR2_PACKAGE_IMX_USB_LOADER
 
 	  https://github.com/boundarydevices/imx_usb_loader
 
-comment "imx-usb-loader needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "imx-usb-loader needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/imx-usb-loader/Config.in.host b/package/imx-usb-loader/Config.in.host
index 04bd4cc018..78c5edea3f 100644
--- a/package/imx-usb-loader/Config.in.host
+++ b/package/imx-usb-loader/Config.in.host
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_HOST_IMX_USB_LOADER
 	bool "host imx-usb-loader"
 	depends on BR2_arm || BR2_aarch64
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
 	help
 	  This package contains tools to download and execute code
 	  on Freescale i.MX5x/6x/7x/8x and Vybrid SoCs through the
 	  Serial Download Protocol.
 
 	  https://github.com/boundarydevices/imx_usb_loader
+
+comment "host imx-usb-loader needs a toolchain w/ host gcc >= 4.9"
+	depends on BR2_arm || BR2_aarch64
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 31ad8630d6..8453ba0e07 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -258,11 +258,15 @@ config BR2_PACKAGE_KODI_LIBUSB
 	# https://github.com/xbmc/xbmc/blob/Jarvis/configure.ac#L1554
 	# "if libudev is available, we don't need libusb"
 	depends on !BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  Enable libusb support.
 
+comment "usb support needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_KODI_LIBVA
 	bool "va"
 	depends on \
diff --git a/package/libftdi/Config.in b/package/libftdi/Config.in
index 23dae1be1f..fdeac28a64 100644
--- a/package/libftdi/Config.in
+++ b/package/libftdi/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBFTDI
 	bool "libftdi"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -23,5 +24,6 @@ comment "libftdi C++ bindings need a toolchain w/ wchar, C++"
 
 endif # BR2_PACKAGE_LIBFTDI
 
-comment "libftdi needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libftdi needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libftdi1/Config.in b/package/libftdi1/Config.in
index d47321345b..2d32573563 100644
--- a/package/libftdi1/Config.in
+++ b/package/libftdi1/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBFTDI1
 	bool "libftdi1"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Userspace access to FTDI USB interface chips (version 1.x)
@@ -33,5 +34,6 @@ config BR2_PACKAGE_LIBFTDI1_FDTI_EEPROM
 
 endif # BR2_PACKAGE_LIBFTDI1
 
-comment "libftdi1 needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libftdi1 needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libgphoto2/Config.in b/package/libgphoto2/Config.in
index fc60dd68a8..184ca206f1 100644
--- a/package/libgphoto2/Config.in
+++ b/package/libgphoto2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBGPHOTO2
 	bool "libgphoto2"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBXML2
@@ -10,5 +11,6 @@ config BR2_PACKAGE_LIBGPHOTO2
 
 	  http://gphoto.org/proj/libgphoto2/
 
-comment "libgphoto needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libgphoto needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libhid/Config.in b/package/libhid/Config.in
index ec66308061..abf338fdc7 100644
--- a/package/libhid/Config.in
+++ b/package/libhid/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBHID
 	bool "libhid"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -8,5 +9,6 @@ config BR2_PACKAGE_LIBHID
 
 	  https://directory.fsf.org/wiki/Libhid
 
-comment "libhid needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libhid needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index dcc7c79d1a..0d89331c89 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -33,13 +33,15 @@ config BR2_PACKAGE_LIBIIO_USB_BACKEND
 	bool "USB backend"
 	default y
 	depends on BR2_TOOLCHAIN_HAS_THREADS # from libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBIIO_XML_BACKEND
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable the USB backend of the library.
 
-comment "The USB backend needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "The USB backend needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_LIBIIO_SERIAL_BACKEND
 	bool "Serial backend"
diff --git a/package/libiqrf/Config.in b/package/libiqrf/Config.in
index 03555e063a..d86a7fd0ec 100644
--- a/package/libiqrf/Config.in
+++ b/package/libiqrf/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBIQRF
 	bool "libiqrf"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  This library implement specific protocol
@@ -10,5 +11,6 @@ config BR2_PACKAGE_LIBIQRF
 
 	  https://github.com/nandra/libiqrf
 
-comment "libiqrf needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libiqrf needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
index 14084dc889..073b8f37f5 100644
--- a/package/libnfc/Config.in
+++ b/package/libnfc/Config.in
@@ -24,13 +24,15 @@ comment "acr122_pcsc driver needs a toolchain w/ threads, dynamic library"
 config BR2_PACKAGE_LIBNFC_ACR122_USB
 	bool "acr122_usb driver"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  support for acr122_usb driver
 
-comment "acr122_usb driver needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "acr122_usb driver needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_LIBNFC_ACR122S
 	bool "acr122s driver"
diff --git a/package/libphidget/Config.in b/package/libphidget/Config.in
index 61e915481d..ab1e3e31b1 100644
--- a/package/libphidget/Config.in
+++ b/package/libphidget/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBPHIDGET
 	bool "libphidget"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBUSB
 	help
@@ -23,6 +24,6 @@ config BR2_PACKAGE_LIBPHIDGET
 
 	  http://phidgets.com/
 
-comment "libphidget needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_STATIC_LIBS
+comment "libphidget needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/librtlsdr/Config.in b/package/librtlsdr/Config.in
index 238659a782..2f22c5b1c7 100644
--- a/package/librtlsdr/Config.in
+++ b/package/librtlsdr/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBRTLSDR
 	bool "librtlsdr"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Library and command line programs for accessing
@@ -28,5 +29,6 @@ config BR2_PACKAGE_LIBRTLSDR_ZEROCOPY
 
 endif
 
-comment "librtlsdr needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "librtlsdr needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libusb/Config.in b/package/libusb/Config.in
index d31a717fdf..5a04ac128b 100644
--- a/package/libusb/Config.in
+++ b/package/libusb/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBUSB
 	bool "libusb"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # _Thread_local
 	help
 	  Userspace library for accessing USB devices
 
@@ -13,5 +14,6 @@ config BR2_PACKAGE_LIBUSB_EXAMPLES
 
 endif
 
-comment "libusb needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libusb needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/mfgtools/Config.in.host b/package/mfgtools/Config.in.host
index 6f2f3a3268..2b506c8f67 100644
--- a/package/mfgtools/Config.in.host
+++ b/package/mfgtools/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_MFGTOOLS
 	bool "host mfgtools"
 	depends on BR2_arm
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
 	help
 	  This package contains the Freescale manufacturing tool.
 	  It is designed to program firmware to i.MX boards during
@@ -8,3 +9,7 @@ config BR2_PACKAGE_HOST_MFGTOOLS
 	  Freescale UTP protocol.
 
 	  https://github.com/codeauroraforum/mfgtools
+
+comment "host mfgtools needs a toolchain w/ host gcc >= 4.9"
+	depends on BR2_arm
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/mxsldr/Config.in.host b/package/mxsldr/Config.in.host
index 0a02877c8b..7c49f02012 100644
--- a/package/mxsldr/Config.in.host
+++ b/package/mxsldr/Config.in.host
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_HOST_MXSLDR
 	bool "host mxsldr"
 	depends on BR2_arm || BR2_armeb
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
 	help
 	  This package contains tools to download and execute code on
 	  Freescale i.MX23 and i.MX28 SoC's through the Serial
 	  Download Protocol.
 
 	  https://gitlab.denx.de/denx/mxsldr
+
+comment "host mxsldr needs a toolchain w/ host gcc >= 4.9"
+	depends on BR2_arm || BR2_armeb
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/omxplayer/Config.in b/package/omxplayer/Config.in
index 80e48d09c8..d2e4b5ace0 100644
--- a/package/omxplayer/Config.in
+++ b/package/omxplayer/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_OMXPLAYER
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # ffmpeg
 	depends on BR2_INSTALL_LIBSTDCPP # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, boost, libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	depends on BR2_USE_WCHAR # boost
 	depends on BR2_PACKAGE_RPI_USERLAND
 	select BR2_PACKAGE_ALSA_LIB
@@ -25,10 +26,11 @@ config BR2_PACKAGE_OMXPLAYER
 
 	  https://github.com/popcornmix/omxplayer
 
-comment "omxplayer needs rpi-userland and a toolchain w/ C++, threads, wchar, dynamic library"
+comment "omxplayer needs rpi-userland and a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.9"
 	depends on BR2_arm
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_RPI_USERLAND
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS
+		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
index 5bf496627b..f1b34ef5dd 100644
--- a/package/openfpgaloader/Config.in
+++ b/package/openfpgaloader/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPENFPGALOADER
 	bool "openfpgaloader"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi1
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libftdi1 -> libusb
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBFTDI1
 	help
@@ -8,5 +9,7 @@ config BR2_PACKAGE_OPENFPGALOADER
 
 	  https://github.com/trabucayre/openFPGALoader/
 
-comment "openfpgaloader needs a toolchain w/ threads, C++"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+comment "openfpgaloader needs a toolchain w/ threads, C++, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 3b35c725ee..1b60d80dc2 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_OPENJDK
 	depends on !BR2_STATIC_LIBS # glibc
 	depends on BR2_INSTALL_LIBSTDCPP # cups
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, cups, libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_USE_MMU # cups
 	depends on BR2_PACKAGE_XORG7
@@ -151,12 +152,14 @@ comment "openjdk needs X.Org"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_XORG7
 
-comment "openjdk needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++"
+comment "openjdk needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 comment "openjdk does not support soft float configurations"
 	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index 448872061b..f2e79f29fe 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -13,6 +13,7 @@ comment "Adapters"
 config BR2_PACKAGE_OPENOCD_CMSIS_DAP
 	bool "CMSIS-DAP compliant debuggers"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	depends on BR2_PACKAGE_HAS_UDEV # hidapi
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
 	select BR2_PACKAGE_LIBUSB
@@ -24,6 +25,7 @@ config BR2_PACKAGE_OPENOCD_CMSIS_DAP
 config BR2_PACKAGE_OPENOCD_FTDI
 	bool "MPSSE mode of FTDI based devices"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the MPSSE mode of FTDI
@@ -32,6 +34,7 @@ config BR2_PACKAGE_OPENOCD_FTDI
 config BR2_PACKAGE_OPENOCD_STLINK
 	bool "ST-Link JTAG Programmer"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the ST-Link JTAG
@@ -40,6 +43,7 @@ config BR2_PACKAGE_OPENOCD_STLINK
 config BR2_PACKAGE_OPENOCD_TI_ICDI
 	bool "TI ICDI JTAG Programmer"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the TI ICDI JTAG
@@ -48,6 +52,7 @@ config BR2_PACKAGE_OPENOCD_TI_ICDI
 config BR2_PACKAGE_OPENOCD_ULINK
 	bool "Keil ULINK JTAG Programmer"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the Keil ULINK JTAG
@@ -56,6 +61,7 @@ config BR2_PACKAGE_OPENOCD_ULINK
 config BR2_PACKAGE_OPENOCD_UBLASTER2
 	bool "Altera USB-Blaster II Compatible"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the Altera USB-Blaster
@@ -64,6 +70,7 @@ config BR2_PACKAGE_OPENOCD_UBLASTER2
 config BR2_PACKAGE_OPENOCD_JLINK
 	bool "Segger J-Link JTAG Programmer"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Segger J-Link JTAG Programmer and clone such as Atmel
@@ -72,6 +79,7 @@ config BR2_PACKAGE_OPENOCD_JLINK
 config BR2_PACKAGE_OPENOCD_OSDBM
 	bool "OSDBM JTAG (only) Programmer"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the OSBDM (JTAG only)
@@ -80,6 +88,7 @@ config BR2_PACKAGE_OPENOCD_OSDBM
 config BR2_PACKAGE_OPENOCD_OPENDOUS
 	bool "eStick/opendous JTAG Programmer"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the eStick/opendous JTAG
@@ -89,6 +98,7 @@ config BR2_PACKAGE_OPENOCD_AICE
 	bool "Andes JTAG Programmer"
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the Andes JTAG
@@ -97,6 +107,7 @@ config BR2_PACKAGE_OPENOCD_AICE
 config BR2_PACKAGE_OPENOCD_VSLLINK
 	bool "Versaloon-Link JTAG Programmer"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb-compat -> libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -106,6 +117,7 @@ config BR2_PACKAGE_OPENOCD_VSLLINK
 config BR2_PACKAGE_OPENOCD_USBPROG
 	bool "USBProg JTAG Programmer"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb-compat -> libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -115,6 +127,7 @@ config BR2_PACKAGE_OPENOCD_USBPROG
 config BR2_PACKAGE_OPENOCD_RLINK
 	bool "Raisonance RLink JTAG Programmer"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb-compat -> libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -124,6 +137,7 @@ config BR2_PACKAGE_OPENOCD_RLINK
 config BR2_PACKAGE_OPENOCD_ARMEW
 	bool "Olimex ARM-JTAG-EW Programmer"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb-compat -> libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -143,6 +157,7 @@ config BR2_PACKAGE_OPENOCD_VPI
 config BR2_PACKAGE_OPENOCD_UBLASTER
 	bool "Altera USB-Blaster"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libftdi -> libusb
 	select BR2_PACKAGE_LIBFTDI1
 	help
 	  Enable building support for the Altera USB-Blaster
@@ -183,6 +198,7 @@ config BR2_PACKAGE_OPENOCD_GW16012
 config BR2_PACKAGE_OPENOCD_PRESTO
 	bool "ASIX Presto Programmer"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libftdi -> libusb
 	select BR2_PACKAGE_LIBFTDI1
 	help
 	  Enable building support for ASIX Presto Programmer
@@ -191,6 +207,7 @@ config BR2_PACKAGE_OPENOCD_PRESTO
 config BR2_PACKAGE_OPENOCD_OPENJTAG
 	bool "OpenJTAG Programmer"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libftdi -> libusb
 	select BR2_PACKAGE_LIBFTDI1
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT # needs usb.h
@@ -209,10 +226,11 @@ config BR2_PACKAGE_OPENOCD_SYSFS
 	  Enable building support for programming driven via
 	  sysfs gpios.
 
-# Many adapters need libusb or libusb-compat, which require threads,
-# but we don't want to duplicate this comment for all adapters that
-# select libusb or libusb-compat.
-comment "many openocd adapters needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+# Many adapters need libusb or libusb-compat, which require threads and
+# gcc >= 4.9 but we don't want to duplicate this comment for all
+# adapters that select libusb or libusb-compat.
+comment "many openocd adapters needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 endif # BR2_PACKAGE_OPENOCD
diff --git a/package/openocd/Config.in.host b/package/openocd/Config.in.host
index e1d0e63308..8ff37379a1 100644
--- a/package/openocd/Config.in.host
+++ b/package/openocd/Config.in.host
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_HOST_OPENOCD
 	bool "host openocd"
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
 	help
 	  OpenOCD - Open On-Chip Debugger
 
 	  http://openocd.org/
+
+comment "host openocd needs a toolchain w/ host gcc >= 4.9"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
index 3250a463b4..1b4d0f7d18 100644
--- a/package/pcsc-lite/Config.in
+++ b/package/pcsc-lite/Config.in
@@ -13,10 +13,14 @@ if BR2_PACKAGE_PCSC_LITE
 config BR2_PACKAGE_PCSC_LITE_FORCE_LIBUSB
 	bool "use libusb"
 	depends on !BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Select Y if you want to support usb smart card readers.
 
+comment "libusb support needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_PCSC_LITE_DEBUGATR
 	bool "enable ATR debug messages"
 	help
diff --git a/package/phidgetwebservice/Config.in b/package/phidgetwebservice/Config.in
index 50018e0af9..b052f180f0 100644
--- a/package/phidgetwebservice/Config.in
+++ b/package/phidgetwebservice/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PHIDGETWEBSERVICE
 	bool "phidgetwebservice"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb, libphidget
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libphidget -> libusb
 	depends on !BR2_STATIC_LIBS # libphidget
 	select BR2_PACKAGE_LIBPHIDGET
 	help
@@ -17,6 +18,6 @@ config BR2_PACKAGE_PHIDGETWEBSERVICE
 
 	  http://phidgets.com/
 
-comment "phidgetwebservice needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_STATIC_LIBS
+comment "phidgetwebservice needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/python-libusb1/Config.in b/package/python-libusb1/Config.in
index 1c4a72edae..e464a0394d 100644
--- a/package/python-libusb1/Config.in
+++ b/package/python-libusb1/Config.in
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_PYTHON_LIBUSB1
 	bool "python-libusb1"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Pure-python wrapper for libusb-1.0.
 
 	  http://github.com/vpelletier/python-libusb1
 
-comment "python-libusb1 needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "python-libusb1 needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/python-nfc/Config.in b/package/python-nfc/Config.in
index 9a8102c23c..7008723f60 100644
--- a/package/python-nfc/Config.in
+++ b/package/python-nfc/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_NFC
 	bool "python-nfc"
 	depends on BR2_PACKAGE_PYTHON
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -9,6 +10,7 @@ config BR2_PACKAGE_PYTHON_NFC
 
 	  https://launchpad.net/nfcpy
 
-comment "python-nfc needs a toolchain w/ threads"
+comment "python-nfc needs a toolchain w/ threads, gcc >= 4.9"
 	depends on BR2_PACKAGE_PYTHON
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/python-pylibftdi/Config.in b/package/python-pylibftdi/Config.in
index d340974656..ce815a55fd 100644
--- a/package/python-pylibftdi/Config.in
+++ b/package/python-pylibftdi/Config.in
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_PYTHON_PYLIBFTDI
 	bool "python-pylibftdi"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libftdi -> libusb
 	select BR2_PACKAGE_LIBFTDI
 	help
 	  This package contains the python language binding libftdi.
 
 	  https://pypi.python.org/pypi/pylibftdi
 
-comment "python-pylibftdi needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "python-pylibftdi needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/python-pyusb/Config.in b/package/python-pyusb/Config.in
index 1f97979c71..bba3480a1b 100644
--- a/package/python-pyusb/Config.in
+++ b/package/python-pyusb/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYUSB
 	bool "python-pyusb"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  The PyUSB module provides easy access to the Universal
@@ -8,5 +9,6 @@ config BR2_PACKAGE_PYTHON_PYUSB
 
 	  http://sourceforge.net/apps/trac/pyusb/
 
-comment "python-pyusb needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "python-pyusb needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index a7c0f7bf59..3163797067 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -88,7 +88,11 @@ config BR2_PACKAGE_HOST_QEMU_VIRTFS
 
 config BR2_PACKAGE_HOST_QEMU_USB
 	bool "USB passthrough support"
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
 	help
 	  Enables USB passthrough support from guest to host.
 
+comment "USB passthrough support needs a toolchain w/ host gcc >= 4.9"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
+
 endif
diff --git a/package/raspberrypi-usbboot/Config.in.host b/package/raspberrypi-usbboot/Config.in.host
index dce2fccd54..b1a434f36e 100644
--- a/package/raspberrypi-usbboot/Config.in.host
+++ b/package/raspberrypi-usbboot/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT
 	bool "host raspberrypi-usbboot"
 	depends on BR2_arm
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
 	help
 	  This package builds and install the "rpiboot" tool for the
 	  host machine. This tool allows to boot the Broadcom BCM
@@ -10,3 +11,7 @@ config BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT
 	  built into the Compute module).
 
 	  https://github.com/raspberrypi/usbboot
+
+comment "host raspberrypi-usbboot needs a toolchain w/ host gcc >= 4.9"
+	depends on BR2_arm
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/sispmctl/Config.in b/package/sispmctl/Config.in
index 6066dc051b..b08116e844 100644
--- a/package/sispmctl/Config.in
+++ b/package/sispmctl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SISPMCTL
 	bool "sispmctl"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBUSB
@@ -13,6 +14,7 @@ config BR2_PACKAGE_SISPMCTL
 
 	  http://sispmctl.sourceforge.net/
 
-comment "sispmctl needs a toolchain w/ threads, wchar"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+comment "sispmctl needs a toolchain w/ threads, wchar, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
diff --git a/package/sunxi-tools/Config.in b/package/sunxi-tools/Config.in
index 80a7130a92..5f72667284 100644
--- a/package/sunxi-tools/Config.in
+++ b/package/sunxi-tools/Config.in
@@ -24,14 +24,16 @@ config BR2_PACKAGE_SUNXI_TOOLS_BOOTINFO
 config BR2_PACKAGE_SUNXI_TOOLS_FEL
 	bool "sunxi-fel"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  The sunxi-fel command can interact with a sunxi device in
 	  fel mode. This allows do download code to memory and execute
 	  it.
 
-comment "sunxi-fel needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "sunxi-fel needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_SUNXI_TOOLS_NAND_PART
 	bool "sunxi-nand-part"
diff --git a/package/sunxi-tools/Config.in.host b/package/sunxi-tools/Config.in.host
index 5fab5e6ff5..51f13cf623 100644
--- a/package/sunxi-tools/Config.in.host
+++ b/package/sunxi-tools/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_SUNXI_TOOLS
 	bool "host sunxi-tools"
 	depends on BR2_arm
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
 	help
 	  Tools for Allwinner A10 (aka sun4i) and A13 (aka sun5i)
 	  based devices. This includes fex2bin which can be used to
@@ -10,3 +11,7 @@ config BR2_PACKAGE_HOST_SUNXI_TOOLS
 	  mainline Linux kernel version.
 
 	  http://linux-sunxi.org/Sunxi-tools
+
+comment "host sunxi-tools needs a toolchain w/ host gcc >= 4.9"
+	depends on BR2_arm
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/tegrarcm/Config.in.host b/package/tegrarcm/Config.in.host
index d8cbb947d6..937d81bd56 100644
--- a/package/tegrarcm/Config.in.host
+++ b/package/tegrarcm/Config.in.host
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_HOST_TEGRARCM
 	bool "host tegrarcm"
 	depends on BR2_arm || BR2_armeb
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
 	help
 	  This program is used to send code to a Tegra device in
 	  recovery mode.
 
 	  https://github.com/NVIDIA/tegrarcm
+
+comment "host tegrarcm needs a toolchain w/ host gcc >= 4.9"
+	depends on BR2_arm || BR2_armeb
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index 32cb4cf89d..8b92a42f62 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -33,16 +33,24 @@ if BR2_PACKAGE_UHD
 
 config BR2_PACKAGE_UHD_B100
 	bool "b100 support"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_UHD_USB
 	help
 	  enable B100 support
 
+comment "B100 support needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_UHD_B200
 	bool "b200 support"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_UHD_USB
 	help
 	  enable B200 support
 
+comment "B200 support needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_UHD_E300
 	bool "E300 support"
 	select BR2_PACKAGE_UHD_MPMD
@@ -72,8 +80,12 @@ config BR2_PACKAGE_UHD_RFNOC
 
 config BR2_PACKAGE_UHD_USB
 	bool "USB support"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  enable UHD USB support
 
+comment "USB support needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 endif
diff --git a/package/uhubctl/Config.in b/package/uhubctl/Config.in
index c000b5ab49..52b0268a38 100644
--- a/package/uhubctl/Config.in
+++ b/package/uhubctl/Config.in
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_UHUBCTL
 	bool "uhubctl"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Control USB power per-port on smart USB hubs.
 
 	  https://github.com/mvp/uhubctl
 
-comment "uhubctl needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "uhubctl needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/upower/Config.in b/package/upower/Config.in
index e564384348..612a2b74b9 100644
--- a/package/upower/Config.in
+++ b/package/upower/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_UPOWER
 	bool "upower"
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgudev, libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	depends on BR2_USE_MMU # libgudev
 	depends on BR2_USE_WCHAR # libgudev
 	select BR2_PACKAGE_LIBGUDEV
@@ -22,6 +23,7 @@ comment "upower needs udev /dev management"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV
 
-comment "upower needs a toolchain w/ threads, wchar"
+comment "upower needs a toolchain w/ threads, wchar, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/usb_modeswitch/Config.in b/package/usb_modeswitch/Config.in
index 579761c040..ecb043a146 100644
--- a/package/usb_modeswitch/Config.in
+++ b/package/usb_modeswitch/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_USB_MODESWITCH
 	bool "usb_modeswitch"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_JIMTCL if !BR2_PACKAGE_TCL || BR2_PACKAGE_TCL_SHLIB_ONLY
 	select BR2_PACKAGE_LIBUSB
 	help
@@ -20,5 +21,6 @@ config BR2_PACKAGE_USB_MODESWITCH
 
 	  http://www.draisberghof.de/usb_modeswitch/
 
-comment "usb_modeswitch needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "usb_modeswitch needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/usb_modeswitch_data/Config.in b/package/usb_modeswitch_data/Config.in
index 95b2a073bd..6da7d3bb0f 100644
--- a/package/usb_modeswitch_data/Config.in
+++ b/package/usb_modeswitch_data/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_USB_MODESWITCH_DATA
 	bool "usb_modeswitch_data"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # usb_modeswitch -> libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # usb_modeswitch -> libusb
 	select BR2_PACKAGE_USB_MODESWITCH
 	help
 	  USB mode switch data
@@ -9,5 +10,6 @@ config BR2_PACKAGE_USB_MODESWITCH_DATA
 
 	  http://www.draisberghof.de/usb_modeswitch/
 
-comment "usb_modeswitch_data needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "usb_modeswitch_data needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in
index 78b0bff6e4..8ce180a884 100644
--- a/package/usbredir/Config.in
+++ b/package/usbredir/Config.in
@@ -1,9 +1,11 @@
-comment "usbredir needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "usbredir needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_USBREDIR
 	bool "usbredir"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  usbredir is the name of a network protocol for sending usb
