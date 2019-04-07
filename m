From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 15:12:26 +0200
Subject: [Buildroot] [git commit] package/copas: avoid to load module
 coxpocall with LuaJIT
Message-ID: <20190407130827.81CDA8DE87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fdbe7f9ed765c81c7be80d2bdc38ecd87a66dd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Do-not-load-coxpcall-for-LuaJIT.patch     | 49 ++++++++++++++++++++++
 package/copas/Config.in                            |  2 +-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/package/copas/0001-Do-not-load-coxpcall-for-LuaJIT.patch b/package/copas/0001-Do-not-load-coxpcall-for-LuaJIT.patch
new file mode 100644
index 0000000000..9a7f38c619
--- /dev/null
+++ b/package/copas/0001-Do-not-load-coxpcall-for-LuaJIT.patch
@@ -0,0 +1,49 @@
+From 8d1b5a9b973a9891d676dabf31807eb825d7f262 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Fran=C3=A7ois=20Perrad?= <francois.perrad@gadz.org>
+Date: Wed, 6 Sep 2017 00:00:56 +0200
+Subject: [PATCH] Do not load coxpcall for LuaJIT
+
+* coxpcall is only required with PUC Lua 5.1, but not with LuaJIT
+
+use the same logic as in copas.lua.
+this fixes issue #63.
+
+Fetch from: https://github.com/keplerproject/copas/commit/8d1b5a9b973a9891d676dabf31807eb825d7f262
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ doc/us/index.html   | 5 +++++
+ src/copas/limit.lua | 2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/copas-2_0_2/doc/us/index.html b/doc/us/index.html
+index 1d008c2..c4d85ef 100644
+--- a/copas-2_0_2/doc/us/index.html
++++ b/copas-2_0_2/doc/us/index.html
+@@ -114,6 +114,11 @@ LuaSocket, <a href="http://keplerproject.github.io/coxpcall/">Coxpcall</a> (only
+ <h2><a name="history"></a>History</h2>
+ 
+ <dl class="history">
++    <dt><strong>Copas</strong> [unreleased]</dt>
++	<dd><ul>
++                <li>Fixed: coxpcall dependency in limit.lua #63 (Francois Perrad)</li>
++	</ul></dd>
++
+     <dt><strong>Copas 2.0.2</strong> [2017]</dt>
+ 	<dd><ul>
+ 		<li>Added: <code>copas.running</code> flag</li>
+diff --git a/copas-2_0_2/src/copas/limit.lua b/src/copas/limit.lua
+index ea178be..f0dfe17 100644
+--- a/copas-2_0_2/src/copas/limit.lua
++++ b/copas-2_0_2/src/copas/limit.lua
+@@ -10,7 +10,7 @@ local pack = table.pack or function(...) return {n=select('#',...),...} end
+ local unpack = function(t) return (table.unpack or unpack)(t, 1, t.n or #t) end
+ 
+ local pcall = pcall
+-if _VERSION=="Lua 5.1" then     -- obsolete: only for Lua 5.1 compatibility
++if _VERSION=="Lua 5.1" and not jit then     -- obsolete: only for Lua 5.1 compatibility
+   pcall = require("coxpcall").pcall
+ end
+ 
+-- 
+2.17.1
+
diff --git a/package/copas/Config.in b/package/copas/Config.in
index f4e05ea21d..2de1967102 100644
--- a/package/copas/Config.in
+++ b/package/copas/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_COPAS
 	bool "copas"
-	select BR2_PACKAGE_COXPCALL if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT # runtime
+	select BR2_PACKAGE_COXPCALL if BR2_PACKAGE_LUA_5_1 # runtime
 	select BR2_PACKAGE_LUASOCKET # runtime
 	help
 	  Copas is a dispatcher based on coroutines that can be used
