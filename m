From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sun, 16 Mar 2014 13:15:03 +0100
Subject: [Buildroot] [PATCH] postgresql: new package
In-Reply-To: <1394315978-15500-1-git-send-email-ps.report@gmx.net>
References: <1394315978-15500-1-git-send-email-ps.report@gmx.net>
Message-ID: <532595C7.3020207@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Peter!
Thank you for you patch. I didn't submitted yet because I still don't 
have a working buildroot environment at the moment.

I should expect to find the new package after a git pull?

Thanks!
Marco

--

Il 08/03/2014 22:59, Peter Seiderer ha scritto:
> Based on suggested new package by Marco Trapanese ([1]).
>
> [1] http://lists.busybox.net/pipermail/buildroot/2014-February/090661.html
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>   package/Config.in                |  1 +
>   package/postgresql/Config.in     | 13 +++++++++++++
>   package/postgresql/postgresql.mk | 29 +++++++++++++++++++++++++++++
>   3 files changed, 43 insertions(+)
>   create mode 100644 package/postgresql/Config.in
>   create mode 100644 package/postgresql/postgresql.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 70e5a7f..f8a86ea 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -539,6 +539,7 @@ source "package/berkeleydb/Config.in"
>   source "package/cppdb/Config.in"
>   source "package/gdbm/Config.in"
>   source "package/mysql/Config.in"
> +source "package/postgresql/Config.in"
>   source "package/redis/Config.in"
>   source "package/sqlcipher/Config.in"
>   source "package/sqlite/Config.in"
> diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
> new file mode 100644
> index 0000000..efc296f
> --- /dev/null
> +++ b/package/postgresql/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_POSTGRESQL
> +	bool "PostgreSQL"
> +	depends on BR2_INET_IPV6
> +	select BR2_PACKAGE_READLINE
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  PostgreSQL is a powerful, open source object-relational
> +	  database system.
> +
> +	  http://www.postgresql.org
> +
> +comment "PostgreSQL needs a toolchain w/ IPv6"
> +	depends on !BR2_INET_IPV6
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> new file mode 100644
> index 0000000..6432b87
> --- /dev/null
> +++ b/package/postgresql/postgresql.mk
> @@ -0,0 +1,29 @@
> +################################################################################
> +#
> +# postgresql
> +#
> +################################################################################
> +
> +POSTGRESQL_VERSION = 9.3.3
> +POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
> +POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)/$(POSTGRESQL_SOURCE)
> +POSTGRESQL_LICENSE = PostgreSQL
> +POSTGRESQ_LICENSE_FILES = COPYRIGHT
> +POSTGRESQL_DEPENDENCIES = readline zlib
> +POSTGRESQL_CONF_OPT = --prefix=/usr
> +
> +ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +	POSTGRESQL_CONF_OPT += --disable-thread-safety
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TZDATA),y)
> +	POSTGRESQL_DEPENDENCIES += tzdata
> +	POSTGRESQL_CONF_OPT += --with-system-tzdata=/usr/share/zoneinfo
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +	POSTGRESQL_DEPENDENCIES += openssl
> +	POSTGRESQL_CONF_OPT += --with-openssl
> +endif
> +
> +$(eval $(autotools-package))
