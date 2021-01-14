From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Jan 2021 07:56:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/usbutils: needs gcc >= 4.9
Message-ID: <20210114065608.119951-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 8a26801c9fad1c7749200e22e9dfdeaeeb65f76e forgot to propagate the
gcc dependency from libusb to usbutils

Fixes:
 - http://autobuild.buildroot.org/results/ed8706a1ead398b5097b046524e710b1d3d0bb1e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usbutils/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index 923853af04..a38eb2f2e5 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_USBUTILS
 	bool "usbutils"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	depends on BR2_PACKAGE_HAS_UDEV # needs hwdb
 	select BR2_PACKAGE_LIBUSB
 	help
@@ -8,5 +9,7 @@ config BR2_PACKAGE_USBUTILS
 
 	  http://linux-usb.sourceforge.net/
 
-comment "usbutils needs udev /dev management and toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_HAS_UDEV
+comment "usbutils needs udev /dev management and toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_PACKAGE_HAS_UDEV || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.29.2
