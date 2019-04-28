From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Sun, 28 Apr 2019 14:12:53 +0300
Subject: [Buildroot] [PATCH v2] package/zabbix: new package
Message-ID: <20190428111253.17263-1-skif@skif-web.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
---
 DEVELOPERS                                 |  3 +
 package/Config.in                          |  1 +
 package/zabbix/0001-fix-netsnmp-path.patch | 16 +++++
 package/zabbix/Config.in                   | 51 ++++++++++++++
 package/zabbix/zabbix-agent.service        | 13 ++++
 package/zabbix/zabbix-server.service       | 14 ++++
 package/zabbix/zabbix.hash                 |  1 +
 package/zabbix/zabbix.mk                   | 78 ++++++++++++++++++++++
 8 files changed, 177 insertions(+)
 create mode 100644 package/zabbix/0001-fix-netsnmp-path.patch
 create mode 100644 package/zabbix/Config.in
 create mode 100644 package/zabbix/zabbix-agent.service
 create mode 100644 package/zabbix/zabbix-server.service
 create mode 100644 package/zabbix/zabbix.hash
 create mode 100644 package/zabbix/zabbix.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 56556413aa..5ae6ee09f9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -121,6 +121,9 @@ N:	Alexandre Esse <alexandre.esse.dev@gmail.com>
 F:	package/kvazaar/
 F:	package/v4l2loopback/
 
+N:      Alexey Lukyanchuk <skif@skif-web.ru>
+F:      package/zabbix/
+
 N:	Alistair Francis <alistair@alistair23.me>
 F:	boot/opensbi/
 F:	package/xen/
diff --git a/package/Config.in b/package/Config.in
index f592e74a99..fe97e595ed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2079,6 +2079,7 @@ endif
 	source "package/xinetd/Config.in"
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
+	source "package/zabbix/Config.in"
 	source "package/znc/Config.in"
 
 endmenu
