From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Nov 2019 22:05:10 +0100
Subject: [Buildroot] [PATCH v4] package/zabbix: new package
In-Reply-To: <20191120084043.975653-1-skif@skif-web.ru>
References: <20191120084043.975653-1-skif@skif-web.ru>
Message-ID: <20191121220510.41a63942@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexey,

Thanks for your new submission. I was going to apply it, but after
doing more careful testing/review, we're not there yet I believe. See
below for a number of comments.

On Wed, 20 Nov 2019 11:40:43 +0300
Alexey Lukyanchuk <skif@skif-web.ru> wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 991be89849..94e98ff794 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -133,6 +133,9 @@ N:	Alexey Brodkin <alexey.brodkin@synopsys.com>
>  F:	board/cubietech/cubieboard2/
>  F:	configs/cubieboard2_defconfig
>  
> +N:  Alexey Lukyanchuk <skif@skif-web.ru>
> +F:  package/zabbix/

Minor detail: indentation is not correct.

> diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
> new file mode 100644
> index 0000000000..09c1d4b017
> --- /dev/null
> +++ b/package/zabbix/Config.in
> @@ -0,0 +1,46 @@
> +config BR2_PACKAGE_ZABBIX
> +	bool "zabbix"
> +	depends on BR2_USE_MMU # netsnmp
> +	select BR2_PACKAGE_ZABBIX_CLIENT

This option does not exist, so you can remove this line.

> +	select BR2_PACKAGE_LIBEVENT
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_NETSNMP
> +	select BR2_PACKAGE_PCRE
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_LIBCURL # runtime

After reading the configure.ac file, it turns out that almost all of
these dependencies are not mandatory dependencies. The only one that is
mandatory seems to be pcre.

Therefore, could you remove these dependencies as mandatory
dependencies, and turn them into optional dependencies ?

Note however that some of those dependencies are mandatory for the
server. In this case, the server option should indeed select them.

> +	help
> +	  Zabbix is an enterprise-class open source distributed
> +	  monitoring solution.Zabbix is free of cost. Zabbix
> +	  is written and distributed under the GPL General Public
> +	  License version 2.
> +
> +if BR2_PACKAGE_ZABBIX
> +
> +config BR2_PACKAGE_ZABBIX_SERVER
> +	bool "zabbix server"
> +	depends on BR2_PACKAGE_ORACLE_MYSQL || BR2_PACKAGE_POSTGRESQL

Please add one blank line here.

Also, why are you using BR2_PACKAGE_ORACLE_MYSQL and not
BR2_PACKAGE_MYSQL ? Is zabbix only compatible with the "old" mysql from
Oracle, and not with the "new" MariaDB ?

> +comment "zabbix server needs postgresql or mysql server"

Please only show this comment if neither mysql or postgresql is
available, so add:

	depends on !BR2_PACKAGE_ORACLE_MYSQL && !BR2_PACKAGE_POSTGRESQL

> +if BR2_PACKAGE_ZABBIX_SERVER
> +
> +choice
> +	prompt "server database backend"
> +
> +config BR2_PACKAGE_ZABBIX_SERVER_MYSQL
> +	bool "mysql"
> +	depends on BR2_PACKAGE_ORACLE_MYSQL
> +	depends on BR2_INSTALL_LIBSTDCPP # mysql
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql

These last two depends on are not needed, since you already have a
"depends on BR2_PACKAGE_ORACLE_MYSQL".

> +	select BR2_PACKAGE_ORACLE_MYSQL_SERVER # mysql
> +
> +config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
> +	bool "postgresql"
> +	depends on BR2_USE_WCHAR # postgresql
> +	depends on !BR2_STATIC_LIBS # postgresql

These two depends on are not needed, since you already have a "depends
on BR2_PACKAGE_POSTGRESQL".


> diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
> new file mode 100644
> index 0000000000..1d8759936b
> --- /dev/null
> +++ b/package/zabbix/zabbix.hash
> @@ -0,0 +1,2 @@
> +# sha256 locally computed:
> +sha256	f6de0e0b91908d8da72d087931fb232988b391d3724d7c951833488fd96942bd	zabbix-4.2.4.tar.gz

Please add the hash of the license file.

> diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
> new file mode 100644
> index 0000000000..94130e9a29
> --- /dev/null
> +++ b/package/zabbix/zabbix.mk
> @@ -0,0 +1,78 @@
> +################################################################################
> +#
> +#zabbix
> +#
> +################################################################################
> +
> +ZABBIX_VERSION = 4.2.4
> +ZABBIX_SITE = https://sourceforge.net/projects/zabbix/files
> +ZABBIX_LICENSE = GPL-2.0
> +ZABBIX_LICENSE_FILES = README
> +
> +ZABBIX_DEPENDENCIES = host-libcurl libevent libxml2 netsnmp libcurl pcre zlib host-libxml2

As said, please remove from here all dependencies that are not
mandatory, and treat them as optional dependencies.

> +ZABBIX_CONF_OPTS = \
> +	--with-libpcre=$(STAGING_DIR)/usr/bin/ \
> +	--with-libcurl=$(STAGING_DIR)/usr/bin/curl-config \
> +	--with-libevent \
> +	--with-libxml2=$(STAGING_DIR)/usr/bin/xml2-config \
> +	--with-net-snmp=$(STAGING_DIR)/usr/bin/net-snmp-config \

