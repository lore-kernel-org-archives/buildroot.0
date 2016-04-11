From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon, 11 Apr 2016 11:43:18 +0200
Subject: [Buildroot] [PATCH v4] package/turbolua: new package
In-Reply-To: <1460103883-7608-2-git-send-email-m.niestroj@grinn-global.com>
References: <1460103883-7608-2-git-send-email-m.niestroj@grinn-global.com>
Message-ID: <1460367798-5380-1-git-send-email-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
Changes v3 -> v4:
 * Show comment when LuaJIT is not selected (suggested by Arnout)

Changes v2 -> v3:
 * Do not use SSL variable, set TURBOLUA_MAKE_OPTS instead
 * Remove dependency on !BR2_ARM_INSTRUCTIONS_THUMB2, as it is
   not clear what is the reason of crashes on Thumb2 target
 * Bump to upstream HEAD version to correctly pass LDFLAGS

Changes v1 -> v2:
 * Use TARGET_CONFIGURE_OPTS instead of CC and LD only
 * Bump to upstream HEAD version to handle TARGET_CONFIGURE_OPTS
   correctly
 * Add comment for dependency on disabled Thumb2
 * Reduce help block column size in Config.in
 * Add URL of the project homepage
 * Disable SSL support when OpenSSL is not selected
---
 package/Config.in              |  1 +
 package/turbolua/Config.in     | 18 ++++++++++++++++++
 package/turbolua/turbolua.hash |  2 ++
 package/turbolua/turbolua.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 48 insertions(+)
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
index 0000000..34f66ef
--- /dev/null
+++ b/package/turbolua/Config.in
@@ -0,0 +1,18 @@
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
+
+comment "turbolua needs LuaJIT"
+	depends on !BR2_PACKAGE_LUAJIT
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
