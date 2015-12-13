From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 23:37:07 +0100
Subject: [Buildroot] [PATCH v2 1/1] postgresql: add an option to build
 the server
In-Reply-To: <1445575419-8267-1-git-send-email-mathstuf@gmail.com>
References: <1445179920-2413-1-git-send-email-mathstuf@gmail.com>
 <1445575419-8267-1-git-send-email-mathstuf@gmail.com>
Message-ID: <20151213233707.3f62c2a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben,

On Fri, 23 Oct 2015 00:43:39 -0400, Ben Boeckel wrote:
> Unfortunately, postgresql upstream doesn't have a configure option for
> this. Instead, to get bits of the build, compiling and installing
> different subdirectories is the preferred way.
> 
> The directories come from those used in the FreeBSD port.
> 
> Signed-off-by: Ben Boeckel <mathstuf@gmail.com>

Sorry for the slow response. I finally had a closer look at this
tonight. I'm adding in Cc Yann, Arnout and Peter to get their feedback
on this, which is why I'm going to keep the entire patch below.

If I understand correctly, the current postgresql package is building
both the client and server parts unconditionally, and the purpose of
your patch is to make each of them conditional.

I am wondering if it is really worth the effort trying to build the
relevant directories in each case. The build phase of postgresql (in
the current package, building both client and server) takes 77 seconds
on my machine, which is not that long.

Since this logic that consists in filtering which directory needs to be
built or not is very likely to break/change when upgrading the
PostgreSQL package version, I would personally be in favor of always
building the whole thing, and then have a post-install hook that
removes the useless files.

If you really want to save the build time, then I would suggest to work
with the PostgreSQL upstream developers to get configure options to do
this.

Peter, Yann, Arnout, what do you think? See below for the full patch.

Thanks!

Thomas

