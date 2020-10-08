From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 23:23:26 +0200
Subject: [Buildroot] [PATCH 2/2] package/timescaledb: new package
In-Reply-To: <20201005101951.3112095-3-fido_max@inbox.ru>
References: <20201005101951.3112095-1-fido_max@inbox.ru>
 <20201005101951.3112095-3-fido_max@inbox.ru>
Message-ID: <20201008232326.08e0ca97@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maxim,

Thanks for this contribution. I have applied it, but after doing a
number of changes. See below.

On Mon,  5 Oct 2020 13:19:51 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> TimescaleDB is an open-source database designed to make SQL scalable for time-series data.
> It is engineered up from PostgreSQL and packaged as a PostgreSQL extension, providing
> automatic partitioning across time and space (partitioning key), as well as full SQL support.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

The lines of the commit log were too long, so I rewrapped them to 72
characters.

> ---
>  package/Config.in                    |  1 +
>  package/timescaledb/Config.in        | 11 +++++++++++
>  package/timescaledb/timescaledb.hash |  3 +++
>  package/timescaledb/timescaledb.mk   | 22 ++++++++++++++++++++++
>  4 files changed, 37 insertions(+)

You forgot to add an entry in the DEVELOPERS file for this package.

>  create mode 100644 package/timescaledb/Config.in
>  create mode 100644 package/timescaledb/timescaledb.hash
>  create mode 100644 package/timescaledb/timescaledb.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 16acc30ce6..5c50d4d523 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1379,6 +1379,7 @@ menu "Database"
>  	source "package/mongodb/Config.in"
>  	source "package/mysql/Config.in"
>  	source "package/postgresql/Config.in"
> +	source "package/timescaledb/Config.in"

This should have been alphabetically sorted.

>  	source "package/redis/Config.in"
>  	source "package/rocksdb/Config.in"
>  	source "package/sqlcipher/Config.in"
> diff --git a/package/timescaledb/Config.in b/package/timescaledb/Config.in
> new file mode 100644
> index 0000000000..e11fb14ac0
> --- /dev/null
> +++ b/package/timescaledb/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_TIMESCALEDB
> +	bool "timescaledb"
> +	depends on BR2_PACKAGE_POSTGRESQL
> +	help
> +	  TimescaleDB is an open-source database designed
> +	  to make SQL scalable for time-series data.
> +	  It is engineered up from PostgreSQL and packaged
> +	  as a PostgreSQL extension, providing automatic
> +	  partitioning across time and space (partitioning key),
> +	  as well as full SQL support.
> +

We need the upstream URL of the project at the end of the Config.in
help text. This is reported by "make check-package".

> diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
> new file mode 100644
> index 0000000000..958fa1e508
> --- /dev/null
> +++ b/package/timescaledb/timescaledb.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# timescaledb
> +#
> +################################################################################
> +
> +TIMESCALEDB_VERSION = 1.7.4
> +TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
> +TIMESCALEDB_LICENSE = Apache-2.0
> +TIMESCALEDB_LICENSE_FILES = LICENSE
> +
> +TIMESCALEDB_DEPENDENCIES = postgresql
> +TIMESCALEDB_CONF_OPTS += -DREGRESS_CHECKS=OFF
> +TIMESCALEDB_CONF_OPTS += -DPG_PKGLIBDIR=lib/postgresql
> +TIMESCALEDB_CONF_OPTS += -DPG_SHAREDIR=share/postgresql
> +TIMESCALEDB_CONF_OPTS += -DPG_BINDIR=bin
> +TIMESCALEDB_CONF_OPTS += -DPG_CPPFLAGS="$(POSTGRESQL_CPPFLAGS) "
> +TIMESCALEDB_CONF_OPTS += -DPG_CFLAGS="$(POSTGRESQL_CFLAGS) "
> +TIMESCALEDB_CONF_OPTS += -DPG_LDFLAGS="$(POSTGRESQL_LDFLAGS) "
> +TIMESCALEDB_CONF_OPTS += -DPG_LIBS=" "

Several issues here:

 - Only one TIMESCALEDB_CONF_OPTS assignment is needed, which can span
   multiple lines.

 - Using POSTGRESQL_{CPPFLAGS,CFLAGS,LDFLAGS} is not recommended, as
   they are variables from another package. Instead, I've used
   TARGET_CPPFLAGS, TARGET_CFLAGS, TARGET_LDFLAGS.

 - It was not obvious why you added a space at the end of those
   variables, but it was indeed necessary, so I've added a comment to
   explain why.

 - My test build had OpenSSL disables, which requires passing
   -DUSE_OPENSSL=0, otherwise timescaledb CMake logic complains.

As said above, I fixed all those issues, and applied. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
