From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 22 Apr 2016 01:02:49 +0200
Subject: [Buildroot] [PATCH v5] package/radlib: new package
In-Reply-To: <1460563603-3748-2-git-send-email-ray.kinsella@intel.com>
References: <1460563603-3748-1-git-send-email-ray.kinsella@intel.com>
 <1460563603-3748-2-git-send-email-ray.kinsella@intel.com>
Message-ID: <57195C19.3070307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/13/16 18:06, ray.kinsella at intel.com wrote:
> From: Ray Kinsella <ray.kinsella@intel.com>
>
> radlib is a rapid application development library for unix
> multi-process applications. It uses SYS V IPC facilities and
> FIFOs to provide an RTOS-like, event-driven, distributed
> framework. Processes may be run as daemons or have a controlling
> terminal.
>
> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> ---
[snip]
> diff --git a/package/radlib/0001-radlib-introduce-pkg-config-for-sqlite-and-postgresq.patch b/package/radlib/0001-radlib-introduce-pkg-config-for-sqlite-and-postgresq.patch
> new file mode 100644
> index 0000000..63a4315
> --- /dev/null
> +++ b/package/radlib/0001-radlib-introduce-pkg-config-for-sqlite-and-postgresq.patch
> @@ -0,0 +1,102 @@
> +From 3c7aad41e2c32b63267fa8cd6bf3fbb9ea0aaae3 Mon Sep 17 00:00:00 2001
> +From: Ray Kinsella <ray.kinsella@intel.com>
> +Date: Wed, 13 Apr 2016 16:21:02 +0100
> +Subject: [PATCH 1/3] radlib: introduce pkg-config for sqlite and postgresql

  Please generate patches with the -N option; the 1/3 becomes invalid when a 4th 
patch is added, or when some of the patches are accepted upstream. Given 
upstream's lack of updates the latter isn't very likely :-) Did you try to 
submit the patches upstream?

> +
> +Retrieve cflags and linker options for sqlite and postgresql using pkg-config.
> +
> +Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> +---
> + configure.in          | 6 ++++++
> + debug/Makefile.am     | 4 ++--
> + msgRouter/Makefile.am | 4 ++--
> + src/Makefile.am       | 6 ++----
> + 4 files changed, 12 insertions(+), 8 deletions(-)
> +
> +diff --git a/configure.in b/configure.in
> +index 47e507e..83f572c 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -23,6 +23,9 @@ AC_ARG_ENABLE(pgresql,
> +   *) pgresql=false ;;
> + esac],[pgresql=false])
> + AM_CONDITIONAL(PGRESQL, test x$pgresql = xtrue)
> ++if test x$pgresql = xtrue; then

  Since the AM_CONDITIONAL is defined just above, it's better to use AM_COND_IF:

AM_COND_IF([PGRESQL],
   PKG_CHECK_MODULES([POSTGRESQL], [libpq])
)

(untested, of course).

> ++  PKG_CHECK_MODULES([POSTGRESQL], [libpq])
> ++fi
> +
> + AC_ARG_ENABLE(sqlite,
> + [  --enable-sqlite                include radlib sqlite database support],
> +@@ -32,6 +35,9 @@ AC_ARG_ENABLE(sqlite,
> +   *) sqlite=false ;;
> + esac],[sqlite=false])
> + AM_CONDITIONAL(SQLITE, test x$sqlite = xtrue)
> ++if test x$sqlite = xtrue; then

  Same here.

> ++  PKG_CHECK_MODULES([SQLITE3], [sqlite3])
> ++fi
> +
> + # Check for big endian host:
> + AC_C_BIGENDIAN()
[snip]
> diff --git a/package/radlib/0002-radlib-introduce-mysql-config.patch b/package/radlib/0002-radlib-introduce-mysql-config.patch
> new file mode 100644
> index 0000000..d778d42
> --- /dev/null
> +++ b/package/radlib/0002-radlib-introduce-mysql-config.patch
> @@ -0,0 +1,78 @@
> +From c70ccfd485b87f9ffe065b82588aa158743620a0 Mon Sep 17 00:00:00 2001
> +From: Ray Kinsella <ray.kinsella@intel.com>
> +Date: Wed, 13 Apr 2016 16:23:11 +0100
> +Subject: [PATCH 2/3] radlib: introduce mysql-config
> +
> +Retrieve cflags and linker options for mysql using mysql-config.$
> +
> +Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> +---
> + configure.in          | 9 +++++++++
> + debug/Makefile.am     | 2 +-
> + msgRouter/Makefile.am | 2 +-
> + src/Makefile.am       | 3 +--
> + 4 files changed, 12 insertions(+), 4 deletions(-)
> +
> +diff --git a/configure.in b/configure.in
> +index 83f572c..3fb8f49 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -14,6 +14,15 @@ AC_ARG_ENABLE(mysql,
> +   *) mysql=false ;;
> + esac],[mysql=false])
> + AM_CONDITIONAL(MYSQL, test x$mysql = xtrue)
> ++if test x$mysql = xtrue; then

  Same, use AM_COND_IF