Same.

> +	--enable-agent
> +
> +ZABBIX_SYSTEMD_UNITS = zabbix-agent.service
> +ZABBIX_POST_INSTALL_TARGET_HOOKS = ZABBIX_CLIENT_CHANGE_PIDFILE_LOCATION

Please use a += here, and put this assignment right after the hook definition itself.

> +
> +define ZABBIX_INSTALL_INIT_SYSTEMD
> +	$(foreach unit,$(ZABBIX_SYSTEMD_UNITS),\
> +		$(INSTALL) -D -m 644 $(ZABBIX_PKGDIR)$(unit) $(TARGET_DIR)/usr/lib/systemd/system/$(unit) && \
> +		mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants && \
> +		ln -fs -r $(TARGET_DIR)/usr/lib/systemd/system/$(unit) $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/$(unit) ;)

Instead of the final ";", just put a newline, with the closing
parenthesis on the newline, i.e:

	$(foreach bar,$(BARS),\
		something
	)

> +define ZABBIX_USERS
> +	zabbix -1 zabbix -1 !- /var/lib/zabbix - zabbix zabbix user
> +endef
> +
> +define ZABBIX_CLIENT_CHANGE_PIDFILE_LOCATION
> +	sed -i 's%\#\ PidFile=/tmp/zabbix_agentd.pid%PidFile=/run/zabbix/zabbix_agentd.pid%g' $(TARGET_DIR)/etc/zabbix_agentd.conf

Use $(SED) instead of "sed -i".

> +endef
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER),y)
> +ZABBIX_SYSTEMD_UNITS += zabbix-server.service
> +ZABBIX_CONF_OPTS += --enable-server
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_COPY_FRONTEND
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_CHANGE_PIDFILE_LOCATION

Please put these next to each hook definition.

> +
> +define ZABBIX_SERVER_COPY_FRONTEND
> +	mkdir -p $(TARGET_DIR)/usr/zabbix/php-frontend/
> +	cp -r $(@D)/frontends/php/* $(TARGET_DIR)/usr/zabbix/php-frontend/

Presumably this frontend requires PHP... but you don't have any
dependency on PHP. Should this frontend only be copied when
BR2_PACKAGE_PHP=y ?

> +endef
> +
> +define ZABBIX_SERVER_CHANGE_PIDFILE_LOCATION
> +	sed -i 's%\#\ PidFile=/tmp/zabbix_server.pid%PidFile=/run/zabbix/zabbix_server.pid%g' $(TARGET_DIR)/etc/zabbix_server.conf

$(SED) instead of "sed -i".

> +endef
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_MYSQL),y)
> +ZABBIX_DEPENDENCIES += mysql
> +ZABBIX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_PREPARE_MYSQL
> +endif
> +
> +define ZABBIX_SERVER_PREPARE_MYSQL
> +	mkdir -p $(TARGET_DIR)/usr/zabbix/mysql_schema/
> +	cp -r $(@D)/database/mysql/*\.sql $(TARGET_DIR)/usr/zabbix/mysql_schema/
> +endef

Please put this inside the mysql condition, and register this hook
after its definition.

> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL),y)
> +ZABBIX_DEPENDENCIES += postgresql
> +ZABBIX_CONF_OPTS += --with-postgresql=$(STAGING_DIR)/usr/bin/pg_config
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_PREPARE_POSTGRESQL
> +endif
> +
> +define ZABBIX_SERVER_PREPARE_POSTGRESQL
> +	mkdir -p $(TARGET_DIR)/usr/zabbix/postgresql_schema
> +	cp -r $(@D)/database/postgresql/*\.sql $(TARGET_DIR)/usr/zabbix/postgresql_schema/
> +endef

Ditto.

So overall, the main issue is that you made all dependencies mandatory
while the vast majority of them seem to be optional.

The second main issue is that it doesn't build properly. The following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_ZABBIX=y
# BR2_TARGET_ROOTFS_TAR is not set

fails to build with:

/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.4/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../src/libs/zbxsysinfo/linux/libspecsysinfo.a(libspecsysinfo_a-cpu.o): in function `SYSTEM_CPU_LOAD':
cpu.c:(.text+0x5a4): undefined reference to `getloadavg'
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.4/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../src/libs/zbxsysinfo/common/libcommonsysinfo.a(libcommonsysinfo_a-net.o): in function `dns_query':
net.c:(.text+0x400): undefined reference to `res_nmkquery'
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.4/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: net.c:(.text+0x5b4): undefined reference to `res_nsend'
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.4/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: net.c:(.text+0x12f0): undefined reference to `res_nsend'
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.4/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: net.c:(.text+0x132c): undefined reference to `res_nsend'
collect2: error: ld returned 1 exit status
make[3]: *** [Makefile:552: zabbix_agentd] Error 1

Indeed, uClibc does not implement the getloadavg() and res_*() API.
musl implements getloadavg(), bu also not the res_*() API apparently.

Could you check that zabbix build fine for the most common
configurations we have by using ./utils/test-pkg ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
