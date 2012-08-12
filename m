From: Jonathan Liu <net147@gmail.com>
Date: Sun, 12 Aug 2012 18:52:05 +1000
Subject: [Buildroot] [PATCH v3 2/2] nodejs: new package
In-Reply-To: <1344761525-532-1-git-send-email-net147@gmail.com>
References: <1344761525-532-1-git-send-email-net147@gmail.com>
Message-ID: <1344761525-532-3-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 package/Config.in        |  1 +
 package/nodejs/Config.in | 38 ++++++++++++++++++++++++++++++++++++++
 package/nodejs/nodejs.mk | 44 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 package/nodejs/Config.in
 create mode 100644 package/nodejs/nodejs.mk

diff --git a/package/Config.in b/package/Config.in
index f308de7..76c589b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -263,6 +263,7 @@ source "package/xavante/Config.in"
 endmenu
 endif
 source "package/microperl/Config.in"
+source "package/nodejs/Config.in"
 source "package/php/Config.in"
 source "package/python/Config.in"
 if BR2_PACKAGE_PYTHON
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
new file mode 100644
index 0000000..feb279b
--- /dev/null
+++ b/package/nodejs/Config.in
@@ -0,0 +1,38 @@
+config BR2_PACKAGE_NODEJS
+	bool "nodejs"
+	help
+	  Event-driven I/O server-side JavaScript environment based on V8.
+
+	  http://nodejs.org/
+
+if BR2_PACKAGE_NODEJS
+
+config BR2_PACKAGE_NODEJS_SSL
+	bool "enable SSL support"
+	default y
+	help
+	  Enable SSL support.
+
+if BR2_PACKAGE_NODEJS_SSL
+
+config BR2_PACKAGE_NODEJS_SHARED_OPENSSL
+	bool "use shared OpenSSL"
+	default y
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Use shared OpenSSL library instead of statically linked
+	  OpenSSL bundled with node.js.
+
+endif
+
+config BR2_PACKAGE_NODEJS_NPM
+	bool "npm"
+	help
+	  Enable npm (Node Package Manager).
+
+config BR2_PACKAGE_NODEJS_WAF
+	bool "waf"
+	help
+	  Enable node-waf for building native modules.
+
+endif
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
new file mode 100644
index 0000000..3ce4707
--- /dev/null
+++ b/package/nodejs/nodejs.mk
@@ -0,0 +1,44 @@
+#############################################################
+#
+# nodejs
+#
+#############################################################
+NODEJS_VERSION = 0.8.6
+NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
+NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
+NODEJS_DEPENDENCIES = host-python
+NODEJS_LICENSE = MIT
+
+# Headers and node-waf binary are needed in staging to build 3rd-party
+# native modules
+NODEJS_INSTALL_STAGING = YES
+
+define NODEJS_CONFIGURE_CMDS
+	(cd $(@D); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_ARGS) \
+		$(TARGET_CONFIGURE_OPTS) \
+		PATH="$(HOST_DIR)/usr/bin:$(PATH)" \
+		./configure \
+		--prefix=/usr \
+		--without-snapshot \
+		$(if $(BR2_PACKAGE_NODEJS_SHARED_OPENSSL),--shared-openssl,) \
+		$(if $(BR2_PACKAGE_NODEJS_SSL),,--without-ssl) \
+		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
+		$(if $(BR2_PACKAGE_NODEJS_WAF),,--without-waf) \
+		--without-dtrace \
+		--without-etw \
+	)
+endef
+
+NODEJS_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
+NODEJS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
+
+define NODEJS_INSTALL_TARGET_CMDS
+       $(INSTALL) -D -m 775 $(@D)/out/Release/node $(TARGET_DIR)/usr/bin/node
+endef
+
+define NODEJS_UNINSTALL_TARGET_CMDS
+       rm -f $(TARGET_DIR)/usr/bin/node
+endef
+
+$(eval $(autotools-package))
-- 
1.7.11.3