> ++  AC_PATH_PROG([MYSQL_CONFIG], [mysql_config])
> ++  if test "x$MYSQL_CONFIG" != "x";then
> ++    MYSQL_CFLAGS=`$MYSQL_CONFIG --cflags`
> ++    MYSQL_LIBS=`$MYSQL_CONFIG --libs`
> ++    AC_SUBST([MYSQL_CFLAGS])
> ++    AC_SUBST([MYSQL_LIBS])

  I guess there should be an error in the else branch?

> ++  fi
> ++fi
> +
> + AC_ARG_ENABLE(pgresql,
> + [  --enable-pgresql               include radlib postgreSQL database support],
[snip]
> diff --git a/package/radlib/0003-radlib-fix-the-paths-in-the-subdir-objects.patch b/package/radlib/0003-radlib-fix-the-paths-in-the-subdir-objects.patch
> new file mode 100644
> index 0000000..b375eaf
> --- /dev/null
> +++ b/package/radlib/0003-radlib-fix-the-paths-in-the-subdir-objects.patch
> @@ -0,0 +1,93 @@
> +From ddcebb69533c795c1c0371eeefe856924e11ff23 Mon Sep 17 00:00:00 2001
> +From: Ray Kinsella <ray.kinsella@intel.com>
> +Date: Wed, 13 Apr 2016 16:24:34 +0100
> +Subject: [PATCH 3/3] radlib: fix the paths in the subdir-objects
> +
> +Remove paths relative to $(prefix) and CROSS_COMPILE options from
> +subdir-objects.

  I think this should be the first patch; our autoreconf will not be happy 
without subdir-objects.

> +
> +Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> +---
> + configure.in          |  1 +
> + debug/Makefile.am     | 16 ++--------------
> + msgRouter/Makefile.am | 16 ++--------------
> + src/Makefile.am       |  1 -
> + 4 files changed, 5 insertions(+), 29 deletions(-)
> +
> +diff --git a/configure.in b/configure.in
> +index 3fb8f49..ffc0204 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -4,6 +4,7 @@ AC_PREREQ(2.5)
> + AC_INIT([radlib],[2.12.0],[mteel2005 at gmail.com])
> + AC_CONFIG_SRCDIR([h/radmsgLog.h])
> + AM_INIT_AUTOMAKE([radlib],[2.12.0])

  Shouldn't this one be removed?

> ++AM_INIT_AUTOMAKE([subdir-objects])
> + AM_CONFIG_HEADER([config.h])
> +
> + AC_ARG_ENABLE(mysql,
> +diff --git a/debug/Makefile.am b/debug/Makefile.am
> +index 7c558ed..e732a06 100644
> +--- a/debug/Makefile.am
> ++++ b/debug/Makefile.am
> +@@ -27,18 +27,6 @@ raddebug_LDADD   += $(SQLITE3_LIBS)
> + endif
> +
> + # define library directories
> +-raddebug_LDFLAGS = -L../src/.libs -L$(prefix)/lib -L/usr/lib
> +-INCLUDES         += -I$(prefix)/include -I/usr/include
> ++raddebug_LDADD += -L../src/.libs
> +
> +-if MYSQL
> +-raddebug_LDFLAGS += -L$(prefix)/lib64/mysql -L$(prefix)/lib/mysql -L/usr/lib64/mysql -L/usr/lib/mysql
> +-else
> +-if PGRESQL
> +-raddebug_LDFLAGS += -L$(prefix)/pgsql/lib
> +-INCLUDES         += -I$(prefix)/pgsql/include
> +-endif
> +-endif
> +-
> +-if CROSSCOMPILE
> +-raddebug_LDFLAGS += $(prefix)/lib/crt1.o $(prefix)/lib/crti.o $(prefix)/lib/crtn.o
> +-endif
> ++# removed paths relative to $(prefix)
> +diff --git a/msgRouter/Makefile.am b/msgRouter/Makefile.am
> +index 14733b7..2cf9d17 100644
> +--- a/msgRouter/Makefile.am
> ++++ b/msgRouter/Makefile.am
> +@@ -27,18 +27,6 @@ radmrouted_LDADD   += $(SQLITE3_LIBS)
> + endif
> +
> + # define library directories
> +-radmrouted_LDFLAGS = -L../src/.libs -L$(prefix)/lib -L/usr/lib
> +-INCLUDES           += -I$(prefix)/include -I/usr/include
> ++radmrouted_LDADD += -L../src/.libs
> +
> +-if MYSQL
> +-radmrouted_LDFLAGS += -L$(prefix)/lib64/mysql -L$(prefix)/lib/mysql -L/usr/lib64/mysql -L/usr/lib/mysql
> +-else
> +-if PGRESQL
> +-radmrouted_LDFLAGS += -L$(prefix)/lib -L$(prefix)/pgsql/lib
> +-INCLUDES           += -I$(prefix)/pgsql/include
> +-endif
> +-endif
> +-
> +-if CROSSCOMPILE
> +-radmrouted_LDFLAGS += $(prefix)/lib/crt1.o $(prefix)/lib/crti.o $(prefix)/lib/crtn.o
> +-endif
> ++# removed paths relative to $(prefix)
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index ea1b73d..f08976b 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -43,7 +43,6 @@ endif
> + # define include directories
> + INCLUDES = \
> + 		-I$(top_srcdir)/h \
> +-		-I$(prefix)/include \
> + 		-D_GNU_SOURCE \
> + 		$(MY_INCLUDES) \
> + 		$(PG_INCLUDES) \
> +--
> +2.4.11
> +
> diff --git a/package/radlib/Config.in b/package/radlib/Config.in
> new file mode 100644
> index 0000000..a4a89c9
> --- /dev/null
> +++ b/package/radlib/Config.in
> @@ -0,0 +1,38 @@
> +config BR2_PACKAGE_RADLIB
> +	bool "radlib"
> +	help
> +	  radlib is a rapid application development library for unix
> +	  multi-process applications. It uses SYS V IPC facilities and
> +	  FIFOs to provide an RTOS-like, event-driven, distributed framework.
> +	  Processes may be run as daemons or have a controlling terminal.

  Lines in help text should be wrapped at 72 columns, where tab counts for 8.

> +	
> +	  http://sourceforge.net/projects/radlib/
> +
> +choice
> +	prompt "radlib database backend"
> +	depends on BR2_PACKAGE_RADLIB
> +	depends on BR2_PACKAGE_SQLITE \
> +		|| BR2_PACKAGE_MYSQL \
> +		|| BR2_PACKAGE_POSTGRESQL
> +	help
> +	  Selects the backend database: sqlite, mysql or postgresql

  I'm not really happy with this choice, I'd prefer an automatic selection. But 
it's true, if both mysql and postgresql are selected it's hard to decide which 
one should be used...

> +
> +config BR2_PACKAGE_RADLIB_SQLITE
> +	bool "sqlite"
> +	depends on BR2_PACKAGE_SQLITE
> +	help
> +	  Configure radlib to use a sqlite database backend
> +
> +config BR2_PACKAGE_RADLIB_MYSQL
> +	bool "mysql"
> +	depends on BR2_PACKAGE_MYSQL
> +	help
> +	  Configure radlib to use a mysql database backend
> +
> +config BR2_PACKAGE_RADLIB_POSTGRESQL
> +	bool "postgresql"
> +	depends on BR2_PACKAGE_POSTGRESQL
> +	help
> +	  Configure radlib to use a postgresql database backend
> +
> +endchoice
> diff --git a/package/radlib/radlib.hash b/package/radlib/radlib.hash
> new file mode 100644
> index 0000000..2fbfbba
> --- /dev/null
> +++ b/package/radlib/radlib.hash
> @@ -0,0 +1,2 @@
> +# From http://sourceforge.net/projects/radlib/files/

  Err, I see sha1 and md5 there, but not sha256. So you should take the md5 and 
sha1 from sourceforge and add the locally-calculated sha256.

> +sha256  82b98bb5e08a500dea1e4252843b9c772fa1fb67ac8ab89ed64abdd5e22eca66  radlib-2.12.0.tar.gz
> diff --git a/package/radlib/radlib.mk b/package/radlib/radlib.mk
> new file mode 100644
> index 0000000..8b8d61e
> --- /dev/null
> +++ b/package/radlib/radlib.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# radlib
> +#
> +################################################################################
> +
> +RADLIB_VERSION = 2.12.0
> +RADLIB_SITE = http://downloads.sourceforge.net/radlib
> +RADLIB_INSTALL_STAGING = YES
> +RADLIB_LICENSE = BSD-2c
> +RADLIB_LICENSE_FILES = COPYING
> +RADLIB_AUTORECONF = YES
> +RADLIB_DEPENDENCIES = host-pkgconf
> +
> +ifeq ($(BR2_PACKAGE_RADLIB_SQLITE),y)
> +RADLIB_CONF_OPTS += --enable-sqlite
RADLIB_DEPENDENCIES += sqlite
else
RADLIB_CONF_OPTS += --disable-sqlite
> +endif
> +
> +ifeq ($(BR2_PACKAGE_RADLIB_MYSQL),y)
> +RADLIB_CONF_ENV=ac_cv_path_MYSQL_CONFIG="$(STAGING_DIR)/usr/bin/mysql_config"
> +RADLIB_CONF_OPTS += --enable-mysql

  Same here

> +endif
> +
> +ifeq ($(BR2_PACKAGE_RADLIB_POSTGRESQL),y)
> +RADLIB_CONF_OPTS += --enable-pgresql

  Same here

  Regards,
  Arnout

> +endif
> +
> +$(eval $(autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
