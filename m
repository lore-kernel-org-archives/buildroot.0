From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Nov 2014 10:36:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/dovecot: Fix build error in SQLite
	module
Message-ID: <1415439365-3224-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch occured with "make dovecot" using this defconfig:
http://autobuild.buildroot.net/results/bd3/bd37ee92eeb00adb1558dbb61315465a0cdfe635/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot/0001-zlib.patch |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/dovecot/0001-zlib.patch

diff --git a/package/dovecot/0001-zlib.patch b/package/dovecot/0001-zlib.patch
new file mode 100644
index 0000000..8935ba2
--- /dev/null
+++ b/package/dovecot/0001-zlib.patch
@@ -0,0 +1,24 @@
+SQLite does not depend on zlib
+
+Fixes build error when zlib target package is not present:
+/home/br/br2/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.9.2/../../../../arm-linux-gnueabihf/bin/ld: cannot find -lz
+
+Patch for configure.ac sent upstream:
+http://www.dovecot.org/list/dovecot/2014-November/098634.html
+
+Here we patch ./configure instead because autoreconf is broken.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr dovecot-2.2.15.org/configure dovecot-2.2.15/configure
+--- dovecot-2.2.15.org/configure	2014-10-25 06:08:57.000000000 +0200
++++ dovecot-2.2.15/configure	2014-11-08 10:08:53.430745198 +0100
+@@ -23865,7 +23865,7 @@
+ 		ac_fn_c_check_header_mongrel "$LINENO" "sqlite3.h" "ac_cv_header_sqlite3_h" "$ac_includes_default"
+ if test "x$ac_cv_header_sqlite3_h" = xyes; then :
+ 
+-			SQLITE_LIBS="$SQLITE_LIBS -lsqlite3 -lz"
++			SQLITE_LIBS="$SQLITE_LIBS -lsqlite3"
+ 
+ 
+ $as_echo "#define HAVE_SQLITE /**/" >>confdefs.h
-- 
1.7.10.4
