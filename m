From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 14:01:07 +0200
Subject: [Buildroot] [git commit] lua-sdl2: refactor with cmake
Message-ID: <20171022115408.4F9F4807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1dd543b4ae12aa161ac0558555c9f03e82ceffb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

that allows optional dependencies

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas:
 - use "luainterpreter" instead of "lua" in the dependencies
 - replace with a Git formatted patch that doesn't comment code but
   removes it.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-not-reference-host-directory-for-headers.patch | 29 +++++++++++++++++
 package/lua-sdl2/Config.in                         |  4 ---
 package/lua-sdl2/lua-sdl2.hash                     |  2 +-
 package/lua-sdl2/lua-sdl2.mk                       | 36 +++++++++++++++++++---
 4 files changed, 61 insertions(+), 10 deletions(-)

diff --git a/package/lua-sdl2/0001-Do-not-reference-host-directory-for-headers.patch b/package/lua-sdl2/0001-Do-not-reference-host-directory-for-headers.patch
new file mode 100644
index 0000000..f4b06e0
--- /dev/null
+++ b/package/lua-sdl2/0001-Do-not-reference-host-directory-for-headers.patch
@@ -0,0 +1,29 @@
+From 07309a49ad6c3e18c8c84fe54f1fdb9e103c4cc5 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sun, 22 Oct 2017 13:00:01 +0200
+Subject: [PATCH] Do not reference host directory for headers
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ cmake/FindSDL2.cmake | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/cmake/FindSDL2.cmake b/cmake/FindSDL2.cmake
+index 5cf4115..5e17919 100644
+--- a/cmake/FindSDL2.cmake
++++ b/cmake/FindSDL2.cmake
+@@ -73,11 +73,6 @@ find_path(SDL2_INCLUDE_DIR SDL.h
+   PATH_SUFFIXES include/SDL2 include
+ )
+ 
+-# On FreeBSD SDL depends on libiconv and SDL_stdinc.h includes iconv.h, which is
+-# located in ${LOCALBASE}/include. Append {LOCALBASE}/include to
+-# the SDL_INCLUDE_DIR, thus allow to build SDL apps out of box.
+-list(APPEND SDL2_INCLUDE_DIR /usr/local/include)
+-
+ find_library(SDL_LIBRARY_TEMP
+   NAMES SDL2 SDL2-2.0
+   HINTS
+-- 
+2.13.6
+
diff --git a/package/lua-sdl2/Config.in b/package/lua-sdl2/Config.in
index f716dba..65f9e7f 100644
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
index 56a2eed..80aa1cc 100644
--- a/package/lua-sdl2/lua-sdl2.hash
+++ b/package/lua-sdl2/lua-sdl2.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	36b626485529f318f284e0cc0c806d5a425fbde4e1e6329d4d5ee9f495ecff62  lua-sdl2-2.0.5.6.0-1.src.rock
+sha256	cee7875106062fbc00cf8acb3b2738e336e2327df73ede011968cb060c094bfb  lua-sdl2-v2.0.5-6.0.tar.gz
diff --git a/package/lua-sdl2/lua-sdl2.mk b/package/lua-sdl2/lua-sdl2.mk
index adb3723..3137599 100644
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
+LUA_SDL2_DEPENDENCIES = luainterpreter sdl2
 
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
