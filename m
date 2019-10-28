From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2019 10:56:30 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/lua-sdl2: fix
 install path
Message-ID: <20191028095124.96E2F8B4FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=444135d7c0f8bcca021baee8476193201cbd4977
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

WITH_LUAVER must be set with a value depending of Lua interpreter,
by this way, the module is installed in the correct location

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f2d1ec39e4a86d223de686ed86a48e7b59bd7689)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-sdl2/lua-sdl2.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/lua-sdl2/lua-sdl2.mk b/package/lua-sdl2/lua-sdl2.mk
index a1e54bfded..43fa2668c6 100644
--- a/package/lua-sdl2/lua-sdl2.mk
+++ b/package/lua-sdl2/lua-sdl2.mk
@@ -10,7 +10,15 @@ LUA_SDL2_LICENSE = ISC
 LUA_SDL2_LICENSE_FILES = LICENSE
 LUA_SDL2_DEPENDENCIES = luainterpreter sdl2
 
-LUA_SDL2_CONF_OPTS += -DWITH_LUAVER=user -DLUA_INCLUDE_DIR=$(STAGING_DIR)/usr/include
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+LUA_SDL2_LUAVER = JIT
+else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+LUA_SDL2_LUAVER = 53
+else
+LUA_SDL2_LUAVER = 51
+endif
+
+LUA_SDL2_CONF_OPTS += -DWITH_LUAVER=$(LUA_SDL2_LUAVER) -DLUA_INCLUDE_DIR=$(STAGING_DIR)/usr/include
 
 ifeq ($(BR2_PACKAGE_SDL2_IMAGE),y)
 LUA_SDL2_DEPENDENCIES += sdl2_image
