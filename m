From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:55:23 -0000
Subject: [Buildroot] [git commit branch/next] new package: luacjson
Message-ID: <20120802195255.294148EE7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d8434630b397dab7da3739c9f737fc2fbf0e97d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/luacjson/Config.in   |   13 +++++++++++++
 package/luacjson/luacjson.mk |   32 ++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5126f1a..8529777 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -250,6 +250,7 @@ menu "LUA libraries/modules"
 source "package/cgilua/Config.in"
 source "package/copas/Config.in"
 source "package/coxpcall/Config.in"
+source "package/luacjson/Config.in"
 source "package/luaexpat/Config.in"
 source "package/luafilesystem/Config.in"
 source "package/luasocket/Config.in"
diff --git a/package/luacjson/Config.in b/package/luacjson/Config.in
new file mode 100644
index 0000000..8a5624f
--- /dev/null
+++ b/package/luacjson/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LUACJSON
+	bool "luacjson"
+	help
+	  The Lua CJSON module provides JSON support for Lua. It features:
+	  - Fast, standards compliant encoding/parsing routines
+	  - Full support for JSON with UTF-8, including decoding surrogate pairs
+	  - Optional run-time support for common exceptions to the JSON
+	    specification (infinity, NaN, ...)
+	  - No dependencies on other libraries
+
+	  (C-module)
+
+	  http://www.kyne.com.au/~mark/software/lua-cjson.php
diff --git a/package/luacjson/luacjson.mk b/package/luacjson/luacjson.mk
new file mode 100644
index 0000000..fe92f16
--- /dev/null
+++ b/package/luacjson/luacjson.mk
@@ -0,0 +1,32 @@
+#############################################################
+#
+# luacjson
+#
+#############################################################
+LUACJSON_VERSION      = 2.1.0
+LUACJSON_SOURCE       = lua-cjson-$(LUACJSON_VERSION).tar.gz
+LUACJSON_SITE         = http://www.kyne.com.au/~mark/software/download
+LUACJSON_DEPENDENCIES = lua
+
+define LUACJSON_BUILD_CMDS
+	$(MAKE) -C $(@D) \
+		CFLAGS="$(TARGET_CFLAGS)"   \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		CC="$(TARGET_CC)"           \
+		LD="$(TARGET_LD)"           \
+		PREFIX=$(STAGING_DIR)/usr
+endef
+
+define LUACJSON_INSTALL_TARGET_CMDS
+	install -D -m 0644 $(@D)/cjson.so $(TARGET_DIR)/usr/lib/lua/cjson.so
+endef
+
+define LUACJSON_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+define LUACJSON_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/lib/lua/cjson.so
+endef
+
+$(eval $(generic-package))
