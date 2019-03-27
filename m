From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 27 Mar 2019 11:30:47 +0100
Subject: [Buildroot] [PATCH v2] package/lua-gd: new package
Message-ID: <20190327103047.25916-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                             |  1 +
 ...ion-of-LgdImageCreateFromPng-with-GD.patch | 34 +++++++++++++++++++
 package/lua-gd/Config.in                      |  7 ++++
 package/lua-gd/lua-gd.hash                    |  3 ++
 package/lua-gd/lua-gd.mk                      | 27 +++++++++++++++
 5 files changed, 72 insertions(+)
 create mode 100644 package/lua-gd/0001-Protect-declaration-of-LgdImageCreateFromPng-with-GD.patch
 create mode 100644 package/lua-gd/Config.in
 create mode 100644 package/lua-gd/lua-gd.hash
 create mode 100644 package/lua-gd/lua-gd.mk

diff --git a/package/Config.in b/package/Config.in
index 71b062915..2d64965a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -617,6 +617,7 @@ menu "Lua libraries/modules"
 	source "package/lua-ev/Config.in"
 	source "package/lua-fifo/Config.in"
 	source "package/lua-flu/Config.in"
+	source "package/lua-gd/Config.in"
 	source "package/lua-http/Config.in"
 	source "package/lua-iconv/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
diff --git a/package/lua-gd/0001-Protect-declaration-of-LgdImageCreateFromPng-with-GD.patch b/package/lua-gd/0001-Protect-declaration-of-LgdImageCreateFromPng-with-GD.patch
new file mode 100644
index 000000000..17a1fe507
--- /dev/null
+++ b/package/lua-gd/0001-Protect-declaration-of-LgdImageCreateFromPng-with-GD.patch
@@ -0,0 +1,34 @@
+From 78afd1c5f1ceaed05b78ac42c297d87a493295fd Mon Sep 17 00:00:00 2001
+From: spacewander <spacewanderlzx@gmail.com>
+Date: Tue, 31 Oct 2017 15:48:30 +0800
+Subject: [PATCH] Protect declaration of LgdImageCreateFromPng* with GD_PNG
+ feature test macro
+
+If GD_PNG is false, neither LgdImageCreateFromPng nor
+LgdImageCreateFromPngPtr would be implemented. We should avoid declaring
+them too.
+
+Fetch from: https://github.com/ittner/lua-gd/pull/8
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ luagd.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/luagd.c b/luagd.c
+index 9730ff7..98bc03e 100644
+--- a/luagd.c
++++ b/luagd.c
+@@ -2168,8 +2168,10 @@ static const luaL_Reg LgdFunctions[] =
+     { "createFromGif",          LgdImageCreateFromGif },
+     { "createFromGifStr",       LgdImageCreateFromGifPtr },
+ #endif
++#ifdef GD_PNG
+     { "createFromPng",          LgdImageCreateFromPng },
+     { "createFromPngStr",       LgdImageCreateFromPngPtr },
++#endif
+     { "createFromGd",           LgdImageCreateFromGd },
+     { "createFromGdStr",        LgdImageCreateFromGdPtr },
+     { "createFromGd2",          LgdImageCreateFromGd2 },
+-- 
+2.17.1
+
diff --git a/package/lua-gd/Config.in b/package/lua-gd/Config.in
new file mode 100644
index 000000000..dd21bba45
--- /dev/null
+++ b/package/lua-gd/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_GD
+	bool "lua-gd"
+	select BR2_PACKAGE_GD
+	help
+	  GD (graphics library) bindings for Lua.
+
+	  https://ittner.github.io/lua-gd/
diff --git a/package/lua-gd/lua-gd.hash b/package/lua-gd/lua-gd.hash
new file mode 100644
index 000000000..d1bab37bc
--- /dev/null
+++ b/package/lua-gd/lua-gd.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  114f273a64da6ccbf6e0555757b952f84ab8c134416dd7aae1aeb666ca0e964d  lua-gd-e60b13b7977bb3424d7044976ccba5d42c256934.tar.gz
+sha256  b0ca41d88ddb0ca785436d37b08b8f413055755eb6bfd3ea0a6ff3214303aa43  COPYING
diff --git a/package/lua-gd/lua-gd.mk b/package/lua-gd/lua-gd.mk
new file mode 100644
index 000000000..361929ffa
--- /dev/null
+++ b/package/lua-gd/lua-gd.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# lua-gd
+#
+################################################################################
+
+LUA_GD_VERSION = e60b13b7977bb3424d7044976ccba5d42c256934
+LUA_GD_SITE = $(call github,ittner,lua-gd,$(LUA_GD_VERSION))
+LUA_GD_LICENSE = MIT
+LUA_GD_LICENSE_FILES = COPYING
+LUA_GD_DEPENDENCIES = luainterpreter gd
+
+# VERSION follows the scheme described on https://ittner.github.io/lua-gd/manual.html#intro,
+# the current version of the binding is 3.
+define LUA_GD_BUILD_CMDS
+	$(MAKE) -C $(@D) gd.so \
+		GDLIBCONFIG="$(STAGING_DIR)/usr/bin/gdlib-config" \
+		CC=$(TARGET_CC) \
+		CFLAGS="$(TARGET_CFLAGS) -DVERSION=\\\"$(GD_VERSION)r3\\\"" \
+		LFLAGS="-shared -lgd"
+endef
+
+define LUA_GD_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -D $(@D)/gd.so $(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/gd.so
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
