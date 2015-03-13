From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 21:59:15 +0100
Subject: [Buildroot] [git commit] package/unixodbc: new package
Message-ID: <20150313210434.CC1E781810@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ebae47f299abf5fe749897d3cafa82f9ff15bbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                         |    1 +
 package/unixodbc/0001-fix-nopthread.patch |   39 +++++++++++++++++++++++++++++
 package/unixodbc/Config.in                |    7 +++++
 package/unixodbc/unixodbc.hash            |    2 +
 package/unixodbc/unixodbc.mk              |   30 ++++++++++++++++++++++
 5 files changed, 79 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a37e519..9217334 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -674,6 +674,7 @@ menu "Database"
 	source "package/redis/Config.in"
 	source "package/sqlcipher/Config.in"
 	source "package/sqlite/Config.in"
+	source "package/unixodbc/Config.in"
 endmenu
 
 menu "Filesystem"
diff --git a/package/unixodbc/0001-fix-nopthread.patch b/package/unixodbc/0001-fix-nopthread.patch
new file mode 100644
index 0000000..45933e5
--- /dev/null
+++ b/package/unixodbc/0001-fix-nopthread.patch
@@ -0,0 +1,39 @@
+Fix pthread detection
+
+configure.in always calls AC_CHECK_COMP_OPT(pthread) which succeeds with the
+toolchain used although it does not contain thread support:
+
+checking for mutex_lock in -lthread ... no
+checking for pthread_mutex_lock in -lpthread... no
+checking for pthread_mutex_lock in -lc... no
+checking if compiler accepts -pthread... yes
+checking for pthread_mutex_lock in -lc... no
+checking for pthread_mutex_lock in -lpthread... no
+
+This positive configure check leads to
+
+    CFLAGS="$CFLAGS -pthread"
+
+in ./configure, line 15757 which causes a compilation bug
+/home/br/br4/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.3/../../../../arm-buildroot-linux-uclibcgnueab
+
+using this defconfig
+http://autobuild.buildroot.net/results/e86/e86e97ff7887f1bdc6bf913498392ff50f56ea88/defconfig
+
+This patch disables the freebsd-only code path. Patching configure directly
+prevents the need for autoreconf.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr unixODBC-2.3.2.org/configure unixODBC-2.3.2/configure
+--- unixODBC-2.3.2.org/configure	2013-10-08 10:56:03.000000000 +0200
++++ unixODBC-2.3.2/configure	2015-03-13 21:19:59.210429211 +0100
+@@ -15746,7 +15746,7 @@
+ 
+     fi
+ 
+-    if test "x$gotthread" = "xno"; then
++    if test "x$gotthread" = "xnot_needed_for_buildroot"; then
+       if test "x$ac_cv_c_compiler_gnu" = "xyes"; then
+                 { $as_echo "$as_me:${as_lineno-$LINENO}: checking if compiler accepts -pthread" >&5
+ $as_echo_n "checking if compiler accepts -pthread... " >&6; }
diff --git a/package/unixodbc/Config.in b/package/unixodbc/Config.in
new file mode 100644
index 0000000..c23e0a5
--- /dev/null
+++ b/package/unixodbc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_UNIXODBC
+	bool "unixodbc"
+	help
+	  The unixODBC Project goals are to develop and promote unixODBC
+	  to be the definitive standard for ODBC on non MS Windows platforms.
+
+	  http://www.unixodbc.org
diff --git a/package/unixodbc/unixodbc.hash b/package/unixodbc/unixodbc.hash
new file mode 100644
index 0000000..a5c2d11
--- /dev/null
+++ b/package/unixodbc/unixodbc.hash
@@ -0,0 +1,2 @@
+# From ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-2.3.2.tar.gz.md5
+md5	5e4528851eda5d3d4aed249b669bd05b	unixODBC-2.3.2.tar.gz
diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
new file mode 100644
index 0000000..067c1ca
--- /dev/null
+++ b/package/unixodbc/unixodbc.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# unixodbc
+#
+################################################################################
+
+UNIXODBC_VERSION = 2.3.2
+UNIXODBC_SOURCE = unixODBC-$(UNIXODBC_VERSION).tar.gz
+UNIXODBC_SITE = ftp://ftp.unixodbc.org/pub/unixODBC
+UNIXODBC_INSTALL_STAGING = YES
+UNIXODBC_LICENSE = LGPLv2.1+ (library), GPLv2+ (programs)
+UNIXODBC_LICENSE_FILES = COPYING exe/COPYING
+
+UNIXODBC_CONF_OPTS = --enable-drivers --enable-driver-conf
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+UNIXODBC_CONF_OPTS += --enable-iconv
+UNIXODBC_DEPENDENCIES += libiconv
+else
+UNIXODBC_CONF_OPTS += --disable-iconv
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+UNIXODBC_CONF_OPTS += --enable-readline
+UNIXODBC_DEPENDENCIES += readline
+else
+UNIXODBC_CONF_OPTS += --disable-readline
+endif
+
+$(eval $(autotools-package))
