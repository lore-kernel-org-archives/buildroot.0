From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 23:05:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/zabbix: new package
In-Reply-To: <20190413190102.27538-1-skif@skif-web.ru>
References: <20190413190102.27538-1-skif@skif-web.ru>
Message-ID: <20190422230503.0defc2b6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexey!

Thanks a lot for your contribution. You've started contributing with a
not really trivial package. I'm doing a review below, to comment on
various aspects of your patch. Could you take those comments into
account and send a v2 of this patch ?

On Sat, 13 Apr 2019 22:01:02 +0300
Alexey Lukyanchuk <skif@skif-web.ru> wrote:

> Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
> ---
>  package/Config.in                    |  4 +-
>  package/zabbix/Config.in             | 54 +++++++++++++++++++++
>  package/zabbix/zabbix-agent.service  | 14 ++++++
>  package/zabbix/zabbix-server.service | 15 ++++++
>  package/zabbix/zabbix.mk             | 70 ++++++++++++++++++++++++++++
>  5 files changed, 155 insertions(+), 2 deletions(-)

First of all, please add an entry to the DEVELOPERS file for this new
package. This will allow us to notify you when there are build failures
related to your package, or patches submitted by other contributors
touching your package.

>  create mode 100644 package/zabbix/Config.in
>  create mode 100644 package/zabbix/zabbix-agent.service
>  create mode 100644 package/zabbix/zabbix-server.service
>  create mode 100644 package/zabbix/zabbix.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index eed842c67a..19a89d5e0c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2070,8 +2070,8 @@ endif
>  	source "package/xinetd/Config.in"
>  	source "package/xl2tp/Config.in"
>  	source "package/xtables-addons/Config.in"
> -	source "package/znc/Config.in"
> -
> +        source "package/zabbix/Config.in"
> +        source "package/znc/Config.in"

Please comply with the indentation in the file, and don't modify the
existing znc line.

> diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
> new file mode 100644
> index 0000000000..1105c8d2e0
> --- /dev/null
> +++ b/package/zabbix/Config.in
> @@ -0,0 +1,54 @@
> +config BR2_PACKAGE_ZABBIX
> +	bool "zabbix"
> +	default n

"default n" is the default, so it is not needed.

> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBEVENT
> +	select BR2_PACKAGE_PCRE
> +	help
> +	  zabbix monitoring system
> +
> +if BR2_PACKAGE_ZABBIX
> +
> +if (!BR2_PACKAGE_APACHE && !BR2_PACKAGE_NGINX && !BR2_PACKAGE_LIGHTTPD) || !BR2_PACKAGE_ORACLE_MYSQL_SERVER
> +comment "zabbix server need http server with php and sql server"

So you need Oracle MySQL, but below you offer the choice of using
PostgreSQL. This doesn't seem very consistent. I think we probably
don't want this comment.

> +endif
> +
> +if (BR2_PACKAGE_APACHE || BR2_PACKAGE_NGINX || BR2_PACKAGE_LIGHTTPD) && BR2_PACKAGE_ORACLE_MYSQL_SERVER

There's more than Apache, Nginx and Lighttpd in terms of web servers. I
don't think it's realistic to have an exhaustive list. Just put in the
Config.in help text that a Web server is needed.

> +config BR2_PACKAGE_ZABBIX_SERVER
> +	bool "zabbix server"
> +	default n

Not needed, as explained above.

> +	select BR2_PACKAGE_PHP

PHP has:

        depends on !BR2_BINFMT_FLAT

so you need to replicate this dependency here.

> +	select BR2_PACKAGE_PHP_EXT_CTYPE
> +	select BR2_PACKAGE_PHP_EXT_GETTEXT

This has:

	depends on BR2_SYSTEM_ENABLE_NLS

so you need to replicate this dependency here. Actually, I find it
weird that BR2_PACKAGE_PHP_EXT_GETTEXT needs BR2_SYSTEM_ENABLE_NLS, but
we probably need to investigate that separately.

> +	select BR2_PACKAGE_PHP_EXT_BCMATH
> +	select BR2_PACKAGE_PHP_EXT_MBSTRING
> +	select BR2_PACKAGE_PHP_EXT_SOCKETS
> +	select BR2_PACKAGE_PHP_EXT_MYSQLI
> +	select BR2_PACKAGE_PHP_EXT_PDO_MYSQL
> +	select BR2_PACKAGE_PHP_EXT_GD
> +	select BR2_PACKAGE_PHP_EXT_LIBXML2
> +	select BR2_PACKAGE_PHP_EXT_XMLREADER
> +	select BR2_PACKAGE_PHP_EXT_XMLWRITER
> +	select BR2_PACKAGE_PHP_EXT_SESSION
> +	help
> +	  Zabbix monitoring server
> +endif
> +if BR2_PACKAGE_ZABBIX_SERVER
> +choice
> +	prompt "zabbix server database backend"
> +	default BR2_PACKAGE_ZABBIX_SERVER_MYSQL
> +config BR2_PACKAGE_ZABBIX_SERVER_MYSQL
> +	bool "mysql"
> +config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
> +	bool "posgresql"

These should select or depends on the appropriate database packages.

> +endchoice
> +
> +config BR2_PACKAGE_ZABBIX_SERVER_HTML_ROOT
> +	string "Location of frontend files"
> +	default "/usr/htdocs"
> +endif
> +
> +config BR2_PACKAGE_ZABBIX_CLIENT
> +	bool "zabbix client"
> +	default n

Not needed.

