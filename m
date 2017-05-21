From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 23:46:32 +0200
Subject: [Buildroot] [PATCH/next] package/c-periphery: bump version to 1.1.1
Message-ID: <20170521214632.22535-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches applied upstream:

0001-Add-missing-header-for-musl-compatibility.patch
https://github.com/vsergeev/c-periphery/commit/27a95527201a368c825aeaf937700c279e13922a

0002-Fix-build-on-SPARC.patch
https://github.com/vsergeev/c-periphery/commit/114c715c78ce300a5cd64fb71f32ffd2bce5326c

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...Add-missing-header-for-musl-compatibility.patch | 32 ----------
 package/c-periphery/0002-Fix-build-on-SPARC.patch  | 70 ----------------------
 package/c-periphery/c-periphery.hash               |  2 +-
 package/c-periphery/c-periphery.mk                 |  2 +-
 4 files changed, 2 insertions(+), 104 deletions(-)
 delete mode 100644 package/c-periphery/0001-Add-missing-header-for-musl-compatibility.patch
 delete mode 100644 package/c-periphery/0002-Fix-build-on-SPARC.patch

diff --git a/package/c-periphery/0001-Add-missing-header-for-musl-compatibility.patch b/package/c-periphery/0001-Add-missing-header-for-musl-compatibility.patch
deleted file mode 100644
index 108297c9c..000000000
--- a/package/c-periphery/0001-Add-missing-header-for-musl-compatibility.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1d8cb0ad54099c3d7261aaa19a2c0786f16736d0 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 8 Aug 2015 22:42:39 +0200
-Subject: [PATCH] Add missing header for musl compatibility
-
-<linux/ioctl.h> is needed to get the definition of _IOC_SIZEBITS and
-solve the following build failure:
-
-src/spi.c: In function 'spi_transfer':
-src/spi.c:100:24: error: '_IOC_SIZEBITS' undeclared (first use in this function)
-     if (ioctl(spi->fd, SPI_IOC_MESSAGE(1), &spi_xfer) < 1)
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/spi.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/spi.c b/src/spi.c
-index 52a8d3d..1a6b17c 100644
---- a/src/spi.c
-+++ b/src/spi.c
-@@ -16,6 +16,7 @@
- #include <errno.h>
- 
- #include <sys/ioctl.h>
-+#include <linux/ioctl.h>
- #include <linux/spi/spidev.h>
- 
- #include "spi.h"
--- 
-2.5.0
-
diff --git a/package/c-periphery/0002-Fix-build-on-SPARC.patch b/package/c-periphery/0002-Fix-build-on-SPARC.patch
deleted file mode 100644
index e491f6f72..000000000
--- a/package/c-periphery/0002-Fix-build-on-SPARC.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 295316c3f44c3e779e85d7453424496a3bb4bc48 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 8 Aug 2015 22:56:09 +0200
-Subject: [PATCH] Fix build on SPARC
-
-On SPARC, the definitions of B2500000, B3000000, B3500000 and B4000000
-are not necessarily available, so use those values only if defined in
-the kernel headers.
-
-It fixes SPARC build failures such as:
-
-src/serial.c: In function '_serial_baudrate_to_bits':
-src/serial.c:73:30: error: 'B2500000' undeclared (first use in this function)
-         case 2500000: return B2500000;
-                              ^
-src/serial.c:73:30: note: each undeclared identifier is reported only once for each function it appears in
-src/serial.c:74:30: error: 'B3000000' undeclared (first use in this function)
-         case 3000000: return B3000000;
-                              ^
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/serial.c | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/src/serial.c b/src/serial.c
-index e385309..efd425e 100644
---- a/src/serial.c
-+++ b/src/serial.c
-@@ -70,10 +70,18 @@ static int _serial_baudrate_to_bits(uint32_t baudrate) {
-         case 1152000: return B1152000;
-         case 1500000: return B1500000;
-         case 2000000: return B2000000;
-+#ifdef B2500000
-         case 2500000: return B2500000;
-+#endif
-+#ifdef B3000000
-         case 3000000: return B3000000;
-+#endif
-+#ifdef B3500000
-         case 3500000: return B3500000;
-+#endif
-+#ifdef B4000000
-         case 4000000: return B4000000;
-+#endif
-         default: return -1;
-     }
- }
-@@ -107,10 +115,18 @@ static int _serial_bits_to_baudrate(uint32_t bits) {
-         case B1152000: return 1152000;
-         case B1500000: return 1500000;
-         case B2000000: return 2000000;
-+#ifdef B2500000
-         case B2500000: return 2500000;
-+#endif
-+#ifdef B3000000
-         case B3000000: return 3000000;
-+#endif
-+#ifdef B3500000
-         case B3500000: return 3500000;
-+#endif
-+#ifdef B4000000
-         case B4000000: return 4000000;
-+#endif
-         default: return -1;
-     }
- }
--- 
-2.5.0
-
diff --git a/package/c-periphery/c-periphery.hash b/package/c-periphery/c-periphery.hash
index 516d340d9..524925ff9 100644
--- a/package/c-periphery/c-periphery.hash
+++ b/package/c-periphery/c-periphery.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 5ae4c3f9de0e64d8153ee58b85c4a5defb9f755c6ae215f11b46719bbbac1335  c-periphery-v1.0.3.tar.gz
+sha256 c6cfaae7496ff6500b747106571de6b4ca7d80a383297e592ffcfa3413b66321  c-periphery-v1.1.1.tar.gz
diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
index 730b3bc30..359c860e8 100644
--- a/package/c-periphery/c-periphery.mk
+++ b/package/c-periphery/c-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_PERIPHERY_VERSION = v1.0.3
+C_PERIPHERY_VERSION = v1.1.1
 C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,$(C_PERIPHERY_VERSION))
 C_PERIPHERY_INSTALL_STAGING = YES
 # only a static library
-- 
2.11.0
