From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 23:17:06 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/zabbix: new package
In-Reply-To: <20190701110633.5618-1-skif@skif-web.ru>
References: <20190701110633.5618-1-skif@skif-web.ru>
Message-ID: <20190803231706.397435dc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexey,

Thanks for this new iteration. However, there are still a lot of
things to fix before we can apply the patch.

On Mon,  1 Jul 2019 14:06:33 +0300
Alexey Lukyanchuk <skif@skif-web.ru> wrote:

> From: Alexey <skif@skif-web.ru>

Please use your full first name + last name as the author of the
commit, as it must match the Signed-off-by.

> 
> Provides zabbix server (with sql-files and php-frontend, which placed in /usr/zabbix) and client. Zabbix client always installed.

Please wrap the commit log to 72 characters.

> 
> Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru)

The e-mail should be enclosed in <>, not in <)

> diff --git a/DEVELOPERS b/DEVELOPERS
> index e9c521f400..fd444bea0e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -122,6 +122,9 @@ N:	Alexandre Esse <alexandre.esse.dev@gmail.com>
>  F:	package/kvazaar/
>  F:	package/v4l2loopback/
>  
> +N:      Alexey Lukyanchuk <skif@skif-web.ru>
> +F:      package/zabbix/

This file is indented with tabs, not spaces.

> diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
> new file mode 100644
> index 0000000000..6b74d24500
> --- /dev/null
> +++ b/package/zabbix/Config.in
> @@ -0,0 +1,55 @@
> +config BR2_PACKAGE_ZABBIX
> +	bool "zabbix"
> +	depends on BR2_TOOLCHAIN_BUILDROOT_GLIBC

BR2_TOOLCHAIN_BUILDROOT_GLIBC is only relevant for internal toolchains,
and won't work for external toolchains. What you want to use is:

	depends on BR2_TOOLCHAIN_USES_GLIBC

> +	select BR2_PACKAGE_LIBEVENT
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_NETSNMP

You need to replicate the depencies of netsnmp, i.e:

	depends on BR2_USE_MMU # netsnmp

> +	select BR2_PACKAGE_ZABBIX_CLIENT

If you select this sub-option, then it doesn't make sense to have it as
an option, please remove it and always build/install the client.

> +	select BR2_PACKAGE_PCRE # runtime

It's not a runtime dependency, because your zabbix.mk has pcre in
ZABBIX_DEPENDENCIES.

> +	select BR2_TOOLCHAIN_BUILDROOT_WCHAR #zabbix runtime

You can't select this, and it's only valid for internal toolchains.
Please use:

	depends on BR2_USE_WCHAR

instead.

> +	select BR2_TOOLCHAIN_BUILDROOT_CXX #oracle-mysql

oracle-mysql is only used when the zabbix server is enabled, so this
seems irrelevant. If you really need C++ for zabbix itself (without the
server), then this should be:

	depends on BR2_INSTALL_LIBSTDCPP

> +	select BR2_PACKAGE_ZLIB
> +	  help

This "help" keyword should be intended with just one tab.

Please run "make check-package" to make sure you don't have basic
coding style issues like this.

> +	  zabbix monitoring system

Please extend the help text with more details about what Zabbix is.
Also, the help text should finish by an empty line, followed by the
upstream URL of the project. See other packages.

Also, you need to add a Config.in comment to document the dependencies
of the package. Something like this:

comment "zabbix needs a glibc toolchain w/ wchar"
	depends on BR2_USE_MMU
	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_USE_WCHAR

of course, extend that with C++ if you need C++ support.

> +
> +if BR2_PACKAGE_ZABBIX
> +
> +config BR2_PACKAGE_ZABBIX_SERVER
> +	bool "zabbix server"
> +	depends on BR2_USE_MMU # netsnmp

netsnmp is selected by the top-level zabbix option, so this doesn't
make sense here.

> +	select BR2_SYSTEM_ENABLE_NLS

Please use a depends on for this option. Are you sure it really needs
NLS ? What happens when NLS is disabled ?

> +	select BR2_PACKAGE_LIBCURL # runtime
> +	help
> +	  Zabbix monitoring server
> +	  Server php-frontends files placed in \
> +	  $(TARGET_DIR)/usr/zabbix/php-frontend
> +	  Database initial files for postgres are placed in \
> +	   /usr/zabbix/postgresql_schema/
> +	  Database initial files for mysql are placed in\
> +	   /usr/zabbix/mysql_schema/

