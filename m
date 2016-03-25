From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Mar 2016 16:38:04 +0100
Subject: [Buildroot] autotools, pkg_config and mysql_config
In-Reply-To: <1458851101.3496.13.camel@intel.com>
References: <1458851101.3496.13.camel@intel.com>
Message-ID: <20160325163804.2ab42dbf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Mar 2016 20:25:02 +0000, Kinsella, Ray wrote:

> SQLite - worked like a dream, with two lines in my configure.ac
> 
> PKG_CHECK_MODULES([SQLITE3], [sqlite3], [have_libsqlite3=yes], [have_libsqlite3=no])$
> AM_CONDITIONAL([LIB_SQLITE3],  [test "$have_libsqlite3" = "yes"])$

This automake variable should rather be called HAVE_SQLITE3, and not
LIB_SQLITE3.

> However mysql, in an effort to be slightly different - doesn't use pkg_config, so you therefore can't use PKG_CHECK_MODULES. Instead it ships its own tool mysql_config.
> 
> So I wrote some autoconf, to handle that ...
> 
> AX_WITH_PROG([MYSQL_CONFIG], [mysql_config], [AC_MSG_ERROR(mysql_config is required to build)])$

Why do you use AX_WITH_PROG instead of AC_PATH_PROG ?

> if test "x$MYSQL_CONFIG" != "x";then$
>   AC_CHECK_HEADERS([mysql.h mysql/mysql.h])$

It doesn't seem to make sense to check for MySQL headers before
fetching the MySQL CFLAGS. Indeed, how can you expect to check the
MySQL headers if you haven't yet asked mysql_config for the headers?

I would simply drop this check in fact, and simply rely on whether
mysql_config exists or not.

>   if test "x$ac_cv_header_mysql_h" != "xno" -o "x$ac_cv_header_mysql_mysql_h" != "xno" ; then$
>     MYSQL_CFLAGS=`$MYSQL_CONFIG --cflags`$
>     MYSQL_LIBS=`$MYSQL_CONFIG --libs`$
>     AC_SUBST([MYSQL_CFLAGS])$
>     AC_SUBST([MYSQL_LIBS])$
>   fi$
> fi$

I am not sure why you have a $ at the end of each line.

> AM_CONDITIONAL([LIB_MYSQL],  [test "x$mysql_config" != "x"])

Ditto, I would call the variable HAVE_MYSQL.

> My problem is that, it is continually picking myconfig from my host system. So end up with $MYSQL_CONFIG=/usr/bin/mysql_config instead of target/usr/bin/mysql_config. MYSQL_CFLAGS and MYSQL_LIBS therefore also end up pointing at the host.

Buildroot will install mysql_config in $(STAGING_DIR)/usr/bin, which is
not in the PATH. So you have to explicitly tell your configure script
where it is located. If you use AC_PATH_PROG, you simply need to pass:

	ac_cv_path_MYSQL_CONFIG=$(STAGING_DIR)/usr/bin/mysql_config

in RADLIB_CONF_ENV.

Some examples from Buildroot:

package/directfb/directfb.mk:DIRECTFB_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
package/directfb/directfb.mk:DIRECTFB_CONF_ENV += ac_cv_path_IMLIB2_CONFIG=$(STAGING_DIR)/usr/bin/imlib2-config
package/gnupg/gnupg.mk:GNUPG_CONF_ENV += ac_cv_path__libcurl_config=$(STAGING_DIR)/usr/bin/curl-config
package/gnuplot/gnuplot.mk:     ac_cv_path_GDLIB_CONFIG=$(STAGING_DIR)/usr/bin/gdlib-config
etc, etc.

And there's even one example with MySQL:

package/kodi/kodi.mk:KODI_CONF_ENV += ac_cv_path_MYSQL_CONFIG="$(STAGING_DIR)/usr/bin/mysql_config"

Hope this helps,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
