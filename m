From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Sat, 13 Apr 2019 22:01:02 +0300
Subject: [Buildroot] [PATCH 1/1] package/zabbix: new package
Message-ID: <20190413190102.27538-1-skif@skif-web.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
---
 package/Config.in                    |  4 +-
 package/zabbix/Config.in             | 54 +++++++++++++++++++++
 package/zabbix/zabbix-agent.service  | 14 ++++++
 package/zabbix/zabbix-server.service | 15 ++++++
 package/zabbix/zabbix.mk             | 70 ++++++++++++++++++++++++++++
 5 files changed, 155 insertions(+), 2 deletions(-)
 create mode 100644 package/zabbix/Config.in
 create mode 100644 package/zabbix/zabbix-agent.service
 create mode 100644 package/zabbix/zabbix-server.service
 create mode 100644 package/zabbix/zabbix.mk

diff --git a/package/Config.in b/package/Config.in
index eed842c67a..19a89d5e0c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2070,8 +2070,8 @@ endif
 	source "package/xinetd/Config.in"
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
-	source "package/znc/Config.in"
-
+        source "package/zabbix/Config.in"
+        source "package/znc/Config.in"
 endmenu
 
 menu "Package managers"
diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
new file mode 100644
index 0000000000..1105c8d2e0
--- /dev/null
+++ b/package/zabbix/Config.in
@@ -0,0 +1,54 @@
+config BR2_PACKAGE_ZABBIX
+	bool "zabbix"
+	default n
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_PCRE
+	help
+	  zabbix monitoring system
+
+if BR2_PACKAGE_ZABBIX
+
+if (!BR2_PACKAGE_APACHE && !BR2_PACKAGE_NGINX && !BR2_PACKAGE_LIGHTTPD) || !BR2_PACKAGE_ORACLE_MYSQL_SERVER
+comment "zabbix server need http server with php and sql server"
+endif
+
+if (BR2_PACKAGE_APACHE || BR2_PACKAGE_NGINX || BR2_PACKAGE_LIGHTTPD) && BR2_PACKAGE_ORACLE_MYSQL_SERVER
+config BR2_PACKAGE_ZABBIX_SERVER
+	bool "zabbix server"
+	default n
+	select BR2_PACKAGE_PHP
+	select BR2_PACKAGE_PHP_EXT_CTYPE
+	select BR2_PACKAGE_PHP_EXT_GETTEXT
+	select BR2_PACKAGE_PHP_EXT_BCMATH
+	select BR2_PACKAGE_PHP_EXT_MBSTRING
+	select BR2_PACKAGE_PHP_EXT_SOCKETS
+	select BR2_PACKAGE_PHP_EXT_MYSQLI
+	select BR2_PACKAGE_PHP_EXT_PDO_MYSQL
+	select BR2_PACKAGE_PHP_EXT_GD
+	select BR2_PACKAGE_PHP_EXT_LIBXML2
+	select BR2_PACKAGE_PHP_EXT_XMLREADER
+	select BR2_PACKAGE_PHP_EXT_XMLWRITER
+	select BR2_PACKAGE_PHP_EXT_SESSION
+	help
+	  Zabbix monitoring server
+endif
+if BR2_PACKAGE_ZABBIX_SERVER
+choice
+	prompt "zabbix server database backend"
+	default BR2_PACKAGE_ZABBIX_SERVER_MYSQL
+config BR2_PACKAGE_ZABBIX_SERVER_MYSQL
+	bool "mysql"
+config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
+	bool "posgresql"
+endchoice
+
+config BR2_PACKAGE_ZABBIX_SERVER_HTML_ROOT
+	string "Location of frontend files"
+	default "/usr/htdocs"
+endif
+
+config BR2_PACKAGE_ZABBIX_CLIENT
+	bool "zabbix client"
+	default n
+endif
diff --git a/package/zabbix/zabbix-agent.service b/package/zabbix/zabbix-agent.service
new file mode 100644
index 0000000000..b46c91e30b
--- /dev/null
+++ b/package/zabbix/zabbix-agent.service
@@ -0,0 +1,14 @@
+Description=Zabbix Agent Daemon
+After=syslog.target network.target mysql.service
+ 
+[Service]
+Type=forking
+ExecStart=/usr/sbin/zabbix_agentd
+ExecReload=/usr/sbin/zabbix_agentd -R config_cache_reload
+PIDFile=/tmp/zabbix_agentd.pid
+ 
+User=zabbix
+Group=zabbix
+ 
+[Install]
+WantedBy=multi-user.target
diff --git a/package/zabbix/zabbix-server.service b/package/zabbix/zabbix-server.service
new file mode 100644
index 0000000000..f4a8d599ad
--- /dev/null
+++ b/package/zabbix/zabbix-server.service
@@ -0,0 +1,15 @@
+Description=Zabbix Server Daemon
+Requires=mysql.service
+After=syslog.target network.target mysql.service
+ 
+[Service]
+Type=forking
+ExecStart=/usr/sbin/zabbix_server
+ExecReload=/usr/sbin/zabbix_server -R config_cache_reload
+PIDFile=/tmp/zabbix_server.pid
+ 
+User=zabbix
+Group=zabbix
+ 
+[Install]
+WantedBy=multi-user.target
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
new file mode 100644
index 0000000000..f4024751a9
--- /dev/null
+++ b/package/zabbix/zabbix.mk
@@ -0,0 +1,70 @@
+################################################################################
+#
+#zabbix
+#
+################################################################################
+
+ZABBIX_VERSION = 4.2.0
+ZABBIX_SITE = https://sourceforge.net/projects/zabbix/files
+
+ZABBIX_INSTALL_STAGING = YES
+ZABBIX_DEPENDENCIES += pcre libcurl libevent
+ZABBIX_CONF_OPTS = --with-libcurl --with-libevent
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER),y)
+ZABBIX_CONF_OPTS += --enable-server
+ZABBIX_DEPENDENCIES += php mysql
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_COPY_FRONTEND
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_COPY_SQL_SCHEMA_FILES
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_CLIENT),y)
+ZABBIX_CONF_OPTS += --enable-agent
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_MYSQL),y)
+ZABBIX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_COPY_MYSQL_SQL_SCHEMA_FILES
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL),y)
+ZABBIX_CONF_OPTS += --with-postgresql
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_COPY_POSTGRESQL_SQL_SCHEMA_FILES
+endif
+
+define ZABBIX_COPY_FRONTEND
+	mkdir -p $(TARGET_DIR)/$(BR2_PACKAGE_ZABBIX_SERVER_HTML_ROOT)
+	cp -r $(@D)/frontends/php/* $(TARGET_DIR)/$(BR2_PACKAGE_ZABBIX_SERVER_HTML_ROOT)
+endef
+
+define ZABBIX_COPY_POSTGRESQL_SQL_SCHEMA_FILES
+	mkdir -p $(TARGET_DIR)/usr/zabbix/
+	cp -r $(@D)/database/postgresql $(TARGET_DIR)/usr/zabbix/
+endef
+
+define ZABBIX_COPY_MYSQL_SQL_SCHEMA_FILES
+	mkdir -p $(TARGET_DIR)/usr/zabbix/
+	cp -r $(@D)/database/mysql $(TARGET_DIR)/usr/zabbix/
+endef
+
+define ZABBIX_SERVER_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/zabbix/zabbix-server.service $(TARGET_DIR)/usr/lib/systemd/system/zabbix-server.service
+endef
+
+define ZABBIX_AGENT_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/zabbix/zabbix-agent.service $(TARGET_DIR)/usr/lib/systemd/system/zabbix-agent.service
+endef
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+ifeq ($(BR2_PACKAGE_ZABBIX_CLIENT),y)
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_AGENT_INSTALL_INIT_SYSTEMD
+endif
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER),y)
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_INSTALL_INIT_SYSTEMD
+endif
+endif
+
+define ZABBIX_USERS
+	zabbix -1 zabbix -1 !- /var/lib/zabbix - zabbix zabbix user
+endef
+
+$(eval $(autotools-package))
-- 
2.20.1
