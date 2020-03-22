From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 22 Mar 2020 09:07:05 +0100
Subject: [Buildroot] [pkg-luarocks v2 4/5] package/lua: allows to load
 native modules from host-lua
In-Reply-To: <20200322080706.19806-1-francois.perrad@gadz.org>
References: <20200322080706.19806-1-francois.perrad@gadz.org>
Message-ID: <20200322080706.19806-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

so, we need a liblua.so
and some modules require Lua 5.2 functions

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/lua.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 8a5f9258a..2ff2fdf75 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -55,6 +55,9 @@ LUA_POST_PATCH_HOOKS += LUA_32BITS_LUACONF
 endif
 
 HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
+ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+HOST_LUA_CFLAGS += -DLUA_COMPAT_5_2
+endif
 HOST_LUA_MYLIBS = -ldl
 
 define LUA_BUILD_CMDS
@@ -74,7 +77,7 @@ define HOST_LUA_BUILD_CMDS
 	CFLAGS="$(HOST_LUA_CFLAGS)" \
 	MYLDFLAGS="$(HOST_LDFLAGS)" \
 	MYLIBS="$(HOST_LUA_MYLIBS)" \
-	BUILDMODE=static \
+	BUILDMODE=dynamic \
 	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
 	sed -e "s/@VERSION@/$(LUA_VERSION)/;s/@ABI@/$(LUAINTERPRETER_ABIVER)/;s/@MYLIBS@/$(HOST_LUA_MYLIBS)/" \
 		package/lua/lua.pc.in > $(@D)/lua.pc
-- 
2.20.1
