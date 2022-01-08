Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C954C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 13:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7057160797;
	Sat,  8 Jan 2022 13:08:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ecNwMuVUH-p0; Sat,  8 Jan 2022 13:08:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BEF9607A3;
	Sat,  8 Jan 2022 13:08:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B0E81BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0246C607A3
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gRvj_uCKEpCr for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 13:08:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2E6960797
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 59E6982BC1; Sat,  8 Jan 2022 13:02:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 14:08:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f33654365ffa8fc1b3d8f9e5394a81abb776f66
X-Git-Newrev: 42382a171277ead59e365f5920e757f01c04ac77
X-Patchwork-Hint: ignore
Message-Id: <20220108130215.59E6982BC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zabbix: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=42382a171277ead59e365f5920e757f01c04ac77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Agent is always enabled. Even though a server without agent is a valid
use case, the agent doesn't take much space compared to the server so
making it optional is not worth it.

Optional dependencies (openssl, libcurl, ...) are set globally, even
though they are supposedly only used for the server. However, this is
not so obvious from configure.ac so it's easy to accidentally miss one.
Setting them globally doesn't hurt.

The proxy, agent2 and webservice features are left disabled. agent2
requires go.

zabbix also has support for sqlite3 as database backend, but only for
the proxy, not for the server.

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
[Arnout:
 - BR2_TOOLCHAIN_USES_GLIBC implies the other glibc options.
 - Fix wrapping in Config.in help text.
 - Add upstream URL.
 - Protect comments with "depends on" instead of "if".
 - Select postgresl/mysql instead of depends (and propagate
   dependencies).
 - Remove redundant condition around
   BR2_PACKAGE_ZABBIX_SERVER_COPY_DUMPS.
 - Select PHP extensions instead of depends.
 - Make optional dependencies automatic instead of Config.in.
 - Improve some of the help texts.
 - Bump to 5.4.9 and update hashes.
 - Add COPYING as license file.
 - Switch to actual upstream at zabbix.com.
 - Explicitly disable all unused features.
 - Disable zabbix user login with '*'.
 - Don't add user to zabbix group twice.
 - Do patch of zabbix_*.conf in post-patch hook and do it for all conf
   files in one shot.
 - Remove workarounds for pending patches (which were merged).
 - Put web ui in /var/www/zabbix and SQL files in /var/lib/zabbix.
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                           |   3 +
 package/Config.in                    |   1 +
 package/zabbix/Config.in             |  82 +++++++++++++++++++++
 package/zabbix/zabbix-agent.service  |  17 +++++
 package/zabbix/zabbix-server.service |  17 +++++
 package/zabbix/zabbix.hash           |   4 ++
 package/zabbix/zabbix.mk             | 133 +++++++++++++++++++++++++++++++++++
 7 files changed, 257 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 25b6a56dc0..f362df2637 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -110,6 +110,9 @@ N:	Alexey Brodkin <alexey.brodkin@synopsys.com>
 F:	board/cubietech/cubieboard2/
 F:	configs/cubieboard2_defconfig
 
+N:	Alexey Lukyanchuk <skif@skif-web.ru>
+F:	package/zabbix/
+
 N:	Alistair Francis <alistair@alistair23.me>
 F:	board/sifive/
 F:	boot/opensbi/
diff --git a/package/Config.in b/package/Config.in
index 5afd7131fe..0ff44dcd25 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2409,6 +2409,7 @@ endif
 	source "package/xinetd/Config.in"
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
+	source "package/zabbix/Config.in"
 	source "package/znc/Config.in"
 
 endmenu
diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
new file mode 100644
index 0000000000..f859471b1c
--- /dev/null
+++ b/package/zabbix/Config.in
@@ -0,0 +1,82 @@
+config BR2_PACKAGE_ZABBIX
+	bool "zabbix"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_PCRE
+	help
+	  Zabbix is an enterprise-class open source distributed
+	  monitoring solution.Zabbix is free of cost. Zabbix is written
+	  and distributed under the GPL General Public License version
+	  2.
+
+	  https://zabbix.com
+
+comment "zabbix need glibc"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+if BR2_PACKAGE_ZABBIX
+
+comment "zabbix server needs C++ and threads or wchar and dynamic libs"
+	depends on BR2_USE_MMU
+	depends on \
+		!(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS) && \
+		!(BR2_USE_WCHAR && !BR2_STATIC_LIBS)
+
+config BR2_PACKAGE_ZABBIX_SERVER
+	bool "zabbix server"
+	depends on BR2_USE_MMU # mysql, postgresql
+	depends on \
+		(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS) || \
+		(BR2_USE_WCHAR && !BR2_STATIC_LIBS)
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
+	depends on BR2_INSTALL_LIBSTDCPP # mysql
+	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
+	select BR2_PACKAGE_MYSQL
+
+config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
+	bool "postgresql"
+	depends on BR2_USE_WCHAR # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
+	select BR2_PACKAGE_POSTGRESQL
+
+endchoice
+
+config BR2_PACKAGE_ZABBIX_SERVER_COPY_DUMPS
+	bool "install SQL dumps"
+	help
+	  Copy initial database dumps to /var/lib/zabbix/schema
+
+	  These still need to be imported into the database by hand.
+
+config BR2_PACKAGE_ZABBIX_SERVER_COPY_FRONTEND
+	bool "install web UI to target"
+	depends on BR2_PACKAGE_PHP # runtime
+	select BR2_PACKAGE_PHP_EXT_MYSQLI if BR2_PACKAGE_ZABBIX_SERVER_MYSQL
+	select BR2_PACKAGE_PHP_EXT_PGSQL if BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
+	select BR2_PACKAGE_PHP_EXT_BCMATH
+	select BR2_PACKAGE_PHP_EXT_SOCKETS
+	select BR2_PACKAGE_PHP_EXT_MBSTRING
+	select BR2_PACKAGE_PHP_EXT_GD
+	select BR2_PACKAGE_PHP_EXT_LIBXML2
+	select BR2_PACKAGE_PHP_EXT_CTYPE
+	select BR2_PACKAGE_PHP_EXT_SESSION
+	select BR2_PACKAGE_PHP_EXT_XMLREADER
+	select BR2_PACKAGE_PHP_EXT_XMLWRITER
+	help
+	  Copy web-UI to /var/www/zabbix. You need to set up a web
+	  server to access it.
+
+comment "zabbix web UI requires PHP"
+	depends on !BR2_PACKAGE_PHP
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
index 0000000000..42cc0bda57
--- /dev/null
+++ b/package/zabbix/zabbix.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  19686628df76e8d5ef7c2ed2975b258c7ca3ec7d151b1bb59d7e132f9fc7c941  zabbix-5.4.9.tar.gz
+sha256  10d68ec3abacc29222c07748fc5e5cb9474fd7cd9ccdde1b92ff941ded946b78  README
+sha256  444fe54aecc95ac0f3314289c300afc73b3946a4dc9fbd7e022709b3e0924dd0  COPYING
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
new file mode 100644
index 0000000000..e72d831b46
--- /dev/null
+++ b/package/zabbix/zabbix.mk
@@ -0,0 +1,133 @@
+################################################################################
+#
+# zabbix
+#
+################################################################################
+
+ZABBIX_VERSION_MAJOR = 5.4
+ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).9
+ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
+ZABBIX_LICENSE = GPL-2.0+
+ZABBIX_LICENSE_FILES = README COPYING
+
+ZABBIX_DEPENDENCIES = pcre
+ZABBIX_CONF_OPTS = \
+	--with-libpcre=$(STAGING_DIR)/usr/bin/ \
+	--without-sqlite3 \
+	--enable-agent \
+	--disable-agent2 \
+	--disable-java \
+	--disable-proxy \
+	--disable-webservice
+
+define ZABBIX_USERS
+	zabbix -1 zabbix -1 * /var/lib/zabbix - - zabbix user
+endef
+
+ZABBIX_SYSTEMD_UNITS += zabbix-agent.service
+
+define ZABBIX_CHANGE_PIDFILE_LOCATION
+	$(SED) 's%\#\ PidFile=/tmp/zabbix\(.*\).pid%PidFile=/run/zabbix/zabbix\1.pid%g' $(@D)/conf/zabbix_*.conf
+endef
+ZABBIX_POST_PATCH_HOOKS += ZABBIX_CHANGE_PIDFILE_LOCATION
+
+ifeq ($(BR2_PACKAGE_OPENIPMI),y)
+ZABBIX_CONF_OPTS += --with-openipmi=$(STAGING_DIR)/usr
+ZABBIX_DEPENDENCIES += openipmi
+else
+ZABBIX_CONF_OPTS += --without-openipmi
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+ZABBIX_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr/bin/curl-config
+ZABBIX_DEPENDENCIES += libcurl
+else
+ZABBIX_CONF_OPTS += --without-libcurl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+ZABBIX_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr/bin/xml2-config
+ZABBIX_DEPENDENCIES += libxml2
+else
+ZABBIX_CONF_OPTS += --without-libxml2
+endif
+
+ifeq ($(BR2_PACKAGE_NETSNMP),y)
+ZABBIX_CONF_OPTS += --with-net-snmp=$(STAGING_DIR)/usr/bin/net-snmp-config
+ZABBIX_DEPENDENCIES += netsnmp
+else
+ZABBIX_CONF_OPTS += --without-net-snmp
+endif
+
+ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+ZABBIX_CONF_OPTS += --with-ldap=$(STAGING_DIR)/usr
+ZABBIX_DEPENDENCIES += openldap
+else
+ZABBIX_CONF_OPTS += --without-ldap
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSSH2),y)
+ZABBIX_CONF_OPTS += --with-ssh2=$(STAGING_DIR)/usr
+ZABBIX_DEPENDENCIES += libssh2
+else
+ZABBIX_CONF_OPTS += --without-ssh2
+endif
+
+# Only one of openssl or gnutls should be enabled
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ZABBIX_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr --without-gnutls
+ZABBIX_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+ZABBIX_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr --without-openssl
+ZABBIX_DEPENDENCIES += gnutls
+else
+ZABBIX_CONF_OPTS += --without-gnutls --without-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER),y)
+
+ZABBIX_DEPENDENCIES += libevent zlib
+ZABBIX_CONF_OPTS += \
+	--enable-server \
+	--with-libevent=$(STAGING_DIR)/usr \
+	--with-libpthread=$(STAGING_DIR)/usr \
+	--with-zlib=$(STAGING_DIR)/usr
+ZABBIX_SYSTEMD_UNITS += zabbix-server.service
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_COPY_FRONTEND),y)
+define ZABBIX_SERVER_COPY_FRONTEND
+	mkdir -p $(TARGET_DIR)/var/www/zabbix/
+	cp -dpfr $(@D)/ui/* $(TARGET_DIR)/var/www/zabbix/
+endef
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_COPY_FRONTEND
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_MYSQL),y)
+ZABBIX_DEPENDENCIES += mysql
+ZABBIX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config --without-postgresql
+ZABBIX_DATABASE = mysql
+else ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL),y)
+ZABBIX_DEPENDENCIES += postgresql
+ZABBIX_CONF_OPTS += --with-postgresql=$(STAGING_DIR)/usr/bin/pg_config --without-mysql
+ZABBIX_DATABASE = postgresql
+endif
+
+ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_COPY_DUMPS),y)
+define ZABBIX_SERVER_COPY_DUMPS
+	mkdir -p $(TARGET_DIR)/var/lib/zabbix/schema/
+	install -m 644 $(@D)/database/$(ZABBIX_DATABASE)/*.sql $(TARGET_DIR)/var/lib/zabbix/schema/
+endef
+ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_COPY_DUMPS
+endif
+
+endif # BR2_PACKAGE_ZABBIX_SERVER
+
+define ZABBIX_INSTALL_INIT_SYSTEMD
+	$(foreach unit,$(ZABBIX_SYSTEMD_UNITS),\
+		$(INSTALL) -D -m 0644 $(ZABBIX_PKGDIR)/$(unit) $(TARGET_DIR)/usr/lib/systemd/system/$(unit) && \
+		mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants && \
+		ln -fs -r $(TARGET_DIR)/usr/lib/systemd/system/$(unit) $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/$(unit)
+	)
+endef
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
