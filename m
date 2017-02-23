From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:37 +0100
Subject: [Buildroot] [PATCH 15/25] luaposix: fix runtime by selecting
	"bit32" instead of "bitop"
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-16-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump of luaposix to 33.4.0, it doesn't work anymore at
runtime with LuaJIT or Lua 5.1. This can be tested with the following
defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_LUA=y
BR2_PACKAGE_LUA_5_1=y
BR2_PACKAGE_LUAPOSIX=y

/usr/bin/lua: /usr/share/lua/5.1/posix/init.lua:17: module 'bit32' not found:
...

In older luaposix versions, it would try to load the 'bit' instead of
'bit32' module if LUAVER == 5.1. However, this feature was removed in
33.4.0.

So instead of adding a runtime dependency on luabitop, depend on
lua-bit32.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/luaposix/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index 9707cdeeff..91abcb9e32 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_LUAPOSIX
 	bool "luaposix"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
-	select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA_5_1
-	# LuaBitOp is already included in LuaJIT
+	# "bit32" is included in Lua 5.2+. luajit has an equivalent
+	# "bit" module, but since it has a different name, luaposix
+	# doesn't find it.
+	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
 	help
 	  This is a POSIX binding for LuaJIT, Lua 5.1, 5.2 and 5.3;
 	  like most libraries it simply binds to C APIs on the
-- 
2.11.0
