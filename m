From: Assaf Inbal <shmuelzon@gmail.com>
Date: Mon, 20 May 2013 15:56:38 +0300
Subject: [Buildroot] [PATCH 06/12] luabitop: New package
In-Reply-To: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <1369054604-26139-6-git-send-email-shmuelzon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lua library for binary operations

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
---
 package/Config.in            |  1 +
 package/luabitop/Config.in   |  7 +++++++
 package/luabitop/luabitop.mk | 27 +++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/luabitop/Config.in
 create mode 100644 package/luabitop/luabitop.mk

diff --git a/package/Config.in b/package/Config.in
index e94cb39..1089533 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -308,6 +308,7 @@ source "package/cgilua/Config.in"
 source "package/copas/Config.in"
 source "package/coxpcall/Config.in"
 source "package/lbase64/Config.in"
+source "package/luabitop/Config.in"
 source "package/luacjson/Config.in"
 source "package/luaexpat/Config.in"
 source "package/luafilesystem/Config.in"
diff --git a/package/luabitop/Config.in b/package/luabitop/Config.in
new file mode 100644
index 0000000..83a85b1
--- /dev/null
+++ b/package/luabitop/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUABITOP
+	bool "luabitop"
+	help
+	  Lua BitOp is a C extension module for Lua 5.1/5.2 which adds bitwise
+	  operations on numbers.
+
+	  http://bitop.luajit.org
diff --git a/package/luabitop/luabitop.mk b/package/luabitop/luabitop.mk
new file mode 100644
index 0000000..aaa01cd
--- /dev/null
+++ b/package/luabitop/luabitop.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# luabitop
+#
+#############################################################
+
+LUABITOP_VERSION = 1.0.2
+LUABITOP_SOURCE = LuaBitOp-$(LUABITOP_VERSION).tar.gz
+LUABITOP_SITE = http://bitop.luajit.org/download
+LUABITOP_LICENSE = MIT
+LUABITOP_LICENSE_FILES = README
+LUABITOP_DEPENDENCIES = lua
+
+define LUABITOP_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+endef
+
+define LUABITOP_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/lib/lua
+	$(INSTALL) -p $(@D)/bit.so $(TARGET_DIR)/usr/lib/lua
+endef
+
+define LUABITOP_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.2
