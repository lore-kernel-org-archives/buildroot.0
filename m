From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Wed, 20 Nov 2019 11:40:43 +0300
Subject: [Buildroot] [PATCH v4] package/zabbix: new package
Message-ID: <20191120084043.975653-1-skif@skif-web.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
---
 DEVELOPERS                           |  3 ++
 package/Config.in                    |  1 +
 package/zabbix/Config.in             | 46 ++++++++++++++++
 package/zabbix/zabbix-agent.service  | 18 +++++++
 package/zabbix/zabbix-server.service | 18 +++++++
 package/zabbix/zabbix.hash           |  2 +
 package/zabbix/zabbix.mk             | 78 ++++++++++++++++++++++++++++
 7 files changed, 166 insertions(+)
 create mode 100644 package/zabbix/Config.in
 create mode 100644 package/zabbix/zabbix-agent.service
 create mode 100644 package/zabbix/zabbix-server.service
 create mode 100644 package/zabbix/zabbix.hash
 create mode 100644 package/zabbix/zabbix.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 991be89849..94e98ff794 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -133,6 +133,9 @@ N:	Alexey Brodkin <alexey.brodkin@synopsys.com>
 F:	board/cubietech/cubieboard2/
 F:	configs/cubieboard2_defconfig
 
+N:  Alexey Lukyanchuk <skif@skif-web.ru>
+F:  package/zabbix/
+
 N:	Alistair Francis <alistair@alistair23.me>
 F:	board/sifive/
 F:	boot/opensbi/
diff --git a/package/Config.in b/package/Config.in
index f72c77b416..51687f0900 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2141,6 +2141,7 @@ endif
 	source "package/xinetd/Config.in"
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
+	source "package/zabbix/Config.in"
 	source "package/znc/Config.in"
 
 endmenu
diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
new file mode 100644
index 0000000000..09c1d4b017
--- /dev/null
+++ b/package/zabbix/Config.in
@@ -0,0 +1,46 @@
+config BR2_PACKAGE_ZABBIX
+	bool "zabbix"
+	depends on BR2_USE_MMU # netsnmp
+	select BR2_PACKAGE_ZABBIX_CLIENT
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_NETSNMP
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBCURL # runtime
+	help
+	  Zabbix is an enterprise-class open source distributed
+	  monitoring solution.Zabbix is free of cost. Zabbix
+	  is written and distributed under the GPL General Public
+	  License version 2.
+
+if BR2_PACKAGE_ZABBIX
+
+config BR2_PACKAGE_ZABBIX_SERVER
+	bool "zabbix server"
+	depends on BR2_PACKAGE_ORACLE_MYSQL || BR2_PACKAGE_POSTGRESQL
+comment "zabbix server needs postgresql or mysql server"
+
+if BR2_PACKAGE_ZABBIX_SERVER
+
+choice
+	prompt "server database backend"
+
+config BR2_PACKAGE_ZABBIX_SERVER_MYSQL
+	bool "mysql"
+	depends on BR2_PACKAGE_ORACLE_MYSQL
+	depends on BR2_INSTALL_LIBSTDCPP # mysql
+	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
+	select BR2_PACKAGE_ORACLE_MYSQL_SERVER # mysql
+
+config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
+	bool "postgresql"
+	depends on BR2_USE_WCHAR # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
+	depends on BR2_PACKAGE_POSTGRESQL
+
+endchoice
+
+endif
+
+endif
diff --git a/package/zabbix/zabbix-agent.service b/package/zabbix/zabbix-agent.service
new file mode 100644
index 0000000000..fd86650cc2
--- /dev/null
+++ b/package/zabbix/zabbix-agent.service
@@ -0,0 +1,18 @@
+[Unit]
+Description=Zabbix Agent Daemon
+After=network.target
+ 
+[Service]
+Type=forking
+User=zabbix
+Group=zabbix
+RuntimeDirectory=zabbix
+RuntimeDirectoryMode=0755
+PIDFile=/run/zabbix/zabbix_agentd.pid
+ExecStart=/usr/sbin/zabbix_agentd
+ExecReload=/usr/sbin/zabbix_agentd -R config_cache_reload
+WatchdogSec=30s
+Restart=on-failure
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/zabbix/zabbix-server.service b/package/zabbix/zabbix-server.service
new file mode 100644
index 0000000000..6e244f43a2
--- /dev/null
+++ b/package/zabbix/zabbix-server.service
@@ -0,0 +1,18 @@
+[Unit]
+Description=Zabbix Server Daemon
+After=network.target
+ 
+[Service]
+Type=forking
+User=zabbix
+Group=zabbix
+RuntimeDirectory=zabbix
+RuntimeDirectoryMode=0755
+PIDFile=/run/zabbix/zabbix_server.pid
+ExecStart=/usr/sbin/zabbix_server
+ExecReload=/usr/sbin/zabbix_server -R config_cache_reload
+WatchdogSec=30s
+Restart=on-failure
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
new file mode 100644
index 0000000000..1d8759936b
--- /dev/null
+++ b/package/zabbix/zabbix.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed:
+sha256	f6de0e0b91908d8da72d087931fb232988b391d3724d7c951833488fd96942bd	zabbix-4.2.4.tar.gz
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
new file mode 100644
index 0000000000..94130e9a29
--- /dev/null
+++ b/package/zabbix/zabbix.mk
@@ -0,0 +1,78 @@
+################################################################################
+#
+#zabbix
+#
+################################################################################
+
+ZABBIX_VERSION = 4.2.4
+ZABBIX_SITE = https://sourceforge.net/projects/zabbix/files
+ZABBIX_LICENSE = GPL-2.0
+ZABBIX_LICENSE_FILES = README
+
+ZABBIX_DEPENDENCIES = host-libcurl libevent libxml2 netsnmp libcurl pcre zlib host-libxml2
+ZABBIX_CONF_OPTS = \
+	--with-libpcre=$(STAGING_DIR)/usr/bin/ \
+	--with-libcurl=$(STAGING_DIR)/usr/bin/curl-config \
+	--with-libevent \
+	--with-libxml2=$(STAGING_DIR)/usr/bin/xml2-config \
+	--with-net-snmp=$(STAGING_DIR)/usr/bin/net-snmp-config \
+	--enable-agent
+
+ZABBIX_SYSTEMD_UNITS = zabbix-agent.service
+ZABBIX_POST_INSTALL_TARGET_HOOKS = ZABBIX_CLIENT_CHANGE_PIDFILE_LOCATION
+
+define ZABBIX_INSTALL_INIT_SYSTEMD
+	$(foreach unit,$(ZABBIX_SYSTEMD_UNITS),\
+		$(INSTALL) -D -m 644 $(ZABBIX_PKGDIR)$(unit) $(TARGET_DIR)/usr/lib/systemd/system/$(unit) && \
+		mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants && \
+		ln -fs -r $(TARGET_DIR)/usr/lib/systemd/system/$(unit) $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/$(unit) ;)
+endef
+
+define ZABBIX_USERS
+	zabbix -1 zabbix -1 !- /var/lib/zabbix - zabbix zabbix user
+endef
+
+define ZABBIX_CLIENT_CHANGE_PIDFILE_LOCATION
+	sed -i 's%\#\ PidFile=/tmp/zabbix_agentd.pid%PidFile=/run/zabbix/zabbix_agentd.pid%g' $(TARGET_DIR)/etc/zabbix_agentd.conf
+endef
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER),y)
+ZABBIX_SYSTEMD_UNITS += zabbix-server.service
+ZABBIX_CONF_OPTS += --enable-server
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_COPY_FRONTEND
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_CHANGE_PIDFILE_LOCATION
+
+define ZABBIX_SERVER_COPY_FRONTEND
+	mkdir -p $(TARGET_DIR)/usr/zabbix/php-frontend/
+	cp -r $(@D)/frontends/php/* $(TARGET_DIR)/usr/zabbix/php-frontend/
+endef
+
+define ZABBIX_SERVER_CHANGE_PIDFILE_LOCATION
+	sed -i 's%\#\ PidFile=/tmp/zabbix_server.pid%PidFile=/run/zabbix/zabbix_server.pid%g' $(TARGET_DIR)/etc/zabbix_server.conf
+endef
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_MYSQL),y)
+ZABBIX_DEPENDENCIES += mysql
+ZABBIX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_PREPARE_MYSQL
+endif
+
+define ZABBIX_SERVER_PREPARE_MYSQL
+	mkdir -p $(TARGET_DIR)/usr/zabbix/mysql_schema/
+	cp -r $(@D)/database/mysql/*\.sql $(TARGET_DIR)/usr/zabbix/mysql_schema/
+endef
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL),y)
+ZABBIX_DEPENDENCIES += postgresql
+ZABBIX_CONF_OPTS += --with-postgresql=$(STAGING_DIR)/usr/bin/pg_config
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_PREPARE_POSTGRESQL
+endif
+
+define ZABBIX_SERVER_PREPARE_POSTGRESQL
+	mkdir -p $(TARGET_DIR)/usr/zabbix/postgresql_schema
+	cp -r $(@D)/database/postgresql/*\.sql $(TARGET_DIR)/usr/zabbix/postgresql_schema/
+endef
+
+endif
+
+$(eval $(autotools-package))
-- 
2.23.0
