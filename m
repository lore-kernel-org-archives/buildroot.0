From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 12 Jun 2017 10:21:44 +0200
Subject: [Buildroot] [PATCH] lua-sdl2: refactor with cmake
Message-ID: <20170612082144.25846-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

that allows optional dependencies

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-sdl2/0001-avoid-host-includes.patch | 18 +++++++++++++
 package/lua-sdl2/Config.in                      |  4 ---
 package/lua-sdl2/lua-sdl2.hash                  |  2 +-
 package/lua-sdl2/lua-sdl2.mk                    | 36 +++++++++++++++++++++----
 4 files changed, 50 insertions(+), 10 deletions(-)
 create mode 100644 package/lua-sdl2/0001-avoid-host-includes.patch

diff --git a/package/lua-sdl2/0001-avoid-host-includes.patch b/package/lua-sdl2/0001-avoid-host-includes.patch
new file mode 100644
index 00000000..3274eacb
--- /dev/null
+++ b/package/lua-sdl2/0001-avoid-host-includes.patch
@@ -0,0 +1,18 @@
+avoid host includes
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+diff --git a/cmake/FindSDL2.cmake b/cmake/FindSDL2.cmake
+index 5cf4115..d3f663a 100644
+--- a/cmake/FindSDL2.cmake
++++ b/cmake/FindSDL2.cmake
+@@ -76,7 +76,7 @@
+ # On FreeBSD SDL depends on libiconv and SDL_stdinc.h includes iconv.h, which is
+ # located in ${LOCALBASE}/include. Append {LOCALBASE}/include to
+ # the SDL_INCLUDE_DIR, thus allow to build SDL apps out of box.
+-list(APPEND SDL2_INCLUDE_DIR /usr/local/include)
++# list(APPEND SDL2_INCLUDE_DIR /usr/local/include)
+ 
+ find_library(SDL_LIBRARY_TEMP
+   NAMES SDL2 SDL2-2.0
+-- 
diff --git a/package/lua-sdl2/Config.in b/package/lua-sdl2/Config.in
index f716dba9..65f9e7ff 100644
--- a/package/lua-sdl2/Config.in
+++ b/package/lua-sdl2/Config.in
@@ -2,10 +2,6 @@ config BR2_PACKAGE_LUA_SDL2
 	bool "lua-sdl2"
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_SDL2
-	select BR2_PACKAGE_SDL2_IMAGE
-	select BR2_PACKAGE_SDL2_MIXER
-	select BR2_PACKAGE_SDL2_NET
-	select BR2_PACKAGE_SDL2_TTF
 	help
 	  Lua-SDL2 is a pure C binding of SDL2 to Lua 5.1, Lua 5.2,
 	  Lua 5.3, and LuaJIT.
diff --git a/package/lua-sdl2/lua-sdl2.hash b/package/lua-sdl2/lua-sdl2.hash
index 56a2eeda..80aa1ccc 100644
--- a/package/lua-sdl2/lua-sdl2.hash
+++ b/package/lua-sdl2/lua-sdl2.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	36b626485529f318f284e0cc0c806d5a425fbde4e1e6329d4d5ee9f495ecff62  lua-sdl2-2.0.5.6.0-1.src.rock
+sha256	cee7875106062fbc00cf8acb3b2738e336e2327df73ede011968cb060c094bfb  lua-sdl2-v2.0.5-6.0.tar.gz
diff --git a/package/lua-sdl2/lua-sdl2.mk b/package/lua-sdl2/lua-sdl2.mk
index adb3723c..489c9f65 100644
--- a/package/lua-sdl2/lua-sdl2.mk
+++ b/package/lua-sdl2/lua-sdl2.mk
@@ -4,10 +4,36 @@
 #
 ################################################################################
 
-LUA_SDL2_VERSION = 2.0.5.6.0-1
+LUA_SDL2_VERSION = v2.0.5-6.0
+LUA_SDL2_SITE = $(call github,Tangent128,luasdl2,$(LUA_SDL2_VERSION))
 LUA_SDL2_LICENSE = ISC
-LUA_SDL2_SUBDIR = luasdl2-2.0.5-6.0
-LUA_SDL2_LICENSE_FILES = $(LUA_SDL2_SUBDIR)/LICENSE
-LUA_SDL2_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer sdl2_net sdl2_ttf
+LUA_SDL2_LICENSE_FILES = LICENSE
+LUA_SDL2_DEPENDENCIES = lua sdl2
 
-$(eval $(luarocks-package))
+LUA_SDL2_CONF_OPTS += -DWITH_LUAVER=user -DLUA_INCLUDE_DIR=$(STAGING_DIR)/usr/include
+
+ifeq ($(BR2_PACKAGE_SDL2_IMAGE),y)
+LUA_SDL2_DEPENDENCIES += sdl2_image
+else
+LUA_SDL2_CONF_OPTS += -DWITH_IMAGE=Off
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2_MIXER),y)
+LUA_SDL2_DEPENDENCIES += sdl2_mixer
+else
+LUA_SDL2_CONF_OPTS += -DWITH_MIXER=Off
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2_NET),y)
+LUA_SDL2_DEPENDENCIES += sdl2_net
+else
+LUA_SDL2_CONF_OPTS += -DWITH_NET=Off
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2_TTF),y)
+LUA_SDL2_DEPENDENCIES += sdl2_ttf
+else
+LUA_SDL2_CONF_OPTS += -DWITH_TTF=Off
+endif
+
+$(eval $(cmake-package))
-- 
2.11.0
