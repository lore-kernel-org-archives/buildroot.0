From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 13 Jun 2021 17:42:53 +0200
Subject: [Buildroot] [PATCH] package/lua-lunix: new package
Message-ID: <20210613154253.2878028-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                             |  1 +
 package/lua-lunix/0001-fix-with-uClibc.patch  | 26 +++++++++++++++++++
 package/lua-lunix/Config.in                   |  6 +++++
 package/lua-lunix/lua-lunix.hash              |  3 +++
 package/lua-lunix/lua-lunix.mk                | 14 ++++++++++
 .../testing/tests/package/test_lua_lunix.py   | 25 ++++++++++++++++++
 6 files changed, 75 insertions(+)
 create mode 100644 package/lua-lunix/0001-fix-with-uClibc.patch
 create mode 100644 package/lua-lunix/Config.in
 create mode 100644 package/lua-lunix/lua-lunix.hash
 create mode 100644 package/lua-lunix/lua-lunix.mk
 create mode 100644 support/testing/tests/package/test_lua_lunix.py

diff --git a/package/Config.in b/package/Config.in
index c59833700..c3fcfda74 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -674,6 +674,7 @@ menu "Lua libraries/modules"
 	source "package/lua-livr-extra/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
 	source "package/lua-lunitx/Config.in"
+	source "package/lua-lunix/Config.in"
 	source "package/lua-lyaml/Config.in"
 	source "package/lua-markdown/Config.in"
 	source "package/lua-messagepack/Config.in"
diff --git a/package/lua-lunix/0001-fix-with-uClibc.patch b/package/lua-lunix/0001-fix-with-uClibc.patch
new file mode 100644
index 000000000..f95de1b2e
--- /dev/null
+++ b/package/lua-lunix/0001-fix-with-uClibc.patch
@@ -0,0 +1,26 @@
+From ee41d97a80b978f54941ac6857c00b8a8f28de24 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sun, 6 Jun 2021 17:55:06 +0200
+Subject: [PATCH] fix with uClibc
+
+there is no sys_siglist
+---
+ lunix-rel-20170920/src/unix.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lunix-rel-20170920/src/unix.c b/lunix-rel-20170920/src/unix.c
+index 5f3a70a..e561ab2 100644
+--- a/lunix-rel-20170920/src/unix.c
++++ b/lunix-rel-20170920/src/unix.c
+@@ -438,7 +438,7 @@
+ #endif
+ 
+ #ifndef HAVE_SYS_SIGLIST
+-#define HAVE_SYS_SIGLIST (!MUSL_MAYBE && !__sun && !_AIX)
++#define HAVE_SYS_SIGLIST (!MUSL_MAYBE && !__sun && !_AIX && !__UCLIBC__)
+ #endif
+ 
+ #ifndef HAVE_UNLINKAT
+-- 
+2.30.2
+
diff --git a/package/lua-lunix/Config.in b/package/lua-lunix/Config.in
new file mode 100644
index 000000000..ca9325a15
--- /dev/null
+++ b/package/lua-lunix/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_LUNIX
+	bool "lua-lunix"
+	help
+	  lunix is a bindings library module to common Unix system APIs.
+
+	  http://25thandclement.com/~william/projects/lunix.html
diff --git a/package/lua-lunix/lua-lunix.hash b/package/lua-lunix/lua-lunix.hash
new file mode 100644
index 000000000..3cbf3481b
--- /dev/null
+++ b/package/lua-lunix/lua-lunix.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256 4a4007b394ae884e18e9d0319ea584e8b4a682d7bf8fa5b99c7eea9baf1e5ed6  lunix-20170920-1.src.rock
+sha256 9b74be104d59caa45bf3321ebe771f9cc7874209261a93f1cf971ceca44fbe03  lunix-rel-20170920/LICENSE
diff --git a/package/lua-lunix/lua-lunix.mk b/package/lua-lunix/lua-lunix.mk
new file mode 100644
index 000000000..28cb2dc41
--- /dev/null
+++ b/package/lua-lunix/lua-lunix.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-lunix
+#
+################################################################################
+
+LUA_LUNIX_VERSION_UPSTREAM = 20170920
+LUA_LUNIX_VERSION = $(LUA_LUNIX_VERSION_UPSTREAM)-1
+LUA_LUNIX_NAME_UPSTREAM = lunix
+LUA_LUNIX_SUBDIR = lunix-rel-$(LUA_LUNIX_VERSION_UPSTREAM)
+LUA_LUNIX_LICENSE = MIT
+LUA_LUNIX_LICENSE_FILES = $(LUA_LUNIX_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))
diff --git a/support/testing/tests/package/test_lua_lunix.py b/support/testing/tests/package/test_lua_lunix.py
new file mode 100644
index 000000000..ae0e3b260
--- /dev/null
+++ b/support/testing/tests/package/test_lua_lunix.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLunix(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_LUNIX=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("unix")
+
+
+class TestLuajitLunix(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_LUNIX=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("unix")
-- 
2.30.2
