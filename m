From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 19 Feb 2019 08:24:09 +0100
Subject: [Buildroot] [PATCH] luaexpat: restore getcurrentbytecount (required
 by prosody)
Message-ID: <20190219072409.22957-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fix https://gitlab.com/buildroot.org/buildroot/-/jobs/158295314

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0001-restore-getcurrentbytecount.patch    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/luaexpat/0001-restore-getcurrentbytecount.patch

diff --git a/package/luaexpat/0001-restore-getcurrentbytecount.patch b/package/luaexpat/0001-restore-getcurrentbytecount.patch
new file mode 100644
index 000000000..6cf219267
--- /dev/null
+++ b/package/luaexpat/0001-restore-getcurrentbytecount.patch
@@ -0,0 +1,40 @@
+From 77cb691f781918908dfe34785f00a5ff75d5cc20 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sat, 16 Feb 2019 15:56:00 +0100
+Subject: [PATCH] restore getcurrentbytecount
+
+see https://github.com/tomasguisasola/luaexpat/issues/3
+
+Fetch from: https://github.com/tomasguisasola/luaexpat/commit/0926f2d705109b7d35b721344264b39c1169e0de
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ src/lxplib.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/luaexpat-1.3.3/src/lxplib.c b/luaexpat-1.3.3/src/lxplib.c
+index 7726913..35bec3c 100644
+--- a/luaexpat-1.3.3/src/lxplib.c
++++ b/luaexpat-1.3.3/src/lxplib.c
+@@ -538,11 +538,18 @@ static int lxp_stop (lua_State *L) {
+   return 1;
+ }
+ 
++static int lxp_getcurrentbytecount (lua_State* L) {
++  lxp_userdata *xpu = checkparser(L, 1);
++  lua_pushinteger(L, XML_GetCurrentByteCount(xpu->parser));
++  return 1;
++}
++
+ static const luaL_Reg lxp_meths[] = {
+   {"parse", lxp_parse},
+   {"close", lxp_close},
+   {"__gc", parser_gc},
+   {"pos", lxp_pos},
++  {"getcurrentbytecount", lxp_getcurrentbytecount},
+   {"setencoding", lxp_setencoding},
+   {"getcallbacks", getcallbacks},
+   {"getbase", getbase},
+-- 
+2.17.1
+
-- 
2.17.1
