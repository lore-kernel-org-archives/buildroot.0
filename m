From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Apr 2021 22:32:19 +0200
Subject: [Buildroot] [PATCH v3 3/3] package/osm2pgsql: new package
In-Reply-To: <20210415150356.775904-3-fido_max@inbox.ru>
References: <20210415150356.775904-1-fido_max@inbox.ru>
 <20210415150356.775904-3-fido_max@inbox.ru>
Message-ID: <4434f6fa-e05e-7a26-bf65-c82fd37210ad@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/04/2021 17:03, Maxim Kochetkov wrote:
[snip]
> diff --git a/package/Config.in b/package/Config.in
> index 61c67e5ce1..00f639915f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1407,6 +1407,9 @@ menu "Database"
>  	source "package/mongodb/Config.in"
>  	source "package/mysql/Config.in"
>  	source "package/postgresql/Config.in"
> +if BR2_PACKAGE_POSTGRESQL
> +	source "package/osm2pgsql/Config.in"
> +endif
>  if BR2_PACKAGE_POSTGRESQL_FULL

 The intention was to have only a single condition here. I've pushed a
preparatory patch that changes the condition to BR2_PACKAGE_POSTGRESQL, so
please rebase on that.

>  	source "package/postgis/Config.in"
>  endif
> diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
> new file mode 100644
> index 0000000000..e4163b5e66
> --- /dev/null
> +++ b/package/osm2pgsql/Config.in
> @@ -0,0 +1,27 @@
> +config BR2_PACKAGE_OSM2PGSQL
> +	bool "osm2pgsql"
> +	depends on BR2_PACKAGE_POSTGRESQL
> +	depends on BR2_INSTALL_LIBSTDCPP # boost, fmt
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
> +	depends on BR2_USE_WCHAR # boost, fmt
> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_SYSTEM
> +	select BR2_PACKAGE_BOOST_FILESYSTEM
> +	select BR2_PACKAGE_BZIP2
> +	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_FMT
> +	select BR2_PACKAGE_PROTOZERO
> +	select BR2_PACKAGE_LIBOSMIUM
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  osm2pgsql is a tool for loading OpenStreetMap data into a
> +	  PostgreSQL / PostGIS database suitable for applications like

 Line too long, as reported by check-package.

> +	  rendering into a map, geocoding with Nominatim,
> +	  or general analysis.
> +
> +	  https://osm2pgsql.org
> +
> +comment "osm2pgsql needs a toolchain w/ C++,  wchar, threads, gcc >= 4.7"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
> \ No newline at end of file
> diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
> new file mode 100644
> index 0000000000..13e8de4b51
> --- /dev/null
> +++ b/package/osm2pgsql/osm2pgsql.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  fc68283930ccd468ed9b28685150741b16083fec86800a4b011884ae22eb061c  osm2pgsql-1.4.2.tar.gz
> +sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
> new file mode 100644
> index 0000000000..f331955604
> --- /dev/null
> +++ b/package/osm2pgsql/osm2pgsql.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# osm2pgsql
> +#
> +################################################################################
> +
> +OSM2PGSQL_VERSION = 1.4.2
> +OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
> +OSM2PGSQL_LICENSE = GPL-2.0+
> +OSM2PGSQL_LICENSE_FILES = COPYING
> +OSM2PGSQL_SUPPORTS_IN_SOURCE_BUILD = NO
> +
> +OSM2PGSQL_DEPENDENCIES =  boost bzip2 expat fmt libosmium postgresql protozero zlib
> +
> +OSM2PGSQL_CONF_OPTS += -DBUILD_TESTS=OFF -DBUILD_COVERAGE=OFF
> +OSM2PGSQL_CONF_OPTS += -DEXTERNAL_FMT=ON -DEXTERNAL_LIBOSMIUM=ON -DEXTERNAL_PROTOZERO=ON
> +
> +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +OSM2PGSQL_DEPENDENCIES += luajit
> +OSM2PGSQL_CONF_OPTS +=  -DWITH_LUA=ON -DWITH_LUAJIT=ON
> +else
> +ifeq ($(BR2_PACKAGE_LUA),y)

 This can be put on one line:

else ifeq ($(BR2_PACKAGE_LUA),y)


> +OSM2PGSQL_DEPENDENCIES += lua
> +OSM2PGSQL_CONF_OPTS +=  -DWITH_LUA=ON -DWITH_LUAJIT=OFF
> +else
> +OSM2PGSQL_CONF_OPTS += -DWITH_LUA=OFF -DWITH_LUAJIT=OFF
> +endif
> +endif

... and then you have only one endif here.


 Regards,
 Arnout

> +
> +ifeq ($(BR2_PACKAGE_PROJ),y)
> +OSM2PGSQL_DEPENDENCIES += proj
> +OSM2PGSQL_CONF_OPTS += -DUSE_PROJ_LIB=auto
> +else
> +OSM2PGSQL_CONF_OPTS += -DUSE_PROJ_LIB=off
> +endif
> +
> +$(eval $(cmake-package))
> 
