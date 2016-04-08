From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Fri,  8 Apr 2016 10:24:43 +0200
Subject: [Buildroot] [PATCH v3] package/turbolua: new package
In-Reply-To: <1460103883-7608-1-git-send-email-m.niestroj@grinn-global.com>
References: <1460103883-7608-1-git-send-email-m.niestroj@grinn-global.com>
Message-ID: <1460103883-7608-2-git-send-email-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/Config.in              |  1 +
 package/turbolua/Config.in     | 15 +++++++++++++++
 package/turbolua/turbolua.hash |  2 ++
 package/turbolua/turbolua.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 package/turbolua/Config.in
 create mode 100644 package/turbolua/turbolua.hash
 create mode 100644 package/turbolua/turbolua.mk

diff --git a/package/Config.in b/package/Config.in
index 64822bf..3d6eaf1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -542,6 +542,7 @@ menu "Lua libraries/modules"
 	source "package/lzlib/Config.in"
 	source "package/orbit/Config.in"
 	source "package/rings/Config.in"
+	source "package/turbolua/Config.in"
 	source "package/wsapi/Config.in"
 	source "package/xavante/Config.in"
 endmenu
diff --git a/package/turbolua/Config.in b/package/turbolua/Config.in
new file mode 100644
index 0000000..8753dbd
--- /dev/null
+++ b/package/turbolua/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_TURBOLUA
+	bool "turbolua"
+	depends on BR2_PACKAGE_LUAJIT
+	help
+	  Turbo.lua is a framework built for LuaJIT 2 to simplify the
+	  task of building fast and scalable network applications. It
+	  uses a event-driven, non-blocking, no thread design to deliver
+	  excellent performance and minimal footprint to high-load
+	  applications while also providing excellent support for
+	  embedded uses. The toolkit can be used for HTTP REST API?s,
+	  traditional dynamic web pages through templating, open
+	  connections like WebSockets, or just as high level building
+	  blocks for native speed network applications.
+
+	  http://www.turbolua.org
diff --git a/package/turbolua/turbolua.hash b/package/turbolua/turbolua.hash
new file mode 100644
index 0000000..ea7898c
--- /dev/null
+++ b/package/turbolua/turbolua.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4f7e3121fcc25a5867a264a6f09acf641c904668f5822b1533881f40a3b863ea turbolua-91db237a6690f4a659cbdee2ebbbbc9741d8ea4c.tar.gz
diff --git a/package/turbolua/turbolua.mk b/package/turbolua/turbolua.mk
new file mode 100644
index 0000000..cf66e70
--- /dev/null
+++ b/package/turbolua/turbolua.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# turbolua
+#
+################################################################################
+
+TURBOLUA_VERSION = 91db237a6690f4a659cbdee2ebbbbc9741d8ea4c
+TURBOLUA_SITE = $(call github,kernelsauce,turbo,$(TURBOLUA_VERSION))
+TURBOLUA_DEPENDENCIES = luajit
+TURBOLUA_LICENSE = Apache-2.0
+TURBOLUA_LICENSE_FILES = LICENSE
+
+TURBOLUA_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	SSL=$(if $(BR2_PACKAGE_OPENSSL),openssl,none) \
+	LUAJIT_VERSION="$(LUAJIT_VERSION)"
+
+define TURBOLUA_BUILD_CMDS
+	$(MAKE) $(TURBOLUA_MAKE_OPTS) -C $(@D) all
+endef
+
+define TURBOLUA_INSTALL_TARGET_CMDS
+	$(MAKE) $(TURBOLUA_MAKE_OPTS) LDCONFIG=true \
+		PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.8.0
