From: Jonathan Liu <net147@gmail.com>
Date: Sat, 11 Aug 2012 16:11:35 +1000
Subject: [Buildroot] [PATCH] nodejs: new package
Message-ID: <1344665495-27246-1-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 package/Config.in        |  1 +
 package/nodejs/Config.in | 19 +++++++++++++++++
 package/nodejs/nodejs.mk | 54 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/python/python.mk |  1 -
 4 files changed, 74 insertions(+), 1 deletion(-)
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
index 0000000..bcc5f17
--- /dev/null
+++ b/package/nodejs/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_NODEJS
+	bool "nodejs"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Event-driven I/O server-side JavaScript environment based on V8.
+
+	  http://nodejs.org/
+
+config BR2_PACKAGE_NODEJS_NPM
+	bool "nodejs npm"
+	depends on BR2_PACKAGE_NODEJS
+	help
+	  Enable npm (Node Package Manager).
+
+config BR2_PACKAGE_NODEJS_WAF
+	bool "nodejs waf"
+	depends on BR2_PACKAGE_NODEJS
+	help
+	  Enable node-waf for building native modules.
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
new file mode 100644
index 0000000..8a0fa91
--- /dev/null
+++ b/package/nodejs/nodejs.mk
@@ -0,0 +1,54 @@
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
+		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
+		$(if $(BR2_PACKAGE_NODEJS_WAF),,--without-waf) \
+		--without-dtrace \
+		--without-etw \
+	)
+endef
+
+define NODEJS_BUILD_CMDS
+	PATH="$(HOST_DIR)/usr/bin:$(PATH)" $(MAKE) -C $(@D)
+endef
+
+define NODEJS_INSTALL_STAGING_CMDS
+	PATH="$(HOST_DIR)/usr/bin:$(PATH)" $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+define NODEJS_UNINSTALL_STAGING_CMDS
+	rm -f $(STAGING_DIR)/usr/bin/node
+	rm -f $(STAGING_DIR)/usr/bin/node-waf
+	rm -f $(STAGING_DIR)/usr/bin/npm
+	rm -rf $(STAGING_DIR)/usr/include/node
+	rm -rf $(STAGING_DIR)/usr/lib/node
+	rm -rf $(STAGING_DIR)/usr/lib/node_modules
+	rm -f $(STAGING_DIR)/usr/share/man/man1/node.1
+endef
+
+define NODEJS_INSTALL_TARGET_CMDS
+	PATH="$(HOST_DIR)/usr/bin:$(PATH)" $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install-bin
+endef
+
+define NODEJS_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/node
+endef
+
+$(eval $(generic-package))
diff --git a/package/python/python.mk b/package/python/python.mk
index fae4e5c..7b314ab 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -27,7 +27,6 @@ HOST_PYTHON_CONF_OPT += 	\
 	--disable-gdbm		\
 	--disable-bsddb		\
 	--disable-test-modules	\
-	--disable-bz2		\
 	--disable-ssl
 
 HOST_PYTHON_MAKE_ENV = \
-- 
1.7.11.3
