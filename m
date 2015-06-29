From: Julien CORJON <corjon.j@ecagroup.com>
Date: Mon, 29 Jun 2015 09:02:43 +0000
Subject: [Buildroot] [PATCH v2] monkey: new package
Message-ID: <570c4a99-dc8a-4605-9c7e-0f08da3ae412@MAIL-SINTERS-01.sinters-int.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Morgan Delestre <m.delestre@sinters.fr>

Monkey is a small, fast and lightweight open source Web Server for GNU/Linux. 
It has been designed with focus in embedded devices, therefore its scalable by 
nature having a low memory and CPU consumption and an excellent performance.

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
Changes v1 -> v2:
  - Fix typo (suggested by Alexandre)
  - Change autotools for generic-package (suggested by Thomas)
  - Add hash file
  - Add licence
  - Add uClib & musl support
  - Add shared library option

 package/Config.in          |   1 +
 package/monkey/Config.in   |  19 ++++++++
 package/monkey/monkey.hash |   3 ++
 package/monkey/monkey.mk   | 109 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 132 insertions(+)
 create mode 100644 package/monkey/Config.in
 create mode 100644 package/monkey/monkey.hash
 create mode 100644 package/monkey/monkey.mk

diff --git a/package/Config.in b/package/Config.in
index c2f6524..477cc47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1226,6 +1226,7 @@ endif
 	source "package/modem-manager/Config.in"
 	source "package/mongoose/Config.in"
 	source "package/mongrel2/Config.in"
+	source "package/monkey/Config.in"
 	source "package/mosquitto/Config.in"
 	source "package/mrouted/Config.in"
 	source "package/mtr/Config.in"
