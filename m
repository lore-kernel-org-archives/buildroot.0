From: Assaf Inbal <shmuelzon@gmail.com>
Date: Mon, 20 May 2013 15:56:44 +0300
Subject: [Buildroot] [PATCH 12/12] orbit: New package
In-Reply-To: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <1369054604-26139-12-git-send-email-shmuelzon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An MVC web framework for Lua

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
---
 package/Config.in       |  1 +
 package/orbit/Config.in | 10 ++++++++++
 package/orbit/orbit.mk  | 26 ++++++++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/orbit/Config.in
 create mode 100644 package/orbit/orbit.mk

diff --git a/package/Config.in b/package/Config.in
index 17fa1e7..5e18e8f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -320,6 +320,7 @@ source "package/luasocket/Config.in"
 source "package/luasql/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-msgpack-native/Config.in"
+source "package/orbit/Config.in"
 source "package/rings/Config.in"
 source "package/wsapi/Config.in"
 source "package/xavante/Config.in"
diff --git a/package/orbit/Config.in b/package/orbit/Config.in
new file mode 100644
index 0000000..959481f
--- /dev/null
+++ b/package/orbit/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_ORBIT
+	bool "orbit"
+	select BR2_PACKAGE_WSAPI
+	select BR2_PACKAGE_LUAFILESYSTEM
+	select BR2_PACKAGE_RINGS
+	help
+	  An MVC web framework for Lua. The design is inspired by lightweight
+	  Ruby frameworks such as Camping
+
+	  http://keplerproject.github.com/orbit
diff --git a/package/orbit/orbit.mk b/package/orbit/orbit.mk
new file mode 100644
index 0000000..8eff332
--- /dev/null
+++ b/package/orbit/orbit.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# orbit
+#
+#############################################################
+
+ORBIT_VERSION = 2.2.0
+ORBIT_SITE = http://github.com/downloads/keplerproject/orbit
+ORBIT_LICENSE = MIT
+ORBIT_LICENSE_FILES = COPYRIGHT
+ORBIT_DEPENDENCIES = wsapi
+
+define ORBIT_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/src/orbit.lua \
+		$(TARGET_DIR)/usr/share/lua
+	mkdir $(TARGET_DIR)/usr/share/lua/orbit
+	$(INSTALL) -m 0644 -D $(@D)/src/orbit/*.lua \
+		$(TARGET_DIR)/usr/share/lua/orbit
+endef
+
+define ORBIT_UNINSTALL_TARGET_CMDS
+	rm -rf "$(TARGET_DIR)/usr/share/lua/orbit"
+	rm -rf "$(TARGET_DIR)/usr/share/lua/orbit.lua"
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.2
