From: ray.kinsella at intel.com <ray.kinsella@intel.com>
Date: Wed,  6 Apr 2016 14:19:29 +0100
Subject: [Buildroot] [PATCH v4 2/3] package/radlib: Renamed configure.in to
	configure.ac
In-Reply-To: <1459948770-2769-1-git-send-email-ray.kinsella@intel.com>
References: <1459948770-2769-1-git-send-email-ray.kinsella@intel.com>
Message-ID: <1459948770-2769-3-git-send-email-ray.kinsella@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ray Kinsella <ray.kinsella@intel.com>

configure.ac is now standard for autotools, this supresses a
warning on autoreconf.

Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
---
 ...dlib-renamed-configure.in-to-configure.ac.patch | 213 +++++++++++++++++++++
 1 file changed, 213 insertions(+)
 create mode 100644 package/radlib/0001-radlib-renamed-configure.in-to-configure.ac.patch

diff --git a/package/radlib/0001-radlib-renamed-configure.in-to-configure.ac.patch b/package/radlib/0001-radlib-renamed-configure.in-to-configure.ac.patch
new file mode 100644
index 0000000..c808ba7
--- /dev/null
+++ b/package/radlib/0001-radlib-renamed-configure.in-to-configure.ac.patch
@@ -0,0 +1,213 @@
+From d3a51cf6492e062383dd49ee604aa1f77cdd47b0 Mon Sep 17 00:00:00 2001
+From: Ray Kinsella <ray.kinsella@intel.com>
+Date: Wed, 6 Apr 2016 11:23:45 +0100
+Subject: [PATCH 1/2] radlib: renamed configure.in to configure.ac
+
+configure.ac is now standard for autotools, this supresses a warning on
+autoreconf
+
+Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
+---
+ configure.ac | 91 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ configure.in | 91 ------------------------------------------------------------
+ 2 files changed, 91 insertions(+), 91 deletions(-)
+ create mode 100644 configure.ac
+ delete mode 100644 configure.in
+
+diff --git a/configure.ac b/configure.ac
+new file mode 100644
+index 0000000..47e507e
+--- /dev/null
++++ b/configure.ac
+@@ -0,0 +1,91 @@
++# Process this file with autoconf to produce a configure script.
++
++AC_PREREQ(2.5)
++AC_INIT([radlib],[2.12.0],[mteel2005 at gmail.com])
++AC_CONFIG_SRCDIR([h/radmsgLog.h])
++AM_INIT_AUTOMAKE([radlib],[2.12.0])
++AM_CONFIG_HEADER([config.h])
++
++AC_ARG_ENABLE(mysql,
++[  --enable-mysql                 include radlib MySQL database support],
++[case "${enableval}" in
++  yes) mysql=true ;;
++  no)  mysql=false ;;
++  *) mysql=false ;;
++esac],[mysql=false])
++AM_CONDITIONAL(MYSQL, test x$mysql = xtrue)
++
++AC_ARG_ENABLE(pgresql,
++[  --enable-pgresql               include radlib postgreSQL database support],
++[case "${enableval}" in
++  yes) pgresql=true ;;
++  no)  pgresql=false ;;
++  *) pgresql=false ;;
++esac],[pgresql=false])
++AM_CONDITIONAL(PGRESQL, test x$pgresql = xtrue)
++
++AC_ARG_ENABLE(sqlite,
++[  --enable-sqlite                include radlib sqlite database support],
++[case "${enableval}" in
++  yes) sqlite=true ;;
++  no)  sqlite=false ;;
++  *) sqlite=false ;;
++esac],[sqlite=false])
++AM_CONDITIONAL(SQLITE, test x$sqlite = xtrue)
++
++# Check for big endian host:
++AC_C_BIGENDIAN()
++
++# Checks for programs.
++AC_PROG_CC
++AC_PROG_INSTALL
++AC_PROG_LIBTOOL
++
++# Set a flag here if we are cross compiling (must be after AC_PROG_CC)
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
+-[  --enable-mysql                 include radlib MySQL database support],
+-[case "${enableval}" in
+-  yes) mysql=true ;;
+-  no)  mysql=false ;;
+-  *) mysql=false ;;
+-esac],[mysql=false])
+-AM_CONDITIONAL(MYSQL, test x$mysql = xtrue)
+-
+-AC_ARG_ENABLE(pgresql,
+-[  --enable-pgresql               include radlib postgreSQL database support],
+-[case "${enableval}" in
+-  yes) pgresql=true ;;
+-  no)  pgresql=false ;;
+-  *) pgresql=false ;;
+-esac],[pgresql=false])
+-AM_CONDITIONAL(PGRESQL, test x$pgresql = xtrue)
+-
+-AC_ARG_ENABLE(sqlite,
+-[  --enable-sqlite                include radlib sqlite database support],
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
+-# Set a flag here if we are cross compiling (must be after AC_PROG_CC)
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
+-- 
+2.4.3
+
-- 
2.4.11
