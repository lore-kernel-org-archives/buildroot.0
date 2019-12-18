From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Dec 2019 22:20:10 +0100
Subject: [Buildroot] [git commit] package/lua-msgpack-native: fix build with
 moonjit
Message-ID: <20191218211132.2A4628C5FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01fea71cc1a08d854341bfb6117efe8ca0dbb19c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

compatibility with Lua 5.0 was removed in LuaJIT/moonjit 2.1.x
(Lua 5.1.x and LuaJIT 2.0.x have this compatibility)

Fixes:

  http://autobuild.buildroot.org/results/4e428df01def186cb034a1774f6c00e2e7c9468c/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: add comment on .mk file]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-msgpack-native/lua-msgpack-native.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index acd3a0e1c9..4a7e672cfa 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -10,8 +10,12 @@ LUA_MSGPACK_NATIVE_DEPENDENCIES = luainterpreter
 LUA_MSGPACK_NATIVE_LICENSE = Apache-2.0
 LUA_MSGPACK_NATIVE_LICENSE_FILES = LICENSE.txt
 
+# lua-msgpack-native uses the old Lua 5.0 API with luaL_reg, but it is
+# no longer provided by LuaJit 2.1, so we have to alias luaL_reg to
+# luaL_Reg.
 define LUA_MSGPACK_NATIVE_BUILD_CMDS
-	$(TARGET_CC) $(TARGET_CFLAGS) -fPIC -shared -o $(@D)/msgpack.so $(@D)/mp.c
+	$(TARGET_CC) $(TARGET_CFLAGS) -DluaL_reg=luaL_Reg -fPIC \
+		-shared -o $(@D)/msgpack.so $(@D)/mp.c
 endef
 
 define LUA_MSGPACK_NATIVE_INSTALL_TARGET_CMDS