diff --git a/package/zabbix/0001-fix-netsnmp-path.patch b/package/zabbix/0001-fix-netsnmp-path.patch
new file mode 100644
index 0000000000..235bec3c18
--- /dev/null
+++ b/package/zabbix/0001-fix-netsnmp-path.patch
@@ -0,0 +1,16 @@
+Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
+
+--- a/m4/netsnmp.m4	2019-04-28 12:13:09.978661351 +0300
++++ b/m4/netsnmp.m4	2019-04-28 12:13:16.218598128 +0300
+@@ -88,7 +88,10 @@
+ 				esac
+ 			done
+ 		fi
+-
++	
++  SNMP_CFLAGS="-I. -I$STAGING_DIR/usr/bin/../../usr/include"
++  SNMP_LDFLAGS="-L$STAGING_DIR/usr/lib"
++  SNMP_LIBS="-lnetsnmp"
+ 		_save_netsnmp_cflags="$CFLAGS"
+ 		_save_netsnmp_ldflags="$LDFLAGS"
+ 		_save_netsnmp_libs="$LIBS"
diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
new file mode 100644
index 0000000000..ca6ab56468
--- /dev/null
+++ b/package/zabbix/Config.in
@@ -0,0 +1,51 @@
+config BR2_PACKAGE_ZABBIX
+	bool "zabbix"
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_PCRE
+	help
+	  zabbix monitoring system
+
+if BR2_PACKAGE_ZABBIX
+comment "zabbix server need nls support"
+
+config BR2_PACKAGE_ZABBIX_SERVER
+	bool "zabbix server"
+	depends on !BR2_BINFMT_FLAT
+	depends on BR2_SYSTEM_ENABLE_NLS
+	select BR2_PACKAGE_PHP
+	select BR2_PACKAGE_PHP_EXT_CTYPE
+	select BR2_PACKAGE_PHP_EXT_GETTEXT
+	select BR2_PACKAGE_PHP_EXT_BCMATH
+	select BR2_PACKAGE_PHP_EXT_MBSTRING
+	select BR2_PACKAGE_PHP_EXT_SOCKETS
+	select BR2_PACKAGE_PHP_EXT_MYSQLI
+	select BR2_PACKAGE_PHP_EXT_PDO_MYSQL
+	select BR2_PACKAGE_PHP_EXT_PDO
+	select BR2_PACKAGE_PHP_EXT_GD
+	select BR2_PACKAGE_PHP_EXT_LIBXML2
+	select BR2_PACKAGE_PHP_EXT_XMLREADER
+	select BR2_PACKAGE_PHP_EXT_XMLWRITER
+	select BR2_PACKAGE_PHP_EXT_SESSION
+	select BR2_PACKAGE_NETSNMP
+	select BR2_PACKAGE_LIBXML2
+	help
+	  Zabbix monitoring server
+
+if BR2_PACKAGE_ZABBIX_SERVER
+choice
+	prompt "zabbix server database backend"
+	default BR2_PACKAGE_ZABBIX_SERVER_MYSQL
+config BR2_PACKAGE_ZABBIX_SERVER_MYSQL
+	bool "mysql"
+	depends on BR2_PACKAGE_MYSQL
+config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
+	bool "posgresql"
+	depends on BR2_PACKAGE_POSTGRESQL
+endchoice
+endif
+
+config BR2_PACKAGE_ZABBIX_CLIENT
+	bool "zabbix client"
+	default n
+endif
diff --git a/package/zabbix/zabbix-agent.service b/package/zabbix/zabbix-agent.service
new file mode 100644
index 0000000000..31c8f81798
--- /dev/null
+++ b/package/zabbix/zabbix-agent.service
@@ -0,0 +1,13 @@
+Description=Zabbix Agent Daemon
+After=syslog.target network.target
+ 
+[Service]
+Type=forking
+ExecStart=/usr/sbin/zabbix_agentd
+ExecReload=/usr/local/sbin/zabbix_agentd -R config_cache_reload
+PIDFile=/tmp/zabbix_agentd.pid
+User=zabbix
+Group=zabbix
+ 
+[Install]
+WantedBy=multi-user.target
\ No newline at end of file
diff --git a/package/zabbix/zabbix-server.service b/package/zabbix/zabbix-server.service
new file mode 100644
index 0000000000..30a906e551
--- /dev/null
+++ b/package/zabbix/zabbix-server.service
@@ -0,0 +1,14 @@
+Description=Zabbix Server Daemon
+Requires=
+After=syslog.target network.target
+ 
+[Service]
+Type=forking
+ExecStart=/usr/sbin/zabbix_server
+ExecReload=/usr/sbin/zabbix_server -R config_cache_reload
+PIDFile=/tmp/zabbix_server.pid
+User=zabbix
+Group=zabbix
+ 
+[Install]
+WantedBy=multi-user.target
\ No newline at end of file
diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
new file mode 100644
index 0000000000..56b1bf88f0
--- /dev/null
+++ b/package/zabbix/zabbix.hash
@@ -0,0 +1 @@
+sha256	4915d52352163e40398ca9b56b8176ea369dfd475e291087c50a3d9ae2459076	zabbix-4.2.1.tar.gz
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
new file mode 100644
index 0000000000..9da48514d9
--- /dev/null
+++ b/package/zabbix/zabbix.mk
@@ -0,0 +1,78 @@
+################################################################################
+#
+#zabbix
+#
+################################################################################
+
+ZABBIX_VERSION = 4.2.1
+ZABBIX_SITE = https://sourceforge.net/projects/zabbix/files
+
+ZABBIX_INSTALL_STAGING = YES
+ZABBIX_DEPENDENCIES = pcre libcurl libevent netsnmp libxml2
+ZABBIX_CONF_OPTS = --with-libcurl --with-libevent --with-libxml2 --with-net-snmp=$(STAGING_DIR)/usr/bin/
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+ifeq ($(BR2_PACKAGE_ZABBIX_CLIENT),y)
+ZABBIX_SYSTEMD_UNITS += zabbix-agent.service
+endif
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER),y)
+ZABBIX_SYSTEMD_UNITS += zabbix-server.service
+endif
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_INSTALL_INIT_SYSTEMD
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER),y)
+ZABBIX_CONF_OPTS += --enable-server
+ZABBIX_DEPENDENCIES += php
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_COPY_FRONTEND
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_MYSQL),y)
+ZABBIX_DEPENDENCIES += mysql
+ZABBIX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_PREPARE_MYSQL
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL),y)
+ZABBIX_DEPENDENCIES += postgresql
+ZABBIX_CONF_OPTS += --with-postgresql=$(STAGING_DIR)/usr/bin/pg_config
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_PREPARE_POSTGRESQL
+endif
+
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_CLIENT),y)
+ZABBIX_CONF_OPTS += --enable-agent
+endif
+
+define ZABBIX_SERVER_COPY_FRONTEND
+	mkdir -p $(TARGET_DIR)/usr/zabbix/php-frontend/
+	cp -r $(@D)/frontends/php/* $(TARGET_DIR)/usr/zabbix/php-frontend/
+endef
+
+define ZABBIX_SERVER_PREPARE_POSTGRESQL
+	mkdir -p $(TARGET_DIR)/usr/zabbix/postgresql_schema
+	cp -r $(@D)/database/postgresql/*\.sql $(TARGET_DIR)/usr/zabbix/postgresql_schema/
+	sed -i '/^Requires=/ s/$$/postgresql.service/' $(TARGET_DIR)/usr/lib/systemd/system/zabbix-server.service
+	sed -i '/^After=/ s/$$/ postgresql.service/' $(TARGET_DIR)/usr/lib/systemd/system/zabbix-server.service
+endef
+
+define ZABBIX_SERVER_PREPARE_MYSQL
+	mkdir -p $(TARGET_DIR)/usr/zabbix/mysql_schema/
+	cp -r $(@D)/database/mysql/*\.sql $(TARGET_DIR)/usr/zabbix/mysql_schema/
+	sed -i '/^Requires=/ s/$$/ mysql.service/' $(TARGET_DIR)/usr/lib/systemd/system/zabbix-server.service
+	sed -i '/^After=/ s/$$/ mysql.service/' $(TARGET_DIR)/usr/lib/systemd/system/zabbix-server.service
+endef
+
+define ZABBIX_INSTALL_INIT_SYSTEMD
+	$(foreach unit,$(ZABBIX_SYSTEMD_UNITS),\
+		echo UNIT=$(unit) && \
+		$(INSTALL) -D -m 644 package/zabbix/$(unit) $(TARGET_DIR)/usr/lib/systemd/system/$(unit) && \
+		mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants && \
+		ln -fs ../../../../usr/lib/systemd/system/$(unit) $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/$(unit) ;)
+endef
+
+define ZABBIX_USERS
+	zabbix -1 zabbix -1 !- /var/lib/zabbix - zabbix zabbix user
+endef
+
+$(eval $(autotools-package))
-- 
2.20.1
