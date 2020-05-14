From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 May 2020 16:54:01 +0200
Subject: [Buildroot] [PATCH 4/6] package/libodb-pgsql: new package
In-Reply-To: <20200514143325.1009253-5-kamel.bouhara@bootlin.com>
References: <20200514143325.1009253-1-kamel.bouhara@bootlin.com>
 <20200514143325.1009253-5-kamel.bouhara@bootlin.com>
Message-ID: <20200514165401.005e0c97@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 May 2020 16:33:23 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 4c7c157e07..abdee8541a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -44,6 +44,7 @@ F:	package/json-for-modern-cpp/
>  F:	package/libcpprestsdk/
>  F:	package/libcutl/
>  F:	package/libodb/
> +F:	package/libodb-pgsql/
>  F:	package/libressl/
>  F:	package/libselinux/
>  F:	package/libsemanage/
> diff --git a/package/Config.in b/package/Config.in
> index 3891b36282..59e714fb6a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1319,6 +1319,7 @@ menu "Database"
>  	source "package/hiredis/Config.in"
>  	source "package/kompexsqlite/Config.in"
>  	source "package/leveldb/Config.in"
> +	source "package/libodb-pgsql/Config.in"
>  	source "package/libgit2/Config.in"
>  	source "package/libpqxx/Config.in"
>  	source "package/mongodb/Config.in"
> diff --git a/package/libodb-pgsql/Config.in b/package/libodb-pgsql/Config.in
> new file mode 100644
> index 0000000000..daaf4717f9
> --- /dev/null
> +++ b/package/libodb-pgsql/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LIBODB_PGSQL
> +	bool "libodb-pgsql"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_POSTGRESQL
> +	select BR2_PACKAGE_LIBODB
> +	help
> +	  This package contains the PostgreSQL ODB runtime library.
> +	  Every application that includes code generated for the
> +	  PostgreSQL database will need to link to this library.
> +
> +	  https://www.codesynthesis.com/products/odb/
> +
> +comment "libodb-pgsql needs a toolchain w/ C++, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

We need a:

	depends on BR2_PACKAGE_POSTGRESQL

here so that the comment does not appear when postgresql is not enabled.

> +LIBODB_PGSQL_VERSION_MAJOR = 2.4
> +LIBODB_PGSQL_VERSION = $(LIBODB_PGSQL_VERSION_MAJOR).0
> +LIBODB_PGSQL_SOURCE = libodb-pgsql-$(LIBODB_PGSQL_VERSION).tar.bz2
> +LIBODB_PGSQL_SITE = https://www.codesynthesis.com/download/odb/$(LIBODB_PGSQL_VERSION_MAJOR)
> +LIBODB_PGSQL_LICENSE = GPL-2.0
> +LIBODB_PGSQL_LICENSE_FILES = LICENSE
> +LIBODB_PGSQL_INSTALL_STAGING = YES
> +LIBODB_PGSQL_DEPENDENCIES += postgresql libodb

The += sign can be just =

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
