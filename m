From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Wed, 14 Apr 2021 07:28:57 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/osm2pgsql: new package
In-Reply-To: <c734c656-6f02-a1f7-fbb3-82cd9c4538f0@mind.be>
References: <20210413135120.3724605-1-fido_max@inbox.ru>
 <c734c656-6f02-a1f7-fbb3-82cd9c4538f0@mind.be>
Message-ID: <208ae79f-afe7-5ce9-68c1-53ba53fb51a4@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



13.04.2021 21:37, Arnout Vandecappelle ?????:
>   Hi Maxim,
> 
>   Did my merging of postgis trigger this? :-)
> 
> On 13/04/2021 15:51, Maxim Kochetkov via buildroot wrote:
>> osm2pgsql is a tool for loading OpenStreetMap data into a
>> PostgreSQL / PostGIS database suitable for applications like
>> rendering into a map, geocoding with Nominatim, or general analysis.
>>
>> https://osm2pgsql.org
>>
>> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
>> ---
>> Changes v1 -> v2 (after review of Peter Seiderer):
>>   - Add dependencies
>>   - Disable tests
>>   - Fix license
>>   - Fix check-package warnings
>>   - Add myself to DEVELOPERS
>>   - Test all lua versions (5.1, 5.3, 5.4)
>>
>>   DEVELOPERS                       |  1 +
>>   package/Config.in                |  1 +
>>   package/osm2pgsql/Config.in      | 20 ++++++++++++
>>   package/osm2pgsql/osm2pgsql.hash |  3 ++
>>   package/osm2pgsql/osm2pgsql.mk   | 54 ++++++++++++++++++++++++++++++++
>>   5 files changed, 79 insertions(+)
>>   create mode 100644 package/osm2pgsql/Config.in
>>   create mode 100644 package/osm2pgsql/osm2pgsql.hash
>>   create mode 100644 package/osm2pgsql/osm2pgsql.mk
>>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index 7699c471d3..e94c4291f2 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -1837,6 +1837,7 @@ F:	arch/Config.in.xtensa
>>   
>>   N:	Maxim Kochetkov <fido_max@inbox.ru>
>>   F:	package/timescaledb/
>> +F:	package/osm2pgsql/
> 
>   I didn't notice when I merged postgis: could you add yourself to DEVELOPERS for
> postgis as well?

Of course.

> 
>>   
>>   N:	Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>>   F:	package/babeld/
>> diff --git a/package/Config.in b/package/Config.in
>> index 19f2606b6b..1615f0c7e3 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -1405,6 +1405,7 @@ menu "Database"
>>   	source "package/libpqxx/Config.in"
>>   	source "package/mongodb/Config.in"
>>   	source "package/mysql/Config.in"
>> +	source "package/osm2pgsql/Config.in"
> 
>   I think it would be better to move this under the BR2_PACKAGE_POSTGRESQL_FULL
> dependency, below, since it's a kind of postgresql extension.
> 
>   And of course, that condition should have been on BR2_PACKAGE_POSTGRESQL, with
> the BR2_PACKAGE_POSTGRESQL_FULL dependency still in postgis. My bad.
> 
>>   	source "package/postgresql/Config.in"
>>   if BR2_PACKAGE_POSTGRESQL_FULL
>>   	source "package/postgis/Config.in"
>> diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
>> new file mode 100644
>> index 0000000000..69ae4b4232
>> --- /dev/null
>> +++ b/package/osm2pgsql/Config.in
>> @@ -0,0 +1,20 @@
>> +config BR2_PACKAGE_OSM2PGSQL
>> +	bool "osm2pgsql"
>> +	depends on BR2_PACKAGE_POSTGRESQL
>> +	depends on BR2_INSTALL_LIBSTDCPP # boost
>> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
>> +	depends on BR2_USE_WCHAR # boost
>> +	select BR2_PACKAGE_BOOST
>> +	select BR2_PACKAGE_BOOST_SYSTEM
>> +	select BR2_PACKAGE_BOOST_FILESYSTEM
>> +	select BR2_PACKAGE_BZIP2
>> +	select BR2_PACKAGE_EXPAT
>> +	select BR2_PACKAGE_ZLIB
>> +	help
>> +	  osm2pgsql is a tool for loading OpenStreetMap data into a
>> +	  PostgreSQL / PostGIS database suitable for applications like
>> +	  rendering into a map, geocoding with Nominatim,
>> +	  or general analysis.
>> +
>> +	  https://osm2pgsql.org
> 
>   You again don't have the comment that indicates what's missing in the toolchain.

Do you mean microblazeel with the bootlin toolchain?

> 
>> diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
>> new file mode 100644
>> index 0000000000..13e8de4b51
>> --- /dev/null
>> +++ b/package/osm2pgsql/osm2pgsql.hash
>> @@ -0,0 +1,3 @@
>> +# Locally calculated
>> +sha256  fc68283930ccd468ed9b28685150741b16083fec86800a4b011884ae22eb061c  osm2pgsql-1.4.2.tar.gz
>> +sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
>> diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
>> new file mode 100644
>> index 0000000000..f281a18b6b
>> --- /dev/null
>> +++ b/package/osm2pgsql/osm2pgsql.mk
>> @@ -0,0 +1,54 @@
>> +################################################################################
>> +#
>> +# osm2pgsql
>> +#
>> +################################################################################
>> +
>> +OSM2PGSQL_VERSION = 1.4.2
>> +OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
>> +OSM2PGSQL_LICENSE = GPL-2.0+, BSL-1.0 (libosmium), Apache-2.0 (protozero), BSD-2-Clause (protozero), MIT with exception (fmt)
> 
>   Are libosmium, protozero and fmt bundled libraries? If possible, we prefer to
> use unbundled versions. ftm already has a package, but for libosmium and
> protozero you'd need to create new packages.

I will try.
