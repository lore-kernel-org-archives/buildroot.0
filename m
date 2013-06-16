From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Jun 2013 22:02:14 +0200
Subject: [Buildroot] [git commit] luabitop: New package
Message-ID: <20130616200645.29B479AD89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b81dd47703fd099e2b257ed0680ddc39524ace5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lua library for binary operations

[Peter: fix header, use TARGET_CONFIGURE_OPTS]
Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/luabitop/Config.in   |    7 +++++++
 package/luabitop/luabitop.mk |   27 +++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index fa64426..f218f65 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -314,6 +314,7 @@ menu "LUA libraries/modules"
 source "package/cgilua/Config.in"
 source "package/copas/Config.in"
 source "package/coxpcall/Config.in"
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
index 0000000..c61e826
--- /dev/null
+++ b/package/luabitop/luabitop.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# luabitop
+#
+################################################################################
+
+LUABITOP_VERSION = 1.0.2
+LUABITOP_SOURCE = LuaBitOp-$(LUABITOP_VERSION).tar.gz
+LUABITOP_SITE = http://bitop.luajit.org/download
+LUABITOP_LICENSE = MIT
+LUABITOP_LICENSE_FILES = README
+LUABITOP_DEPENDENCIES = lua
+
+define LUABITOP_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
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
