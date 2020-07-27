From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 22:32:55 +0200
Subject: [Buildroot] [PATCH 4/9 v2] package/luainterpreter: add abi version
 options
In-Reply-To: <cover.1595881971.git.yann.morin.1998@free.fr>
References: <cover.1595881971.git.yann.morin.1998@free.fr>
Message-ID: <97cfd0dc9f5ff68ae37a9c7b5e6857f8c8b1ffb2.1595881971.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Since a number of packages depend on specific ABI version that are
provided by lua and luajit packages we should have a kconfig variable
that those packages can depend on.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lua/Config.in            | 2 ++
 package/luainterpreter/Config.in | 6 ++++++
 package/luajit/Config.in         | 1 +
 3 files changed, 9 insertions(+)

diff --git a/package/lua/Config.in b/package/lua/Config.in
index ce2e439f63..c267cb6faf 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -20,9 +20,11 @@ choice
 
 config BR2_PACKAGE_LUA_5_1
 	bool "Lua 5.1.x"
+	select BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 
 config BR2_PACKAGE_LUA_5_3
 	bool "Lua 5.3.x"
+	select BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_3
 
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
2.20.1