diff --git a/package/monkey/Config.in b/package/monkey/Config.in
new file mode 100644
index 0000000..5be2284
--- /dev/null
+++ b/package/monkey/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_MONKEY
+	bool "monkey"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Monkey Server is a fast and lightweight web server for Linux platforms.
+
+	  http://monkey-project.com/
+
+if BR2_PACKAGE_MONKEY
+
+config BR2_PACKAGE_MONKEY_SHARED
+	bool "shared library in addition to stand-alone server"
+	help
+	  Build Monkey as a shared library in addition to stand-alone server
+
+endif
+
+comment "monkey needs an toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/monkey/monkey.hash b/package/monkey/monkey.hash
new file mode 100644
index 0000000..6c7eada
--- /dev/null
+++ b/package/monkey/monkey.hash
@@ -0,0 +1,3 @@
+# md5 from http://monkey-project.com/releases/1.5/monkey-1.5.6.tar.gz.md5, sha256 locally computed:
+md5    9699e4c9ea6ce6b989907c252ae80254 				monkey-1.5.6.tar.gz
+sha256 7c3d845306aa74ee6effd7ab6169d16ac4e6450e564954d0d0baa2d1e9be1a22	monkey-1.5.6.tar.gz
diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
new file mode 100644
index 0000000..b73d0bb
--- /dev/null
+++ b/package/monkey/monkey.mk
@@ -0,0 +1,109 @@
+################################################################################
+#
+# monkey
+#
+################################################################################
+MONKEY_VERSION_MAJOR = 1.5
+MONKEY_VERSION = $(MONKEY_VERSION_MAJOR).6
+MONKEY_SOURCE = monkey-$(MONKEY_VERSION).tar.gz
+MONKEY_SITE = http://monkey-project.com/releases/$(MONKEY_VERSION_MAJOR)/
+MONKEY_LICENCE = Apache-2.0
+MONKEY_LICENCE_FILE = LICENSE
+
+MONKEY_SYSCONF_DIR = /etc/monkey
+MONKEY_DATA_DIR = /usr/local/monkey
+MONKEY_LOG_DIR = /var/log
+MONKEY_PLUGIN_DIR = /usr/lib/monkey
+
+MONKEY_CONF_OPTS = \
+	--prefix=/usr \
+	--sysconfdir=$(MONKEY_SYSCONF_DIR) \
+	--datadir=$(MONKEY_DATA_DIR) \
+	--mandir=/usr/share/man \
+	--logdir=$(MONKEY_LOG_DIR) \
+	--pidfile=/var/run \
+	--plugdir=$(MONKEY_PLUGIN_DIR)
+
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+MONLEY_CONF_OPTS += --uclib-mode
+endif
+
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+MONKEY_CONF_OPTS += --musl-mode
+endif
+
+ifeq ($(BR2_PACKAGE_MONKEY_SHARED),y)
+MONKEY_CONF_OPTS += --enable-shared
+MONKEY_INSTALL_STAGING = YES
+endif
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+MONKEY_CONF_OPT += --debug
+endif
+
+define MONKEY_CONFIGURE_CMDS
+	(cd $(@D); ./configure $(MONKEY_CONF_OPTS))
+endef
+
+define MONKEY_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define MONKEY_INSTALL_STAGING_CMDS
+       $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+define MONKEY_INSTALL_TARGET_BIN
+	$(INSTALL) -d $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 755 $(@D)/bin/* $(TARGET_DIR)/usr/bin/
+endef
+
+define MONKEY_INSTALL_TARGET_LIBRARY
+	$(INSTALL) -m 644 $(@D)/src/libmonkey.so.$(MONKEY_VERSION_MAJOR) $(TARGET_DIR)/usr/lib
+	-ln -sf libmonkey.$(MONKEY_VERSION_MAJOR) $(TARGET_DIR)/usr/lib/libmonkey.so
+endef
+
+define MONKEY_INSTALL_TARGET_CONFIGURATION
+	$(INSTALL) -d $(TARGET_DIR)$(MONKEY_SYSCONF_DIR)
+	$(INSTALL) -d $(TARGET_DIR)${MONKEY_SYSCONF_DIR}/plugins
+	$(INSTALL) -d $(TARGET_DIR)${MONKEY_SYSCONF_DIR}/sites
+	$(INSTALL) -m 644 $(@D)/conf/*.* $(TARGET_DIR)$(MONKEY_SYSCONF_DIR)
+	cp -r $(@D)/conf/plugins/* $(TARGET_DIR)${MONKEY_SYSCONF_DIR}/plugins/
+endef
+
+define MONKEY_INSTALL_TARGET_PLUGINS
+	$(INSTALL) -d $(TARGET_DIR)${MONKEY_PLUGIN_DIR}
+	$(INSTALL) -m 644 $(@D)/plugins/*/*.so $(TARGET_DIR)${MONKEY_PLUGIN_DIR}/
+endef
+
+define MONKEY_INSTALL_TARGET_DATA
+	$(INSTALL) -d $(TARGET_DIR)${MONKEY_DATA_DIR}
+	$(INSTALL) -d $(TARGET_DIR)$(MONKEY_DATA_DIR)/imgs
+	$(INSTALL) -d $(TARGET_DIR)$(MONKEY_DATA_DIR)/css
+	$(INSTALL) -m 644 $(@D)/htdocs/index.html $(TARGET_DIR)$(MONKEY_DATA_DIR)
+	$(INSTALL) -m 644 $(@D)/htdocs/404.html $(TARGET_DIR)$(MONKEY_DATA_DIR)
+	$(INSTALL) -m 644 $(@D)/htdocs/favicon.ico $(TARGET_DIR)$(MONKEY_DATA_DIR)
+	$(INSTALL) -m 644 $(@D)/htdocs/imgs/monkey_logo.png $(TARGET_DIR)$(MONKEY_DATA_DIR)/imgs
+	$(INSTALL) -m 644 $(@D)/htdocs/imgs/info_pic.jpg $(TARGET_DIR)$(MONKEY_DATA_DIR)/imgs
+	$(INSTALL) -m 644 $(@D)/htdocs/css/bootstrap.min.css $(TARGET_DIR)$(MONKEY_DATA_DIR)/css
+	$(INSTALL) -d $(TARGET_DIR)${MONKEY_LOG_DIR}
+endef
+
+ifeq ($(BR2_PACKAGE_MONKEY_SHARED),y)
+define MONKEY_INSTALL_TARGET_CMDS
+	$(MONKEY_INSTALL_TARGET_BIN)
+	$(MONKEY_INSTALL_TARGET_LIBRARY)
+	$(MONKEY_INSTALL_TARGET_CONFIGURATION)
+	$(MONKEY_INSTALL_TARGET_PLUGINS)
+	$(MONKEY_INSTALL_TARGET_DATA)
+endef
+else
+define MONKEY_INSTALL_TARGET_CMDS
+        $(MONKEY_INSTALL_TARGET_BIN)
+        $(MONKEY_INSTALL_TARGET_CONFIGURATION)
+        $(MONKEY_INSTALL_TARGET_PLUGINS)
+        $(MONKEY_INSTALL_TARGET_DATA)
+endef
+endif
+
+$(eval $(generic-package))
-- 
2.1.0
