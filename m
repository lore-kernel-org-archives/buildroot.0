From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Mon,  1 Jul 2019 14:06:33 +0300
Subject: [Buildroot] [PATCH v3 1/1] package/zabbix: new package
Message-ID: <20190701110633.5618-1-skif@skif-web.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexey <skif@skif-web.ru>

Provides zabbix server (with sql-files and php-frontend, which placed in /usr/zabbix) and client. Zabbix client always installed.

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru)

----
Changes v2 -> v3:
Remove PHP dependencies (server frontend may be installed on other machine)
Add GLIBC dependence
PID-files moved to /run/zabbix
Zabbix updated to 4.2.4
SNMP-patch removed (now build fine)

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
---
 DEVELOPERS                           |  3 ++
 package/Config.in                    |  1 +
 package/zabbix/Config.in             | 55 +++++++++++++++++++++
 package/zabbix/zabbix-agent.service  | 14 ++++++
 package/zabbix/zabbix-server.service | 15 ++++++
 package/zabbix/zabbix.hash           |  1 +
 package/zabbix/zabbix.mk             | 73 ++++++++++++++++++++++++++++
 7 files changed, 162 insertions(+)
 create mode 100644 package/zabbix/Config.in
 create mode 100644 package/zabbix/zabbix-agent.service
 create mode 100644 package/zabbix/zabbix-server.service
 create mode 100644 package/zabbix/zabbix.hash
 create mode 100644 package/zabbix/zabbix.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e9c521f400..fd444bea0e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -122,6 +122,9 @@ N:	Alexandre Esse <alexandre.esse.dev@gmail.com>
 F:	package/kvazaar/
 F:	package/v4l2loopback/
 
+N:      Alexey Lukyanchuk <skif@skif-web.ru>
+F:      package/zabbix/
+
 N:	Alistair Francis <alistair@alistair23.me>
 F:	boot/opensbi/
 F:	package/xen/
diff --git a/package/Config.in b/package/Config.in
index d501b5a65b..4f21a40af3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2094,6 +2094,7 @@ endif
 	source "package/xinetd/Config.in"
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
+	source "package/zabbix/Config.in"
 	source "package/znc/Config.in"
 
 endmenu
diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
new file mode 100644
index 0000000000..6b74d24500
--- /dev/null
+++ b/package/zabbix/Config.in
@@ -0,0 +1,55 @@
+config BR2_PACKAGE_ZABBIX
+	bool "zabbix"
+	depends on BR2_TOOLCHAIN_BUILDROOT_GLIBC
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_NETSNMP
+	select BR2_PACKAGE_ZABBIX_CLIENT
+	select BR2_PACKAGE_PCRE # runtime
+	select BR2_TOOLCHAIN_BUILDROOT_WCHAR #zabbix runtime
+	select BR2_TOOLCHAIN_BUILDROOT_CXX #oracle-mysql
+	select BR2_PACKAGE_ZLIB
+	  help
+	  zabbix monitoring system
+
+if BR2_PACKAGE_ZABBIX
+
+config BR2_PACKAGE_ZABBIX_SERVER
+	bool "zabbix server"
+	depends on BR2_USE_MMU # netsnmp
+	select BR2_SYSTEM_ENABLE_NLS
+	select BR2_PACKAGE_LIBCURL # runtime
+	help
+	  Zabbix monitoring server
+	  Server php-frontends files placed in \
+	  $(TARGET_DIR)/usr/zabbix/php-frontend
+	  Database initial files for postgres are placed in \
+	   /usr/zabbix/postgresql_schema/
+	  Database initial files for mysql are placed in\
+	   /usr/zabbix/mysql_schema/
+
+if BR2_PACKAGE_ZABBIX_SERVER
+
+choice
+	prompt "zabbix server database backend"
+	default BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
+	help
+	  Select database backend for zabbix server
+
+config BR2_PACKAGE_ZABBIX_SERVER_MYSQL
+	bool "Use mysql support"
+	select BR2_PACKAGE_MYSQL
+	select BR2_PACKAGE_ORACLE_MYSQL
+	select BR2_PACKAGE_ORACLE_MYSQL_SERVER
+
+config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
+	bool "Use postgresql support"
+	select BR2_PACKAGE_POSTGRESQL
+
+endchoice
+
+endif
+
+config BR2_PACKAGE_ZABBIX_CLIENT
+	bool "zabbix client"
+endif
diff --git a/package/zabbix/zabbix-agent.service b/package/zabbix/zabbix-agent.service
new file mode 100644
index 0000000000..27ae034b59
--- /dev/null
+++ b/package/zabbix/zabbix-agent.service
@@ -0,0 +1,14 @@
+Description=Zabbix Agent Daemon
+After=syslog.target network.target
+ 
+[Service]
+Type=forking
+ExecStart=/usr/sbin/zabbix_agentd
+ExecReload=/usr/local/sbin/zabbix_agentd -R config_cache_reload
+RuntimeDirectory=zabbix
+PIDFile=/run/zabbix/zabbix_agentd.pid
+User=zabbix
+Group=zabbix
+ 
+[Install]
+WantedBy=multi-user.target
diff --git a/package/zabbix/zabbix-server.service b/package/zabbix/zabbix-server.service
new file mode 100644
index 0000000000..06b14bef31
--- /dev/null
+++ b/package/zabbix/zabbix-server.service
@@ -0,0 +1,15 @@
+Description=Zabbix Server Daemon
+Requires=
+After=syslog.target network.target
+ 
+[Service]
+Type=forking
+ExecStart=/usr/sbin/zabbix_server
+ExecReload=/usr/sbin/zabbix_server -R config_cache_reload
+RuntimeDirectory=zabbix
+PIDFile=/run/zabbix/zabbix_server.pid
+User=zabbix
+Group=zabbix
+ 
+[Install]
+WantedBy=multi-user.target
diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
new file mode 100644
index 0000000000..9da85cdf92
--- /dev/null
+++ b/package/zabbix/zabbix.hash
@@ -0,0 +1 @@
+sha256	f6de0e0b91908d8da72d087931fb232988b391d3724d7c951833488fd96942bd	zabbix-4.2.4.tar.gz
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
new file mode 100644
index 0000000000..501b6975e9
--- /dev/null
+++ b/package/zabbix/zabbix.mk
@@ -0,0 +1,73 @@
+################################################################################
+#
+#zabbix
+#
+################################################################################
+
+ZABBIX_VERSION = 4.2.4
+ZABBIX_SITE = https://sourceforge.net/projects/zabbix/files
+
+ZABBIX_DEPENDENCIES = libevent libxml2 netsnmp libcurl pcre zlib
+ZABBIX_CONF_OPTS = --with-libpcre=$(STAGING_DIR)/usr/bin/ --with-libcurl=$(STAGING_DIR)/usr/bin/curl-config --with-libevent --with-libxml2--with-net-snmp=$(STAGING_DIR)/usr/bin/
+
+define ZABBIX_SERVER_COPY_FRONTEND
+	mkdir -p $(TARGET_DIR)/usr/zabbix/php-frontend/
+	cp -r $(@D)/frontends/php/* $(TARGET_DIR)/usr/zabbix/php-frontend/
+endef
+
+define ZABBIX_SERVER_PREPARE_POSTGRESQL
+	mkdir -p $(TARGET_DIR)/usr/zabbix/postgresql_schema
+	cp -r $(@D)/database/postgresql/*\.sql $(TARGET_DIR)/usr/zabbix/postgresql_schema/
+endef
+
+define ZABBIX_SERVER_PREPARE_MYSQL
+	mkdir -p $(TARGET_DIR)/usr/zabbix/mysql_schema/
+	cp -r $(@D)/database/mysql/*\.sql $(TARGET_DIR)/usr/zabbix/mysql_schema/
+endef
+
+define ZABBIX_INSTALL_INIT_SYSTEMD
+	$(foreach unit,$(ZABBIX_SYSTEMD_UNITS),\
+		$(INSTALL) -D -m 644 $(ZABBIX_PKGDIR)$(unit) $(TARGET_DIR)/usr/lib/systemd/system/$(unit) && \
+		mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants && \
+		ln -fs ../../../../usr/lib/systemd/system/$(unit) $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/$(unit) ;)
+endef
+
+define ZABBIX_USERS
+	zabbix -1 zabbix -1 !- /var/lib/zabbix - zabbix zabbix user
+endef
+
+define ZABBIX_CLIENT_CHANGE_PIDFILE_LOCATION
+	sed -i 's/\#\ PidFile=\/tmp\/zabbix_agentd.pid/PidFile=\/run\/zabbix\/zabbix_agentd.pid/g' $(TARGET_DIR)/etc/zabbix_agentd.conf
+endef
+
+define ZABBIX_SERVER_CHANGE_PIDFILE_LOCATION
+	sed -i 's/\#\ PidFile=\/tmp\/zabbix_server.pid/PidFile=\/run\/zabbix\/zabbix_server.pid/g' $(TARGET_DIR)/etc/zabbix_server.conf
+endef
+
+ifeq ($(BR2_PACKAGE_ZABBIX_CLIENT),y)
+ZABBIX_CONF_OPTS += --enable-agent
+ZABBIX_SYSTEMD_UNITS += zabbix-agent.service
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_CLIENT_CHANGE_PIDFILE_LOCATION
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER),y)
+ZABBIX_SYSTEMD_UNITS += zabbix-server.service
+ZABBIX_CONF_OPTS += --enable-server
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_COPY_FRONTEND
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_CHANGE_PIDFILE_LOCATION
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
+$(eval $(autotools-package))
-- 
2.20.1
