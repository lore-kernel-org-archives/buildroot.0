From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 23:27:15 +0200
Subject: [Buildroot] [git commit branch/next] lua-sdl2: new package
Message-ID: <20170531213303.016F1827C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3703edb516145ffdfab5be9f705e54256bb51efd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: add missing !BR2_STATIC_LIBS dependency, inherited from SDL2.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 +
 package/lua-sdl2/Config.in     | 16 ++++++++++++++++
 package/lua-sdl2/lua-sdl2.hash |  2 ++
 package/lua-sdl2/lua-sdl2.mk   | 13 +++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d6b9901..e1007cc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -567,6 +567,7 @@ menu "Lua libraries/modules"
 	source "package/lua-messagepack/Config.in"
 	source "package/lua-msgpack-native/Config.in"
 	source "package/lua-periphery/Config.in"
+	source "package/lua-sdl2/Config.in"
 	source "package/lua-testmore/Config.in"
 	source "package/luabitop/Config.in"
 	source "package/luacrypto/Config.in"
diff --git a/package/lua-sdl2/Config.in b/package/lua-sdl2/Config.in
new file mode 100644
index 0000000..f716dba
--- /dev/null
+++ b/package/lua-sdl2/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LUA_SDL2
+	bool "lua-sdl2"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_SDL2
+	select BR2_PACKAGE_SDL2_IMAGE
+	select BR2_PACKAGE_SDL2_MIXER
+	select BR2_PACKAGE_SDL2_NET
+	select BR2_PACKAGE_SDL2_TTF
+	help
+	  Lua-SDL2 is a pure C binding of SDL2 to Lua 5.1, Lua 5.2,
+	  Lua 5.3, and LuaJIT.
+
+	  https://github.com/Tangent128/luasdl2
+
+comment "lua-sdl2 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/lua-sdl2/lua-sdl2.hash b/package/lua-sdl2/lua-sdl2.hash
new file mode 100644
index 0000000..56a2eed
--- /dev/null
+++ b/package/lua-sdl2/lua-sdl2.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	36b626485529f318f284e0cc0c806d5a425fbde4e1e6329d4d5ee9f495ecff62  lua-sdl2-2.0.5.6.0-1.src.rock
diff --git a/package/lua-sdl2/lua-sdl2.mk b/package/lua-sdl2/lua-sdl2.mk
new file mode 100644
index 0000000..adb3723
--- /dev/null
+++ b/package/lua-sdl2/lua-sdl2.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-sdl2
+#
+################################################################################
+
+LUA_SDL2_VERSION = 2.0.5.6.0-1
+LUA_SDL2_LICENSE = ISC
+LUA_SDL2_SUBDIR = luasdl2-2.0.5-6.0
+LUA_SDL2_LICENSE_FILES = $(LUA_SDL2_SUBDIR)/LICENSE
+LUA_SDL2_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer sdl2_net sdl2_ttf
+
+$(eval $(luarocks-package))
