From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jun 2010 22:16:11 +0200
Subject: [Buildroot] [git commit master] New lua module: xavante
Message-ID: <20100605201726.6C9ED9BFB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=db7b08447001c169f48cc5e4a2e67b9d2e54b045
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/Config.in          |    1 +
 package/xavante/Config.in  |   14 ++++++++++++++
 package/xavante/xavante.mk |   23 +++++++++++++++++++++++
 4 files changed, 39 insertions(+), 1 deletions(-)
 create mode 100644 package/xavante/Config.in
 create mode 100644 package/xavante/xavante.mk

diff --git a/CHANGES b/CHANGES
index 8be098f..98a9e12 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 	New GTK-based configurator, usable using 'make gconfig'.
 
 	New packages: cgilua, copas, coxpcall, luafilesystem,
-	luasocket, rings, wsapi
+	luasocket, rings, wsapi, xavante
 
 	Updated/fixed packages: cdrkit, libidn, netperf
 
diff --git a/package/Config.in b/package/Config.in
index 5f389e0..8b837fd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -215,6 +215,7 @@ source "package/luafilesystem/Config.in"
 source "package/luasocket/Config.in"
 source "package/rings/Config.in"
 source "package/wsapi/Config.in"
+source "package/xavante/Config.in"
 endif
 source "package/microperl/Config.in"
 source "package/php/Config.in"
diff --git a/package/xavante/Config.in b/package/xavante/Config.in
new file mode 100644
index 0000000..7a3535a
--- /dev/null
+++ b/package/xavante/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_XAVANTE
+	bool "xavante"
+	depends on BR2_PACKAGE_LUA_SHARED_LIBRARY
+	select BR2_PACKAGE_CGILUA
+	select BR2_PACKAGE_COPAS
+	select BR2_PACKAGE_COXPCALL
+	select BR2_PACKAGE_LUAFILESYSTEM
+	select BR2_PACKAGE_LUASOCKET
+	select BR2_PACKAGE_WSAPI
+	help
+	  Xavante is a Lua HTTP 1.1 Web server that uses a modular
+	  architecture based on URI mapped handlers.
+
+	  http://keplerproject.github.com/xavante/
diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
new file mode 100644
index 0000000..525b09f
--- /dev/null
+++ b/package/xavante/xavante.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# xavante
+#
+#############################################################
+
+XAVANTE_VERSION = 2.2.0
+XAVANTE_SITE = http://github.com/downloads/keplerproject/xavante
+XAVANTE_DEPENDENCIES = cgilua copas coxpcall lua luafilesystem luasocket wsapi
+
+define XAVANTE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) PREFIX=/usr \
+		LUA_DIR="$(TARGET_DIR)/usr/share/lua" \
+		LUA_LIBDIR="$(TARGET_DIR)/usr/lib/lua" install
+endef
+
+define XAVANTE_UNINSTALL_TARGET_CMDS
+	rm -rf "$(TARGET_DIR)/usr/share/xavante"
+	rm -f "$(TARGET_DIR)/usr/share/xavante.lua"
+	rm -f "$(TARGET_DIR)/usr/share/sajax.lua"
+endef
+
+$(eval $(call GENTARGETS,package,xavante))
-- 
1.6.3.3
