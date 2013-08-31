From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:01 -0000
Subject: [Buildroot] [git commit] luasec: New package
Message-ID: <20130831213337.2362C9B5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61cdd3c7600876d87e7b3c7e943a99bb3dfef172
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LuaSec is a Lua binding for OpenSSL library to provide TLS/SSL
communication.

[Thomas: adjust header in .mk file, add missing 'mkdir -p' before
installation, remove useless quotes.]

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/luasec/Config.in |    9 +++++++++
 package/luasec/luasec.mk |   33 +++++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f27ba2b..d5453fe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -336,6 +336,7 @@ source "package/luaexpat/Config.in"
 source "package/luaexpatutils/Config.in"
 source "package/luafilesystem/Config.in"
 source "package/luaposix/Config.in"
+source "package/luasec/Config.in"
 source "package/luasocket/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-msgpack-native/Config.in"
diff --git a/package/luasec/Config.in b/package/luasec/Config.in
new file mode 100644
index 0000000..2d303c1
--- /dev/null
+++ b/package/luasec/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LUASEC
+	bool "luasec"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LUASOCKET
+	help
+	  LuaSec is a binding for OpenSSL library to provide TLS/SSL
+	  communication.
+
+	  http://www.inf.puc-rio.br/~brunoos/luasec/
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
new file mode 100644
index 0000000..053309f
--- /dev/null
+++ b/package/luasec/luasec.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# luasec
+#
+################################################################################
+
+LUASEC_VERSION = 0.4.1
+LUASEC_SITE = http://www.inf.puc-rio.br/~brunoos/luasec/download/
+LUASEC_LICENSE = MIT
+LUASEC_LICENSE_FILES = LICENSE
+LUASEC_DEPENDENCIES = lua openssl
+
+define LUASEC_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC)" LD="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS) -fPIC" \
+		LDFLAGS="$(TARGET_LDFLAGS) -shared" linux
+endef
+
+define LUASEC_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/lua
+	mkdir -p $(TARGET_DIR)/usr/lib/lua
+	$(MAKE) -C $(@D) \
+		LUAPATH="$(TARGET_DIR)/usr/share/lua" \
+		LUACPATH="$(TARGET_DIR)/usr/lib/lua" install
+endef
+
+define LUASEC_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/lib/lua/ssl.so
+	rm -rf $(TARGET_DIR)/usr/share/lua/ssl
+	rm -f $(TARGET_DIR)/usr/share/lua/ssl.lua
+endef
+
+$(eval $(generic-package))
