From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 14:35:31 +0200
Subject: [Buildroot] [git commit] package/flashrom: bump to version 1.2
Message-ID: <20200906122719.B959781847@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39148cd3d2e42ae43173304c8d00d5f851eed707
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (not needed since
  https://github.com/flashrom/flashrom/commit/e0ceedf76d48757a05f22860e7ddd03e430c2252)
- CONFIG_ENABLE_LIBUSB0_PROGRAMMERS has been dropped since
  https://github.com/flashrom/flashrom/commit/b221cd7048f9cde1fe789e686a0e0adaf9a688b3
- arc platform is supported since
  https://github.com/flashrom/flashrom/commit/34d07f00b2990bec4a2ce12852acd42c08ddf217
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flashrom/0001-spi.patch | 25 -------------------------
 package/flashrom/Config.in      |  1 +
 package/flashrom/flashrom.hash  |  6 +++---
 package/flashrom/flashrom.mk    |  9 +--------
 4 files changed, 5 insertions(+), 36 deletions(-)

diff --git a/package/flashrom/0001-spi.patch b/package/flashrom/0001-spi.patch
deleted file mode 100644
index 22ffcb54dc..0000000000
--- a/package/flashrom/0001-spi.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-linux_spi: add missing include
-
-Some defines (e.g. _IOC_SIZEBITS) are defined in linux/ioctl.h,
-so it must be included before it is used, by SPI_IOC_MESSAGE
-from linux/spi/spidev.h
-
-Fixes build errors with the musl C library, as seen in these
-Buildroot autobuilder failures:
-
-    http://autobuild.buildroot.org/results/2a3/2a3744007c630c267575a638ebcd83a4b97644f5/build-end.log
-    http://autobuild.buildroot.org/results/3de/3de936d9be79e151e66af15193084d82a0f2c04a/build-end.log
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN flashrom-0.9.8.orig/linux_spi.c flashrom-0.9.8/linux_spi.c
---- flashrom-0.9.8.orig/linux_spi.c	2015-10-28 19:42:38.480285847 +0100
-+++ flashrom-0.9.8/linux_spi.c	2015-10-28 19:43:15.492994613 +0100
-@@ -27,6 +27,7 @@
- #include <ctype.h>
- #include <unistd.h>
- #include <linux/types.h>
-+#include <linux/ioctl.h>
- #include <linux/spi/spidev.h>
- #include <sys/ioctl.h>
- #include "flash.h"
diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index c333c29730..182a3f454a 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arc
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_m68k
diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index 6622758a55..97df4fe9a4 100644
--- a/package/flashrom/flashrom.hash
+++ b/package/flashrom/flashrom.hash
@@ -1,4 +1,4 @@
 # Locally computed after checking pgp signature
-# https://download.flashrom.org/releases/flashrom-v1.1.tar.bz2.asc
-sha256 aeada9c70c22421217c669356180c0deddd0b60876e63d2224e3260b90c14e19  flashrom-v1.1.tar.bz2
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+# https://download.flashrom.org/releases/flashrom-v1.2.tar.bz2.asc
+sha256  e1f8d95881f5a4365dfe58776ce821dfcee0f138f75d0f44f8a3cd032d9ea42b  flashrom-v1.2.tar.bz2
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 6b9e6dde94..5554082bca 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 1.1
+FLASHROM_VERSION = 1.2
 FLASHROM_SOURCE = flashrom-v$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = https://download.flashrom.org/releases
 FLASHROM_LICENSE = GPL-2.0+
@@ -28,13 +28,6 @@ else
 FLASHROM_MAKE_OPTS += CONFIG_ENABLE_LIBUSB1_PROGRAMMERS=no
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
-FLASHROM_DEPENDENCIES += host-pkgconf libusb-compat
-FLASHROM_MAKE_OPTS += CONFIG_ENABLE_LIBUSB0_PROGRAMMERS=yes
-else
-FLASHROM_MAKE_OPTS += CONFIG_ENABLE_LIBUSB0_PROGRAMMERS=no
-endif
-
 ifeq ($(BR2_PACKAGE_PCIUTILS),y)
 FLASHROM_DEPENDENCIES += pciutils
 FLASHROM_MAKE_OPTS += CONFIG_ENABLE_LIBPCI_PROGRAMMERS=yes
