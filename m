From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon,  4 Apr 2016 11:54:42 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/turbolua: new package
In-Reply-To: <1459763682-29799-1-git-send-email-m.niestroj@grinn-global.com>
References: <1459763682-29799-1-git-send-email-m.niestroj@grinn-global.com>
Message-ID: <1459763682-29799-2-git-send-email-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/Config.in              |  1 +
 package/turbolua/Config.in     | 18 ++++++++++++++++++
 package/turbolua/turbolua.hash |  2 ++
 package/turbolua/turbolua.mk   | 30 ++++++++++++++++++++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 package/turbolua/Config.in
 create mode 100644 package/turbolua/turbolua.hash
 create mode 100644 package/turbolua/turbolua.mk

diff --git a/package/Config.in b/package/Config.in
index 1467f33..d58d863 100644
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
index 0000000..a742097
--- /dev/null
+++ b/package/turbolua/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_TURBOLUA
+	bool "turbolua"
+	depends on BR2_PACKAGE_LUAJIT
+	# Turbolua program within thumb2 system receives "Illegal
+	# instruction" and "Segmentation fault" errors.
+	depends on !BR2_ARM_INSTRUCTIONS_THUMB2
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
index 0000000..d16c8c4
--- /dev/null
+++ b/package/turbolua/turbolua.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 25dbc148e49ce46ecde34057fa88cb8590efeec3f5814ebaa6ce3b1470e71764 turbolua-51dabab52ec957438645fa227f0135c1221f126b.tar.gz
diff --git a/package/turbolua/turbolua.mk b/package/turbolua/turbolua.mk
new file mode 100644
index 0000000..10a8ed7
--- /dev/null
+++ b/package/turbolua/turbolua.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# turbolua
+#
+################################################################################
+
+TURBOLUA_VERSION = 51dabab52ec957438645fa227f0135c1221f126b
+TURBOLUA_SITE = $(call github,kernelsauce,turbo,$(TURBOLUA_VERSION))
+TURBOLUA_DEPENDENCIES = luajit
+TURBOLUA_LICENSE = Apache-2.0
+TURBOLUA_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+SSL = openssl
+else
+SSL = none
+endif
+
+define TURBOLUA_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) SSL="$(SSL)" \
+		LUAJIT_VERSION="$(LUAJIT_VERSION)" -C $(@D) all
+endef
+
+define TURBOLUA_INSTALL_TARGET_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) SSL="$(SSL)" LDCONFIG=true \
+		LUAJIT_VERSION="$(LUAJIT_VERSION)" \
+		PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.8.0
