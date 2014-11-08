From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Nov 2014 23:54:16 +0100
Subject: [Buildroot] [git commit] package/dovecot: Fix build error in SQLite
	module
Message-ID: <20141108230843.0D39DB3814@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d5af94c81eb6ceaad09bd96a95603df845fa73b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch occured with "make dovecot" using this defconfig:
http://autobuild.buildroot.net/results/bd3/bd37ee92eeb00adb1558dbb61315465a0cdfe635/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/0001-zlib.patch |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/dovecot/0001-zlib.patch b/package/dovecot/0001-zlib.patch
new file mode 100644
index 0000000..a6187bf
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
