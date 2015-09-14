From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 15 Sep 2015 00:40:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/lua-periphery: bump to version 1.0.6
Message-ID: <1442270435-28287-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove patch 0001-fix-build-flags.patch. The uCLibc issue is fixed
upstream.

Add patch taken and slighly adopted from the c-periphery package to fix build
issue with musl.

Build was tested with an uCLibc toolchain and a musl toolchain.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...Add-missing-header-for-musl-compatibility.patch | 34 ++++++++++++++++++++++
 package/lua-periphery/0001-fix-build-flags.patch   | 21 -------------
 package/lua-periphery/lua-periphery.hash           |  2 +-
 package/lua-periphery/lua-periphery.mk             |  4 +--
 4 files changed, 37 insertions(+), 24 deletions(-)
 create mode 100644 package/lua-periphery/0001-Add-missing-header-for-musl-compatibility.patch
 delete mode 100644 package/lua-periphery/0001-fix-build-flags.patch

diff --git a/package/lua-periphery/0001-Add-missing-header-for-musl-compatibility.patch b/package/lua-periphery/0001-Add-missing-header-for-musl-compatibility.patch
new file mode 100644
index 0000000..22c748c
--- /dev/null
+++ b/package/lua-periphery/0001-Add-missing-header-for-musl-compatibility.patch
@@ -0,0 +1,34 @@
+From 1d8cb0ad54099c3d7261aaa19a2c0786f16736d0 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 8 Aug 2015 22:42:39 +0200
+Subject: [PATCH] Add missing header for musl compatibility
+
+<linux/ioctl.h> is needed to get the definition of _IOC_SIZEBITS and
+solve the following build failure:
+
+src/spi.c: In function 'spi_transfer':
+src/spi.c:100:24: error: '_IOC_SIZEBITS' undeclared (first use in this function)
+     if (ioctl(spi->fd, SPI_IOC_MESSAGE(1), &spi_xfer) < 1)
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Port from c-periphery]
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ src/spi.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lua-periphery/c-periphery/src/spi.c b/lua-periphery/c-periphery/src/spi.c
+index 52a8d3d..1a6b17c 100644
+--- a/lua-periphery/c-periphery/src/spi.c
++++ b/lua-periphery/c-periphery/src/spi.c
+@@ -16,6 +16,7 @@
+ #include <errno.h>
+ 
+ #include <sys/ioctl.h>
++#include <linux/ioctl.h>
+ #include <linux/spi/spidev.h>
+ 
+ #include "spi.h"
+-- 
+2.5.0
+
diff --git a/package/lua-periphery/0001-fix-build-flags.patch b/package/lua-periphery/0001-fix-build-flags.patch
deleted file mode 100644
index 1ac220c..0000000
--- a/package/lua-periphery/0001-fix-build-flags.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Fix build flags to build properly with uClibc
-
-Building with -std=c99 -D_DEFAULT_SOURCE hides the struct timespec and
-nanosleep() definitions from <time.h> in uClibc. Work around that by
-using -std=gnu99 instead.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/lua-periphery/Makefile
-===================================================================
---- a/lua-periphery/Makefile
-+++ b/lua-periphery/Makefile
-@@ -16,7 +16,7 @@
- 
- ###########################################################################
- 
--CFLAGS += -std=c99 -pedantic -D_DEFAULT_SOURCE
-+CFLAGS += -std=gnu99 -pedantic
- CFLAGS += -Wall -Wextra -Wno-unused-parameter $(DEBUG) -fPIC -I. $(LUA_CFLAGS)
- LDFLAGS += -shared
- 
diff --git a/package/lua-periphery/lua-periphery.hash b/package/lua-periphery/lua-periphery.hash
index 39209df..7f6e63f 100644
--- a/package/lua-periphery/lua-periphery.hash
+++ b/package/lua-periphery/lua-periphery.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  f94f4af342e531ff25b037b8b7c127db50b7464c0bbce4c5ea3b49fd215ada60    lua-periphery-1.0.5-2.src.rock
+sha256  53762ed9b8a2edfcc5b4c535ef73e6a425f2577e036bb15994ca16a39b16ebab  lua-periphery-1.0.6-1.src.rock
diff --git a/package/lua-periphery/lua-periphery.mk b/package/lua-periphery/lua-periphery.mk
index 541079f..48eba39 100644
--- a/package/lua-periphery/lua-periphery.mk
+++ b/package/lua-periphery/lua-periphery.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LUA_PERIPHERY_VERSION_UPSTREAM = 1.0.5
-LUA_PERIPHERY_VERSION = $(LUA_PERIPHERY_VERSION_UPSTREAM)-2
+LUA_PERIPHERY_VERSION_UPSTREAM = 1.0.6
+LUA_PERIPHERY_VERSION = $(LUA_PERIPHERY_VERSION_UPSTREAM)-1
 LUA_PERIPHERY_SUBDIR = lua-periphery
 LUA_PERIPHERY_LICENSE = MIT
 LUA_PERIPHERY_LICENSE_FILES = $(LUA_PERIPHERY_SUBDIR)/LICENSE
-- 
2.5.2
