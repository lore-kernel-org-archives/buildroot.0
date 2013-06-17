From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Jun 2013 23:13:36 +0200
Subject: [Buildroot] [git commit] lbase64: New package
Message-ID: <20130617212030.12E549AEE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a28ec29a9ed80b36c41dc6c549191e6f2453fe7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package adds base64 encode/decode functionality for Lua

[Peter: fix file header, use TARGET_CONFIGURE_OPTS, drop quotes around paths]
Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/lbase64/Config.in  |    6 ++++++
 package/lbase64/lbase64.mk |   32 ++++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f218f65..2d32a9f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -314,6 +314,7 @@ menu "LUA libraries/modules"
 source "package/cgilua/Config.in"
 source "package/copas/Config.in"
 source "package/coxpcall/Config.in"
+source "package/lbase64/Config.in"
 source "package/luabitop/Config.in"
 source "package/luacjson/Config.in"
 source "package/luaexpat/Config.in"
diff --git a/package/lbase64/Config.in b/package/lbase64/Config.in
new file mode 100644
index 0000000..bd8503a
--- /dev/null
+++ b/package/lbase64/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LBASE64
+	bool "lbase64"
+	help
+	  A base64 library for Lua
+
+	  http://luaforge.net/projects/lbase64/
diff --git a/package/lbase64/lbase64.mk b/package/lbase64/lbase64.mk
new file mode 100644
index 0000000..87dda40
--- /dev/null
+++ b/package/lbase64/lbase64.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# lbase64
+#
+################################################################################
+
+LBASE64_VERSION = 20100323
+LBASE64_SITE = http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/5.1
+LBASE64_SOURCE = lbase64.tar.gz
+LBASE64_LICENSE = Public domain
+LBASE64_LICENSE_FILES = README
+LBASE64_DEPENDENCIES = lua
+
+define LBASE64_BUILD_CMDS
+       $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -fPIC" so
+endef
+
+define LBASE64_INSTALL_TARGET_CMDS
+       $(INSTALL) -D -m 0755 $(@D)/base64.so \
+		$(TARGET_DIR)/usr/lib/lua/base64.so
+endef
+
+define LBASE64_UNINSTALL_TARGET_CMDS
+       rm -f $(TARGET_DIR)/usr/lib/lua/base64.so
+endef
+
+define LBASE64_CLEAN_CMDS
+       $(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
