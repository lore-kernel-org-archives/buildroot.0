From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 15 Jul 2012 22:59:26 -0400
Subject: [Buildroot] [PATCH] New package: LuaExpat [v2]
In-Reply-To: <1342407566-2819-1-git-send-email-danomimanchego123@gmail.com>
References: <1342407566-2819-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1342407566-2819-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/Config.in            |    1 +
 package/luaexpat/Config.in   |    7 +++++++
 package/luaexpat/luaexpat.mk |   39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 package/luaexpat/Config.in
 create mode 100644 package/luaexpat/luaexpat.mk

diff --git a/package/Config.in b/package/Config.in
index 99257b4..5126f1a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -250,6 +250,7 @@ menu "LUA libraries/modules"
 source "package/cgilua/Config.in"
 source "package/copas/Config.in"
 source "package/coxpcall/Config.in"
+source "package/luaexpat/Config.in"
 source "package/luafilesystem/Config.in"
 source "package/luasocket/Config.in"
 source "package/rings/Config.in"
diff --git a/package/luaexpat/Config.in b/package/luaexpat/Config.in
new file mode 100644
index 0000000..186c5c9
--- /dev/null
+++ b/package/luaexpat/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUAEXPAT
+	bool "luaexpat"
+	select BR2_PACKAGE_EXPAT
+	help
+	  LuaExpat is a SAX XML parser based on the Expat library.
+
+	  http://matthewwild.co.uk/projects/luaexpat/
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
new file mode 100644
index 0000000..e23473e
--- /dev/null
+++ b/package/luaexpat/luaexpat.mk
@@ -0,0 +1,39 @@
+#############################################################
+#
+# luaexpat
+#
+#############################################################
+
+LUAEXPAT_VERSION      = 1.2.0
+LUAEXPAT_SOURCE       = luaexpat-$(LUAEXPAT_VERSION).tar.gz
+LUAEXPAT_SITE         = http://matthewwild.co.uk/projects/luaexpat
+LUAEXPAT_DEPENDENCIES = lua expat
+
+
+LUAEXPAT_MFLAGS += LUA_VERSION_NUM=501
+LUAEXPAT_MFLAGS += LUA_INC=$(STAGING_DIR)/usr/include/lua
+LUAEXPAT_MFLAGS += EXPAT_INC=$(STAGING_DIR)/usr/include
+LUAEXPAT_MFLAGS += LIBNAME=lxp.so
+LUAEXPAT_MFLAGS += LIB_OPTION="-shared -fPIC $(TARGET_CFLAGS)"
+LUAEXPAT_MFLAGS += CC="$(TARGET_CC) -fPIC $(TARGET_CFLAGS)"
+
+
+define LUAEXPAT_BUILD_CMDS
+	$(MAKE) -C $(@D) $(LUAEXPAT_MFLAGS)
+endef
+
+define LUAEXPAT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/src/lxp.so $(TARGET_DIR)/usr/lib/lua/lxp.so
+	$(INSTALL) -D -m 0644 $(@D)/src/lxp/lom.lua $(TARGET_DIR)/usr/share/lua/lxp/lom.lua
+endef
+
+define LUAEXPAT_UNINSTALL_TARGET_CMDS
+	rm -f "$(TARGET_DIR)/usr/lib/lua/lxp.so"
+	rm -f "$(TARGET_DIR)/usr/share/lua/lxp/lom.lua"
+endef
+
+define LUAEXPAT_CLEAN_CMDS
+	$(MAKE) -C $(@D) $(LUAEXPAT_MFLAGS) clean
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
