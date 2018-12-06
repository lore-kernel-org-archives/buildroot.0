From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 23:08:34 +0100
Subject: [Buildroot] [git commit] package/prosody: fix runtime dependencies
Message-ID: <20181206220522.DD08B85A8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=768a9b9dd7ef0d2e1bc35e41352f0df6daf59d46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

prosody is not available for Lua 5.3, but only 5.1 & 5.2.

prosody needs the module BitOp which is included in LuaJIT

note: the actual config is working only LuaJIT
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/prosody/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/prosody/Config.in b/package/prosody/Config.in
index 133b0b1343..c32ca20e23 100644
--- a/package/prosody/Config.in
+++ b/package/prosody/Config.in
@@ -2,7 +2,9 @@ config BR2_PACKAGE_PROSODY
 	bool "prosody"
 	depends on BR2_USE_MMU # fork
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on !BR2_PACKAGE_LUA_5_3
 	depends on !BR2_STATIC_LIBS # luaexpat, luasec, luasocket, luafilesystem
+	select BR2_PACKAGE_LUABITOP if !BR2_PACKAGE_LUAJIT # runtime
 	select BR2_PACKAGE_LUAEXPAT # runtime
 	select BR2_PACKAGE_LUASEC # runtime
 	select BR2_PACKAGE_LUASOCKET # runtime
@@ -19,3 +21,6 @@ config BR2_PACKAGE_PROSODY
 comment "prosody needs the lua interpreter, dynamic library"
 	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
+
+comment "prosody needs a Lua 5.1/5.2 interpreter"
+	depends on BR2_PACKAGE_LUA_5_3
