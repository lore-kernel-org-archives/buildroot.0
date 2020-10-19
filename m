From: David GOUARIN <dgouarin@gmail.com>
Date: Mon, 19 Oct 2020 22:00:16 +0200
Subject: [Buildroot] [PATCH v5 2/2] package/freeradius-server: new package
In-Reply-To: <20201019200016.24455-1-dgouarin@gmail.com>
References: <20201015221657.7a224c6a@windsurf>
 <20201019200016.24455-1-dgouarin@gmail.com>
Message-ID: <20201019200016.24455-2-dgouarin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FreeRADIUS is an open source server which implements
a protocol for remote user Authorization, Authentication
and Accounting.

Signed-off-by: David GOUARIN <dgouarin@gmail.com>

---
Changes v1 -> v2:
  fix invalid characters in Config.in

Changes v2 -> v3:
  As suggested by Matt, merge with pending upstream patch. Included most of it,
  including patches based on Yocto work :
  http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/freeradius/files
  Didn't kept all the --without directive, as they do not seem useful, nor
  the custom INSTALL_TARGET_CMDS.

Changes v3 -> v4:
  Taken in account Thomas review
  - fix build with BR2_COMPILER_PARANOID_UNSAFE_PATH
  - import patches inside package directory instead of downloading them
  - remove config.cache file, pass the answers on the command line instead
  - add comments for weird TARGET_DIR and R directives
  - remove broken python optional feature. Managed to get it to build
with python 2.7, not 3.0 and it still fails basic testing

Changes v4 -> v5:
  - better package patches formatting

 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 .../0001-host-jlibtool.patch                  |  17 ++
 ...freeradius-avoid-searching-host-dirs.patch | 200 ++++++++++++++++++
 ...s-configure.ac-add-option-for-libcap.patch |  73 +++++++
 ...configure.ac-allow-cross-compilation.patch |  40 ++++
 ...ius-fix-error-for-expansion-of-macro.patch |  64 ++++++
 package/freeradius-server/Config.in           |  18 ++
 .../freeradius-server/freeradius-server.hash  |   3 +
 .../freeradius-server/freeradius-server.mk    | 112 ++++++++++
 10 files changed, 529 insertions(+)
 create mode 100644 package/freeradius-server/0001-host-jlibtool.patch
 create mode 100644 package/freeradius-server/0002-freeradius-avoid-searching-host-dirs.patch
 create mode 100644 package/freeradius-server/0003-freeradius-configure.ac-add-option-for-libcap.patch
 create mode 100644 package/freeradius-server/0004-freeradius-configure.ac-allow-cross-compilation.patch
 create mode 100644 package/freeradius-server/0005-freeradius-fix-error-for-expansion-of-macro.patch
 create mode 100644 package/freeradius-server/Config.in
 create mode 100644 package/freeradius-server/freeradius-server.hash
 create mode 100644 package/freeradius-server/freeradius-server.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c856d7ad45..ae688a85c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -711,6 +711,7 @@ N:	David du Colombier <0intro@gmail.com>
 F:	package/x264/
 
 N:	David GOUARIN <dgouarin@gmail.com>
+F:	package/freeradius-server/
 F:	package/librelp/
 F:	package/libtalloc/
 
diff --git a/package/Config.in b/package/Config.in
index a4d6fe02ae..8e3ce4fe20 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2079,6 +2079,7 @@ menu "Networking applications"
 	source "package/flannel/Config.in"
 	source "package/fmc/Config.in"
 	source "package/fping/Config.in"
+	source "package/freeradius-server/Config.in"
 	source "package/freeswitch/Config.in"
 	source "package/freeswitch-mod-bcg729/Config.in"
 	source "package/frr/Config.in"
