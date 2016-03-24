From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Thu, 24 Mar 2016 20:25:02 +0000
Subject: [Buildroot] autotools, pkg_config and mysql_config
Message-ID: <1458851101.3496.13.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi folks,

So  I have a library (radlib) which can link against a couple of database libraries; sqlite, mysql and postgresql. I have been sorting out it's autotools implementation.

SQLite - worked like a dream, with two lines in my configure.ac

PKG_CHECK_MODULES([SQLITE3], [sqlite3], [have_libsqlite3=yes], [have_libsqlite3=no])$
AM_CONDITIONAL([LIB_SQLITE3],  [test "$have_libsqlite3" = "yes"])$

However mysql, in an effort to be slightly different - doesn't use pkg_config, so you therefore can't use PKG_CHECK_MODULES. Instead it ships its own tool mysql_config.

So I wrote some autoconf, to handle that ...

AX_WITH_PROG([MYSQL_CONFIG], [mysql_config], [AC_MSG_ERROR(mysql_config is required to build)])$
if test "x$MYSQL_CONFIG" != "x";then$
  AC_CHECK_HEADERS([mysql.h mysql/mysql.h])$
  if test "x$ac_cv_header_mysql_h" != "xno" -o "x$ac_cv_header_mysql_mysql_h" != "xno" ; then$
    MYSQL_CFLAGS=`$MYSQL_CONFIG --cflags`$
    MYSQL_LIBS=`$MYSQL_CONFIG --libs`$
    AC_SUBST([MYSQL_CFLAGS])$
    AC_SUBST([MYSQL_LIBS])$
  fi$
fi$
AM_CONDITIONAL([LIB_MYSQL],  [test "x$mysql_config" != "x"])

My problem is that, it is continually picking myconfig from my host system. So end up with $MYSQL_CONFIG=/usr/bin/mysql_config instead of target/usr/bin/mysql_config. MYSQL_CFLAGS and MYSQL_LIBS therefore also end up pointing at the host.

pkg_config works fine it gets set to target/usr/bin/pkg_config.

Have tried the other similar autotools macros (https://www.gnu.org/software/autoconf/manual/autoconf-2.68/html_node/Generic-Programs.html) - problem remains the same. Any clues for me?

Ray K
