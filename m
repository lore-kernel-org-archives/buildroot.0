From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jun 2010 22:16:11 +0200
Subject: [Buildroot] [git commit master] New lua module: luafilesystem
Message-ID: <20100605201724.7767E9BFB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a8495cdfcd46267e6782d174429231a49c22a23f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                |    2 ++
 package/Config.in                      |    3 +++
 package/luafilesystem/Config.in        |    9 +++++++++
 package/luafilesystem/luafilesystem.mk |   27 +++++++++++++++++++++++++++
 4 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 package/luafilesystem/Config.in
 create mode 100644 package/luafilesystem/luafilesystem.mk

diff --git a/CHANGES b/CHANGES
index b1a9a4c..ad1419b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,6 +4,8 @@
 
 	New GTK-based configurator, usable using 'make gconfig'.
 
+	New packages: luafilesystem
+
 	Updated/fixed packages: cdrkit, libidn, netperf
 
 	Issues resolved (http://bugs.uclibc.org):
diff --git a/package/Config.in b/package/Config.in
index d3c4316..cb52c7c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -207,6 +207,9 @@ menu "Interpreter languages and scripting"
 source "package/haserl/Config.in"
 source "package/java/jamvm/Config.in"
 source "package/lua/Config.in"
+if BR2_PACKAGE_LUA
+source "package/luafilesystem/Config.in"
+endif
 source "package/microperl/Config.in"
 source "package/php/Config.in"
 source "package/python/Config.in"
diff --git a/package/luafilesystem/Config.in b/package/luafilesystem/Config.in
new file mode 100644
index 0000000..ba63878
--- /dev/null
+++ b/package/luafilesystem/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LUAFILESYSTEM
+	bool "luafilesystem"
+	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LUA_SHARED_LIBRARY
+	help
+	  LuaFileSystem offers a portable way to access
+	  the underlying directory structure and file attributes.
+
+	  http://luaforge.net/projects/luafilesystem/
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
new file mode 100644
index 0000000..a27080c
--- /dev/null
+++ b/package/luafilesystem/luafilesystem.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# luafilesystem
+#
+#############################################################
+
+LUAFILESYSTEM_VERSION = 1.5.0
+LUAFILESYSTEM_SITE = http://github.com/downloads/keplerproject/luafilesystem
+LUAFILESYSTEM_DEPENDENCIES = lua
+
+define LUAFILESYSTEM_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -fPIC"
+endef
+
+define LUAFILESYSTEM_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/src/lfs.so $(TARGET_DIR)/usr/lib/lua/lfs.so
+endef
+
+define LUAFILESYSTEM_UNINSTALL_TARGET_CMDS
+	rm -f "$(TARGET_DIR)/usr/lib/lua/lfs.so"
+endef
+
+define LUAFILESYSTEM_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS,package,luafilesystem))
-- 
1.6.3.3