diff --git a/package/freeradius-server/0001-host-jlibtool.patch b/package/freeradius-server/0001-host-jlibtool.patch
new file mode 100644
index 0000000000..5c0696ea1b
--- /dev/null
+++ b/package/freeradius-server/0001-host-jlibtool.patch
@@ -0,0 +1,17 @@
+jlibtool.c: while cross compiling, use host CC instead of target CC to build jlibtool
+
+Signed-off-by: David Gouarin <david.gouarin@thalesgroup.com>
+
+--- a/scripts/libtool.mk 2018-10-08 09:22:59.032031858 -0600
++++ b/scripts/libtool.mk 2018-10-08 15:04:18.406661484 -0600
+@@ -43,8 +43,8 @@ ifeq "${LIBTOOL}" "JLIBTOOL"
+    # binary!
+	${JLIBTOOL}: ${top_makedir}/jlibtool.c
+	$(Q)mkdir -p $(dir $@)
+-	$(Q)echo CC jlibtool.c
+-	$(Q)${CC} $< -o $@
++	$(Q)echo HOSTCC jlibtool.c
++	$(Q)${HOSTCC} $< -o $@
+
+    clean: jlibtool_clean
+
diff --git a/package/freeradius-server/0002-freeradius-avoid-searching-host-dirs.patch b/package/freeradius-server/0002-freeradius-avoid-searching-host-dirs.patch
new file mode 100644
index 0000000000..12ced568a2
--- /dev/null
+++ b/package/freeradius-server/0002-freeradius-avoid-searching-host-dirs.patch
@@ -0,0 +1,200 @@
+From dc41591d5ceb18900ec85894f8f7b7bb44bb3bd9 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Mon, 4 Jan 2016 01:44:04 -0500
+Subject: [PATCH] avoid searching host dirs
+
+Don't search the hardcoded host dirs to avoid
+host contamination.
+
+Upstream-Status: Inappropriate [cross-compile specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+Fetch from: http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/freeradius/files
+Signed-off-by: David Gouarin <david.gouarin@thalesgroup.com>
+---
+ acinclude.m4                                                | 4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac        | 4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac   | 4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac      | 4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac      | 6 +++---
+ src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac     | 2 +-
+ src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac | 4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac   | 4 ++--
+ 8 files changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index da48acc..b513ae1 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -178,7 +178,7 @@ if test "x$smart_lib" = "x"; then
+   FR_LOCATE_DIR(smart_lib_dir,[lib$1${libltdl_cv_shlibext}])
+   FR_LOCATE_DIR(smart_lib_dir,[lib$1.a])
+ 
+-  for try in $smart_lib_dir /usr/local/lib /opt/lib; do
++  for try in $smart_lib_dir; do
+     AC_MSG_CHECKING([for $2 in -l$1 in $try])
+     LIBS="-l$1 $old_LIBS"
+     CPPFLAGS="-L$try -Wl,-rpath,$try $old_CPPFLAGS"
+@@ -218,7 +218,7 @@ ac_safe=`echo "$1" | sed 'y%./+-%__pm%'`
+ old_CPPFLAGS="$CPPFLAGS"
+ smart_include=
+ dnl #  The default directories we search in (in addition to the compilers search path)
+-smart_include_dir="/usr/local/include /opt/include"
++smart_include_dir=
+ 
+ dnl #  Our local versions
+ _smart_try_dir=
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
+index 75c851a..a262d71 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
+@@ -57,14 +57,14 @@ if test x$with_[]modname != xno; then
+ 		esac])
+ 
+ 	dnl Check for SQLConnect in -ldb2
+-	smart_try_dir="$ibmdb2_lib_dir /usr/local/db2/lib /usr/IBMdb2/V7.1/lib"
++	smart_try_dir="$ibmdb2_lib_dir"
+ 	FR_SMART_CHECK_LIB(db2, SQLConnect)
+ 	if test "x$ac_cv_lib_db2_SQLConnect" != xyes; then
+ 		fail="$fail libdb2"
+ 	fi
+ 
+ 	dnl Check for sqlcli.h
+-	smart_try_dir="$ibmdb2_include_dir /usr/local/db2/include /usr/IBMdb2/V7.1/include"
++	smart_try_dir="$ibmdb2_include_dir"
+ 	FR_SMART_CHECK_INCLUDE(sqlcli.h)
+ 	if test "x$ac_cv_header_sqlcli_h" != xyes; then
+ 		fail="$fail sqlcli.h"
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
+index 4da57b3..752b043 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
+@@ -56,14 +56,14 @@ if test x$with_[]modname != xno; then
+ 		esac])
+ 
+ 	dnl Check for isc_attach_database in -lfbclient
+-	smart_try_dir="$firebird_lib_dir /usr/lib/firebird2/lib /usr/local/firebird/lib"
++	smart_try_dir="$firebird_lib_dir"
+ 	FR_SMART_CHECK_LIB(fbclient, isc_attach_database)
+ 	if test "x$ac_cv_lib_fbclient_isc_attach_database" != xyes; then
+ 		fail="$fail libfbclient"
+ 	fi
+ 
+ 	dnl Check for ibase.h
+-	smart_try_dir="$firebird_include_dir /usr/lib/firebird2/include /usr/local/firebird/include"
++	smart_try_dir="$firebird_include_dir"
+ 	FR_SMART_CHECK_INCLUDE(ibase.h)
+ 	if test "x$ac_cv_header_ibase_h" != xyes; then
+ 		fail="$fail ibase.h"
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
+index ba6304f..3393557 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
+@@ -57,14 +57,14 @@ if test x$with_[]modname != xno; then
+ 		esac])
+ 
+ 	dnl Check for SQLConnect in -liodbc
+-	smart_try_dir="$iodbc_lib_dir /usr/lib /usr/lib/iodbc /usr/local/lib/iodbc /usr/local/iodbc/lib/iodbc"
++	smart_try_dir="$iodbc_lib_dir"
+ 	FR_SMART_CHECK_LIB(iodbc, SQLConnect)
+ 	if test "x$ac_cv_lib_iodbc_SQLConnect" != xyes; then
+ 		fail="$fail libiodbc"
+ 	fi
+ 
+ 	dnl Check for isql.h
+-	smart_try_dir="$iodbc_include_dir /usr/include /usr/include/iodbc /usr/local/iodbc/include"
++	smart_try_dir="$iodbc_include_dir"
+ 	FR_SMART_CHECK_INCLUDE(isql.h)
+ 	if test "x$ac_cv_header_isql_h" != xyes; then
+ 		fail="$fail isql.h"
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
+index 1401677..2e7db44 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
+@@ -136,7 +136,7 @@ if test x$with_[]modname != xno; then
+ 
+ 	dnl # Check for libmysqlclient_r
+ 	if test "x$have_a_libmysqlclient" != "xyes"; then
+-	    smart_try_dir="$mysql_lib_dir /usr/lib /usr/lib/mysql /usr/local/lib/mysql /usr/local/mysql/lib/mysql"
++	    smart_try_dir="$mysql_lib_dir"
+ 	    FR_SMART_CHECK_LIB(mysqlclient_r, mysql_init)
+ 	    if test "x$ac_cv_lib_mysqlclient_r_mysql_init" = "xyes"; then
+ 			have_a_libmysqlclient='yes'
+@@ -145,7 +145,7 @@ if test x$with_[]modname != xno; then
+ 
+ 	dnl # Check for libmysqlclient
+ 	if test "x$have_a_libmysqlclient" != "xyes"; then
+-	    smart_try_dir="$mysql_lib_dir /usr/lib /usr/lib/mysql /usr/local/lib/mysql /usr/local/mysql/lib/mysql"
++	    smart_try_dir="$mysql_lib_dir"
+ 	    FR_SMART_CHECK_LIB(mysqlclient, mysql_init)
+ 	    if test "x$ac_cv_lib_mysqlclient_mysql_init" = "xyes"; then
+ 			have_a_libmysqlclient='yes'
+@@ -189,7 +189,7 @@ if test x$with_[]modname != xno; then
+     fi
+ 
+     if test "x$have_mysql_h" != "xyes"; then
+-		smart_try_dir="$mysql_include_dir /usr/local/include /usr/local/mysql/include"
++		smart_try_dir="$mysql_include_dir"
+ 		FR_SMART_CHECK_INCLUDE(mysql/mysql.h)
+ 		if test "x$ac_cv_header_mysql_mysql_h" = "xyes"; then
+ 	    	AC_DEFINE(HAVE_MYSQL_MYSQL_H, [], [Define if you have <mysql/mysql.h>])
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
+index 3178462..5cbc8c2 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
+@@ -63,7 +63,7 @@ if test x$with_[]modname != xno; then
+     dnl # Check for header files
+     dnl ############################################################
+ 
+-    smart_try_dir="$oracle_include_dir /usr/local/instaclient/include"
++    smart_try_dir="$oracle_include_dir"
+ 
+     if test "x$ORACLE_HOME" != "x"; then
+ 	smart_try_dir="${smart_try_dir} ${ORACLE_HOME}/include"
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
+index 4f9a890..e1cf811 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
+@@ -41,7 +41,7 @@ if test x$with_[]modname != xno; then
+ 	  esac ]
+ 	)
+ 
+-	smart_try_dir="$rlm_sql_postgresql_include_dir /usr/include/postgresql /usr/local/pgsql/include /usr/include/pgsql"
++	smart_try_dir="$rlm_sql_postgresql_include_dir"
+ 	FR_SMART_CHECK_INCLUDE(libpq-fe.h)
+ 	if test "x$ac_cv_header_libpqmfe_h" != "xyes"; then
+ 		fail="$fail libpq-fe.h"
+@@ -76,7 +76,7 @@ if test x$with_[]modname != xno; then
+ 		  ])
+ 	fi
+ 
+-	smart_try_dir="$rlm_sql_postgresql_lib_dir /usr/lib /usr/local/pgsql/lib"
++	smart_try_dir="$rlm_sql_postgresql_lib_dir"
+ 	FR_SMART_CHECK_LIB(pq, PQconnectdb)
+ 	if test "x$ac_cv_lib_pq_PQconnectdb" != "xyes"; then
+ 		fail="$fail libpq"
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
+index 3545387..c543ed4 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
+@@ -57,14 +57,14 @@ if test x$with_[]modname != xno; then
+ 		esac])
+ 
+ 	dnl Check for SQLConnect in -lodbc
+-	smart_try_dir="$unixodbc_lib_dir /usr/local/unixodbc/lib"
++	smart_try_dir="$unixodbc_lib_dir"
+ 	FR_SMART_CHECK_LIB(odbc, SQLConnect)
+ 	if test "x$ac_cv_lib_odbc_SQLConnect" != xyes; then
+ 		fail="$fail libodbc"
+ 	fi
+ 
+ 	dnl Check for sql.h
+-	smart_try_dir="$unixodbc_include_dir /usr/local/unixodbc/include"
++	smart_try_dir="$unixodbc_include_dir"
+ 	FR_SMART_CHECK_INCLUDE(sql.h)
+ 	if test "x$ac_cv_header_sql_h" != xyes; then
+ 		fail="$fail sql.h"
+-- 
+1.9.1
+
diff --git a/package/freeradius-server/0003-freeradius-configure.ac-add-option-for-libcap.patch b/package/freeradius-server/0003-freeradius-configure.ac-add-option-for-libcap.patch
new file mode 100644
index 0000000000..622d11b221
--- /dev/null
+++ b/package/freeradius-server/0003-freeradius-configure.ac-add-option-for-libcap.patch
@@ -0,0 +1,73 @@
+From 98a9eff357959d1113e33a615c2178751d5b2054 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 22 Aug 2019 10:50:21 +0800
+Subject: [PATCH 2/2] configure.ac: add option for libcap
+
+Upstream-Status: Pending
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Fetch from: http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/freeradius/files
+Signed-off-by: David Gouarin <david.gouarin@thalesgroup.com>
+---
+ configure.ac | 36 +++++++++++++++++++++++++++---------
+ 1 file changed, 27 insertions(+), 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 65db61e..6486aac 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -977,6 +977,22 @@ fi
+ dnl Set by FR_SMART_CHECKLIB
+ LIBS="${old_LIBS}"
+ 
++dnl #
++dnl #  extra argument: --with-libcap
++dnl #
++WITH_LIBCAP=yes
++AC_ARG_WITH(libcap,
++[  --with-licap          use licap for debugger checks. (default=yes)],
++[ case "$withval" in
++  no)
++    WITH_LIBCAP=no
++    ;;
++  *)
++    WITH_LIBCAP=yes
++    ;;
++  esac ]
++)
++
+ dnl Check for cap
+ dnl extra argument: --with-cap-lib-dir=DIR
+ cap_lib_dir=
+@@ -1010,15 +1026,17 @@ AC_ARG_WITH(cap-include-dir,
+       ;;
+   esac])
+ 
+-smart_try_dir="$cap_lib_dir"
+-FR_SMART_CHECK_LIB(cap, cap_get_proc)
+-if test "x$ac_cv_lib_cap_cap_get_proc" != "xyes"; then
+-  AC_MSG_WARN([cap library not found, debugger checks will not be enabled. Use --with-cap-lib-dir=<path>.])
+-else
+-  AC_DEFINE(HAVE_LIBCAP, 1,
+-    [Define to 1 if you have the `cap' library (-lcap).]
+-  )
+-  HAVE_LIBCAP=1
++if test "x$WITH_LIBCAP" = xyes; then
++  smart_try_dir="$cap_lib_dir"
++  FR_SMART_CHECK_LIB(cap, cap_get_proc)
++  if test "x$ac_cv_lib_cap_cap_get_proc" != "xyes"; then
++    AC_MSG_WARN([cap library not found, debugger checks will not be enabled. Use --with-cap-lib-dir=<path>.])
++  else
++    AC_DEFINE(HAVE_LIBCAP, 1,
++      [Define to 1 if you have the `cap' library (-lcap).]
++    )
++    HAVE_LIBCAP=1
++  fi
+ fi
+ 
+ dnl #
+-- 
+2.7.4
+
diff --git a/package/freeradius-server/0004-freeradius-configure.ac-allow-cross-compilation.patch b/package/freeradius-server/0004-freeradius-configure.ac-allow-cross-compilation.patch
new file mode 100644
index 0000000000..16baf5af1a
--- /dev/null
+++ b/package/freeradius-server/0004-freeradius-configure.ac-allow-cross-compilation.patch
@@ -0,0 +1,40 @@
+From 0780b7053fb0d33d721aa70ab2ecd75299e5ba31 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 24 Jul 2018 15:03:39 +0800
+Subject: [PATCH] configure.ac: allow cross-compilation
+
+The checking OpenSSL library and header version consistency will
+always fail in cross compiling, skip the check and give a warning
+instead for cross compiling.
+
+Upstream-Status: Inappropriate[embedded specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+update to new version 3.0.17 to fix patch warning
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Fetch from: http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/freeradius/files
+Signed-off-by: David Gouarin <david.gouarin@thalesgroup.com>
+---
+ src/modules/rlm_krb5/configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/modules/rlm_krb5/configure.ac b/src/modules/rlm_krb5/configure.ac
+index efc9f29..98a97e4 100644
+--- a/src/modules/rlm_krb5/configure.ac
++++ b/src/modules/rlm_krb5/configure.ac
+@@ -137,7 +137,8 @@ if test x$with_[]modname != xno; then
+ 		FR_SMART_CHECK_LIB(krb5, krb5_is_thread_safe)
+ 		if test "x$ac_cv_lib_krb5_krb5_is_thread_safe" = xyes; then
+ 			AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <krb5.h>]], [[return krb5_is_thread_safe() ? 0 : 1]])],
+-				[krb5threadsafe="-DKRB5_IS_THREAD_SAFE"], [AC_MSG_WARN([[libkrb5 is not threadsafe]])])
++				[krb5threadsafe="-DKRB5_IS_THREAD_SAFE"], [AC_MSG_WARN([[libkrb5 is not threadsafe]])],
++				[AC_MSG_WARN(cross compiling: not checking)])
+ 		fi
+ 	else
+ 		krb5threadsafe=""
+-- 
+2.7.4
+
diff --git a/package/freeradius-server/0005-freeradius-fix-error-for-expansion-of-macro.patch b/package/freeradius-server/0005-freeradius-fix-error-for-expansion-of-macro.patch
new file mode 100644
index 0000000000..4355653282
--- /dev/null
+++ b/package/freeradius-server/0005-freeradius-fix-error-for-expansion-of-macro.patch
@@ -0,0 +1,64 @@
+From 5b6d8b14f2696fcf1dca119212f9d0a0fa04defd Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 18 Jan 2017 14:59:39 +0800
+Subject: [PATCH] fix error for expansion of macro in thread.h
+
+The parameter declaration is missing in expansion of macro
+which cause the build error:
+| In file included from src/freeradius-devel/libradius.h:80:0,
+|                  from src/lib/log.c:26:
+| src/lib/log.c: In function '__fr_thread_local_destroy_fr_strerror_buffer':
+| src/lib/log.c:37:31: error: 'fr_strerror_buffer' undeclared (first use in this function)
+|  fr_thread_local_setup(char *, fr_strerror_buffer) /* macro */
+|                                ^
+
+Add the missing declaration in macro.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+Fetch from: http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/freeradius/files
+Signed-off-by: David Gouarin <david.gouarin@thalesgroup.com>
+---
+ src/include/threads.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/include/threads.h b/src/include/threads.h
+index e36d81d..2bcb6aa 100644
+--- a/src/include/threads.h
++++ b/src/include/threads.h
+@@ -89,7 +89,7 @@ static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
+ #  define fr_thread_local_get(_n) _n
+ #elif defined(HAVE_PTHREAD_H)
+ #  include <pthread.h>
+-#  define fr_thread_local_setup(_t, _n) \
++#  define fr_thread_local_setup(_t, _n) static __thread _t _n;\
+ static pthread_key_t __fr_thread_local_key_##_n;\
+ static pthread_once_t __fr_thread_local_once_##_n = PTHREAD_ONCE_INIT;\
+ static pthread_destructor_t __fr_thread_local_destructor_##_n = NULL;\
+@@ -100,17 +100,17 @@ static void __fr_thread_local_destroy_##_n(UNUSED void *unused)\
+ static void __fr_thread_local_key_init_##_n(void)\
+ {\
+ 	(void) pthread_key_create(&__fr_thread_local_key_##_n, __fr_thread_local_destroy_##_n);\
+-	(void) pthread_setspecific(__fr_thread_local_key_##_n, &(_n));\
+ }\
+ static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
+ {\
+ 	__fr_thread_local_destructor_##_n = func;\
+ 	if (_n) return _n; \
+ 	(void) pthread_once(&__fr_thread_local_once_##_n, __fr_thread_local_key_init_##_n);\
++	(void) pthread_setspecific(__fr_thread_local_key_##_n, &(_n));\
+ 	return _n;\
+ }
+-#  define fr_thread_local_init(_n, _f)			__fr_thread_local_init_##_n(_f)
+-#  define fr_thread_local_set(_n, _v)			__fr_thread_local_set_##_n(_v)
+-#  define fr_thread_local_get(_n)			__fr_thread_local_get_##_n()
++#  define fr_thread_local_init(_n, _f)	__fr_thread_local_init_##_n(_f)
++#  define fr_thread_local_set(_n, _v) ((int)!((_n = _v) || 1))
++#  define fr_thread_local_get(_n) _n
+ #endif
+ #endif
+-- 
+2.10.2
+
diff --git a/package/freeradius-server/Config.in b/package/freeradius-server/Config.in
new file mode 100644
index 0000000000..fad8bfeb80
--- /dev/null
+++ b/package/freeradius-server/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_FREERADIUS_SERVER
+	bool "freeradius-server"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBTALLOC
+	help
+	  FreeRADIUS is an open source server which implements
+	  a protocol for remote user Authorization, Authentication
+	  and Accounting.
+
+	  http://wiki.freeradius.org/
+
+comment "freeradius-server needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "freeradius-server needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
diff --git a/package/freeradius-server/freeradius-server.hash b/package/freeradius-server/freeradius-server.hash
new file mode 100644
index 0000000000..ba338d8b7f
--- /dev/null
+++ b/package/freeradius-server/freeradius-server.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  2bf914d471d4409fd72e708e308fa32ca8d01d698c518497a1d4b867d50132ae  freeradius-server-3.0.21.tar.gz
+sha256  8b9cc1e5d41938be45a368f126a6d1fda03d60a3d622dc75e776be4e90c2d2c6  COPYRIGHT
diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
new file mode 100644
index 0000000000..9a0934126f
--- /dev/null
+++ b/package/freeradius-server/freeradius-server.mk
@@ -0,0 +1,112 @@
+################################################################################
+#
+# freeradius-server
+#
+################################################################################
+
+FREERADIUS_SERVER_VERSION = 3.0.21
+FREERADIUS_SERVER_SITE = ftp://ftp.freeradius.org/pub/freeradius
+FREERADIUS_SERVER_LICENSE = GPL-2.0
+FREERADIUS_SERVER_LICENSE_FILES = COPYRIGHT
+FREERADIUS_SERVER_DEPENDENCIES = libtalloc
+
+# some compiler checks are not supported while cross compiling.
+# instead of removing those checks, we cache the answers
+FREERADIUS_SERVER_CONF_OPTS += \
+	ax_cv_cc_bounded_attribute=no \
+	ax_cv_cc_builtin_bswap64=no \
+	ax_cv_cc_builtin_choose_expr=no \
+	ax_cv_cc_builtin_types_compatible_p=no
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-libcap
+FREERADIUS_SERVER_DEPENDENCIES += libcap
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-libcap
+endif
+
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_krb5
+FREERADIUS_SERVER_DEPENDENCIES += libkrb5
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_krb5
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_pam
+FREERADIUS_SERVER_DEPENDENCIES += linux-pam
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_pam
+endif
+
+ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_ldap
+FREERADIUS_SERVER_DEPENDENCIES += openldap
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_ldap
+endif
+
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_sql_mysql
+FREERADIUS_SERVER_DEPENDENCIES += mysql
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_mysql
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_sql_sqlite
+FREERADIUS_SERVER_DEPENDENCIES += sqlite
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_sqlite
+endif
+
+ifeq ($(BR2_PACKAGE_UNIXODBC),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_sql_unixodbc
+FREERADIUS_SERVER_DEPENDENCIES += unixodbc
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_unixodbc
+endif
+
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_sql_postgresql
+FREERADIUS_SERVER_DEPENDENCIES += postgresql
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_postgresql
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_OPENSSL),y)
+FREERADIUS_SERVER_DEPENDENCIES += openssl
+FREERADIUS_SERVER_CONF_OPTS += --with-openssl
+else
+FREERADIUS_CONF_OPTS += --without-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-pcre
+FREERADIUS_SERVER_DEPENDENCIES += pcre
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-pcre
+endif
+
+ifeq ($(BR2_PACKAGE_RUBY),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_ruby
+FREERADIUS_SERVER_DEPENDENCIES += ruby
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_ruby
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-systemd
+FREERADIUS_SERVER_DEPENDENCIES += systemd
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-systemd
+endif
+
+# TARGET_DIR is set to empty to avoid creation of symlinks in hardcoded host directories
+# freeradius Makefile does not support an alternate DESTDIR, instead it uses the magic $(R) variable
+FREERADIUS_SERVER_MAKE_ENV = R=$(TARGET_DIR) TARGET_DIR=""
+
+# use MAKE1 because make install does not support parallel build
+FREERADIUS_SERVER_MAKE = $(MAKE1)
+
+$(eval $(autotools-package))
-- 
2.17.1
