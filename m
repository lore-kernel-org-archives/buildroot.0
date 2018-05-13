From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 21:07:37 +0200
Subject: [Buildroot] [PATCH 8/8] utils/check-package: verify the prefix of
 package Config.in options
In-Reply-To: <20180513190737.26079-1-thomas.petazzoni@bootlin.com>
References: <20180513190737.26079-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180513190737.26079-9-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a new check in the check-package tool to verify that
the prefix used to name Config.in options are matching the name of the
package.

For now, only Config.in files in package/ are checked, because
Config.in files in fs/, linux/ and boot/ obey to different rules. The
check might be extended later to cover other files.

A series of expections is added, mainly to cope with virtual packages
such as zlib, cryptodev, openssl, jpeg and mysql.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/checkpackagelib/lib_config.py | 75 +++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 1d273f1c5f..3ffd725351 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -60,6 +60,81 @@ class AttributesOrder(_CheckFunction):
                     text]
 
 
+class ConfigVariableName(_CheckFunction):
+    PACKAGE_NAME = re.compile(".*/([^/]+)/(Config.*)")
+    OPTION_ONLY = re.compile("^config (BR2_PACKAGE_.*)")
+    EXCLUDES = ["package/Config.in",
+                "package/Config.in.host"]
+    EXCEPTIONS = {
+        "package/zlib/Config.in": ["BR2_PACKAGE_LIBZLIB"],
+        "package/cryptodev/Config.in": ["BR2_PACKAGE_OCF_LINUX"],
+        "package/libcurl/Config.in": ["BR2_PACKAGE_CURL"],
+        "package/luajit/Config.in": ["BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION"],
+        "package/mono/Config.in": ["BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS"],
+        "package/rustc/Config.in.host": ["BR2_PACKAGE_HOST_RUST",
+                                         "BR2_PACKAGE_HOST_RUST_BIN"],
+        "package/openssl/Config.in": ["BR2_PACKAGE_LIBOPENSSL",
+                                      "BR2_PACKAGE_LIBOPENSSL_BIN",
+                                      "BR2_PACKAGE_LIBOPENSSL_ENGINES",
+                                      "BR2_PACKAGE_LIBRESSL",
+                                      "BR2_PACKAGE_LIBRESSL_BIN"],
+        "package/erlang/Config.in": ["BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS"],
+        "package/jpeg/Config.in": ["BR2_PACKAGE_LIBJPEG"],
+        "package/mysql/Config.in": ["BR2_PACKAGE_MARIADB",
+                                    "BR2_PACKAGE_ORACLE_MYSQL",
+                                    "BR2_PACKAGE_MARIADB_SERVER",
+                                    "BR2_PACKAGE_ORACLE_MYSQL_SERVER"],
+    }
+
+    def _check_file(self):
+        if not self.filename.startswith("package/"):
+            return False
+        if self.filename in self.EXCLUDES:
+            return False
+        return True
+
+    def _check_symbol(self, symbol):
+        if self.filename in self.EXCEPTIONS and \
+           symbol in self.EXCEPTIONS[self.filename]:
+            return False
+        else:
+            return True
+
+    def before(self):
+        if not self._check_file():
+            return
+        m = self.PACKAGE_NAME.search(self.filename)
+        if not m:
+            print "NOT FOUND: %s" % self.filename
+        package = m.group(1)
+        config_file_name = m.group(2)
+        if config_file_name == "Config.in.host":
+            self.config_prefix = "BR2_PACKAGE_HOST_" + package.replace("-", "_").upper()
+        else:
+            self.config_prefix = "BR2_PACKAGE_" + package.replace("-", "_").upper()
+
+    def check_line(self, lineno, text):
+        if not self._check_file():
+            return
+        if _empty_or_comment(text):
+            return
+
+        m = self.OPTION_ONLY.search(text)
+        if m:
+            option = m.group(1)
+            # virtual package related options don't have the suffix of
+            # the current package, but this is expected.
+            if option.startswith("BR2_PACKAGE_PROVIDES_"):
+                return
+            if option.startswith("BR2_PACKAGE_HAS_"):
+                return
+            if not self._check_symbol(option):
+                return
+            if not option.startswith(self.config_prefix):
+                return ["{}:{}: option '{}' doesn't start with '{}' prefix"
+                        .format(self.filename, lineno, option, self.config_prefix)]
+
+
 class HelpText(_CheckFunction):
     HELP_TEXT_FORMAT = re.compile("^\t  .{,62}$")
     URL_ONLY = re.compile("^(http|https|git)://\S*$")
-- 
2.14.3
