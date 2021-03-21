From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 21 Mar 2021 16:49:03 +0100
Subject: [Buildroot] [PATCH] package/lua-cffi: new package
Message-ID: <20210321154903.1950636-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                              |  1 +
 package/lua-cffi/Config.in                     | 18 ++++++++++++++++++
 package/lua-cffi/lua-cffi.hash                 |  3 +++
 package/lua-cffi/lua-cffi.mk                   | 14 ++++++++++++++
 support/testing/tests/package/test_lua_cffi.py | 14 ++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/lua-cffi/Config.in
 create mode 100644 package/lua-cffi/lua-cffi.hash
 create mode 100644 package/lua-cffi/lua-cffi.mk
 create mode 100644 support/testing/tests/package/test_lua_cffi.py

diff --git a/package/Config.in b/package/Config.in
index 8fb173540..5b854f898 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -652,6 +652,7 @@ menu "Lua libraries/modules"
 	source "package/lua-basexx/Config.in"
 	source "package/lua-binaryheap/Config.in"
 	source "package/lua-bit32/Config.in"
+	source "package/lua-cffi/Config.in"
 	source "package/lua-cjson/Config.in"
 	source "package/lua-coat/Config.in"
 	source "package/lua-coatpersistent/Config.in"
diff --git a/package/lua-cffi/Config.in b/package/lua-cffi/Config.in
new file mode 100644
index 000000000..fcf3d25e2
--- /dev/null
+++ b/package/lua-cffi/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LUA_CFFI
+	bool "lua-cffi"
+	depends on !BR2_PACKAGE_LUAJIT
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # libffi
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBFFI
+	help
+	  This is a portable C FFI for Lua, based on libffi and aiming
+	  to be mostly compatible with LuaJIT FFI, but written from
+	  scratch.
+
+	  https://github.com/q66/cffi-lua
+
+comment "lua-cffi needs a toolchain w/ C++, gcc >= 4.8, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lua-cffi/lua-cffi.hash b/package/lua-cffi/lua-cffi.hash
new file mode 100644
index 000000000..a532c6c7b
--- /dev/null
+++ b/package/lua-cffi/lua-cffi.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c30080d6309167f86d1a96d3ee33f33ef52e884052b7feac140b8c52db10ad7a  lua-cffi-0.2.1.tar.gz
+sha256  f5653a4d5864a3920ea1e07dacfd646067314be647598f0acaaf685beaa2e396  COPYING.md
diff --git a/package/lua-cffi/lua-cffi.mk b/package/lua-cffi/lua-cffi.mk
new file mode 100644
index 000000000..07d84ad5f
--- /dev/null
+++ b/package/lua-cffi/lua-cffi.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-cffi
+#
+################################################################################
+
+LUA_CFFI_VERSION=0.2.1
+LUA_CFFI_SITE = $(call github,q66,cffi-lua,v$(LUA_CFFI_VERSION))
+LUA_CFFI_LICENSE = MIT
+LUA_CFFI_LICENSE_FILES = COPYING.md
+
+LUA_CFFI_DEPENDENCIES = libffi lua
+
+$(eval $(meson-package))
diff --git a/support/testing/tests/package/test_lua_cffi.py b/support/testing/tests/package/test_lua_cffi.py
new file mode 100644
index 000000000..7f56eef56
--- /dev/null
+++ b/support/testing/tests/package/test_lua_cffi.py
@@ -0,0 +1,14 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaCffi(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_CFFI=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("cffi")
+
-- 
2.27.0
