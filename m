From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 15:13:06 +0100
Subject: [Buildroot] [git commit] package/lualdap: new package
Message-ID: <20201231135724.8064B814AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2949f423a4c4c02defdef47affe45076d4dea82d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                             |  1 +
 package/lualdap/Config.in                     | 16 +++++++++++++
 package/lualdap/lualdap.hash                  |  3 +++
 package/lualdap/lualdap.mk                    | 33 +++++++++++++++++++++++++++
 support/testing/tests/package/test_lualdap.py | 25 ++++++++++++++++++++
 5 files changed, 78 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 1a85a891aa..4690c54a66 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -683,6 +683,7 @@ menu "Lua libraries/modules"
 	source "package/luaexpatutils/Config.in"
 	source "package/luafilesystem/Config.in"
 	source "package/luajson/Config.in"
+	source "package/lualdap/Config.in"
 	source "package/lualogging/Config.in"
 	source "package/luaossl/Config.in"
 	source "package/luaposix/Config.in"
diff --git a/package/lualdap/Config.in b/package/lualdap/Config.in
new file mode 100644
index 0000000000..ef3e932027
--- /dev/null
+++ b/package/lualdap/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LUALDAP
+	bool "lualdap"
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_PACKAGE_LUA_5_4
+	depends on BR2_USE_WCHAR # openldap
+	depends on BR2_USE_MMU # openldap
+	select BR2_PACKAGE_OPENLDAP
+	help
+	  LuaLDAP is a simple interface from Lua to an LDAP client,
+	  in fact it is a bind to OpenLDAP client.
+
+	  https://github.com/lualdap/lualdap
+
+comment "lualdap needs a toolchain w/ wchar, dynamic library, Lua <= 5.3"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || BR2_PACKAGE_LUA_5_4
diff --git a/package/lualdap/lualdap.hash b/package/lualdap/lualdap.hash
new file mode 100644
index 0000000000..77eced4341
--- /dev/null
+++ b/package/lualdap/lualdap.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  3e028faa6a5798cf2f3d50b9853b9b3fb6eb562b62010747bd5b6f50b57bb1cc  lualdap-1.2.5.tar.gz
+sha256  7afd8bed6c96a2ba1d1fa9f03ea04c140065462dbd37d7fb66cc7c3c6722aa89  LICENSE.md
diff --git a/package/lualdap/lualdap.mk b/package/lualdap/lualdap.mk
new file mode 100644
index 0000000000..6ab3302697
--- /dev/null
+++ b/package/lualdap/lualdap.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# lualdap
+#
+################################################################################
+
+LUALDAP_VERSION = 1.2.5
+LUALDAP_SITE = $(call github,lualdap,lualdap,v$(LUALDAP_VERSION))
+LUALDAP_LICENSE = MIT
+LUALDAP_LICENSE_FILES = LICENSE.md
+LUALDAP_DEPENDENCIES = luainterpreter openldap
+
+define LUALDAP_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
+		CC=$(TARGET_CC) \
+		LUA_LIB=-llua \
+		LUA_LIBDIR="$(STAGING_DIR)/usr/lib" \
+		LUA_INCDIR="$(STAGING_DIR)/usr/include" \
+		LDAP_LIBDIR="$(STAGING_DIR)/usr/lib" \
+		LDAP_INCDIR="$(STAGING_DIR)/usr/include" \
+		LBER_LIBDIR="$(STAGING_DIR)/usr/lib" \
+		LBER_INCDIR="$(STAGING_DIR)/usr/include" \
+		src/lualdap.so
+endef
+
+define LUALDAP_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
+		DESTDIR="$(TARGET_DIR)" \
+		INST_LIBDIR="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/" \
+		install
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_lualdap.py b/support/testing/tests/package/test_lualdap.py
new file mode 100644
index 0000000000..2ec0d58228
--- /dev/null
+++ b/support/testing/tests/package/test_lualdap.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaLdap(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUALDAP=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lualdap")
+
+
+class TestLuajitLuaLdap(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUALDAP=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lualdap")
