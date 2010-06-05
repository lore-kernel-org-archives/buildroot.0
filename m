From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jun 2010 22:16:11 +0200
Subject: [Buildroot] [git commit master] New lua module: luasocket
Message-ID: <20100605201725.8C6EC9BFB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b9b76f7441b2608d1ec3c8c40527dca4ce360bf1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    2 +-
 package/Config.in              |    1 +
 package/luasocket/Config.in    |   10 ++++++++++
 package/luasocket/luasocket.mk |   36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 48 insertions(+), 1 deletions(-)
 create mode 100644 package/luasocket/Config.in
 create mode 100644 package/luasocket/luasocket.mk

diff --git a/CHANGES b/CHANGES
index 17d4a69..b1787fa 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,7 @@
 
 	New GTK-based configurator, usable using 'make gconfig'.
 
-	New packages: cgilua, coxpcall, luafilesystem, rings
+	New packages: cgilua, coxpcall, luafilesystem, luasocket, rings
 
 	Updated/fixed packages: cdrkit, libidn, netperf
 
diff --git a/package/Config.in b/package/Config.in
index bfbb12c..05ec42f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -211,6 +211,7 @@ if BR2_PACKAGE_LUA
 source "package/cgilua/Config.in"
 source "package/coxpcall/Config.in"
 source "package/luafilesystem/Config.in"
+source "package/luasocket/Config.in"
 source "package/rings/Config.in"
 endif
 source "package/microperl/Config.in"
diff --git a/package/luasocket/Config.in b/package/luasocket/Config.in
new file mode 100644
index 0000000..298db56
--- /dev/null
+++ b/package/luasocket/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LUASOCKET
+	bool "luasocket"
+	depends on BR2_PACKAGE_LUA_SHARED_LIBRARY
+	help
+	  LuaSocket is the most comprehensive networking support library
+	  for the Lua language.
+	  It provides easy access to TCP, UDP, DNS, SMTP,
+	  FTP, HTTP, MIME and much more.
+
+	  http://luaforge.net/projects/luasocket/
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
new file mode 100644
index 0000000..e0faf03
--- /dev/null
+++ b/package/luasocket/luasocket.mk
@@ -0,0 +1,36 @@
+#############################################################
+#
+# luasocket
+#
+#############################################################
+
+LUASOCKET_VERSION = 2.0.2
+LUASOCKET_SITE = http://luaforge.net/frs/download.php/2664
+LUASOCKET_DEPENDENCIES = lua
+
+define LUASOCKET_BUILD_CMDS
+	$(MAKE) -C $(@D) -f makefile \
+		CC="$(TARGET_CC)" LD="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS) -fPIC"
+endef
+
+define LUASOCKET_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) -f makefile \
+		INSTALL_TOP_SHARE="$(TARGET_DIR)/usr/share/lua" \
+		INSTALL_TOP_LIB="$(TARGET_DIR)/usr/lib/lua" install
+endef
+
+define LUASOCKET_UNINSTALL_TARGET_CMDS
+	rm -rf "$(TARGET_DIR)/usr/lib/lua/mime"
+	rm -rf "$(TARGET_DIR)/usr/lib/lua/socket"
+	rm -rf "$(TARGET_DIR)/usr/share/lua/socket"
+	rm -f "$(TARGET_DIR)/usr/share/lua/socket.lua"
+	rm -f "$(TARGET_DIR)/usr/share/lua/mime.lua"
+	rm -f "$(TARGET_DIR)/usr/share/lua/ltn12.lua"
+endef
+
+define LUASOCKET_CLEAN_CMDS
+	$(MAKE) -C $(@D) -f makefile clean
+endef
+
+$(eval $(call GENTARGETS,package,luasocket))
-- 
1.6.3.3
