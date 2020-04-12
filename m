From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 14:48:18 +0200
Subject: [Buildroot] [git commit] package/lua: allow to load native modules
 from host-lua
Message-ID: <20200412123416.4C1CA8E66B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b98e8e6f50b6ecf6939f7c05c1796edcb0c0134f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to allow the host Lua interpreter to load native modules, we
need to enable building liblua.so, by switching from BUILDMODE=static
to BUILDMODE=dynamic.

In addition, since some modules need Lua 5.2 functions, we build the
host Lua interpreter with -DLUA_COMPAT_5_2, when the Lua interpreter
version is 5.3. Note that we are testing the target option
BR2_PACKAGE_LUA_5_3, but this is OK: the host and target Lua
interpreters have the same version.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua/lua.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 8a5f9258a0..2ff2fdf754 100644
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
