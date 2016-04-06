From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Apr 2016 00:36:44 +0200
Subject: [Buildroot] [PATCH v4 3/3] package/radlib: reworked autotools
 with pkg-config
In-Reply-To: <1459948770-2769-4-git-send-email-ray.kinsella@intel.com>
References: <1459948770-2769-1-git-send-email-ray.kinsella@intel.com>
 <1459948770-2769-4-git-send-email-ray.kinsella@intel.com>
Message-ID: <57058F7C.7000708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/06/16 15:19, ray.kinsella at intel.com wrote:
> From: Ray Kinsella <ray.kinsella@intel.com>
>
> Reworked the autools implementation to use pkg-config and mysql-config.
>
> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> ---
>   ...radlib-reworked-autotools-with-pkg-config.patch | 252 +++++++++++++++++++++
>   1 file changed, 252 insertions(+)
>   create mode 100644 package/radlib/0002-radlib-reworked-autotools-with-pkg-config.patch
>
> diff --git a/package/radlib/0002-radlib-reworked-autotools-with-pkg-config.patch b/package/radlib/0002-radlib-reworked-autotools-with-pkg-config.patch
> new file mode 100644
> index 0000000..3410fcb
> --- /dev/null
> +++ b/package/radlib/0002-radlib-reworked-autotools-with-pkg-config.patch
> @@ -0,0 +1,252 @@
> +From 832855f6942fea66a39c738865484e57a8f97169 Mon Sep 17 00:00:00 2001
> +From: Ray Kinsella <ray.kinsella@intel.com>
> +Date: Wed, 6 Apr 2016 11:25:40 +0100
> +Subject: [PATCH 2/2] radlib: reworked autotools with pkg-config
> +
> +Reworked the autools implementation to use pkg-config and mysql-config.

  Do this in three separate patches: one that sets subdir-objects, one that adds 
pkg-config, and one that adds mysql-config.

> +
> +Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> +---
> + configure.ac          | 47 ++++++++++++++++++++++-------------------------
> + debug/Makefile.am     | 32 +++++---------------------------
> + msgRouter/Makefile.am | 34 ++++++----------------------------
> + src/Makefile.am       | 36 +++++++++++++-----------------------
> + 4 files changed, 46 insertions(+), 103 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 47e507e..ba493f5 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -3,35 +3,32 @@
> + AC_PREREQ(2.5)
> + AC_INIT([radlib],[2.12.0],[mteel2005 at gmail.com])
> + AC_CONFIG_SRCDIR([h/radmsgLog.h])
> +-AM_INIT_AUTOMAKE([radlib],[2.12.0])
> ++AM_INIT_AUTOMAKE([subdir-objects])
> + AM_CONFIG_HEADER([config.h])
> +
> +-AC_ARG_ENABLE(mysql,
> +-[  --enable-mysql                 include radlib MySQL database support],

  Why would you remove this? An enable option is as good as a with option.

> +-[case "${enableval}" in
> +-  yes) mysql=true ;;
> +-  no)  mysql=false ;;
> +-  *) mysql=false ;;
> +-esac],[mysql=false])

  So you keep the above, and here just add

if test x"$mysql" = xtrue; then
   AC_PATH_PROG(...)
   if test "x$MYSQL_CONFIG" != "x"; then
     ...
   else
     mysql=false
   fi
fi

(indentation in this file seems to be with two spaces instead of tabs).

  And of course the same story for pg.


> +-AM_CONDITIONAL(MYSQL, test x$mysql = xtrue)

  Keep this, there is no reason to replace it by HAVE_MYSQL.

