From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 24 May 2020 18:48:37 -0600
Subject: [Buildroot] [PATCH v3 1/9] package/luainterpreter: add abi version
 options
Message-ID: <20200525004845.3019642-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since a number of packages depend on specific ABI version that are
provided by lua and luajit packages we should have a kconfig variable
that those packages can depend on.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/lua/Config.in            | 2 ++
 package/luainterpreter/Config.in | 6 ++++++
 package/luajit/Config.in         | 1 +
 3 files changed, 9 insertions(+)

diff --git a/package/lua/Config.in b/package/lua/Config.in
index ce2e439f63..c5ac580267 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -19,9 +19,11 @@ choice
 	  Select the version of Lua API/ABI you wish to use.
 
 config BR2_PACKAGE_LUA_5_1
+	select BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	bool "Lua 5.1.x"
 
 config BR2_PACKAGE_LUA_5_3
+	select BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_3
 	bool "Lua 5.3.x"
 
 endchoice
diff --git a/package/luainterpreter/Config.in b/package/luainterpreter/Config.in
index 7bc54d862f..a5973063b4 100644
--- a/package/luainterpreter/Config.in
+++ b/package/luainterpreter/Config.in
@@ -8,6 +8,12 @@ config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
 	string
 
+config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
+	bool
+
+config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_3
+	bool
+
 config BR2_PACKAGE_PROVIDES_HOST_LUAINTERPRETER
 	string
 	default "host-lua"
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index f4d6001586..8cfa85684e 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_LUAJIT
 	# binaries, so check if that option is supported. See
 	# luajit.mk for details.
 	select BR2_PACKAGE_HAS_LUAINTERPRETER
+	select BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_ARCH_IS_64
 	help
 	  LuaJIT implements the full set of language features defined
-- 
2.25.1
