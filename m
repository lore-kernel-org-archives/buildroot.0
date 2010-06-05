From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jun 2010 22:16:11 +0200
Subject: [Buildroot] [git commit master] New lua module: rings
Message-ID: <20100605201724.E44C39BFB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=50d6f2dde4db8c9d042294a09d5e8e120aec9987
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    2 +-
 package/Config.in       |    1 +
 package/rings/Config.in |    7 +++++++
 package/rings/rings.mk  |   29 +++++++++++++++++++++++++++++
 4 files changed, 38 insertions(+), 1 deletions(-)
 create mode 100644 package/rings/Config.in
 create mode 100644 package/rings/rings.mk

diff --git a/CHANGES b/CHANGES
index 5150916..d4d4253 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,7 @@
 
 	New GTK-based configurator, usable using 'make gconfig'.
 
-	New packages: coxpcall, luafilesystem
+	New packages: coxpcall, luafilesystem, rings
 
 	Updated/fixed packages: cdrkit, libidn, netperf
 
diff --git a/package/Config.in b/package/Config.in
index faab6bf..92a3335 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -210,6 +210,7 @@ source "package/lua/Config.in"
 if BR2_PACKAGE_LUA
 source "package/coxpcall/Config.in"
 source "package/luafilesystem/Config.in"
+source "package/rings/Config.in"
 endif
 source "package/microperl/Config.in"
 source "package/php/Config.in"
diff --git a/package/rings/Config.in b/package/rings/Config.in
new file mode 100644
index 0000000..2fe14aa
--- /dev/null
+++ b/package/rings/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_RINGS
+	bool "rings"
+	depends on BR2_PACKAGE_LUA_SHARED_LIBRARY
+	help
+	  Provides a way to create new Lua states from within Lua.
+
+	  http://github.com/keplerproject/rings
diff --git a/package/rings/rings.mk b/package/rings/rings.mk
new file mode 100644
index 0000000..36fe666
--- /dev/null
+++ b/package/rings/rings.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# rings
+#
+#############################################################
+
+RINGS_VERSION = 1.2.3
+RINGS_SITE = http://github.com/downloads/keplerproject/rings
+RINGS_DEPENDENCIES = lua
+
+define RINGS_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -fPIC"
+endef
+
+define RINGS_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) LUA_LIBDIR="$(TARGET_DIR)/usr/lib/lua" \
+		LUA_DIR="$(TARGET_DIR)/usr/share/lua" install
+endef
+
+define RINGS_UNINSTALL_TARGET_CMDS
+	rm -f "$(TARGET_DIR)/usr/lib/lua/rings.so"
+	rm -f "$(TARGET_DIR)/usr/share/lua/stable.lua"
+endef
+
+define RINGS_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS,package,rings))
-- 
1.6.3.3