> +endif
> diff --git a/package/zabbix/zabbix-agent.service b/package/zabbix/zabbix-agent.service
> new file mode 100644
> index 0000000000..b46c91e30b
> --- /dev/null
> +++ b/package/zabbix/zabbix-agent.service
> @@ -0,0 +1,14 @@
> +Description=Zabbix Agent Daemon
> +After=syslog.target network.target mysql.service

So you must have mysql, even if postgresql is used ?

> + 
> +[Service]
> +Type=forking
> +ExecStart=/usr/sbin/zabbix_agentd
> +ExecReload=/usr/sbin/zabbix_agentd -R config_cache_reload
> +PIDFile=/tmp/zabbix_agentd.pid
> + 
> +User=zabbix
> +Group=zabbix
> + 
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/package/zabbix/zabbix-server.service b/package/zabbix/zabbix-server.service
> new file mode 100644
> index 0000000000..f4a8d599ad
> --- /dev/null
> +++ b/package/zabbix/zabbix-server.service
> @@ -0,0 +1,15 @@
> +Description=Zabbix Server Daemon
> +Requires=mysql.service
> +After=syslog.target network.target mysql.service

Same question: you must have mysql, even if postgresql is used ?

> diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
> new file mode 100644
> index 0000000000..f4024751a9
> --- /dev/null
> +++ b/package/zabbix/zabbix.mk
> @@ -0,0 +1,70 @@
> +################################################################################
> +#
> +#zabbix
> +#
> +################################################################################
> +
> +ZABBIX_VERSION = 4.2.0
> +ZABBIX_SITE = https://sourceforge.net/projects/zabbix/files
> +
> +ZABBIX_INSTALL_STAGING = YES
> +ZABBIX_DEPENDENCIES += pcre libcurl libevent

Just '=' not '+='.

> +ZABBIX_CONF_OPTS = --with-libcurl --with-libevent

Please add one empty line here.

> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER),y)
> +ZABBIX_CONF_OPTS += --enable-server
> +ZABBIX_DEPENDENCIES += php mysql

So always mysql ?

> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_COPY_FRONTEND

ZABBIX_COPY_FRONTEND should be defined inside the condition.

> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_COPY_SQL_SCHEMA_FILES

ZABBIX_COPY_SQL_SCHEMA_FILES does not exist.

> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_CLIENT),y)
> +ZABBIX_CONF_OPTS += --enable-agent
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_MYSQL),y)

Add the dependency on "mysql" here ?

> +ZABBIX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_COPY_MYSQL_SQL_SCHEMA_FILES

ZABBIX_COPY_MYSQL_SQL_SCHEMA_FILES should be defined inside the
condition as well.

> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL),y)

Add the dependency on "postgresql" here?

> +ZABBIX_CONF_OPTS += --with-postgresql
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_COPY_POSTGRESQL_SQL_SCHEMA_FILES

ZABBIX_COPY_POSTGRESQL_SQL_SCHEMA_FILES shoudl be defined inside the
condition as well.

> +endif
> +
> +define ZABBIX_COPY_FRONTEND
> +	mkdir -p $(TARGET_DIR)/$(BR2_PACKAGE_ZABBIX_SERVER_HTML_ROOT)
> +	cp -r $(@D)/frontends/php/* $(TARGET_DIR)/$(BR2_PACKAGE_ZABBIX_SERVER_HTML_ROOT)
> +endef
> +
> +define ZABBIX_COPY_POSTGRESQL_SQL_SCHEMA_FILES
> +	mkdir -p $(TARGET_DIR)/usr/zabbix/
> +	cp -r $(@D)/database/postgresql $(TARGET_DIR)/usr/zabbix/
> +endef
> +
> +define ZABBIX_COPY_MYSQL_SQL_SCHEMA_FILES
> +	mkdir -p $(TARGET_DIR)/usr/zabbix/
> +	cp -r $(@D)/database/mysql $(TARGET_DIR)/usr/zabbix/
> +endef
> +
> +define ZABBIX_SERVER_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 644 package/zabbix/zabbix-server.service $(TARGET_DIR)/usr/lib/systemd/system/zabbix-server.service
> +endef
> +
> +define ZABBIX_AGENT_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 644 package/zabbix/zabbix-agent.service $(TARGET_DIR)/usr/lib/systemd/system/zabbix-agent.service

This is not how systemd units should be installed. The canonical
solution we use is:

        $(INSTALL) -D -m 644 package/dropbear/dropbear.service \
                $(TARGET_DIR)/usr/lib/systemd/system/dropbear.service
        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
        ln -fs ../../../../usr/lib/systemd/system/dropbear.service \
                $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dropbear.service


> +endef
> +
> +ifeq ($(BR2_INIT_SYSTEMD),y)
> +ifeq ($(BR2_PACKAGE_ZABBIX_CLIENT),y)
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_AGENT_INSTALL_INIT_SYSTEMD
> +endif
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER),y)
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_INSTALL_INIT_SYSTEMD
> +endif
> +endif

Please do something like this instead:

ifeq ($(BR2_PACKAGE_ZABBIX_CLIENT),y)
ZABBIX_SYSTEMD_UNITS += zabbix-agent.service
endif

ifeq ($(BR2_PACKAGE_ZABBIX_SERVER),y)
ZABBIX_SYSTEMD_UNITS += zabbix-server.service
endif

(of course these should be part of existing client/server conditions
previously in the .mk file)

And then:

define ZABBIX_INSTALL_INIT_SYSTEMD
	$(foreach unit,$(ZABBIX_SYSTEMD_UNITS),\
		...
	)
endef

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
