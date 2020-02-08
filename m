From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Sat,  8 Feb 2020 11:03:40 +0300
Subject: [Buildroot] [PATCH v6] package/zabbix: new package
Message-ID: <20200208080340.32300-1-skif@skif-web.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
---
 DEVELOPERS                           |   3 +
 package/Config.in                    |   1 +
 package/zabbix/Config.in             | 122 +++++++++++++++++++++
 package/zabbix/zabbix-agent.service  |  17 +++
 package/zabbix/zabbix-server.service |  17 +++
 package/zabbix/zabbix.hash           |   3 +
 package/zabbix/zabbix.mk             | 153 +++++++++++++++++++++++++++
 7 files changed, 316 insertions(+)
 create mode 100644 package/zabbix/Config.in
 create mode 100644 package/zabbix/zabbix-agent.service
 create mode 100644 package/zabbix/zabbix-server.service
 create mode 100644 package/zabbix/zabbix.hash
 create mode 100644 package/zabbix/zabbix.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3520072034..905afe054f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -146,6 +146,9 @@ N:	Alexey Brodkin <alexey.brodkin@synopsys.com>
 F:	board/cubietech/cubieboard2/
 F:	configs/cubieboard2_defconfig
 
+N:	Alexey Lukyanchuk <skif@skif-web.ru>
+F:	package/zabbix/
+
 N:	Alistair Francis <alistair@alistair23.me>
 F:	board/sifive/
 F:	boot/opensbi/
diff --git a/package/Config.in b/package/Config.in
index bad4f9cba6..90175b9330 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2199,6 +2199,7 @@ endif
 	source "package/xinetd/Config.in"
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
+    source "package/zabbix/Config.in"
 	source "package/znc/Config.in"
 
 endmenu
diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
new file mode 100644
index 0000000000..b75b6ce3f6
--- /dev/null
+++ b/package/zabbix/Config.in
@@ -0,0 +1,122 @@
+config BR2_PACKAGE_ZABBIX
+	bool "zabbix"
+	depends on BR2_TOOLCHAIN_USES_GLIBC=y || BR2_TOOLCHAIN_EXTERNAL_GLIBC=y || BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+	select BR2_PACKAGE_PCRE
+	help
+	  Zabbix is an enterprise-class open source distributed
+	  monitoring solution.Zabbix is free of cost. Zabbix
+	  is written and distributed under the GPL General Public
+	  License version 2.
+
+if (!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_EXTERNAL_GLIBC && !BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC)
+comment "zabbix need glibc"
+endif
+
+if BR2_PACKAGE_ZABBIX
+
+if (!BR2_PACKAGE_POSTGRESQL && !BR2_PACKAGE_MYSQL)
+comment "zabbix server needs postgresql or mysql support"
+endif
+
+config BR2_PACKAGE_ZABBIX_SERVER
+	bool "zabbix server"
+	depends on BR2_PACKAGE_POSTGRESQL || BR2_PACKAGE_MYSQL
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBEVENT
+
+if BR2_PACKAGE_ZABBIX_SERVER
+
+choice
+	prompt "server database backend"
+
+config BR2_PACKAGE_ZABBIX_SERVER_MYSQL
+	bool "mysql"
+	depends on BR2_PACKAGE_MYSQL
+
+config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
+	bool "postgresql"
+	depends on BR2_PACKAGE_POSTGRESQL
+
+endchoice
+
+if BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL || BR2_PACKAGE_ZABBIX_SERVER_MYSQL
+config BR2_PACKAGE_ZABBIX_SERVER_COPY_DUMPS
+	bool "install sql dumps"
+	help
+	  Copy inicitial database dumps to /usr/zabbix/
+endif
+
+if (!BR2_PACKAGE_PHP || (!BR2_PACKAGE_PHP_EXT_MYSQLI && !BR2_PACKAGE_PHP_EXT_PGSQL) || \
+	!BR2_PACKAGE_PHP_EXT_MBSTRING || !BR2_PACKAGE_PHP_EXT_BCMATH || \
+	!BR2_PACKAGE_PHP_EXT_SOCKETS || !BR2_PACKAGE_PHP_EXT_GD || \
+	!BR2_PACKAGE_PHP_EXT_LIBXML2 || !BR2_PACKAGE_PHP_EXT_CTYPE || \
+	!BR2_PACKAGE_PHP_EXT_SESSION || !BR2_PACKAGE_PHP_EXT_XMLREADER || \
+	!BR2_PACKAGE_PHP_EXT_XMLWRITER )
+comment "zabbix-frontend need php with extensions(bc,sockets,"
+comment "mbstring,gd,libxml2,ctype,session, xmlreader,xmlwriter, mysql or postgresql"
+endif
+
+choice
+	prompt "server ssl/tls backend"
+
+config BR2_PACKAGE_ZABBIX_SERVER_NOTLS
+	bool "none"
+
+config BR2_PACKAGE_ZABBIX_SERVER_OPENSSL
+	bool "openssl"
+	depends on BR2_PACKAGE_OPENSSL
+
+config BR2_PACKAGE_ZABBIX_SERVER_GNUTLS
+	bool "gnutls"
+	depends on BR2_PACKAGE_GNUTLS
+
+endchoice
+
+config BR2_PACKAGE_ZABBIX_SERVER_OPENIPMI
+	bool "openipmi support"
+	select BR2_PACKAGE_OPENIPMI
+
+config BR2_PACKAGE_ZABBIX_SERVER_LIBSSH2
+	bool "libssh2 support"
+	select BR2_PACKAGE_LIBSSH2
+
+config BR2_PACKAGE_ZABBIX_SERVER_LDAP
+	bool "openldap support"
+	select BR2_PACKAGE_OPENLDAP
+
+if (!BR2_USE_MMU)
+comment "netsnmp support need MMU"
+endif
+
+config BR2_PACKAGE_ZABBIX_SERVER_NETSNMP
+	bool "net-snmp support"
+	depends on BR2_USE_MMU # netsnmp
+	select BR2_PACKAGE_NETSNMP
+
+config BR2_PACKAGE_ZABBIX_SERVER_LIBCURL
+	bool "libcurl support"
+	select BR2_PACKAGE_LIBCURL
+
+config BR2_PACKAGE_ZABBIX_SERVER_LIBXML2
+	bool "libxml2 support"
+	select BR2_PACKAGE_LIBXML2
+
+config BR2_PACKAGE_ZABBIX_SERVER_COPY_FRONTEND
+	bool "copy php-frontend to target"
+	depends on BR2_PACKAGE_PHP
+	depends on BR2_PACKAGE_PHP_EXT_MYSQLI || BR2_PACKAGE_PHP_EXT_PGSQL
+	depends on BR2_PACKAGE_PHP_EXT_BCMATH
+	depends on BR2_PACKAGE_PHP_EXT_SOCKETS
+	depends on BR2_PACKAGE_PHP_EXT_MBSTRING
+	depends on BR2_PACKAGE_PHP_EXT_GD
+	depends on BR2_PACKAGE_PHP_EXT_LIBXML2
+	depends on BR2_PACKAGE_PHP_EXT_CTYPE
+	depends on BR2_PACKAGE_PHP_EXT_SESSION
+	depends on BR2_PACKAGE_PHP_EXT_XMLREADER
+	depends on BR2_PACKAGE_PHP_EXT_XMLWRITER
+	help
+	  copy web-frontend to /usr/zabbix/php-frontend
+
+endif
+
+endif
diff --git a/package/zabbix/zabbix-agent.service b/package/zabbix/zabbix-agent.service
new file mode 100644
index 0000000000..8b4f45a4fc
--- /dev/null
+++ b/package/zabbix/zabbix-agent.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=Zabbix Agent Daemon
+After=network.target
+ 
+[Service]
+Type=forking
+ExecStart=/usr/sbin/zabbix_agentd
+ExecReload=/usr/sbin/zabbix_agentd -R config_cache_reload
+RuntimeDirectory=zabbix
+PIDFile=/run/zabbix/zabbix_agentd.pid
+User=zabbix
+Group=zabbix
+WatchdogSec=30s
+Restart=on-failure
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/zabbix/zabbix-server.service b/package/zabbix/zabbix-server.service
new file mode 100644
index 0000000000..b8ba0d1707
--- /dev/null
+++ b/package/zabbix/zabbix-server.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=Zabbix Server Daemon
+After=network.target
+ 
+[Service]
+Type=forking
+ExecStart=/usr/sbin/zabbix_server
+ExecReload=/usr/sbin/zabbix_server -R config_cache_reload
+RuntimeDirectory=zabbix
+PIDFile=/run/zabbix/zabbix_server.pid
+User=zabbix
+Group=zabbix
+WatchdogSec=30s
+Restart=on-failure
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
new file mode 100644
index 0000000000..71e6bff316
--- /dev/null
+++ b/package/zabbix/zabbix.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256	9d6f599283e10014c3b10688c92255f9fbe36d5efc071d59fe69cf146b7cf3e6	zabbix-4.4.3.tar.gz
+sha256  10b786d44486dda9abff580b949406059d66c1a90364b5954ce77c3e1005c33a    README
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
new file mode 100644
index 0000000000..8e540ff1b9
--- /dev/null
+++ b/package/zabbix/zabbix.mk
@@ -0,0 +1,153 @@
+################################################################################
+#
+# zabbix
+#
+################################################################################
+
+ZABBIX_VERSION = 4.4.3
+ZABBIX_SITE = https://sourceforge.net/projects/zabbix/files
+ZABBIX_LICENSE = GPL-2.0
+ZABBIX_LICENSE_FILES = README
+
+ZABBIX_DEPENDENCIES = pcre
+ZABBIX_CONF_OPTS = --with-libpcre=$(STAGING_DIR)/usr/bin/ \
+	--enable-agent
+
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_CLIENT_CHANGE_PIDFILE_LOCATION
+ZABBIX_SYSTEMD_UNITS += zabbix-agent.service
+
+define ZABBIX_INSTALL_INIT_SYSTEMD
+	$(foreach unit,$(ZABBIX_SYSTEMD_UNITS),\
+		$(INSTALL) -D -m 0644 $(ZABBIX_PKGDIR)/$(unit) $(TARGET_DIR)/usr/lib/systemd/system/$(unit) && \
+		mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants && \
+		ln -fs -r $(TARGET_DIR)/usr/lib/systemd/system/$(unit) $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/$(unit)
+	)
+endef
+
+define ZABBIX_USERS
+	zabbix -1 zabbix -1 !- /var/lib/zabbix - zabbix zabbix user
+endef
+
+define ZABBIX_CLIENT_CHANGE_PIDFILE_LOCATION
+	$(SED) 's%\#\ PidFile=/tmp/zabbix_agentd.pid%PidFile=/run/zabbix/zabbix_agentd.pid%g' $(TARGET_DIR)/etc/zabbix_agentd.conf
+endef
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER),y)
+ZABBIX_SYSTEMD_UNITS += zabbix-server.service
+ZABBIX_CONF_OPTS += --enable-server \
+	--with-libevent \
+	--with-libpthread=$(STAGING_DIR)/usr \
+	--with-zlib=$(STAGING_DIR)/usr
+ZABBIX_DEPENDENCIES += libevent zlib
+
+# Need openipmi in staging dir. Patch submitted at 2019.12.16
+# Before this patch enabled, use this crutch
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_OPENIPMI),y)
+ZABBIX_CONF_OPTS += --with-openipmi=$(STAGING_DIR)/usr
+ZABBIX_DEPENDENCIES += openipmi
+ZABBIX_PRE_CONFIGURE_HOOKS += BR2_PACKAGE_ZABBIX_SERVER_OPENIPMI_FIX_LIBS
+
+define BR2_PACKAGE_ZABBIX_SERVER_OPENIPMI_FIX_LIBS
+	if [ ! -f $(STAGING_DIR)/usr/lib/libOpenIPMI.so ]; then \
+		cp -rf $(TARGET_DIR)/usr/lib/libOpenIPMI* $(STAGING_DIR)/usr/lib/ ;\
+		cp -rf $(TARGET_DIR)/usr/include/OpenIPMI $(STAGING_DIR)/usr/include/ ;\
+	fi
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_LIBCURL),y)
+ZABBIX_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr/bin/curl-config
+ZABBIX_DEPENDENCIES += libcurl
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_LIBXML2),y)
+ZABBIX_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr/bin/xml2-config
+ZABBIX_DEPENDENCIES += libxml2
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_NETSNMP),y)
+ZABBIX_CONF_OPTS += --with-net-snmp=$(STAGING_DIR)/usr/bin/net-snmp-config
+ZABBIX_DEPENDENCIES += netsnmp
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_LDAP),y)
+ZABBIX_CONF_OPTS += --with-ldap=$(STAGING_DIR)/usr
+ZABBIX_DEPENDENCIES += openldap
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_LIBSSH2),y)
+ZABBIX_CONF_OPTS += --with-ssh2=$(STAGING_DIR)/usr
+ZABBIX_DEPENDENCIES += libssh2
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_OPENSSL),y)
+ZABBIX_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
+ZABBIX_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_GNUTLS),y)
+ZABBIX_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
+ZABBIX_DEPENDENCIES += gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_COPY_FRONTEND),y)
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_COPY_FRONTEND
+
+define ZABBIX_SERVER_COPY_FRONTEND
+	mkdir -p $(TARGET_DIR)/usr/zabbix/php-frontend/
+	cp -r $(@D)/frontends/php/* $(TARGET_DIR)/usr/zabbix/php-frontend/
+endef
+
+endif
+
+define ZABBIX_SERVER_CHANGE_PIDFILE_LOCATION
+	$(SED) 's%\#\ PidFile=/tmp/zabbix_server.pid%PidFile=/run/zabbix/zabbix_server.pid%g' $(TARGET_DIR)/etc/zabbix_server.conf
+endef
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_MYSQL),y)
+ZABBIX_DEPENDENCIES += mysql
+ZABBIX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
+# Need package/mariadb/0003-add-sysroot-path-to-mariadb_config.patch by Ryan Coe
+# While this patch not included, use this crutch
+ZABBIX_PRE_CONFIGURE_HOOKS += ZABBIX_DISABLE_MARIADB_CONFIG
+ZABBIX_POST_CONFIGURE_HOOKS += ZABBIX_ENABLE_MARIADB_CONFIG
+
+define ZABBIX_DISABLE_MARIADB_CONFIG
+	if [ -f "$(STAGING_DIR)/usr/bin/mariadb_config" ]; then \
+		mv $(STAGING_DIR)/usr/bin/mariadb_config $(STAGING_DIR)/usr/bin/mariadb_config_save; \
+	fi
+endef
+
+define ZABBIX_ENABLE_MARIADB_CONFIG
+	if [ -f "$(STAGING_DIR)/usr/bin/mariadb_confi_save" ]; then \
+		mv $(STAGING_DIR)/usr/bin/mariadb_config_save $(STAGING_DIR)/usr/bin/mariadb_config; \
+	fi
+endef
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_COPY_DUMPS),y)
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_PREPARE_MYSQL
+endif
+
+define ZABBIX_SERVER_PREPARE_MYSQL
+	mkdir -p $(TARGET_DIR)/usr/zabbix/mysql_schema/
+	cp -r $(@D) $(@D)/database/mysql/*\.sql $(TARGET_DIR)/usr/zabbix/mysql_schema/
+endef
+
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL),y)
+ZABBIX_DEPENDENCIES += postgresql
+ZABBIX_CONF_OPTS += --with-postgresql=$(STAGING_DIR)/usr/bin/pg_config
+
+define ZABBIX_SERVER_PREPARE_POSTGRESQL
+	mkdir -p $(TARGET_DIR)/usr/zabbix/postgresql_schema
+	cp -r $(@D)/database/postgresql/*\.sql $(TARGET_DIR)/usr/zabbix/postgresql_schema/
+endef
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_COPY_DUMPS),y)
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_PREPARE_POSTGRESQL
+endif
+
+endif
+
+endif
+
+$(eval $(autotools-package))
-- 
2.24.1
