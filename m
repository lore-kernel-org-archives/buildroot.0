From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 24 Mar 2015 19:49:39 +0200
Subject: [Buildroot] [PATCH] openocd: openjtag needs libusb-compat
Message-ID: <72755ca3fda8465a03e156db60d3b035f1653e37.1427219379.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 9bdf5926 (package/openocd: depends on libftdi1 instead of
libftdi) the OpenJTAG Programmer can be built without libusb-compat, that is a
dependency of libftdi (but not libftdi1). This breaks the build, because
openjtag.c uses libusb-compat headers. Select BR2_PACKAGE_LIBUSB_COMPAT to fix
this.

Fixes:
http://autobuild.buildroot.net/results/d19/d1969e6df56835568fb908b7f252aec0915d9fa4/
http://autobuild.buildroot.net/results/f06/f06ed6df6138ab399036c397c3f72d33d64fe0a3/
http://autobuild.buildroot.net/results/bd7/bd7f90f3cc1d2b395f9849eb0630c2602a075bf5/
...

Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/openocd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index 2db17fa76a1a..d84aac18f08e 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -186,6 +186,7 @@ config BR2_PACKAGE_OPENOCD_PRESTO
 config BR2_PACKAGE_OPENOCD_OPENJTAG
 	bool "OpenJTAG Programmer"
 	select BR2_PACKAGE_LIBFTDI1
+	select BR2_PACKAGE_LIBUSB_COMPAT # needs usb.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
 	depends on BR2_ARCH_HAS_ATOMICS
 	help
-- 
2.1.4