The \ are not needed. This is a bit messy. Is it really useful to have
those details about the paths of things in the help text ?

> +if BR2_PACKAGE_ZABBIX_SERVER
> +
> +choice
> +	prompt "zabbix server database backend"
> +	default BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
> +	help
> +	  Select database backend for zabbix server
> +
> +config BR2_PACKAGE_ZABBIX_SERVER_MYSQL
> +	bool "Use mysql support"
> +	select BR2_PACKAGE_MYSQL
> +	select BR2_PACKAGE_ORACLE_MYSQL
> +	select BR2_PACKAGE_ORACLE_MYSQL_SERVER

You cannot select BR2_PACKAGE_ORACLE_MYSQL, because it's part of a
choice. The only thing you can do is depend on it.

> +
> +config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
> +	bool "Use postgresql support"
> +	select BR2_PACKAGE_POSTGRESQL

postgresql depends on MMU, WCHAR and !STATIC_LIBS, so you need to
replicate these dependencies here.

Overall, I think this is too complicated, you should probably do it
like this instead:

config BR2_PACKAGE_ZABBIX_SERVER
	bool "zabbix server"
	depends on BR2_PACKAGE_ORACLE_MYSQL || BR2_PACKAGE_POSTGRESQL

if BR2_PACKAGE_ZABBIX_SERVER

choice
prompt "server database backend"

config BR2_PACKAGE_ZABBIX_SERVER_MYSQL
	bool "mysql"
	depends on BR2_PACKAGE_ORACLE_MYSQL
	select BR2_PACKAGE_ORACLE_MYSQL_SERVER

config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
	bool "postgresql"
	depends on BR2_PACKAGE_POSTGRESQL

endchoice

endif


> +config BR2_PACKAGE_ZABBIX_CLIENT
> +	bool "zabbix client"

This option is not needed, as it's always selected by the top-level
BR2_PACKAGE_ZABBIX option.

> +endif
> diff --git a/package/zabbix/zabbix-agent.service b/package/zabbix/zabbix-agent.service
> new file mode 100644
> index 0000000000..27ae034b59
> --- /dev/null
> +++ b/package/zabbix/zabbix-agent.service
> @@ -0,0 +1,14 @@
> +Description=Zabbix Agent Daemon
> +After=syslog.target network.target
> + 
> +[Service]
> +Type=forking
> +ExecStart=/usr/sbin/zabbix_agentd
> +ExecReload=/usr/local/sbin/zabbix_agentd -R config_cache_reload
> +RuntimeDirectory=zabbix
> +PIDFile=/run/zabbix/zabbix_agentd.pid
> +User=zabbix
> +Group=zabbix
> + 
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/package/zabbix/zabbix-server.service b/package/zabbix/zabbix-server.service
> new file mode 100644
> index 0000000000..06b14bef31
> --- /dev/null
> +++ b/package/zabbix/zabbix-server.service
> @@ -0,0 +1,15 @@
> +Description=Zabbix Server Daemon
> +Requires=
> +After=syslog.target network.target
> + 
> +[Service]
> +Type=forking
> +ExecStart=/usr/sbin/zabbix_server
> +ExecReload=/usr/sbin/zabbix_server -R config_cache_reload
> +RuntimeDirectory=zabbix
> +PIDFile=/run/zabbix/zabbix_server.pid
> +User=zabbix
> +Group=zabbix
> + 
> +[Install]
> +WantedBy=multi-user.target

I am not qualified enough to review systemd unit files.

> diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
> new file mode 100644
> index 0000000000..9da85cdf92
> --- /dev/null
> +++ b/package/zabbix/zabbix.hash
> @@ -0,0 +1 @@
> +sha256	f6de0e0b91908d8da72d087931fb232988b391d3724d7c951833488fd96942bd	zabbix-4.2.4.tar.gz

Please add a comment above this that gives the origin of this hash. Is
it provided by upstream in some release notes on the web site ? Is it
simply locally calculated by you ? See how other packages do that.

Also, we want the hash of the license file(s).

> diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
> new file mode 100644
> index 0000000000..501b6975e9
> --- /dev/null
> +++ b/package/zabbix/zabbix.mk
> @@ -0,0 +1,73 @@
> +################################################################################
> +#
> +#zabbix
> +#
> +################################################################################
> +
> +ZABBIX_VERSION = 4.2.4
> +ZABBIX_SITE = https://sourceforge.net/projects/zabbix/files

Please add ZABBIX_LICENSE and ZABBIX_LICENSE_FILES.

> +ZABBIX_DEPENDENCIES = libevent libxml2 netsnmp libcurl pcre zlib
> +ZABBIX_CONF_OPTS = --with-libpcre=$(STAGING_DIR)/usr/bin/ --with-libcurl=$(STAGING_DIR)/usr/bin/curl-config --with-libevent --with-libxml2--with-net-snmp=$(STAGING_DIR)/usr/bin/

There is a missing space between --with-libxml2 and --with-net-snmp.
Was this tested properly ?

Also, please split this long line:

ZABBIX_CONF_OPTS = \
	--with-foo \
	--with-bar \
	--with-baz

> +define ZABBIX_SERVER_COPY_FRONTEND
> +	mkdir -p $(TARGET_DIR)/usr/zabbix/php-frontend/
> +	cp -r $(@D)/frontends/php/* $(TARGET_DIR)/usr/zabbix/php-frontend/
> +endef
> +
> +define ZABBIX_SERVER_PREPARE_POSTGRESQL
> +	mkdir -p $(TARGET_DIR)/usr/zabbix/postgresql_schema
> +	cp -r $(@D)/database/postgresql/*\.sql $(TARGET_DIR)/usr/zabbix/postgresql_schema/
> +endef
> +
> +define ZABBIX_SERVER_PREPARE_MYSQL
> +	mkdir -p $(TARGET_DIR)/usr/zabbix/mysql_schema/
> +	cp -r $(@D)/database/mysql/*\.sql $(TARGET_DIR)/usr/zabbix/mysql_schema/
> +endef

Please put the definition of those macros near where they are used.

> +define ZABBIX_INSTALL_INIT_SYSTEMD
> +	$(foreach unit,$(ZABBIX_SYSTEMD_UNITS),\
> +		$(INSTALL) -D -m 644 $(ZABBIX_PKGDIR)$(unit) $(TARGET_DIR)/usr/lib/systemd/system/$(unit) && \
> +		mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants && \
> +		ln -fs ../../../../usr/lib/systemd/system/$(unit) $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/$(unit) ;)
> +endef
> +
> +define ZABBIX_USERS
> +	zabbix -1 zabbix -1 !- /var/lib/zabbix - zabbix zabbix user
> +endef
> +
> +define ZABBIX_CLIENT_CHANGE_PIDFILE_LOCATION
> +	sed -i 's/\#\ PidFile=\/tmp\/zabbix_agentd.pid/PidFile=\/run\/zabbix\/zabbix_agentd.pid/g' $(TARGET_DIR)/etc/zabbix_agentd.conf

Use % as a sed separator, so that you don't have to espace all slashes.
Will make things a lot more readable.

> +endef
> +
> +define ZABBIX_SERVER_CHANGE_PIDFILE_LOCATION
> +	sed -i 's/\#\ PidFile=\/tmp\/zabbix_server.pid/PidFile=\/run\/zabbix\/zabbix_server.pid/g' $(TARGET_DIR)/etc/zabbix_server.conf

Ditto.

> +endef
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_CLIENT),y)

This option will no longer exist, so you can make the code below
unconditional.

> +ZABBIX_CONF_OPTS += --enable-agent
> +ZABBIX_SYSTEMD_UNITS += zabbix-agent.service
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_CLIENT_CHANGE_PIDFILE_LOCATION
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER),y)
> +ZABBIX_SYSTEMD_UNITS += zabbix-server.service
> +ZABBIX_CONF_OPTS += --enable-server
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_COPY_FRONTEND
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_CHANGE_PIDFILE_LOCATION
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_MYSQL),y)
> +ZABBIX_DEPENDENCIES += mysql
> +ZABBIX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_PREPARE_MYSQL
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL),y)
> +ZABBIX_DEPENDENCIES += postgresql
> +ZABBIX_CONF_OPTS += --with-postgresql=$(STAGING_DIR)/usr/bin/pg_config
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_PREPARE_POSTGRESQL
> +endif
> +
> +endif

Could you fix the above issues and send an updated version of your
patch ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
