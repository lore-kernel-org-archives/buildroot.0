From: Jonathan Liu <net147@gmail.com>
Date: Sun, 12 Aug 2012 12:35:27 +1000
Subject: [Buildroot] [PATCH v2 2/2] nodejs: new package
In-Reply-To: <1344738927-24698-1-git-send-email-net147@gmail.com>
References: <1344738927-24698-1-git-send-email-net147@gmail.com>
Message-ID: <1344738927-24698-3-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 package/Config.in        |  1 +
 package/nodejs/Config.in | 26 ++++++++++++++++++++++++++
 package/nodejs/nodejs.mk | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)
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
index 0000000..3fa79cb
--- /dev/null
+++ b/package/nodejs/Config.in
@@ -0,0 +1,26 @@
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
index 0000000..43e871a
--- /dev/null
+++ b/package/nodejs/nodejs.mk
@@ -0,0 +1,39 @@
+#############################################################
+#
+# nodejs
+#
+#############################################################
+NODEJS_VERSION = 0.8.6
+NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
+NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
+NODEJS_INSTALL_STAGING = YES
+NODEJS_DEPENDENCIES = host-python
+NODEJS_LICENSE = MIT
+
+define NODEJS_CONFIGURE_CMDS
+	(cd $(@D); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_ARGS) \
+		$(TARGET_CONFIGURE_OPTS) \
+		PATH="$(HOST_DIR)/usr/bin:$(PATH)" \
+		./configure \
+		--prefix=/usr \
+		--without-snapshot \
+		$(if $(BR2_PACKAGE_NODEJS_SSL),,--without-ssl) \
+		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
+		$(if $(BR2_PACKAGE_NODEJS_WAF),,--without-waf) \
+		--without-dtrace \
+		--without-etw \
+	)
+endef
+
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
