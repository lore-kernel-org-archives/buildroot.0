From: ray.kinsella at intel.com <ray.kinsella@intel.com>
Date: Wed,  6 Apr 2016 13:21:37 +0100
Subject: [Buildroot] [PATCH v3 3/3] package/radlib: reworked autotools with
	pkg-config
In-Reply-To: <1459945297-29773-1-git-send-email-ray.kinsella@intel.com>
References: <1459945297-29773-1-git-send-email-ray.kinsella@intel.com>
Message-ID: <1459945297-29773-3-git-send-email-ray.kinsella@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ray Kinsella <ray.kinsella@intel.com>

Reworked the autools implementation to use pkg-config and mysql-config.

Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
---
 ...radlib-reworked-autotools-with-pkg-config.patch | 252 +++++++++++++++++++++
 1 file changed, 252 insertions(+)
 create mode 100644 package/radlib/0002-radlib-reworked-autotools-with-pkg-config.patch

diff --git a/package/radlib/0002-radlib-reworked-autotools-with-pkg-config.patch b/package/radlib/0002-radlib-reworked-autotools-with-pkg-config.patch
new file mode 100644
index 0000000..3410fcb
--- /dev/null
+++ b/package/radlib/0002-radlib-reworked-autotools-with-pkg-config.patch
@@ -0,0 +1,252 @@
+From 832855f6942fea66a39c738865484e57a8f97169 Mon Sep 17 00:00:00 2001
+From: Ray Kinsella <ray.kinsella@intel.com>
+Date: Wed, 6 Apr 2016 11:25:40 +0100
+Subject: [PATCH 2/2] radlib: reworked autotools with pkg-config
+
+Reworked the autools implementation to use pkg-config and mysql-config.
+
+Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
+---
+ configure.ac          | 47 ++++++++++++++++++++++-------------------------
+ debug/Makefile.am     | 32 +++++---------------------------
+ msgRouter/Makefile.am | 34 ++++++----------------------------
+ src/Makefile.am       | 36 +++++++++++++-----------------------
+ 4 files changed, 46 insertions(+), 103 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 47e507e..ba493f5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,35 +3,32 @@
+ AC_PREREQ(2.5)
+ AC_INIT([radlib],[2.12.0],[mteel2005 at gmail.com])
+ AC_CONFIG_SRCDIR([h/radmsgLog.h])
+-AM_INIT_AUTOMAKE([radlib],[2.12.0])
++AM_INIT_AUTOMAKE([subdir-objects])
+ AM_CONFIG_HEADER([config.h])
+ 
+-AC_ARG_ENABLE(mysql,
+-[  --enable-mysql                 include radlib MySQL database support],
+-[case "${enableval}" in
+-  yes) mysql=true ;;
+-  no)  mysql=false ;;
+-  *) mysql=false ;;
+-esac],[mysql=false])
+-AM_CONDITIONAL(MYSQL, test x$mysql = xtrue)
++AC_ARG_WITH([postgresql], AS_HELP_STRING([--with-postgresql], [Build with postgresql]))
++if test "x$with_postgresql" = "xyes"; then
++ PKG_CHECK_MODULES([POSTGRESQL], [libpq], [have_libpq=yes], [have_libpq=no])
++fi
++AM_CONDITIONAL([HAVE_POSTGRESQL],  [test "$have_libpq" = "yes"])
+ 
+-AC_ARG_ENABLE(pgresql,
+-[  --enable-pgresql               include radlib postgreSQL database support],
+-[case "${enableval}" in
+-  yes) pgresql=true ;;
+-  no)  pgresql=false ;;
+-  *) pgresql=false ;;
+-esac],[pgresql=false])
+-AM_CONDITIONAL(PGRESQL, test x$pgresql = xtrue)
++AC_ARG_WITH([mysql], AS_HELP_STRING([--with-mysql], [Build with mysql]))
++if test "x$with_mysql" = "xyes"; then
++        AC_PATH_PROG([MYSQL_CONFIG], [mysql_config])
++        if test "x$MYSQL_CONFIG" != "x";then
++                MYSQL_CFLAGS=`$MYSQL_CONFIG --cflags`
++                MYSQL_LIBS=`$MYSQL_CONFIG --libs`
++                AC_SUBST([MYSQL_CFLAGS])
++                AC_SUBST([MYSQL_LIBS])
++        fi
++fi
++AM_CONDITIONAL([HAVE_MYSQL],  [test "x$MYSQL_CONFIG" != "x"])
+ 
+-AC_ARG_ENABLE(sqlite,
+-[  --enable-sqlite                include radlib sqlite database support],
+-[case "${enableval}" in
+-  yes) sqlite=true ;;
+-  no)  sqlite=false ;;
+-  *) sqlite=false ;;
+-esac],[sqlite=false])
+-AM_CONDITIONAL(SQLITE, test x$sqlite = xtrue)
++AC_ARG_WITH([sqlite], AS_HELP_STRING([--with-sqlite], [Build with sqlite]))
++if test "x$with_sqlite" = "xyes"; then
++	PKG_CHECK_MODULES([SQLITE3], [sqlite3], [have_libsqlite3=yes], [have_libsqlite3=no])
++fi
++AM_CONDITIONAL([HAVE_SQLITE3],  [test "$have_libsqlite3" = "yes"])
+ 
+ # Check for big endian host:
+ AC_C_BIGENDIAN()
+diff --git a/debug/Makefile.am b/debug/Makefile.am
+index 00f3b13..fde57d5 100644
+--- a/debug/Makefile.am
++++ b/debug/Makefile.am
+@@ -4,7 +4,7 @@
+ bin_PROGRAMS = raddebug
+ 
+ # define include directories
+-INCLUDES = \
++AM_CFLAGS = \
+ 		-I$(top_srcdir)/h \
+ 		-D_GNU_SOURCE
+ 
+@@ -15,30 +15,8 @@ raddebug_SOURCES  = \
+ # define libraries
+ raddebug_LDADD   = -lrad -lpthread 
+ 
+-if MYSQL
+-raddebug_LDADD   += -lmysqlclient
+-else
+-if PGRESQL
+-raddebug_LDADD   += -lpq
+-endif
+-endif
+-if SQLITE
+-raddebug_LDADD   += -lsqlite3
+-endif
+-
+ # define library directories
+-raddebug_LDFLAGS = -L../src/.libs -L$(prefix)/lib -L/usr/lib
+-INCLUDES         += -I$(prefix)/include -I/usr/include
+-
+-if MYSQL
+-raddebug_LDFLAGS += -L$(prefix)/lib64/mysql -L$(prefix)/lib/mysql -L/usr/lib64/mysql -L/usr/lib/mysql
+-else
+-if PGRESQL
+-raddebug_LDFLAGS += -L$(prefix)/pgsql/lib
+-INCLUDES         += -I$(prefix)/pgsql/include
+-endif
+-endif
+-
+-if CROSSCOMPILE
+-raddebug_LDFLAGS += $(prefix)/lib/crt1.o $(prefix)/lib/crti.o $(prefix)/lib/crtn.o
+-endif
++raddebug_LDFLAGS = -L../src/.libs \
++		$(SQLITE3_LIBS) \
++		$(MYSQL_LIBS) \
++		$(POSTGRESQL_LIBS)
+diff --git a/msgRouter/Makefile.am b/msgRouter/Makefile.am
+index 5a20421..6f13a4e 100644
+--- a/msgRouter/Makefile.am
++++ b/msgRouter/Makefile.am
+@@ -4,7 +4,7 @@
+ bin_PROGRAMS = radmrouted
+ 
+ # define include directories
+-INCLUDES = \
++AM_CFLAGS = \
+ 		-I$(top_srcdir)/h \
+ 		-D_GNU_SOURCE
+ 
+@@ -13,32 +13,10 @@ radmrouted_SOURCES  = \
+ 		$(top_srcdir)/msgRouter/msgRouter.c
+ 
+ # define libraries
+-radmrouted_LDADD   = -lrad -lpthread
+-
+-if MYSQL
+-radmrouted_LDADD   += -lmysqlclient
+-else
+-if PGRESQL
+-radmrouted_LDADD   += -lpq
+-endif
+-endif
+-if SQLITE
+-radmrouted_LDADD   += -lsqlite3
+-endif
++radmrouted_LDADD  = -lrad -lpthread
+ 
+ # define library directories
+-radmrouted_LDFLAGS = -L../src/.libs -L$(prefix)/lib -L/usr/lib
+-INCLUDES           += -I$(prefix)/include -I/usr/include
+-
+-if MYSQL
+-radmrouted_LDFLAGS += -L$(prefix)/lib64/mysql -L$(prefix)/lib/mysql -L/usr/lib64/mysql -L/usr/lib/mysql
+-else
+-if PGRESQL
+-radmrouted_LDFLAGS += -L$(prefix)/lib -L$(prefix)/pgsql/lib
+-INCLUDES           += -I$(prefix)/pgsql/include
+-endif
+-endif
+-
+-if CROSSCOMPILE
+-radmrouted_LDFLAGS += $(prefix)/lib/crt1.o $(prefix)/lib/crti.o $(prefix)/lib/crtn.o
+-endif
++radmrouted_LDFLAGS = -L../src/.libs \
++			$(SQLITE3_LIBS) \
++			$(MYSQL_LIBS) \
++			$(POSTGRESQL_LIBS)
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 38b2ac8..25d16cf 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -12,45 +12,35 @@ SUBDIRS =
+ #define the library to be built
+ lib_LTLIBRARIES = librad.la
+ 
+-if MYSQL
+-MY_INCLUDES 	= \
+-		-I$(prefix)/include/mysql \
+-		-I/usr/include/mysql
+-MY_SOURCES  	= \
++if HAVE_MYSQL
++MYSQL_SOURCES  	= \
+ 		$(top_srcdir)/database/mysql/my_database.c \
+ 		$(top_srcdir)/src/raddatabase.c
+ MYSQL_HDRS	= \
+ 		$(top_srcdir)/h/raddatabase.h
+ endif
+-if PGRESQL
+-PG_INCLUDES 	= \
+-		-I$(prefix)/include \
+-		-I/usr/include
+-PG_SOURCES	= \
++if HAVE_POSTGRESQL
++PGSQL_SOURCES	= \
+ 		$(top_srcdir)/database/postgresql/pg_database.c \
+ 		$(top_srcdir)/src/raddatabase.c
+ PGSQL_HDRS	= \
+ 		$(top_srcdir)/h/raddatabase.h \
+ 		$(top_srcdir)/database/postgresql/_pg-types.h
+ endif
+-if SQLITE
+-SQ_INCLUDES 	= \
+-		-I$(prefix)/include \
+-		-I/usr/include
+-SQ_SOURCES	= \
++if HAVE_SQLITE3
++SQLITE_SOURCES	= \
+ 		$(top_srcdir)/src/radsqlite.c
+ SQLITE_HDRS	= \
+ 		$(top_srcdir)/h/radsqlite.h
+ endif
+ 
+ # define include directories
+-INCLUDES = \
++AM_CFLAGS = \
+ 		-I$(top_srcdir)/h \
+-		-I$(prefix)/include \
+ 		-D_GNU_SOURCE \
+-		$(MY_INCLUDES) \
+-		$(PG_INCLUDES) \
+-		$(SQ_INCLUDES)
++		$(MYSQL_CFLAGS) \
++		$(SQLITE3_CFLAGS) \
++		$(POSTGRESQL_CFLAGS)
+ 
+ 
+ 
+@@ -86,9 +76,9 @@ librad_la_SOURCES  = \
+ 		$(top_srcdir)/src/radtimers.c \
+ 		$(top_srcdir)/src/radtimeUtils.c \
+ 		$(top_srcdir)/src/radUDPsocket.c \
+-		$(MY_SOURCES) \
+-		$(PG_SOURCES) \
+-		$(SQ_SOURCES)
++		$(MYSQL_SOURCES) \
++		$(PGSQL_SOURCES) \
++		$(SQLITE_SOURCES)
+ 
+ 
+ # define the header files we install for the library
+-- 
+2.4.3
+
-- 
2.4.11
