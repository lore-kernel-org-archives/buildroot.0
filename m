From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  7 Oct 2019 06:02:50 +0200
Subject: [Buildroot] [PATCH] package/lua-sdl2: fix install path
Message-ID: <20191007040250.23281-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WITH_LUAVER must be set with a value depending of Lua interpreter,
by this way, the module is installed in the correct location

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-sdl2/lua-sdl2.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/lua-sdl2/lua-sdl2.mk b/package/lua-sdl2/lua-sdl2.mk
index a1e54bfde..e0ed0b7e2 100644
--- a/package/lua-sdl2/lua-sdl2.mk
+++ b/package/lua-sdl2/lua-sdl2.mk
@@ -10,7 +10,17 @@ LUA_SDL2_LICENSE = ISC
 LUA_SDL2_LICENSE_FILES = LICENSE
 LUA_SDL2_DEPENDENCIES = luainterpreter sdl2
 
-LUA_SDL2_CONF_OPTS += -DWITH_LUAVER=user -DLUA_INCLUDE_DIR=$(STAGING_DIR)/usr/include
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+LUA_SDL2_LUAVER=JIT
+else
+ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+LUA_SDL2_LUAVER=53
+else
+LUA_SDL2_LUAVER=51
+endif
+endif
+
+LUA_SDL2_CONF_OPTS += -DWITH_LUAVER=$(LUA_SDL2_LUAVER) -DLUA_INCLUDE_DIR=$(STAGING_DIR)/usr/include
 
 ifeq ($(BR2_PACKAGE_SDL2_IMAGE),y)
 LUA_SDL2_DEPENDENCIES += sdl2_image
-- 
2.20.1
