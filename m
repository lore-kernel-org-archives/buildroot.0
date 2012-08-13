From: Jonathan Liu <net147@gmail.com>
Date: Mon, 13 Aug 2012 13:05:50 +1000
Subject: [Buildroot] [PATCH v4 2/2] nodejs: new package
In-Reply-To: <1344827150-25067-1-git-send-email-net147@gmail.com>
References: <1344827150-25067-1-git-send-email-net147@gmail.com>
Message-ID: <1344827150-25067-3-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 package/Config.in        |  1 +
 package/nodejs/Config.in | 20 +++++++++++++++
 package/nodejs/nodejs.mk | 63 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 84 insertions(+)
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
index 0000000..52fb03d
--- /dev/null
+++ b/package/nodejs/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_NODEJS
+	bool "nodejs"
+	help
+	  Event-driven I/O server-side JavaScript environment based on V8.
+
+	  http://nodejs.org/
+
+if BR2_PACKAGE_NODEJS
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
index 0000000..442c5f9
--- /dev/null
+++ b/package/nodejs/nodejs.mk
@@ -0,0 +1,63 @@
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
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	NODEJS_DEPENDENCIES += openssl
+endif
+
+define NODEJS_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		PATH="$(HOST_PATH):$(PATH)" \
+		./configure \
+		--prefix=/usr \
+		--without-snapshot \
+		$(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl) \
+		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
+		$(if $(BR2_PACKAGE_NODEJS_WAF),,--without-waf) \
+		--without-dtrace \
+		--without-etw \
+	)
+endef
+
+define NODEJS_BUILD_CMDS
+	PATH="$(HOST_PATH):$(PATH)" $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define NODEJS_INSTALL_STAGING_CMDS
+	PATH="$(HOST_PATH):$(PATH)" $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+define NODEJS_UNINSTALL_STAGING_CMDS
+	rm -f $(STAGING_DIR)/usr/bin/node
+	rm -f $(STAGING_DIR)/usr/bin/node-waf
+	rm -f $(STAGING_DIR)/usr/bin/npm
+	rm -rf $(STAGING_DIR)/usr/include/node
+	rm -f $(STAGING_DIR)/usr/lib/dtrace/node.d
+	rm -rf $(STAGING_DIR)/usr/lib/node
+	rm -rf $(STAGING_DIR)/usr/lib/node_modules
+	rm -f $(STAGING_DIR)/usr/share/man/man1/node.1
+endef
+
+define NODEJS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 775 $(@D)/out/Release/node $(TARGET_DIR)/usr/bin/node
+endef
+
+define NODEJS_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/node
+endef
+
+# node.js configure is a Python script and does not use autotools
+$(eval $(generic-package))
-- 
1.7.11.3
