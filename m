From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 15:49:21 +0200
Subject: [Buildroot] [PATCH 2/2] lua-periphery: depend on c-periphery
	instead of cloning it
In-Reply-To: <1431784161-5771-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1431784161-5771-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1431784161-5771-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lua-periphery currently clones and builds the c-periphery library by
itself. This causes two problems:

 1/ It does not integrate properly with the download infrastructure of
    Buildroot, making offline builds impossible since not the entire
    source code is downloaded by Buildroot.

 2/ It does not use the latest version of c-periphery, which has some
    fixes contributed by Vicente to fix c-periphery on MIPS.

This commit fixes:

  http://autobuild.buildroot.org/results/0ad/0ad656970b3cbc84b5531b28155ba2f747715fe3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...01-Makefile-don-t-clone-build-c-periphery.patch | 32 ++++++++
 package/lua-periphery/0002-Fix-include-paths.patch | 89 ++++++++++++++++++++++
 package/lua-periphery/Config.in                    |  1 +
 package/lua-periphery/lua-periphery.mk             |  1 +
 4 files changed, 123 insertions(+)
 create mode 100644 package/lua-periphery/0001-Makefile-don-t-clone-build-c-periphery.patch
 create mode 100644 package/lua-periphery/0002-Fix-include-paths.patch

