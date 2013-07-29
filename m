From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 29 Jul 2013 16:36:27 -0300
Subject: [Buildroot] [PATCH] directfb-lua: new package
Message-ID: <1375126587-983-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a Lua binding to DirectFB. It is an automated binding
generated from the DirectFB headers, so it generates an identical
API to DirectFB's, only simpler to use.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/directfb-lua/Config.in       | 10 ++++++++++
 package/directfb-lua/directfb-lua.mk | 23 +++++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/directfb-lua/Config.in
 create mode 100644 package/directfb-lua/directfb-lua.mk

diff --git a/package/Config.in b/package/Config.in
index 6d5ff01..dcaac4c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -120,6 +120,7 @@ comment "graphic libraries"
 source "package/cegui06/Config.in"
 source "package/directfb/Config.in"
 source "package/directfb-examples/Config.in"
+source "package/directfb-lua/Config.in"
 source "package/divine/Config.in"
 source "package/fbdump/Config.in"
 source "package/fbgrab/Config.in"
diff --git a/package/directfb-lua/Config.in b/package/directfb-lua/Config.in
new file mode 100644
index 0000000..7f941f9
--- /dev/null
+++ b/package/directfb-lua/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_DIRECTFB_LUA
+	bool "directfb-lua"
+	depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_PACKAGE_LUA
+	help
+	  directfb-lua is a Lua binding to DirectFB. It is an automated binding
+	  generated from the DirectFB headers. This means it generates an API
+	  identical to the DirectFB's, only easier to use.
+
+	  https://github.com/ezequielgarcia/directfb-lua
diff --git a/package/directfb-lua/directfb-lua.mk b/package/directfb-lua/directfb-lua.mk
new file mode 100644
index 0000000..f975a55
--- /dev/null
+++ b/package/directfb-lua/directfb-lua.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# directfb-lua
+#
+################################################################################
+
+DIRECTFB_LUA_VERSION = v0.2.1
+DIRECTFB_LUA_SITE = https://github.com/ezequielgarcia/directfb-lua/tarball/$(DIRECTFB_LUA_VERSION)
+DIRECTFB_LUA_LICENSE = MIT
+DIRECTFB_LUA_LICENSE_FILES = COPYING
+DIRECTFB_LUA_DEPENDENCIES = directfb lua
+
+define DIRECTFB_LUA_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) gen
+	$(TARGET_MAKE_ENV) CROSS_COMPILE="$(TARGET_CROSS)" $(MAKE) -C $(@D)
+endef
+
+define DIRECTFB_LUA_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) INSTALL_DIR="$(TARGET_DIR)/usr/lib/lua" \
+		$(MAKE) -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.5
