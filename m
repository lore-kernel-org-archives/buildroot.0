From: Assaf Inbal <shmuelzon@gmail.com>
Date: Mon, 20 May 2013 15:56:36 +0300
Subject: [Buildroot] [PATCH 04/12] lbase64: New package
In-Reply-To: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <1369054604-26139-4-git-send-email-shmuelzon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds base64 encode/decode functionality for Lua

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
---
 package/Config.in          |  1 +
 package/lbase64/Config.in  |  6 ++++++
 package/lbase64/lbase64.mk | 30 ++++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/lbase64/Config.in
 create mode 100644 package/lbase64/lbase64.mk

diff --git a/package/Config.in b/package/Config.in
index d980871..0845881 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -307,6 +307,7 @@ menu "LUA libraries/modules"
 source "package/cgilua/Config.in"
 source "package/copas/Config.in"
 source "package/coxpcall/Config.in"
+source "package/lbase64/Config.in"
 source "package/luacjson/Config.in"
 source "package/luaexpat/Config.in"
 source "package/luafilesystem/Config.in"
diff --git a/package/lbase64/Config.in b/package/lbase64/Config.in
new file mode 100644
index 0000000..bd8503a
--- /dev/null
+++ b/package/lbase64/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LBASE64
+	bool "lbase64"
+	help
+	  A base64 library for Lua
+
+	  http://luaforge.net/projects/lbase64/
diff --git a/package/lbase64/lbase64.mk b/package/lbase64/lbase64.mk
new file mode 100644
index 0000000..e253f24
--- /dev/null
+++ b/package/lbase64/lbase64.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# lbase64
+#
+#############################################################
+
+LBASE64_VERSION =
+LBASE64_SITE = http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/5.1
+LBASE64_SOURCE = lbase64.tar.gz
+LBASE64_LICENSE = Public domain
+LBASE64_LICENSE_FILES = README
+LBASE64_DEPENDENCIES = lua
+
+define LBASE64_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -fPIC" so
+endef
+
+define LBASE64_INSTALL_TARGET_CMDS
+	$(INSTALL) "$(@D)/base64.so" "$(TARGET_DIR)/usr/lib/lua"
+endef
+
+define LBASE64_UNINSTALL_TARGET_CMDS
+	rm -f "$(TARGET_DIR)/usr/lib/lua/base64.so"
+endef
+
+define LBASE64_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.2
