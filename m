From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Mon, 28 Mar 2016 19:40:27 +0000
Subject: [Buildroot] [PATCH v2] radlib: new package
Message-ID: <1459194027.3607.13.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Delta's from v1:-

 * Complete rework of patch for the package's autotools implementation
  * Removed references to prefix.
  * Reworked database support to use PKG_CHECK_MODULES and
AC_PATH_PROG.
  * Used '--with--somedb' to indicate which database backend to build
with. (The radlib build ends up with conflicting symbols if more than
one is enabled at the same time, we prevent this in the package's .mk).
 * Complete rework of the Kconfig.
  * Database support is only enabled when BR2_PACKAGE_(mysql, sqlite or
postgresql) are set.
  * Database backend is selected by 'choice' when more than one is
enabled. 
 * Other tidy up's recommended for the v1 patch. 
  * Included a comment on radlib.hash.
  * Added signed off line and description to the patch.
  * Removed no_sync from mysql.
  * etc.

radlib is a rapid application development library for unix
multi-process applications. It uses SYS V IPC facilities and
FIFOs to provide an RTOS-like, event-driven, distributed
framework. Processes may be run as daemons or have a controlling
terminal.

Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
---
 package/Config.in                                  |   1 +
 ...0001-Update-to-autoconf-to-use-pkg-config.patch | 388
+++++++++++++++++++++
 package/radlib/Config.in                           |  37 ++
 package/radlib/radlib.hash                         |   2 +
 package/radlib/radlib.mk                           |  28 ++
 5 files changed, 456 insertions(+)
 create mode 100644 package/radlib/0001-Update-to-autoconf-to-use-pkg
-config.patch
 create mode 100644 package/radlib/Config.in
 create mode 100644 package/radlib/radlib.hash
 create mode 100644 package/radlib/radlib.mk

diff --git a/package/Config.in b/package/Config.in
index 8208da8..13fb380 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1260,6 +1260,7 @@ endif
 	source "package/protobuf-c/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
+	source "package/radlib/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
diff --git a/package/radlib/0001-Update-to-autoconf-to-use-pkg
-config.patch b/package/radlib/0001-Update-to-autoconf-to-use-pkg
-config.patch
new file mode 100644
index 0000000..f98b9d5
--- /dev/null
+++ b/package/radlib/0001-Update-to-autoconf-to-use-pkg-config.patch
@@ -0,0 +1,388 @@
+From d4c1b74a6624da7cc217c6b1aef59dc60b7d20c0 Mon Sep 17 00:00:00 2001
+From: Ray Kinsella <ray.kinsella@intel.com>
+Date: Sun, 27 Mar 2016 16:38:16 +0100
+Subject: [PATCH] Update to autoconf to use pkg-config
+
+Updates to autoconf as follows;
+
+ * Use pkg-config for postgresql and sqlite
+ * Use mysql-config for mysql
+ * Also removed unecessary conditionals from sub-makefiles
+
+Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
+---
+ configure.ac          | 88
+++++++++++++++++++++++++++++++++++++++++++++++++
+ configure.in          | 91 ------------------------------------------
---------
+ debug/Makefile.am     | 32 +++---------------
+ msgRouter/Makefile.am | 34 ++++---------------
+ src/Makefile.am       | 36 ++++++++------------
+ 5 files changed, 112 insertions(+), 169 deletions(-)
+ create mode 100644 configure.ac
+ delete mode 100644 configure.in
+
+diff --git a/configure.ac b/configure.ac
+new file mode 100644
+index 0000000..ba493f5
+--- /dev/null
++++ b/configure.ac
+@@ -0,0 +1,88 @@
++# Process this file with autoconf to produce a configure script.
++
++AC_PREREQ(2.5)
++AC_INIT([radlib],[2.12.0],[mteel2005 at gmail.com])
++AC_CONFIG_SRCDIR([h/radmsgLog.h])
++AM_INIT_AUTOMAKE([subdir-objects])
++AM_CONFIG_HEADER([config.h])
++
++AC_ARG_WITH([postgresql], AS_HELP_STRING([--with-postgresql], [Build
with postgresql]))
++if test "x$with_postgresql" = "xyes"; then
++ PKG_CHECK_MODULES([POSTGRESQL], [libpq], [have_libpq=yes],
[have_libpq=no])
++fi
++AM_CONDITIONAL([HAVE_POSTGRESQL],  [test "$have_libpq" = "yes"])
++
++AC_ARG_WITH([mysql], AS_HELP_STRING([--with-mysql], [Build with
mysql]))
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
++
++AC_ARG_WITH([sqlite], AS_HELP_STRING([--with-sqlite], [Build with
sqlite]))
++if test "x$with_sqlite" = "xyes"; then
++	PKG_CHECK_MODULES([SQLITE3], [sqlite3],
[have_libsqlite3=yes], [have_libsqlite3=no])
++fi
++AM_CONDITIONAL([HAVE_SQLITE3],  [test "$have_libsqlite3" = "yes"])
++
++# Check for big endian host:
++AC_C_BIGENDIAN()
++
++# Checks for programs.
++AC_PROG_CC
++AC_PROG_INSTALL
++AC_PROG_LIBTOOL
++
++# Set a flag here if we are cross compiling (must be after
AC_PROG_CC)
++AM_CONDITIONAL(CROSSCOMPILE, test x$cross_compiling = xyes)
++
++# Checks for libraries.
++AC_CHECK_LIB([c], [strncpy])
++AC_CHECK_LIB([m], [exp])
++
++# Checks for header files.
++AC_HEADER_STDC
++AC_HEADER_SYS_WAIT
++AC_CHECK_HEADERS([fcntl.h \
++                  stdlib.h \
++                  string.h \
++                  sys/time.h \
++                  syslog.h \
++                  termios.h \
++                  unistd.h])
++
++# Checks for typedefs, structures, and compiler characteristics.
++AC_C_CONST
++AC_TYPE_PID_T
++AC_HEADER_TIME
++AC_STRUCT_TM
++
++# Checks for library functions.
++AC_FUNC_FORK
++AC_FUNC_MALLOC
++AC_FUNC_SELECT_ARGTYPES
++AC_TYPE_SIGNAL
++AC_FUNC_STAT
++AC_FUNC_VPRINTF
++AC_CHECK_FUNCS([getcwd \
++                gethostname \
++                gettimeofday \
++                memset \
++                mkdir \
++                mkfifo \
++                select \
++                strchr \
++                strerror \
++                strrchr])
++
++AC_CONFIG_FILES([Makefile \
++                 src/Makefile \
++                 msgRouter/Makefile \
++                 debug/Makefile])
++AC_OUTPUT
++
+diff --git a/configure.in b/configure.in
+deleted file mode 100644
+index 47e507e..0000000
+--- a/configure.in
++++ /dev/null
+@@ -1,91 +0,0 @@
+-# Process this file with autoconf to produce a configure script.
+-
+-AC_PREREQ(2.5)
+-AC_INIT([radlib],[2.12.0],[mteel2005 at gmail.com])
+-AC_CONFIG_SRCDIR([h/radmsgLog.h])
+-AM_INIT_AUTOMAKE([radlib],[2.12.0])
+-AM_CONFIG_HEADER([config.h])
+-
+-AC_ARG_ENABLE(mysql,
+-[  --enable-mysql                 include radlib MySQL database
support],
+-[case "${enableval}" in
+-  yes) mysql=true ;;
+-  no)  mysql=false ;;
+-  *) mysql=false ;;
+-esac],[mysql=false])
+-AM_CONDITIONAL(MYSQL, test x$mysql = xtrue)
+-
+-AC_ARG_ENABLE(pgresql,
+-[  --enable-pgresql               include radlib postgreSQL database
support],
+-[case "${enableval}" in
+-  yes) pgresql=true ;;
+-  no)  pgresql=false ;;
+-  *) pgresql=false ;;
+-esac],[pgresql=false])
+-AM_CONDITIONAL(PGRESQL, test x$pgresql = xtrue)
+-
+-AC_ARG_ENABLE(sqlite,
+-[  --enable-sqlite                include radlib sqlite database
support],
+-[case "${enableval}" in
+-  yes) sqlite=true ;;
+-  no)  sqlite=false ;;
+-  *) sqlite=false ;;
+-esac],[sqlite=false])
+-AM_CONDITIONAL(SQLITE, test x$sqlite = xtrue)
+-
+-# Check for big endian host:
+-AC_C_BIGENDIAN()
+-
+-# Checks for programs.
+-AC_PROG_CC
+-AC_PROG_INSTALL
+-AC_PROG_LIBTOOL
+-
+-# Set a flag here if we are cross compiling (must be after
AC_PROG_CC)
+-AM_CONDITIONAL(CROSSCOMPILE, test x$cross_compiling = xyes)
+-
+-# Checks for libraries.
+-AC_CHECK_LIB([c], [strncpy])
+-AC_CHECK_LIB([m], [exp])
+-
+-# Checks for header files.
+-AC_HEADER_STDC
+-AC_HEADER_SYS_WAIT
+-AC_CHECK_HEADERS([fcntl.h \
+-                  stdlib.h \
+-                  string.h \
+-                  sys/time.h \
+-                  syslog.h \
+-                  termios.h \
+-                  unistd.h])
+-
+-# Checks for typedefs, structures, and compiler characteristics.
+-AC_C_CONST
+-AC_TYPE_PID_T
+-AC_HEADER_TIME
+-AC_STRUCT_TM
+-
+-# Checks for library functions.
+-AC_FUNC_FORK
+-AC_FUNC_MALLOC
+-AC_FUNC_SELECT_ARGTYPES
+-AC_TYPE_SIGNAL
+-AC_FUNC_STAT
+-AC_FUNC_VPRINTF
+-AC_CHECK_FUNCS([getcwd \
+-                gethostname \
+-                gettimeofday \
+-                memset \
+-                mkdir \
+-                mkfifo \
+-                select \
+-                strchr \
+-                strerror \
+-                strrchr])
+-
+-AC_CONFIG_FILES([Makefile \
+-                 src/Makefile \
+-                 msgRouter/Makefile \
+-                 debug/Makefile])
+-AC_OUTPUT
+-
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
+-raddebug_LDFLAGS += -L$(prefix)/lib64/mysql -L$(prefix)/lib/mysql 
-L/usr/lib64/mysql -L/usr/lib/mysql
+-else
+-if PGRESQL
+-raddebug_LDFLAGS += -L$(prefix)/pgsql/lib
+-INCLUDES         += -I$(prefix)/pgsql/include
+-endif
+-endif
+-
+-if CROSSCOMPILE
+-raddebug_LDFLAGS += $(prefix)/lib/crt1.o $(prefix)/lib/crti.o
$(prefix)/lib/crtn.o
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
+-radmrouted_LDFLAGS += -L$(prefix)/lib64/mysql -L$(prefix)/lib/mysql 
-L/usr/lib64/mysql -L/usr/lib/mysql
+-else
+-if PGRESQL
+-radmrouted_LDFLAGS += -L$(prefix)/lib -L$(prefix)/pgsql/lib
+-INCLUDES           += -I$(prefix)/pgsql/include
+-endif
+-endif
+-
+-if CROSSCOMPILE
+-radmrouted_LDFLAGS += $(prefix)/lib/crt1.o $(prefix)/lib/crti.o
$(prefix)/lib/crtn.o
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
diff --git a/package/radlib/Config.in b/package/radlib/Config.in
new file mode 100644
index 0000000..e77e03c
--- /dev/null
+++ b/package/radlib/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_RADLIB
+	bool "radlib"
+	help
+	  radlib is a rapid application development library for unix
+	  multi-process applications. It uses SYS V IPC facilities and
+	  FIFOs to provide an RTOS-like, event-driven, distributed
framework.
+	  Processes may be run as daemons or have a controlling
terminal.
+	  
+	  http://sourceforge.net/projects/radlib/
+
+choice
+	prompt "radlib database backend"
+	depends on BR2_PACKAGE_RADLIB
+	depends on BR2_PACKAGE_SQLITE \
+		|| BR2_PACKAGE_MYSQL \
+		|| BR2_PACKAGE_POSTGRESQL
+	help$
+		Selects the backend database: sqlite, mysql or
postgresql
+
+config BR2_PACKAGE_RADLIB_SQLITE
+	bool "sqlite"
+	depends on BR2_PACKAGE_SQLITE
+	help
+		Configure radlib to use a sqlite database backend
+
+config BR2_PACKAGE_RADLIB_MYSQL
+	bool "mysql"
+	depends on BR2_PACKAGE_MYSQL
+	help
+		Configure radlib to use a mysql database backend
+
+config BR2_PACKAGE_RADLIB_POSTGRESQL
+	bool "postgresql"
+	depends on BR2_PACKAGE_POSTGRESQL
+	help
+		Configure radlib to use a postgresql database backend
+endchoice
diff --git a/package/radlib/radlib.hash b/package/radlib/radlib.hash
new file mode 100644
index 0000000..2fbfbba
--- /dev/null
+++ b/package/radlib/radlib.hash
@@ -0,0 +1,2 @@
+# From http://sourceforge.net/projects/radlib/files/
+sha256 
 82b98bb5e08a500dea1e4252843b9c772fa1fb67ac8ab89ed64abdd5e22eca66 
 radlib-2.12.0.tar.gz
