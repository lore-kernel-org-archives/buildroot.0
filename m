From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jun 2010 22:16:11 +0200
Subject: [Buildroot] [git commit master] New lua module: coxpcall
Message-ID: <20100605201724.B087A9BFB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=13ec21c66c417450a74c173c16aa27ea339de9c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    2 +-
 package/Config.in            |    1 +
 package/coxpcall/Config.in   |    8 ++++++++
 package/coxpcall/coxpcall.mk |   20 ++++++++++++++++++++
 4 files changed, 30 insertions(+), 1 deletions(-)
 create mode 100644 package/coxpcall/Config.in
 create mode 100644 package/coxpcall/coxpcall.mk

diff --git a/CHANGES b/CHANGES
index ad1419b..5150916 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,7 @@
 
 	New GTK-based configurator, usable using 'make gconfig'.
 
-	New packages: luafilesystem
+	New packages: coxpcall, luafilesystem
 
 	Updated/fixed packages: cdrkit, libidn, netperf
 
diff --git a/package/Config.in b/package/Config.in
index cb52c7c..faab6bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -208,6 +208,7 @@ source "package/haserl/Config.in"
 source "package/java/jamvm/Config.in"
 source "package/lua/Config.in"
 if BR2_PACKAGE_LUA
+source "package/coxpcall/Config.in"
 source "package/luafilesystem/Config.in"
 endif
 source "package/microperl/Config.in"
diff --git a/package/coxpcall/Config.in b/package/coxpcall/Config.in
new file mode 100644
index 0000000..1237482
--- /dev/null
+++ b/package/coxpcall/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_COXPCALL
+	bool "coxpcall"
+	help
+	  Coxpcall encapsulates the protected calls with a coroutine
+	  based loop, so errors can be dealed without the usual
+	  pcall/xpcall issues with coroutines.
+
+	  http://coxpcall.luaforge.net/
diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
new file mode 100644
index 0000000..b947571
--- /dev/null
+++ b/package/coxpcall/coxpcall.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# coxpcall
+#
+#############################################################
+
+COXPCALL_VERSION = 1.13.0
+COXPCALL_SITE = http://luaforge.net/frs/download.php/3406
+COXPCALL_DEPENDENCIES = lua
+
+define COXPCALL_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/src/coxpcall.lua \
+		$(TARGET_DIR)/usr/share/lua/coxpcall.lua
+endef
+
+define COXPCALL_UNINSTALL_TARGET_CMDS
+	rm -f "$(TARGET_DIR)/usr/share/lua/coxpcall.lua"
+endef
+
+$(eval $(call GENTARGETS,package,coxpcall))
-- 
1.6.3.3
