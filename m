From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 16 Dec 2018 21:19:03 +0100
Subject: [Buildroot] [PATCH 1/4] lua-periphery: bump to version 1.1.1
Message-ID: <20181216201906.25729-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...issing-header-for-musl-compatibility.patch | 34 -----------
 .../0002-Fix-build-on-SPARC.patch             | 60 -------------------
 package/lua-periphery/lua-periphery.hash      |  2 +-
 package/lua-periphery/lua-periphery.mk        |  2 +-
 4 files changed, 2 insertions(+), 96 deletions(-)
 delete mode 100644 package/lua-periphery/0001-Add-missing-header-for-musl-compatibility.patch
 delete mode 100644 package/lua-periphery/0002-Fix-build-on-SPARC.patch

diff --git a/package/lua-periphery/0001-Add-missing-header-for-musl-compatibility.patch b/package/lua-periphery/0001-Add-missing-header-for-musl-compatibility.patch
deleted file mode 100644
index 22c748ccb..000000000
--- a/package/lua-periphery/0001-Add-missing-header-for-musl-compatibility.patch
+++ /dev/null
@@ -1,34 +0,0 @@
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
-[Port from c-periphery]
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- src/spi.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lua-periphery/c-periphery/src/spi.c b/lua-periphery/c-periphery/src/spi.c
-index 52a8d3d..1a6b17c 100644
---- a/lua-periphery/c-periphery/src/spi.c
-+++ b/lua-periphery/c-periphery/src/spi.c
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
diff --git a/package/lua-periphery/0002-Fix-build-on-SPARC.patch b/package/lua-periphery/0002-Fix-build-on-SPARC.patch
deleted file mode 100644
index ce461ddca..000000000
--- a/package/lua-periphery/0002-Fix-build-on-SPARC.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-[PATCH] Fix build on SPARC
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
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/lua-periphery/c-periphery/src/serial.c
-===================================================================
---- a/lua-periphery/c-periphery/src/serial.c
-+++ b/lua-periphery/c-periphery/src/serial.c
-@@ -70,10 +70,18 @@
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
-@@ -107,10 +115,18 @@
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
diff --git a/package/lua-periphery/lua-periphery.hash b/package/lua-periphery/lua-periphery.hash
index 7f6e63f3b..73dbd1cf2 100644
--- a/package/lua-periphery/lua-periphery.hash
+++ b/package/lua-periphery/lua-periphery.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  53762ed9b8a2edfcc5b4c535ef73e6a425f2577e036bb15994ca16a39b16ebab  lua-periphery-1.0.6-1.src.rock
+sha256 ff8a4d08f02356586fadfe47f01859ba28539cc42013836f79a032bf4ccc78b3  lua-periphery-1.1.1-1.src.rock
diff --git a/package/lua-periphery/lua-periphery.mk b/package/lua-periphery/lua-periphery.mk
index 2c04eede8..af5abe70d 100644
--- a/package/lua-periphery/lua-periphery.mk
+++ b/package/lua-periphery/lua-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_PERIPHERY_VERSION = 1.0.6-1
+LUA_PERIPHERY_VERSION = 1.1.1-1
 LUA_PERIPHERY_SUBDIR = lua-periphery
 LUA_PERIPHERY_LICENSE = MIT
 LUA_PERIPHERY_LICENSE_FILES = $(LUA_PERIPHERY_SUBDIR)/LICENSE
-- 
2.17.1