> ++AC_ARG_WITH([postgresql], AS_HELP_STRING([--with-postgresql], [Build with postgresql]))
> ++if test "x$with_postgresql" = "xyes"; then
> ++ PKG_CHECK_MODULES([POSTGRESQL], [libpq], [have_libpq=yes], [have_libpq=no])
> ++fi
> ++AM_CONDITIONAL([HAVE_POSTGRESQL],  [test "$have_libpq" = "yes"])
> +
> +-AC_ARG_ENABLE(pgresql,
> +-[  --enable-pgresql               include radlib postgreSQL database support],
> +-[case "${enableval}" in
> +-  yes) pgresql=true ;;
> +-  no)  pgresql=false ;;
> +-  *) pgresql=false ;;
> +-esac],[pgresql=false])
> +-AM_CONDITIONAL(PGRESQL, test x$pgresql = xtrue)
> ++AC_ARG_WITH([mysql], AS_HELP_STRING([--with-mysql], [Build with mysql]))
> ++if test "x$with_mysql" = "xyes"; then
> ++        AC_PATH_PROG([MYSQL_CONFIG], [mysql_config])
> ++        if test "x$MYSQL_CONFIG" != "x";then
> ++                MYSQL_CFLAGS=`$MYSQL_CONFIG --cflags`
> ++                MYSQL_LIBS=`$MYSQL_CONFIG --libs`
> ++                AC_SUBST([MYSQL_CFLAGS])
> ++                AC_SUBST([MYSQL_LIBS])
> ++        fi
> ++fi
> ++AM_CONDITIONAL([HAVE_MYSQL],  [test "x$MYSQL_CONFIG" != "x"])
> +
> +-AC_ARG_ENABLE(sqlite,
> +-[  --enable-sqlite                include radlib sqlite database support],
> +-[case "${enableval}" in
> +-  yes) sqlite=true ;;
> +-  no)  sqlite=false ;;
> +-  *) sqlite=false ;;
> +-esac],[sqlite=false])
> +-AM_CONDITIONAL(SQLITE, test x$sqlite = xtrue)
> ++AC_ARG_WITH([sqlite], AS_HELP_STRING([--with-sqlite], [Build with sqlite]))
> ++if test "x$with_sqlite" = "xyes"; then
> ++	PKG_CHECK_MODULES([SQLITE3], [sqlite3], [have_libsqlite3=yes], [have_libsqlite3=no])
> ++fi
> ++AM_CONDITIONAL([HAVE_SQLITE3],  [test "$have_libsqlite3" = "yes"])
> +
> + # Check for big endian host:
> + AC_C_BIGENDIAN()
> +diff --git a/debug/Makefile.am b/debug/Makefile.am
> +index 00f3b13..fde57d5 100644
> +--- a/debug/Makefile.am
> ++++ b/debug/Makefile.am
> +@@ -4,7 +4,7 @@
> + bin_PROGRAMS = raddebug
> +
> + # define include directories
> +-INCLUDES = \
> ++AM_CFLAGS = \

  Why does this need to be changed?

> + 		-I$(top_srcdir)/h \
> + 		-D_GNU_SOURCE
> +

  Did you forget to add $(SQLITE3_CFLAGS) etc?

> +@@ -15,30 +15,8 @@ raddebug_SOURCES  = \
> + # define libraries
> + raddebug_LDADD   = -lrad -lpthread
> +
> +-if MYSQL
> +-raddebug_LDADD   += -lmysqlclient
> +-else
> +-if PGRESQL
> +-raddebug_LDADD   += -lpq
> +-endif
> +-endif
> +-if SQLITE
> +-raddebug_LDADD   += -lsqlite3
> +-endif
> +-
> + # define library directories
> +-raddebug_LDFLAGS = -L../src/.libs -L$(prefix)/lib -L/usr/lib
> +-INCLUDES         += -I$(prefix)/include -I/usr/include
> +-
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

  Removing the CROSSCOMPILE part should be a separate patch.

> ++raddebug_LDFLAGS = -L../src/.libs \
> ++		$(SQLITE3_LIBS) \
> ++		$(MYSQL_LIBS) \
> ++		$(POSTGRESQL_LIBS)
> +diff --git a/msgRouter/Makefile.am b/msgRouter/Makefile.am
[snip]

  Same here.

> +diff --git a/src/Makefile.am b/src/Makefile.am
[snip]

  Same here.



  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
