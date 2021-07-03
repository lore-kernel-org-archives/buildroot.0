From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 23:35:14 +0200
Subject: [Buildroot] [git commit] package/openocd: require wchar for the
 xds110 driver
Message-ID: <20210703210241.4C38B8F64E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=705b5b3cd0e38a37672eac086ca555da2ec60baf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The xds110 driver requires wchar, and is enabled by default. Make sure
to disable xds110 when wchar support is missing.

Fixes:
http://autobuild.buildroot.net/results/530bfe22ff509cf4ebfdf99a183312a1053f505f/
http://autobuild.buildroot.net/results/956538a0a6029137db19cce30dc340e2e30dd166/
http://autobuild.buildroot.net/results/ae7da2ce1389ece44a4ca65108fee02e318df7b3/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openocd/Config.in  | 13 +++++++++++++
 package/openocd/openocd.mk |  1 +
 2 files changed, 14 insertions(+)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index f2e79f29fe..b14f940b27 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -144,6 +144,15 @@ config BR2_PACKAGE_OPENOCD_ARMEW
 	  Enable building support for the Olimex ARM-JTAG-EW
 	  Programmer (default is auto)
 
+config BR2_PACKAGE_OPENOCD_XDS110
+	bool "TI XDS110 Debug Probe"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	select BR2_PACKAGE_LIBUSB
+	help
+	  Enable building support for the TI XDS110 Debug Probe.
+
 config BR2_PACKAGE_OPENOCD_PARPORT
 	bool "pc parallel port driver"
 	help
@@ -233,4 +242,8 @@ comment "many openocd adapters needs a toolchain w/ threads, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
+comment "xds110 adapter support needs toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 endif # BR2_PACKAGE_OPENOCD
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index b74426ff47..9f53ae3ee3 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -49,6 +49,7 @@ OPENOCD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_OPENOCD_VSLLINK),--enable-vsllink,--disable-vsllink) \
 	$(if $(BR2_PACKAGE_OPENOCD_USBPROG),--enable-usbprog,--disable-usbprog) \
 	$(if $(BR2_PACKAGE_OPENOCD_RLINK),--enable-rlink,--disable-rlink) \
+	$(if $(BR2_PACKAGE_OPENOCD_XDS110),--enable-xds110,--disable-xds110) \
 	$(if $(BR2_PACKAGE_OPENOCD_ARMEW),--enable-armjtagew,--disable-armjtagew) \
 	$(if $(BR2_PACKAGE_OPENOCD_CMSIS_DAP),--enable-cmsis-dap,--disable-cmsis-dap) \
 	$(if $(BR2_PACKAGE_OPENOCD_PARPORT),--enable-parport,--disable-parport) \