diff --git a/package/radlib/radlib.mk b/package/radlib/radlib.mk
new file mode 100644
index 0000000..5ff55ac
--- /dev/null
+++ b/package/radlib/radlib.mk
@@ -0,0 +1,28 @@
+######################################################################
##########
+#
+# radlib
+#
+######################################################################
##########
+
+RADLIB_VERSION = 2.12.0
+RADLIB_SITE = http://downloads.sourceforge.net/radlib
+RADLIB_INSTALL_STAGING = YES
+RADLIB_LICENSE = BSD-2c
+RADLIB_LICENSE_FILES = COPYING
+RADLIB_AUTORECONF = YES
+RADLIB_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_RADLIB_SQLITE),y)
+	RADLIB_CONF_OPTS += --with-sqlite
+endif
+
+ifeq ($(BR2_PACKAGE_RADLIB_MYSQL),y)
+	RADLIB_CONF_ENV=ac_cv_path_MYSQL_CONFIG="$(STAGING_DIR)/usr/bi
n/mysql_config"
+	RADLIB_CONF_OPTS += --with-mysql
+endif
+
+ifeq ($(BR2_PACKAGE_RADLIB_POSTGRESQL),y)
+	RADLIB_CONF_OPTS += --with-postgresql
+endif
+
+$(eval $(autotools-package))
-- 
2.4.3
