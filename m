From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jun 2010 22:16:11 +0200
Subject: [Buildroot] [git commit master] New lua module: cgilua
Message-ID: <20100605201725.31C299C008@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=15ec5ee82128f2f7225df10f3bf54d46eb7af95d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    2 +-
 package/Config.in        |    1 +
 package/cgilua/Config.in |   10 ++++++++++
 package/cgilua/cgilua.mk |   20 ++++++++++++++++++++
 4 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 package/cgilua/Config.in
 create mode 100644 package/cgilua/cgilua.mk

diff --git a/CHANGES b/CHANGES
index d4d4253..17d4a69 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,7 @@
 
 	New GTK-based configurator, usable using 'make gconfig'.
 
-	New packages: coxpcall, luafilesystem, rings
+	New packages: cgilua, coxpcall, luafilesystem, rings
 
 	Updated/fixed packages: cdrkit, libidn, netperf
 
diff --git a/package/Config.in b/package/Config.in
index 92a3335..bfbb12c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -208,6 +208,7 @@ source "package/haserl/Config.in"
 source "package/java/jamvm/Config.in"
 source "package/lua/Config.in"
 if BR2_PACKAGE_LUA
+source "package/cgilua/Config.in"
 source "package/coxpcall/Config.in"
 source "package/luafilesystem/Config.in"
 source "package/rings/Config.in"
diff --git a/package/cgilua/Config.in b/package/cgilua/Config.in
new file mode 100644
index 0000000..aba4c24
--- /dev/null
+++ b/package/cgilua/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_CGILUA
+	bool "cgilua"
+	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LUA_SHARED_LIBRARY
+	select BR2_PACKAGE_LUAFILESYSTEM
+	help
+	  CGILua is a tool for creating dynamic HTML pages
+	  and manipulating input data from Web forms.
+
+	  http://luaforge.net/projects/cgilua/
diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
new file mode 100644
index 0000000..9d524cd
--- /dev/null
+++ b/package/cgilua/cgilua.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# cgilua
+#
+#############################################################
+
+CGILUA_VERSION = 5.1.3
+CGILUA_SITE = http://luaforge.net/frs/download.php/3970
+CGILUA_DEPENDENCIES = luafilesystem
+
+define CGILUA_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install LUA_DIR="$(TARGET_DIR)/usr/share/lua"
+endef
+
+define CGILUA_UNINSTALL_TARGET_CMDS
+	rm -rf "$(TARGET_DIR)/usr/share/lua/cgilua"
+	rm -f "$(TARGET_DIR)/usr/share/lua/cgilua.lua"
+endef
+
+$(eval $(call GENTARGETS,package,cgilua))
-- 
1.6.3.3
