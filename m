From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Dec 2020 22:09:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/qemu: fix build with kernel < 5.0
Message-ID: <20201213210909.300489-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/e4ef13e8ca4ac634650ed80a72a0e1da59520628

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...t-libusb.c-fix-build-with-kernel-5.0.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/qemu/0003-hw-usb-host-libusb.c-fix-build-with-kernel-5.0.patch

diff --git a/package/qemu/0003-hw-usb-host-libusb.c-fix-build-with-kernel-5.0.patch b/package/qemu/0003-hw-usb-host-libusb.c-fix-build-with-kernel-5.0.patch
new file mode 100644
index 0000000000..2510dc9cd4
--- /dev/null
+++ b/package/qemu/0003-hw-usb-host-libusb.c-fix-build-with-kernel-5.0.patch
@@ -0,0 +1,43 @@
+From ecd615dfe328e3ab551cea3ba243d908936ed382 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 13 Dec 2020 21:27:31 +0100
+Subject: [PATCH] hw/usb/host-libusb.c: fix build with kernel < 5.0
+
+USBDEVFS_GET_SPEED is used since version 5.2.0 and
+https://gitlab.com/qemu-project/qemu/-/commit/202d69a715a4b1824dcd7ec1683d027ed2bae6d3
+resulting in the following build failure with kernel < 5.0:
+
+../hw/usb/host-libusb.c: In function 'usb_host_open':
+../hw/usb/host-libusb.c:953:32: error: 'USBDEVFS_GET_SPEED' undeclared (first use in this function); did you mean 'USBDEVFS_GETDRIVER'?
+         int rc = ioctl(hostfd, USBDEVFS_GET_SPEED, NULL);
+                                ^~~~~~~~~~~~~~~~~~
+                                USBDEVFS_GETDRIVER
+
+A tentative was made to fix this build failure with
+https://gitlab.com/qemu-project/qemu/-/commit/4969e697c15ac536d5c0700381d5d026ef7f0588
+
+However, the assumtion that distros with old kernels also have old
+libusb is just wrong so also add a check for defined(USBDEVFS_GET_SPEED)
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to qemu-devel at nongnu.org]
+---
+ hw/usb/host-libusb.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
+index b950501d10..0343300d3e 100644
+--- a/hw/usb/host-libusb.c
++++ b/hw/usb/host-libusb.c
+@@ -941,7 +941,7 @@ static int usb_host_open(USBHostDevice *s, libusb_device *dev, int hostfd)
+     usb_host_ep_update(s);
+ 
+     libusb_speed = libusb_get_device_speed(dev);
+-#if LIBUSB_API_VERSION >= 0x01000107 && defined(CONFIG_LINUX)
++#if LIBUSB_API_VERSION >= 0x01000107 && defined(CONFIG_LINUX) && defined(USBDEVFS_GET_SPEED)
+     if (hostfd && libusb_speed == 0) {
+         /*
+          * Workaround libusb bug: libusb_get_device_speed() does not
+-- 
+2.29.2
+
-- 
2.29.2
