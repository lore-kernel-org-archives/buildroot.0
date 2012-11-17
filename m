From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sat, 17 Nov 2012 19:55:56 +0000
Subject: [Buildroot] [PATCH] libusb: disable on avr32
Message-ID: <1353182156-28906-1-git-send-email-spdawson@gmail.com>
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

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libusb/Config.in |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
1.7.10.4
