From: Vanya Sergeev <vsergeev@gmail.com>
Date: Wed, 27 May 2015 16:26:11 -0700
Subject: [Buildroot] [PATCH 1/3] lua-periphery: bump version to 1.0.5,
	remove dependency on c-periphery
Message-ID: <1432769173-30319-1-git-send-email-vsergeev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new version of the lua-periphery LuaRocks package handles fetching the
c-periphery dependency, so that it no longer needs to be cloned during the
lua-periphery build process. Consequently, this removes the need for selecting
c-periphery as a package dependency in buildroot and the need for the patches
that modify lua-periphery to be built against an external c-periphery.

Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
---
 ...01-Makefile-don-t-clone-build-c-periphery.patch | 32 --------
 package/lua-periphery/0002-Fix-include-paths.patch | 89 ----------------------
 package/lua-periphery/Config.in                    |  1 -
 package/lua-periphery/lua-periphery.mk             |  4 +-
 4 files changed, 2 insertions(+), 124 deletions(-)
 delete mode 100644 package/lua-periphery/0001-Makefile-don-t-clone-build-c-periphery.patch
 delete mode 100644 package/lua-periphery/0002-Fix-include-paths.patch

diff --git a/package/lua-periphery/0001-Makefile-don-t-clone-build-c-periphery.patch b/package/lua-periphery/0001-Makefile-don-t-clone-build-c-periphery.patch
deleted file mode 100644
index f6d3f27..0000000
--- a/package/lua-periphery/0001-Makefile-don-t-clone-build-c-periphery.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 395bb4cb37612a4ac94346531b13ff0e901ed05e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 5 May 2015 23:59:17 +0200
-Subject: [PATCH 1/2] Makefile: don't clone/build c-periphery
-
-This patch adjusts lua-periphery Makefile to not clone and build the
-c-periphery library by itself, and instead use the already available
-c-periphery library.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lua-periphery/Makefile b/lua-periphery/Makefile
-index bed9b32..a4c68eb 100644
---- a/lua-periphery/Makefile
-+++ b/lua-periphery/Makefile
-@@ -36,8 +36,8 @@ install:
- 
- ###########################################################################
- 
--$(LIB): $(C_PERIPHERY_LIB) $(SRCS)
--	$(CC) $(CFLAGS) $(LDFLAGS) $(SRCS) $(C_PERIPHERY_LIB) -o $@
-+$(LIB): $(SRCS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) $(SRCS) -lc-periphery -o $@
- 
- $(C_PERIPHERY_LIB): $(C_PERIPHERY)/Makefile
- 	cd $(C_PERIPHERY); $(MAKE)
--- 
-2.1.0
-
diff --git a/package/lua-periphery/0002-Fix-include-paths.patch b/package/lua-periphery/0002-Fix-include-paths.patch
deleted file mode 100644
index ede4e30..0000000
--- a/package/lua-periphery/0002-Fix-include-paths.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From b0a48721c48e0857458eb46b36ae575281412c64 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 16 May 2015 15:12:30 +0200
-Subject: [PATCH 2/2] Fix include paths for c-periphery
-
-The lua-periphery source code is designed to have c-periphery cloned
-and built internally, so the include paths are written with this
-assumption.
-
-This commit adjusts the header paths of the c-periphery headers to be
-compatible with a separated build/installation of c-periphery.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/lua_gpio.c   | 2 +-
- src/lua_i2c.c    | 2 +-
- src/lua_mmio.c   | 2 +-
- src/lua_serial.c | 2 +-
- src/lua_spi.c    | 2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/lua-periphery/src/lua_gpio.c b/lua-periphery/src/lua_gpio.c
-index cfeb03d..711d7e1 100644
---- a/lua-periphery/src/lua_gpio.c
-+++ b/lua-periphery/src/lua_gpio.c
-@@ -13,7 +13,7 @@
- #include <stdint.h>
- #include <errno.h>
- 
--#include <c-periphery/src/gpio.h>
-+#include <c-periphery/gpio.h>
- #include "lua_periphery.h"
- #include "lua_51compat.h"
- 
-diff --git a/lua-periphery/src/lua_i2c.c b/lua-periphery/src/lua_i2c.c
-index ebdab79..7b38f6f 100644
---- a/lua-periphery/src/lua_i2c.c
-+++ b/lua-periphery/src/lua_i2c.c
-@@ -13,7 +13,7 @@
- #include <stdint.h>
- #include <errno.h>
- 
--#include <c-periphery/src/i2c.h>
-+#include <c-periphery/i2c.h>
- #include "lua_periphery.h"
- #include "lua_51compat.h"
- 
-diff --git a/lua-periphery/src/lua_mmio.c b/lua-periphery/src/lua_mmio.c
-index 5ab1188..7dd399b 100644
---- a/lua-periphery/src/lua_mmio.c
-+++ b/lua-periphery/src/lua_mmio.c
-@@ -13,7 +13,7 @@
- #include <stdint.h>
- #include <errno.h>
- 
--#include <c-periphery/src/mmio.h>
-+#include <c-periphery/mmio.h>
- #include "lua_periphery.h"
- #include "lua_51compat.h"
- 
-diff --git a/lua-periphery/src/lua_serial.c b/lua-periphery/src/lua_serial.c
-index 7d332af..85afa4a 100644
---- a/lua-periphery/src/lua_serial.c
-+++ b/lua-periphery/src/lua_serial.c
-@@ -13,7 +13,7 @@
- #include <stdint.h>
- #include <errno.h>
- 
--#include <c-periphery/src/serial.h>
-+#include <c-periphery/serial.h>
- #include "lua_periphery.h"
- #include "lua_51compat.h"
- 
-diff --git a/lua-periphery/src/lua_spi.c b/lua-periphery/src/lua_spi.c
-index a4735a2..0c1e583 100644
---- a/lua-periphery/src/lua_spi.c
-+++ b/lua-periphery/src/lua_spi.c
-@@ -13,7 +13,7 @@
- #include <stdint.h>
- #include <errno.h>
- 
--#include <c-periphery/src/spi.h>
-+#include <c-periphery/spi.h>
- #include "lua_periphery.h"
- #include "lua_51compat.h"
- 
--- 
-2.1.0
-
diff --git a/package/lua-periphery/Config.in b/package/lua-periphery/Config.in
index df0546f..de5a716 100644
--- a/package/lua-periphery/Config.in
+++ b/package/lua-periphery/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LUA_PERIPHERY
 	bool "lua-periphery"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
-	select BR2_PACKAGE_C_PERIPHERY
 	help
 	  A library for GPIO, SPI, I2C, MMIO, and Serial peripheral I/O
 	  interface access in userspace Linux with Lua.
diff --git a/package/lua-periphery/lua-periphery.mk b/package/lua-periphery/lua-periphery.mk
index 99e1dbe..f820408 100644
--- a/package/lua-periphery/lua-periphery.mk
+++ b/package/lua-periphery/lua-periphery.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LUA_PERIPHERY_VERSION_UPSTREAM = 1.0.4
-LUA_PERIPHERY_VERSION = $(LUA_PERIPHERY_VERSION_UPSTREAM)-1
+LUA_PERIPHERY_VERSION_UPSTREAM = 1.0.5
+LUA_PERIPHERY_VERSION = $(LUA_PERIPHERY_VERSION_UPSTREAM)-2
 LUA_PERIPHERY_SUBDIR = lua-periphery
 LUA_PERIPHERY_DEPENDENCIES = c-periphery
 LUA_PERIPHERY_LICENSE = MIT
-- 
2.4.1
