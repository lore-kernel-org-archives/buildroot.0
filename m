From: mattwood2000 at gmail.com <mattwood2000@gmail.com>
Date: Mon, 7 Jan 2019 12:12:19 -0500
Subject: [Buildroot] openocd CMSIS-DAP support
Message-ID: <CADjezmZq4MSvxbGm9HAHxAGN2O5F1XZrVRRoGw9ehV-i=CUSyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I need CMSIS-DAP support in openOCD on my target build.  I noticed the
comment in openocd.mk explaining that CMSIS-DAP support is disabled for the
host build because HIDAPI is not supported in buildroot.

However, I see cmsis-dap support in the target options of openocd as well
as HIDAPI support for target buids.

I was able to add cmsis-dap support for the target easily with the patch
below.

Is there a reason why the CMSIS-DAP Adapter option in Config.in was removed
or never added for the target build?  If not I'll submit this but wanted to
make sure I wasn't missing something.

Thanks, Matt.

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index 6cba7a04c8..2145ac72eb 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -9,6 +9,16 @@ if BR2_PACKAGE_OPENOCD

 comment "Adapters"

+config BR2_PACKAGE_OPENOCD_CMSIS_DAP
+
+       bool "CMSIS-DAP compliant debuggers"
+       depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+       select BR2_PACKAGE_LIBUSB
+       select BR2_PACKAGE_HIDAPI
+       help
+         Enable support for CMSIS-DAP compliant
+         debuggers (i.e Atmel/Microchip EDBG, etc.)
+
 config BR2_PACKAGE_OPENOCD_FTDI
        bool "MPSSE mode of FTDI based devices"
        depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 9d2576ceeb..a4e7a26921 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -29,7 +29,8 @@ OPENOCD_DEPENDENCIES = \
        $(if $(BR2_PACKAGE_LIBFTDI1),libftdi1) \
        $(if $(BR2_PACKAGE_LIBUSB),libusb) \
        $(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
-       $(if $(BR2_PACKAGE_LIBHID),libhid)
+       $(if $(BR2_PACKAGE_LIBHID),libhid) \
+       $(if $(BR2_PACKAGE_HIDAPI),hidapi)

 # Adapters
 OPENOCD_CONF_OPTS += \
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190107/503765d2/attachment.html>
