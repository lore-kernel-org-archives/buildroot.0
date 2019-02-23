From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Feb 2019 17:00:55 +0100
Subject: [Buildroot] [git commit] package/luaexpat: restore
 getcurrentbytecount, required by prosody
Message-ID: <20190223155909.8CA7A88D9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98cb0faa4c9f78b817df7ed0182925fdde1f17ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/158295314

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-restore-getcurrentbytecount.patch         | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/luaexpat/0001-restore-getcurrentbytecount.patch b/package/luaexpat/0001-restore-getcurrentbytecount.patch
new file mode 100644
index 0000000000..6cf2192678
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
