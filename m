From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Jan 2021 22:38:01 +0100
Subject: [Buildroot] [git commit] package/apcupsd: fix reverse dependency
 for libusb
Message-ID: <20210109212159.ABCA7862FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1a9f10b7933e837eafbc5ab011b38dacbb8d5df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8a26801c9f (package/libusb: needs gcc >= 4.9) added a dependency
to gcc >= 4.9 for libusb but forgot to propagate the reverse dependency
to BR2_PACKAGE_APCUPSD_USB.

Fixes:
http://autobuild.buildroot.net/results/f34/f348fe8e5530970a14589ca878810a3bdaf98f67/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/apcupsd/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/apcupsd/Config.in b/package/apcupsd/Config.in
index f87f6a8b55..2a00d43d67 100644
--- a/package/apcupsd/Config.in
+++ b/package/apcupsd/Config.in
@@ -57,13 +57,15 @@ config BR2_PACKAGE_APCUPSD_SNMP
 config BR2_PACKAGE_APCUPSD_USB
 	bool "usb"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  Compile USB UPS code
 
-comment "usb support needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "usb support needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 endif
 
