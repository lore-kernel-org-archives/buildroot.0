From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 30 Jun 2019 20:24:40 +0200
Subject: [Buildroot] [PATCH] package/luasyslog: bump to version 2.2.0 (fork)
Message-ID: <20190630182440.2841-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this fork has a good support for Lua 5.3

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luasyslog/0001-compat-Lua-5.3.patch   | 52 -------------------
 .../luasyslog/0001-remove-AX_LUA_LIBS.patch   | 27 ++++++++++
 package/luasyslog/Config.in                   |  4 +-
 package/luasyslog/luasyslog.hash              |  6 +--
 package/luasyslog/luasyslog.mk                |  9 ++--
 .../testing/tests/package/test_luasyslog.py   |  2 +
 6 files changed, 40 insertions(+), 60 deletions(-)
 delete mode 100644 package/luasyslog/0001-compat-Lua-5.3.patch
 create mode 100644 package/luasyslog/0001-remove-AX_LUA_LIBS.patch

diff --git a/package/luasyslog/0001-compat-Lua-5.3.patch b/package/luasyslog/0001-compat-Lua-5.3.patch
deleted file mode 100644
index 6c2c1e591..000000000
--- a/package/luasyslog/0001-compat-Lua-5.3.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From b3347655bd31c4f1fd9e101787a84da0c98f2f8f Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Wed, 12 Jun 2019 20:47:18 +0200
-Subject: [PATCH] compat Lua 5.3
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
----
- lsyslog.c  | 8 ++++++--
- syslog.lua | 4 ++--
- 2 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/luasyslog-1.0.0/lsyslog.c b/luasyslog-1.0.0/lsyslog.c
-index cd512dc..57121da 100644
---- a/luasyslog-1.0.0/lsyslog.c
-+++ b/luasyslog-1.0.0/lsyslog.c
-@@ -136,7 +136,7 @@
- 	lua_settable(L, -3);
- }
- 
--static const struct luaL_reg lsysloglib[] =
-+static const struct luaL_Reg lsysloglib[] =
- {
- 	{"open", lsyslog_open},
- 	{"close", lsyslog_close},
-@@ -146,7 +146,11 @@
- 
- int luaopen_lsyslog(lua_State *L)
- {
--	luaL_openlib(L, "lsyslog", lsysloglib, 0);
-+#if LUA_VERSION_NUM >= 502
-+	luaL_newlib(L, lsysloglib);
-+#else
-+	luaL_register(L, "lsyslog", lsysloglib);
-+#endif
- 
- 	set_info(L);
- 	return 1;
-diff --git a/luasyslog-1.0.0/syslog.lua b/luasyslog-1.0.0/syslog.lua
-index febda00..f4d98ec 100644
---- a/luasyslog-1.0.0/syslog.lua
-+++ b/luasyslog-1.0.0/syslog.lua
-@@ -1,5 +1,5 @@
--require"logging"
--require"lsyslog"
-+local logging = require"logging"
-+local lsyslog = require"lsyslog"
- 
- local convert =
- {
--- 
-2.20.1
-
diff --git a/package/luasyslog/0001-remove-AX_LUA_LIBS.patch b/package/luasyslog/0001-remove-AX_LUA_LIBS.patch
new file mode 100644
index 000000000..23569ff5b
--- /dev/null
+++ b/package/luasyslog/0001-remove-AX_LUA_LIBS.patch
@@ -0,0 +1,27 @@
+From 84296c5eae651b45ebfa233199b7ddc009a5dad3 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Fri, 21 Jun 2019 14:58:54 +0200
+Subject: [PATCH] remove AX_LUA_LIBS
+
+AX_LUA_LIBS fails with LuaJIT
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9ac6c95..d7fc518 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -32,7 +32,6 @@ AC_PATH_PROG([LUAROCKS], [luarocks], [:])
+ AX_PROG_LUA([5.1],[6.0])
+ 
+ dnl Check for libraries
+-AX_LUA_LIBS
+ 
+ dnl Check for functions
+ AC_HEADER_STDC
+-- 
+2.20.1
+
diff --git a/package/luasyslog/Config.in b/package/luasyslog/Config.in
index 814e7ad37..ca098cb4f 100644
--- a/package/luasyslog/Config.in
+++ b/package/luasyslog/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_LUASYSLOG
 	bool "luasyslog"
 	select BR2_PACKAGE_LUALOGGING # runtime
 	help
-	  Syslog logging for Lua.
+	  syslog appender for LuaLogging.
 
-	  http://lua.net-core.org/sputnik.lua?p=Telesto:About
+	  https://github.com/ntd/luasyslog
diff --git a/package/luasyslog/luasyslog.hash b/package/luasyslog/luasyslog.hash
index 02a0d838a..bcb6a7e02 100644
--- a/package/luasyslog/luasyslog.hash
+++ b/package/luasyslog/luasyslog.hash
@@ -1,3 +1,3 @@
-# computed by luarocks/buildroot
-sha256 e807a614b77108ca25aeed061faf73b7ef00708f5bfebb9e4f03d27f3d453e7b  luasyslog-1.0.0-2.src.rock
-sha256 c1ed5cbf3fc02836d3fc5d2354818a5c151c1cd75fcc0bf240dbf8d2b36a3c1d  luasyslog-1.0.0/COPYING
+# Locally computed
+sha256 7f7dad64117407f2484ff5b53e90804f923a99fcbde5872e54f6aba53f482da0  luasyslog-2.2.0.tar.gz
+sha256 833457938f5155e65dabda12a5c9d4b6fd7fb92dd7ead584c1c30cfb0c84adf4  COPYING
diff --git a/package/luasyslog/luasyslog.mk b/package/luasyslog/luasyslog.mk
index 1d88b6056..aa57f9425 100644
--- a/package/luasyslog/luasyslog.mk
+++ b/package/luasyslog/luasyslog.mk
@@ -4,8 +4,11 @@
 #
 ################################################################################
 
-LUASYSLOG_VERSION = 1.0.0-2
+LUASYSLOG_VERSION = 2.2.0
+LUASYSLOG_SITE = $(call github,ntd,luasyslog,$(LUASYSLOG_VERSION))
+LUASUSLOG_DEPENDENCIES = luainterpreter
 LUASYSLOG_LICENSE = MIT
-LUASYSLOG_LICENSE_FILES = $(LUASYSLOG_SUBDIR)/COPYING
+LUASYSLOG_LICENSE_FILES = COPYING
+LUASYSLOG_AUTORECONF = YES
 
-$(eval $(luarocks-package))
+$(eval $(autotools-package))
diff --git a/support/testing/tests/package/test_luasyslog.py b/support/testing/tests/package/test_luasyslog.py
index 4eb5402d0..158b95cb0 100644
--- a/support/testing/tests/package/test_luasyslog.py
+++ b/support/testing/tests/package/test_luasyslog.py
@@ -10,6 +10,7 @@ class TestLuaLuasyslog(TestLuaBase):
 
     def test_run(self):
         self.login()
+        self.module_test("lsyslog")
         self.module_test("logging.syslog")
 
 
@@ -22,4 +23,5 @@ class TestLuajitLuasyslog(TestLuaBase):
 
     def test_run(self):
         self.login()
+        self.module_test("lsyslog")
         self.module_test("logging.syslog")
-- 
2.20.1
