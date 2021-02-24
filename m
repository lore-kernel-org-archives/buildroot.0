From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 24 Feb 2021 23:07:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/osm2pgsql: new package
In-Reply-To: <f840c69b-91f1-bce3-a26f-da93aed9f765@inbox.ru>
References: <20210127071847.1170622-1-fido_max@inbox.ru>
 <f840c69b-91f1-bce3-a26f-da93aed9f765@inbox.ru>
Message-ID: <20210224230719.56ca56fa@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Feb 2021 09:04:33 +0300, Maxim Kochetkov via buildroot <buildroot@busybox.net> wrote:

> Has this patch chance to be upstreamable? Should I resend or what?

Or find someone to do some review of the patch ;-)

> 
> 27.01.2021 10:18, Maxim Kochetkov via buildroot ?????:
> > osm2pgsql is a tool for loading OpenStreetMap data into a
> > PostgreSQL / PostGIS database suitable for applications like
> > rendering into a map, geocoding with Nominatim, or general analysis.
> > 
> > https://osm2pgsql.org
> > 
> > Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> > ---
> >   package/Config.in                |  1 +
> >   package/osm2pgsql/Config.in      | 15 +++++++++++++++
> >   package/osm2pgsql/osm2pgsql.hash |  3 +++
> >   package/osm2pgsql/osm2pgsql.mk   | 26 ++++++++++++++++++++++++++
> >   4 files changed, 45 insertions(+)
> >   create mode 100644 package/osm2pgsql/Config.in
> >   create mode 100644 package/osm2pgsql/osm2pgsql.hash
> >   create mode 100644 package/osm2pgsql/osm2pgsql.mk
> > 
> > diff --git a/package/Config.in b/package/Config.in
> > index 06dfc32cc6..0b7127bfd4 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1400,6 +1400,7 @@ menu "Database"
> >   	source "package/libpqxx/Config.in"
> >   	source "package/mongodb/Config.in"
> >   	source "package/mysql/Config.in"
> > +	source "package/osm2pgsql/Config.in"
> >   	source "package/postgresql/Config.in"
> >   	source "package/redis/Config.in"
> >   	source "package/rocksdb/Config.in"
> > diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
> > new file mode 100644
> > index 0000000000..81be6b0c49
> > --- /dev/null
> > +++ b/package/osm2pgsql/Config.in
> > @@ -0,0 +1,15 @@
> > +config BR2_PACKAGE_OSM2PGSQL
> > +	bool "osm2pgsql"
> > +	depends on BR2_PACKAGE_POSTGRESQL
> > +	select BR2_PACKAGE_EXPAT
> > +	select BR2_PACKAGE_PROJ

Same as for postgis package, dependencies should be propagated (with comment),
here:
        depends on BR2_INSTALL_LIBSTDCPP
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
        depends on BR2_TOOLCHAIN_HAS_THREADS
        depends on BR2_USE_WCHAR

> > +	select BR2_PACKAGE_BZIP2
> > +	select BR2_PACKAGE_ZLIB
> > +	select BR2_PACKAGE_BOOST

        depends on BR2_INSTALL_LIBSTDCPP
        depends on BR2_TOOLCHAIN_HAS_THREADS
        depends on BR2_USE_WCHAR

> > +	select BR2_PACKAGE_BOOST_FILESYSTEM
> > +	help
> > +	  osm2pgsql is a tool for loading OpenStreetMap data into a
> > +	  PostgreSQL / PostGIS database suitable for applications like
> > +	  rendering into a map, geocoding with Nominatim, or general analysis.



	$ /utils/check-package package/osm2pgsql/*
package/osm2pgsql/Config.in:11: line contains trailing whitespace
package/osm2pgsql/Config.in:12: line contains trailing whitespace
package/osm2pgsql/Config.in:13: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

> > +
> > +	  https://osm2pgsql.org
> > diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
> > new file mode 100644
> > index 0000000000..28ff242321
> > --- /dev/null
> > +++ b/package/osm2pgsql/osm2pgsql.hash
> > @@ -0,0 +1,3 @@
> > +# Locally calculated
> > +sha256  403e25a0310d088183a868d80e5325dceee88617d0df570056e50a2930905369  osm2pgsql-1.4.0.tar.gz
> > +sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> > diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
> > new file mode 100644
> > index 0000000000..6d143d43f7
> > --- /dev/null
> > +++ b/package/osm2pgsql/osm2pgsql.mk
> > @@ -0,0 +1,26 @@
> > +################################################################################
> > +#
> > +# osm2pgsql
> > +#
> > +################################################################################
> > +
> > +OSM2PGSQL_VERSION = 1.4.0
> > +OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
> > +OSM2PGSQL_LICENSE = GPL-2.0+
> > +OSM2PGSQL_LICENSE_FILES = COPYING
> > +OSM2PGSQL_SUPPORTS_IN_SOURCE_BUILD = NO
> > +
> > +OSM2PGSQL_DEPENDENCIES = postgresql expat proj bzip2 zlib boost

Should be sorted alphabetically...

> > +
> > +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> > +OSM2PGSQL_DEPENDENCIES += luajit
> > +OSM2PGSQL_CONF_OPTS += -DWITH_LUAJIT=ON
> > +else
> > +ifeq ($(BR2_PACKAGE_LUA),y)
> > +OSM2PGSQL_DEPENDENCIES += lua
> > +else
> > +OSM2PGSQL_CONF_OPTS += -DWITH_LUA=OFF
> > +endif
> > +endif
> > +
> > +$(eval $(cmake-package))

And add an entry in the DEVELOPERS file...

Did not find time (yet) for compile testing...

Regards,
Peter

> >   
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
