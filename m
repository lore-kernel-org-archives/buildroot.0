From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:01 -0000
Subject: [Buildroot] [git commit] orbit: New package
Message-ID: <20130831213337.36BFF9B5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02e4326fe7f1912a6f12bdef54c7295f9188dd38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An MVC web framework for Lua

[Thomas P: add patch to fix installation procedure, and use the
provided Makefile for installation. Remove build-time dependency on
wsapi since there's nothing to build in 'orbit'. Remove run-time
dependency on 'rings', since it's not clear why Orbit would depend on
that.]

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                             |    1 +
 package/orbit/Config.in                       |   10 +++++++++
 package/orbit/orbit-01-fix-installation.patch |   26 +++++++++++++++++++++++++
 package/orbit/orbit.mk                        |   19 ++++++++++++++++++
 4 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 27a0d55..4fcff65 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -341,6 +341,7 @@ source "package/luasocket/Config.in"
 source "package/luasql/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-msgpack-native/Config.in"
+source "package/orbit/Config.in"
 source "package/rings/Config.in"
 source "package/wsapi/Config.in"
 source "package/xavante/Config.in"
diff --git a/package/orbit/Config.in b/package/orbit/Config.in
new file mode 100644
index 0000000..556c46e
--- /dev/null
+++ b/package/orbit/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_ORBIT
+	bool "orbit"
+	# These are runtime dependencies
+	select BR2_PACKAGE_WSAPI
+	select BR2_PACKAGE_LUAFILESYSTEM
+	help
+	  An MVC web framework for Lua. The design is inspired by lightweight
+	  Ruby frameworks such as Camping
+
+	  http://keplerproject.github.com/orbit
diff --git a/package/orbit/orbit-01-fix-installation.patch b/package/orbit/orbit-01-fix-installation.patch
new file mode 100644
index 0000000..ae50ad9
--- /dev/null
+++ b/package/orbit/orbit-01-fix-installation.patch
@@ -0,0 +1,26 @@
+Fix installation commands
+
+The installation commands did not match the location of the source
+files within the Orbit source tree.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -11,12 +11,9 @@
+ 	mkdir -p $(LUA_DIR)
+ 	cp src/orbit.lua $(LUA_DIR)
+ 	mkdir -p $(LUA_DIR)/orbit
+-	cp src/model.lua $(LUA_DIR)/orbit
+-	cp src/cache.lua $(LUA_DIR)/orbit
+-	cp src/pages.lua $(LUA_DIR)/orbit
+-	cp src/ophandler.lua $(LUA_DIR)/orbit
++	cp src/orbit/*.lua $(LUA_DIR)/orbit
+ 	mkdir -p $(BIN_DIR)
+-	cp src/orbit $(BIN_DIR)
++	cp src/launchers/* $(BIN_DIR)
+ 	if [ -f ./wsapi/Makefile ]; then \
+ 	  cd wsapi && make install; \
+ 	fi
diff --git a/package/orbit/orbit.mk b/package/orbit/orbit.mk
new file mode 100644
index 0000000..af5f0af
--- /dev/null
+++ b/package/orbit/orbit.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# orbit
+#
+################################################################################
+
+ORBIT_VERSION = 2.2.0
+ORBIT_SITE = http://github.com/downloads/keplerproject/orbit
+ORBIT_LICENSE = MIT
+ORBIT_LICENSE_FILES = COPYRIGHT
+
+define ORBIT_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) \
+		LUA_DIR=$(TARGET_DIR)/usr/share/lua/ \
+		BIN_DIR=$(TARGET_DIR)/usr/bin \
+		install
+endef
+
+$(eval $(generic-package))
