From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 22:32:56 +0200
Subject: [Buildroot] [PATCH 5/9 v2] package/luainterpreter: gather the ABI
 version string defaults
In-Reply-To: <cover.1595881971.git.yann.morin.1998@free.fr>
References: <cover.1595881971.git.yann.morin.1998@free.fr>
Message-ID: <5a439727e7de7b0faf0fd57fd33ef76abc19a767.1595881971.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we have booleans to represent the Lua ABI version, and that
every Lua providers do select those, there is no longer any reason
for them to also handle the ABI version string anymore.

Move the defaults into the common luainterpreter.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/Config.in            | 4 ----
 package/luainterpreter/Config.in | 2 ++
 package/luajit/Config.in         | 3 ---
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/lua/Config.in b/package/lua/Config.in
index c267cb6faf..d6ddc708e7 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -28,10 +28,6 @@ config BR2_PACKAGE_LUA_5_3
 
 endchoice
 
-config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
-	default "5.1"	if BR2_PACKAGE_LUA_5_1
-	default "5.3"	if BR2_PACKAGE_LUA_5_3
-
 if BR2_PACKAGE_LUA_5_3
 config BR2_PACKAGE_LUA_32BITS
 	bool "Use 32 bit numbers"
diff --git a/package/luainterpreter/Config.in b/package/luainterpreter/Config.in
index a5973063b4..d35b35ff31 100644
--- a/package/luainterpreter/Config.in
+++ b/package/luainterpreter/Config.in
@@ -7,6 +7,8 @@ config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 
 config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
 	string
+	default "5.1" if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
+	default "5.3" if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_3
 
 config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	bool
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 8cfa85684e..eb3eb01998 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -34,9 +34,6 @@ if BR2_PACKAGE_LUAJIT
 config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 	default "luajit"
 
-config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
-	default "5.1"
-
 config BR2_PACKAGE_LUAJIT_COMPAT52
 	bool "Lua 5.2 compatibility"
 	help
-- 
2.20.1