diff --git a/package/lua-periphery/0001-Makefile-don-t-clone-build-c-periphery.patch b/package/lua-periphery/0001-Makefile-don-t-clone-build-c-periphery.patch
new file mode 100644
index 0000000..85545ce
--- /dev/null
+++ b/package/lua-periphery/0001-Makefile-don-t-clone-build-c-periphery.patch
@@ -0,0 +1,32 @@
+From 395bb4cb37612a4ac94346531b13ff0e901ed05e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 5 May 2015 23:59:17 +0200
+Subject: [PATCH 1/2] Makefile: don't clone/build c-periphery
+
+This patch adjusts lua-periphery Makefile to not clone and build the
+c-periphery library by itself, and instead of the already available
+c-periphery library.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lua-periphery/Makefile b/lua-periphery/Makefile
+index bed9b32..a4c68eb 100644
+--- a/lua-periphery/Makefile
++++ b/lua-periphery/Makefile
+@@ -36,8 +36,8 @@ install:
+ 
+ ###########################################################################
+ 
+-$(LIB): $(C_PERIPHERY_LIB) $(SRCS)
+-	$(CC) $(CFLAGS) $(LDFLAGS) $(SRCS) $(C_PERIPHERY_LIB) -o $@
++$(LIB): $(SRCS)
++	$(CC) $(CFLAGS) $(LDFLAGS) $(SRCS) -lc-periphery -o $@
+ 
+ $(C_PERIPHERY_LIB): $(C_PERIPHERY)/Makefile
+ 	cd $(C_PERIPHERY); $(MAKE)
+-- 
+2.1.0
+
diff --git a/package/lua-periphery/0002-Fix-include-paths.patch b/package/lua-periphery/0002-Fix-include-paths.patch
new file mode 100644
index 0000000..ede4e30
--- /dev/null
+++ b/package/lua-periphery/0002-Fix-include-paths.patch
@@ -0,0 +1,89 @@
+From b0a48721c48e0857458eb46b36ae575281412c64 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 16 May 2015 15:12:30 +0200
+Subject: [PATCH 2/2] Fix include paths for c-periphery
+
+The lua-periphery source code is designed to have c-periphery cloned
+and built internally, so the include paths are written with this
+assumption.
+
+This commit adjusts the header paths of the c-periphery headers to be
+compatible with a separated build/installation of c-periphery.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/lua_gpio.c   | 2 +-
+ src/lua_i2c.c    | 2 +-
+ src/lua_mmio.c   | 2 +-
+ src/lua_serial.c | 2 +-
+ src/lua_spi.c    | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/lua-periphery/src/lua_gpio.c b/lua-periphery/src/lua_gpio.c
+index cfeb03d..711d7e1 100644
+--- a/lua-periphery/src/lua_gpio.c
++++ b/lua-periphery/src/lua_gpio.c
+@@ -13,7 +13,7 @@
+ #include <stdint.h>
+ #include <errno.h>
+ 
+-#include <c-periphery/src/gpio.h>
++#include <c-periphery/gpio.h>
+ #include "lua_periphery.h"
+ #include "lua_51compat.h"
+ 
+diff --git a/lua-periphery/src/lua_i2c.c b/lua-periphery/src/lua_i2c.c
+index ebdab79..7b38f6f 100644
+--- a/lua-periphery/src/lua_i2c.c
++++ b/lua-periphery/src/lua_i2c.c
+@@ -13,7 +13,7 @@
+ #include <stdint.h>
+ #include <errno.h>
+ 
+-#include <c-periphery/src/i2c.h>
++#include <c-periphery/i2c.h>
+ #include "lua_periphery.h"
+ #include "lua_51compat.h"
+ 
+diff --git a/lua-periphery/src/lua_mmio.c b/lua-periphery/src/lua_mmio.c
+index 5ab1188..7dd399b 100644
+--- a/lua-periphery/src/lua_mmio.c
++++ b/lua-periphery/src/lua_mmio.c
+@@ -13,7 +13,7 @@
+ #include <stdint.h>
+ #include <errno.h>
+ 
+-#include <c-periphery/src/mmio.h>
++#include <c-periphery/mmio.h>
+ #include "lua_periphery.h"
+ #include "lua_51compat.h"
+ 
+diff --git a/lua-periphery/src/lua_serial.c b/lua-periphery/src/lua_serial.c
+index 7d332af..85afa4a 100644
+--- a/lua-periphery/src/lua_serial.c
++++ b/lua-periphery/src/lua_serial.c
+@@ -13,7 +13,7 @@
+ #include <stdint.h>
+ #include <errno.h>
+ 
+-#include <c-periphery/src/serial.h>
++#include <c-periphery/serial.h>
+ #include "lua_periphery.h"
+ #include "lua_51compat.h"
+ 
+diff --git a/lua-periphery/src/lua_spi.c b/lua-periphery/src/lua_spi.c
+index a4735a2..0c1e583 100644
+--- a/lua-periphery/src/lua_spi.c
++++ b/lua-periphery/src/lua_spi.c
+@@ -13,7 +13,7 @@
+ #include <stdint.h>
+ #include <errno.h>
+ 
+-#include <c-periphery/src/spi.h>
++#include <c-periphery/spi.h>
+ #include "lua_periphery.h"
+ #include "lua_51compat.h"
+ 
+-- 
+2.1.0
+
diff --git a/package/lua-periphery/Config.in b/package/lua-periphery/Config.in
index de5a716..df0546f 100644
--- a/package/lua-periphery/Config.in
+++ b/package/lua-periphery/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LUA_PERIPHERY
 	bool "lua-periphery"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	select BR2_PACKAGE_C_PERIPHERY
 	help
 	  A library for GPIO, SPI, I2C, MMIO, and Serial peripheral I/O
 	  interface access in userspace Linux with Lua.
diff --git a/package/lua-periphery/lua-periphery.mk b/package/lua-periphery/lua-periphery.mk
index 0717a27..99e1dbe 100644
--- a/package/lua-periphery/lua-periphery.mk
+++ b/package/lua-periphery/lua-periphery.mk
@@ -7,6 +7,7 @@
 LUA_PERIPHERY_VERSION_UPSTREAM = 1.0.4
 LUA_PERIPHERY_VERSION = $(LUA_PERIPHERY_VERSION_UPSTREAM)-1
 LUA_PERIPHERY_SUBDIR = lua-periphery
+LUA_PERIPHERY_DEPENDENCIES = c-periphery
 LUA_PERIPHERY_LICENSE = MIT
 LUA_PERIPHERY_LICENSE_FILES = $(LUA_PERIPHERY_SUBDIR)/LICENSE
 
-- 
2.1.0
