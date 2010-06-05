From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jun 2010 22:16:11 +0200
Subject: [Buildroot] [git commit master] New lua module: wsapi
Message-ID: <20100605201726.24B979BFB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e5d578a6e2ea8244d7e6de12747930b0f2e3393b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    2 +-
 package/Config.in       |    1 +
 package/wsapi/Config.in |    9 +++++++++
 package/wsapi/wsapi.mk  |   21 +++++++++++++++++++++
 4 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 package/wsapi/Config.in
 create mode 100644 package/wsapi/wsapi.mk

diff --git a/CHANGES b/CHANGES
index daeba2d..8be098f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 	New GTK-based configurator, usable using 'make gconfig'.
 
 	New packages: cgilua, copas, coxpcall, luafilesystem,
-	luasocket, rings
+	luasocket, rings, wsapi
 
 	Updated/fixed packages: cdrkit, libidn, netperf
 
diff --git a/package/Config.in b/package/Config.in
index 2fb61b5..5f389e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -214,6 +214,7 @@ source "package/coxpcall/Config.in"
 source "package/luafilesystem/Config.in"
 source "package/luasocket/Config.in"
 source "package/rings/Config.in"
+source "package/wsapi/Config.in"
 endif
 source "package/microperl/Config.in"
 source "package/php/Config.in"
diff --git a/package/wsapi/Config.in b/package/wsapi/Config.in
new file mode 100644
index 0000000..3621648
--- /dev/null
+++ b/package/wsapi/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_WSAPI
+	bool "wsapi"
+	select BR2_PACKAGE_COXPCALL
+	select BR2_PACKAGE_LUAFILESYSTEM
+	select BR2_PACKAGE_RINGS
+	help
+	  API that abstracts the web server from Lua web applications.
+
+	  http://keplerproject.github.com/wsapi/
diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
new file mode 100644
index 0000000..c0f9c8b
--- /dev/null
+++ b/package/wsapi/wsapi.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# wsapi
+#
+#############################################################
+
+WSAPI_VERSION = 1.3.4
+WSAPI_SITE = http://github.com/downloads/keplerproject/wsapi
+WSAPI_DEPENDENCIES = coxpcall luafilesystem rings
+
+define WSAPI_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/lua/wsapi
+	$(INSTALL) -m 0644 -D $(@D)/src/wsapi/*.lua \
+		$(TARGET_DIR)/usr/share/lua/wsapi
+endef
+
+define WSAPI_UNINSTALL_TARGET_CMDS
+	rm -rf "$(TARGET_DIR)/usr/share/lua/wsapi"
+endef
+
+$(eval $(call GENTARGETS,package,wsapi))
-- 
1.6.3.3
