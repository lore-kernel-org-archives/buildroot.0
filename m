From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jun 2010 22:16:11 +0200
Subject: [Buildroot] [git commit master] New lua module: copas
Message-ID: <20100605201725.CE25F9BFB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bfce1e4cbcd995792e5fe92c4c1f2d0e77d52618
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    3 ++-
 package/Config.in       |    1 +
 package/copas/Config.in |    9 +++++++++
 package/copas/copas.mk  |   20 ++++++++++++++++++++
 4 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 package/copas/Config.in
 create mode 100644 package/copas/copas.mk

diff --git a/CHANGES b/CHANGES
index b1787fa..daeba2d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,8 @@
 
 	New GTK-based configurator, usable using 'make gconfig'.
 
-	New packages: cgilua, coxpcall, luafilesystem, luasocket, rings
+	New packages: cgilua, copas, coxpcall, luafilesystem,
+	luasocket, rings
 
 	Updated/fixed packages: cdrkit, libidn, netperf
 
diff --git a/package/Config.in b/package/Config.in
index 05ec42f..2fb61b5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -209,6 +209,7 @@ source "package/java/jamvm/Config.in"
 source "package/lua/Config.in"
 if BR2_PACKAGE_LUA
 source "package/cgilua/Config.in"
+source "package/copas/Config.in"
 source "package/coxpcall/Config.in"
 source "package/luafilesystem/Config.in"
 source "package/luasocket/Config.in"
diff --git a/package/copas/Config.in b/package/copas/Config.in
new file mode 100644
index 0000000..9969c8f
--- /dev/null
+++ b/package/copas/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_COPAS
+	bool "copas"
+	select BR2_PACKAGE_COXPCALL
+	select BR2_PACKAGE_LUASOCKET
+	help
+	  Copas is a dispatcher based on coroutines that
+	  can be used by TCP/IP servers.
+
+	  http://keplerproject.github.com/copas/
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
new file mode 100644
index 0000000..1baed83
--- /dev/null
+++ b/package/copas/copas.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# copas
+#
+#############################################################
+
+COPAS_VERSION = 1.1.6
+COPAS_SITE = http://github.com/downloads/keplerproject/copas
+COPAS_DEPENDENCIES = lua coxpcall luasocket
+
+define COPAS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/src/copas/copas.lua \
+		$(TARGET_DIR)/usr/share/lua/copas.lua
+endef
+
+define COPAS_UNINSTALL_TARGET_CMDS
+	rm -f "$(TARGET_DIR)/usr/share/lua/copas.lua"
+endef
+
+$(eval $(call GENTARGETS,package,copas))
-- 
1.6.3.3
