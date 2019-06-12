From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 12 Jun 2019 21:09:28 +0200
Subject: [Buildroot] [PATCH] package/luasyslog: new package
Message-ID: <20190612190928.30403-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                             |  1 +
 package/luasyslog/0001-compat-Lua-5.3.patch   | 52 +++++++++++++++++++
 package/luasyslog/Config.in                   |  7 +++
 package/luasyslog/luasyslog.hash              |  3 ++
 package/luasyslog/luasyslog.mk                | 11 ++++
 .../testing/tests/package/test_luasyslog.py   | 25 +++++++++
 6 files changed, 99 insertions(+)
 create mode 100644 package/luasyslog/0001-compat-Lua-5.3.patch
 create mode 100644 package/luasyslog/Config.in
 create mode 100644 package/luasyslog/luasyslog.hash
 create mode 100644 package/luasyslog/luasyslog.mk
 create mode 100644 support/testing/tests/package/test_luasyslog.py

diff --git a/package/Config.in b/package/Config.in
index f592e74a9..d2ba8c483 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -650,6 +650,7 @@ menu "Lua libraries/modules"
 	source "package/luasec/Config.in"
 	source "package/luasocket/Config.in"
 	source "package/luasql-sqlite3/Config.in"
+	source "package/luasyslog/Config.in"
 	source "package/lua-valua/Config.in"
 	source "package/lutok/Config.in"
 	source "package/luv/Config.in"
diff --git a/package/luasyslog/0001-compat-Lua-5.3.patch b/package/luasyslog/0001-compat-Lua-5.3.patch
new file mode 100644
index 000000000..6c2c1e591
--- /dev/null
+++ b/package/luasyslog/0001-compat-Lua-5.3.patch
@@ -0,0 +1,52 @@
+From b3347655bd31c4f1fd9e101787a84da0c98f2f8f Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Wed, 12 Jun 2019 20:47:18 +0200
+Subject: [PATCH] compat Lua 5.3
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ lsyslog.c  | 8 ++++++--
+ syslog.lua | 4 ++--
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/luasyslog-1.0.0/lsyslog.c b/luasyslog-1.0.0/lsyslog.c
+index cd512dc..57121da 100644
+--- a/luasyslog-1.0.0/lsyslog.c
++++ b/luasyslog-1.0.0/lsyslog.c
+@@ -136,7 +136,7 @@
+ 	lua_settable(L, -3);
+ }
+ 
+-static const struct luaL_reg lsysloglib[] =
++static const struct luaL_Reg lsysloglib[] =
+ {
+ 	{"open", lsyslog_open},
+ 	{"close", lsyslog_close},
+@@ -146,7 +146,11 @@
+ 
+ int luaopen_lsyslog(lua_State *L)
+ {
+-	luaL_openlib(L, "lsyslog", lsysloglib, 0);
++#if LUA_VERSION_NUM >= 502
++	luaL_newlib(L, lsysloglib);
++#else
++	luaL_register(L, "lsyslog", lsysloglib);
++#endif
+ 
+ 	set_info(L);
+ 	return 1;
+diff --git a/luasyslog-1.0.0/syslog.lua b/luasyslog-1.0.0/syslog.lua
+index febda00..f4d98ec 100644
+--- a/luasyslog-1.0.0/syslog.lua
++++ b/luasyslog-1.0.0/syslog.lua
+@@ -1,5 +1,5 @@
+-require"logging"
+-require"lsyslog"
++local logging = require"logging"
++local lsyslog = require"lsyslog"
+ 
+ local convert =
+ {
+-- 
+2.20.1
+
diff --git a/package/luasyslog/Config.in b/package/luasyslog/Config.in
new file mode 100644
index 000000000..814e7ad37
--- /dev/null
+++ b/package/luasyslog/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUASYSLOG
+	bool "luasyslog"
+	select BR2_PACKAGE_LUALOGGING # runtime
+	help
+	  Syslog logging for Lua.
+
+	  http://lua.net-core.org/sputnik.lua?p=Telesto:About
diff --git a/package/luasyslog/luasyslog.hash b/package/luasyslog/luasyslog.hash
new file mode 100644
index 000000000..02a0d838a
--- /dev/null
+++ b/package/luasyslog/luasyslog.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256 e807a614b77108ca25aeed061faf73b7ef00708f5bfebb9e4f03d27f3d453e7b  luasyslog-1.0.0-2.src.rock
+sha256 c1ed5cbf3fc02836d3fc5d2354818a5c151c1cd75fcc0bf240dbf8d2b36a3c1d  luasyslog-1.0.0/COPYING
diff --git a/package/luasyslog/luasyslog.mk b/package/luasyslog/luasyslog.mk
new file mode 100644
index 000000000..1d88b6056
--- /dev/null
+++ b/package/luasyslog/luasyslog.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# luasyslog
+#
+################################################################################
+
+LUASYSLOG_VERSION = 1.0.0-2
+LUASYSLOG_LICENSE = MIT
+LUASYSLOG_LICENSE_FILES = $(LUASYSLOG_SUBDIR)/COPYING
+
+$(eval $(luarocks-package))
diff --git a/support/testing/tests/package/test_luasyslog.py b/support/testing/tests/package/test_luasyslog.py
new file mode 100644
index 000000000..4eb5402d0
--- /dev/null
+++ b/support/testing/tests/package/test_luasyslog.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuasyslog(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUASYSLOG=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("logging.syslog")
+
+
+class TestLuajitLuasyslog(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUASYSLOG=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("logging.syslog")
-- 
2.20.1
