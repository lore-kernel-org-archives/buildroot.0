From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Jun 2021 16:47:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/openocd: add XDS110 option
Message-ID: <20210613144722.1461597-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

XDS110 is available (and enabled by default) since version 0.11.0 and
https://github.com/ntfreak/openocd/commit/2ba27e2f3edd37e5dce4b2a231d2ae84c14cb59a

It raises the following build failure without wchar:

/home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/9.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: src/.libs/libopenocd.a(src_jtag_drivers_libocdjtagdrivers_la-xds110.o): in function `xds110_handle_serial_command':
xds110.c:(.text+0x368): undefined reference to `mbstowcs'

Fixes:
 - http://autobuild.buildroot.org/results/4536ed9124e77547c5e29f710fcafccc17b80a05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openocd/Config.in  | 14 ++++++++++++++
 package/openocd/openocd.mk |  1 +
 2 files changed, 15 insertions(+)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index f2e79f29fe..0fc5a670f2 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -114,6 +114,20 @@ config BR2_PACKAGE_OPENOCD_VSLLINK
 	  Enable building support for the Versaloon-Link JTAG
 	  Programmer (default is auto)
 
+config BR2_PACKAGE_OPENOCD_XDS110
+	bool "TI XDS110 Debug Probe"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb-compat -> libusb
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	help
+	  Enable building support for the TI XDS110 Debug
+	  Probe (default is auto)
+
+comment "TI XDS110 Debug Probe needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_OPENOCD_USBPROG
 	bool "USBProg JTAG Programmer"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index b74426ff47..1254188aef 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -47,6 +47,7 @@ OPENOCD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_OPENOCD_OPENDOUS),--enable-opendous,--disable-opendous) \
 	$(if $(BR2_PACKAGE_OPENOCD_AICE),--enable-aice,--disable-aice) \
 	$(if $(BR2_PACKAGE_OPENOCD_VSLLINK),--enable-vsllink,--disable-vsllink) \
+	$(if $(BR2_PACKAGE_OPENOCD_XDS110),--enable-xds110,--disable-xds110) \
 	$(if $(BR2_PACKAGE_OPENOCD_USBPROG),--enable-usbprog,--disable-usbprog) \
 	$(if $(BR2_PACKAGE_OPENOCD_RLINK),--enable-rlink,--disable-rlink) \
 	$(if $(BR2_PACKAGE_OPENOCD_ARMEW),--enable-armjtagew,--disable-armjtagew) \
-- 
2.30.2
