From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  6 Jun 2018 23:04:39 +0300
Subject: [Buildroot] [PATCH] imx-usb-loader: propagate libusb dependency
Message-ID: <41228b9c0becd39927b2f2714e8e980a372c319d.1528315479.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avoid select of libusb when the toolchain does not support threads.

Fixes:
http://autobuild.buildroot.net/results/a21/a212ee3e5ec174f4e6e7d582f777325dac035bfd/

Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/imx-usb-loader/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/imx-usb-loader/Config.in b/package/imx-usb-loader/Config.in
index 6f083f34d12a..1cc0dd8c25e7 100644
--- a/package/imx-usb-loader/Config.in
+++ b/package/imx-usb-loader/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_IMX_USB_LOADER
 	bool "imx-usb-loader"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  This package contains tools to download and execute code
@@ -7,3 +8,6 @@ config BR2_PACKAGE_IMX_USB_LOADER
 	  Serial Download Protocol.
 
 	  https://github.com/boundarydevices/imx_usb_loader
+
+comment "imx-usb-loader needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.17.1
