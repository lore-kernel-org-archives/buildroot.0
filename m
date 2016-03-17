From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu, 17 Mar 2016 16:27:39 +0100
Subject: [Buildroot] [PATCH] package/turbolua: new package
Message-ID: <1458228459-2401-1-git-send-email-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/Config.in              |  1 +
 package/turbolua/Config.in     | 13 +++++++++++++
 package/turbolua/turbolua.hash |  2 ++
 package/turbolua/turbolua.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/turbolua/Config.in
 create mode 100644 package/turbolua/turbolua.hash
 create mode 100644 package/turbolua/turbolua.mk

diff --git a/package/Config.in b/package/Config.in
index 2401867..e722684 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -540,6 +540,7 @@ menu "Lua libraries/modules"
 	source "package/lzlib/Config.in"
 	source "package/orbit/Config.in"
 	source "package/rings/Config.in"
+	source "package/turbolua/Config.in"
 	source "package/wsapi/Config.in"
 	source "package/xavante/Config.in"
 endmenu
diff --git a/package/turbolua/Config.in b/package/turbolua/Config.in
new file mode 100644
index 0000000..f42f4ca
--- /dev/null
+++ b/package/turbolua/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_TURBOLUA
+	bool "turbolua"
+	depends on BR2_PACKAGE_LUAJIT
+	depends on !BR2_ARM_INSTRUCTIONS_THUMB2
+	help
+	  Turbo.lua is a framework built for LuaJIT 2 to simplify the task of
+	  building fast and scalable network applications. It uses a
+	  event-driven, non-blocking, no thread design to deliver excellent
+	  performance and minimal footprint to high-load applications while
+	  also providing excellent support for embedded uses. The toolkit can
+	  be used for HTTP REST API?s, traditional dynamic web pages through
+	  templating, open connections like WebSockets, or just as high level
+	  building blocks for native speed network applications.
diff --git a/package/turbolua/turbolua.hash b/package/turbolua/turbolua.hash
new file mode 100644
index 0000000..e0a54d7
--- /dev/null
+++ b/package/turbolua/turbolua.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 5bee3132d28e56b432bd76221b4bd221666130000814a7eb5867f12b11d23b0f turbolua-v2.0.4.tar.gz
diff --git a/package/turbolua/turbolua.mk b/package/turbolua/turbolua.mk
new file mode 100644
index 0000000..ed4e0f9
--- /dev/null
+++ b/package/turbolua/turbolua.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# turbolua
+#
+################################################################################
+
+TURBOLUA_VERSION = v2.0.4
+TURBOLUA_SITE = $(call github,kernelsauce,turbo,$(TURBOLUA_VERSION))
+TURBOLUA_DEPENDENCIES = luajit
+TURBOLUA_LICENSE = Apache-2.0
+TURBOLUA_LICENSE_FILES = LICENSE
+
+define TURBOLUA_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
+		LUAJIT_VERSION="$(LUAJIT_VERSION)" -C $(@D) all
+endef
+
+define TURBOLUA_INSTALL_TARGET_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDCONFIG=true \
+		LUAJIT_VERSION="$(LUAJIT_VERSION)" \
+		PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.7.3