> ---
> Changes v1 -> v2:
>   - review by Thomas Petazzoni
>     - add client-if-not-server select for the postgresql package
>     - shell for -> $(foreach)
>     - remove empty variable "declarations"
>     - rewrap directory list variables
>     - simplify the directory listing variables
>     - document the directories being installed
>     - install fmgroids.h explicitly
> 
> Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
> ---
>  package/bandwidthd/Config.in     |  1 +
>  package/collectd/Config.in       |  1 +
>  package/cppdb/Config.in          |  2 +-
>  package/php/Config.ext           |  1 +
>  package/postgresql/Config.in     | 17 ++++++++++
>  package/postgresql/postgresql.mk | 71 ++++++++++++++++++++++++++++++++++++++++
>  package/qt/Config.sql.in         |  1 +
>  package/qt5/qt5base/Config.in    |  1 +
>  8 files changed, 94 insertions(+), 1 deletion(-)
> 
> diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
> index b4a47f2..8b48cc4 100644
> --- a/package/bandwidthd/Config.in
> +++ b/package/bandwidthd/Config.in
> @@ -33,6 +33,7 @@ if BR2_PACKAGE_BANDWIDTHD
>  config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
>  	bool "enable postgresql log target support"
>  	select BR2_PACKAGE_POSTGRESQL
> +	select BR2_PACKAGE_POSTGRESQL_CLIENT
>  	depends on !BR2_STATIC_LIBS
>  	help
>  	  Enable support for logging the bandwidthd data to a remote
> diff --git a/package/collectd/Config.in b/package/collectd/Config.in
> index 5cdb24e..936b0cf 100644
> --- a/package/collectd/Config.in
> +++ b/package/collectd/Config.in
> @@ -349,6 +349,7 @@ config BR2_PACKAGE_COLLECTD_PING
>  config BR2_PACKAGE_COLLECTD_POSTGRESQL
>  	bool "postgresql"
>  	select BR2_PACKAGE_POSTGRESQL
> +	select BR2_PACKAGE_POSTGRESQL_CLIENT
>  	help
>  	  Connects to and executes SQL statements on a PostgreSQL
>  	  database. It then reads back the results and, depending on the
> diff --git a/package/cppdb/Config.in b/package/cppdb/Config.in
> index 9037a7a..54ecb95 100644
> --- a/package/cppdb/Config.in
> +++ b/package/cppdb/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_CPPDB
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	# Can be built without them but it's useless
> -	depends on BR2_PACKAGE_MYSQL || BR2_PACKAGE_POSTGRESQL || BR2_PACKAGE_SQLITE
> +	depends on BR2_PACKAGE_MYSQL || BR2_PACKAGE_POSTGRESQL_CLIENT || BR2_PACKAGE_SQLITE
>  	help
>  	  CppDB is an SQL connectivity library that is designed to provide
>  	  platform and Database independent connectivity API similarly
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index 5324e79..2e05c61 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -158,6 +158,7 @@ comment "MySQL drivers need a toolchain w/ C++, threads"
>  config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
>  	bool "PostgreSQL"
>  	select BR2_PACKAGE_POSTGRESQL
> +	select BR2_PACKAGE_POSTGRESQL_CLIENT
>  	depends on BR2_USE_MMU # postgresql
>  	depends on !BR2_STATIC_LIBS
>  	help
> diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
> index e9b8f48..f2b7061 100644
> --- a/package/postgresql/Config.in
> +++ b/package/postgresql/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_POSTGRESQL
>  	# postgresql is unlikely to be used in a pure statically
>  	# linked environment.
>  	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_POSTGRESQL_CLIENT if !BR2_PACKAGE_POSTGRESQL_SERVER
>  	help
>  	  PostgreSQL is a powerful, open source object-relational
>  	  database system.
> @@ -18,5 +19,21 @@ config BR2_PACKAGE_POSTGRESQL
>  
>  	  http://www.postgresql.org
>  
> +if BR2_PACKAGE_POSTGRESQL
> +
> +config BR2_PACKAGE_POSTGRESQL_CLIENT
> +	bool "PostgreSQL client libraries"
> +	default y
> +	help
> +	  Install the PostgreSQL client libraries on the target.
> +
> +config BR2_PACKAGE_POSTGRESQL_SERVER
> +	bool "PostgreSQL server"
> +	default y
> +	help
> +	  Install the PostgreSQL server on the target.
> +
> +endif
> +
>  comment "postgresql needs a toolchain w/ dynamic library"
>  	depends on BR2_STATIC_LIBS
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index a42fe73..7fc4d54 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -58,6 +58,34 @@ POSTGRESQL_DEPENDENCIES += openssl
>  POSTGRESQL_CONF_OPTS += --with-openssl
>  endif
>  
> +ifeq ($(BR2_PACKAGE_POSTGRESQL_CLIENT),y)
> +
> +# Install the binaries:
> +#  clusterdb
> +#  createdb
> +#  createlang
> +#  createuser
> +#  dropdb
> +#  droplang
> +#  dropuser
> +#  ecpg
> +#  pg_dump
> +#  pg_dumpall
> +#  pg_isready
> +#  pg_restore
> +#  psql
> +#  reindexdb
> +#  vacuumdb
> +#
> +# and the directories required to build them.
> +POSTGRESQL_INSTALL_DIRECTORIES += \
> +	config src/include src/interfaces src/port \
> +	src/bin/pg_dump src/bin/psql src/bin/scripts src/bin/pg_config
> +
> +endif
> +
> +ifeq ($(BR2_PACKAGE_POSTGRESQL_SERVER),y)
> +
>  define POSTGRESQL_USERS
>  	postgres -1 postgres -1 * /var/lib/pgsql /bin/sh - PostgreSQL Server
>  endef
> @@ -89,4 +117,47 @@ define POSTGRESQL_INSTALL_INIT_SYSTEMD
>  		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/postgresql.service
>  endef
>  
> +# Install the binaries:
> +#  initdb
> +#  pg_basebackup
> +#  pg_controldata
> +#  pg_ctl
> +#  pg_receivexlog
> +#  pg_recvlogical
> +#  pg_resetxlog
> +#  postgres
> +#  postmaster
> +#
> +# and the directories required to build them.
> +POSTGRESQL_INSTALL_DIRECTORIES += \
> +	src/port src/common src/backend \
> +	src/backend/utils/mb/conversion_procs \
> +	src/backend/snowball src/backend/replication/libpqwalreceiver \
> +	src/bin/initdb src/bin/pg_ctl \
> +	src/bin/pg_controldata src/bin/pg_resetxlog src/pl \
> +	src/bin/pg_basebackup
> +
> +ifeq ($(BR2_PACKAGE_TZDATA),y)
> +POSTGRESQL_INSTALL_DIRECTORIES += src/timezone
> +endif
> +
> +endif
> +
> +define POSTGRESQL_BUILD_CMDS
> +	$(foreach d,$(POSTGRESQL_INSTALL_DIRECTORIES),
> +		$(MAKE) -C $(@D)/$(d)$(sep))
> +	# Required for the installation.
> +	$(MAKE) -C $(@D)/src/backend ../../src/include/utils/fmgroids.h
> +endef
> +
> +define POSTGRESQL_INSTALL_TARGET_CMDS
> +	$(foreach d,$(POSTGRESQL_INSTALL_DIRECTORIES),
> +		$(MAKE) -C $(@D)/$(d) DESTDIR=$(TARGET_DIR) install$(sep))
> +endef
> +
> +define POSTGRESQL_INSTALL_STAGING_CMDS
> +	$(foreach d,$(POSTGRESQL_INSTALL_DIRECTORIES),
> +		$(MAKE) -C $(@D)/$(d) DESTDIR=$(STAGING_DIR) install$(sep))
> +endef
> +
>  $(eval $(autotools-package))
> diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
> index 452edd5..d6c04ef 100644
> --- a/package/qt/Config.sql.in
> +++ b/package/qt/Config.sql.in
> @@ -31,6 +31,7 @@ config BR2_PACKAGE_QT_ODBC
>  config BR2_PACKAGE_QT_PSQL
>  	bool "PostgreSQL Driver"
>  	select BR2_PACKAGE_POSTGRESQL
> +	select BR2_PACKAGE_POSTGRESQL_CLIENT
>  	depends on !BR2_STATIC_LIBS
>  	help
>  	  Build PostgreSQL driver
> diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
> index 603df45..1def533 100644
> --- a/package/qt5/qt5base/Config.in
> +++ b/package/qt5/qt5base/Config.in
> @@ -73,6 +73,7 @@ config BR2_PACKAGE_QT5BASE_MYSQL
>  config BR2_PACKAGE_QT5BASE_PSQL
>  	bool "PostgreSQL Plugin"
>  	select BR2_PACKAGE_POSTGRESQL
> +	select BR2_PACKAGE_POSTGRESQL_CLIENT
>  	depends on BR2_USE_MMU # postgresql
>  	depends on !BR2_STATIC_LIBS
>  	help



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
