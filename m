From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Feb 2018 19:26:57 +0100
Subject: [Buildroot] [git commit] libmaxminddb: disable binaries without
 threads
Message-ID: <20180205195155.352D68844C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8dc63d1689a061982debf84856a2bd55f108a538
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libmaxminddb added a pthread dependency to bin/mmdblookup in version
1.3.2

Fixes:
 - https://autobuild.buildroot.net/results/3e653a5fa4cbd714980ce0f1c3b02f3abb6d558e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../libmaxminddb/0001-Add-disable-binaries.patch   | 53 ++++++++++++++++++++++
 package/libmaxminddb/libmaxminddb.mk               |  7 +++
 2 files changed, 60 insertions(+)

diff --git a/package/libmaxminddb/0001-Add-disable-binaries.patch b/package/libmaxminddb/0001-Add-disable-binaries.patch
new file mode 100644
index 0000000000..0053cace71
--- /dev/null
+++ b/package/libmaxminddb/0001-Add-disable-binaries.patch
@@ -0,0 +1,53 @@
+From 501f85fa729d08b90f0e1ff6f9378a0864f722a7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 2 Feb 2018 13:19:18 +0100
+Subject: [PATCH] Add --disable-binaries
+
+mmdblookup now depends on pthread.h which can be disabled on some
+toolchains so add an option to be able to compile libmaxminddb without
+this binary
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 6 ++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index cebcd31..cfbfd77 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -4,8 +4,12 @@ include_HEADERS = include/maxminddb.h
+ nodist_include_HEADERS = include/maxminddb_config.h
+ 
+ SUBDIRS = \
+-  src     \
++  src
++
++if BINARIES
++SUBDIRS += \
+   bin
++endif
+ 
+ if TESTS
+ SUBDIRS += \
+diff --git a/configure.ac b/configure.ac
+index c494746..4d1beb4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -119,6 +119,12 @@ AC_ARG_ENABLE(
+         esac],[debug=false])
+ AM_CONDITIONAL([DEBUG], [test x$debug = xtrue])
+ 
++AC_ARG_ENABLE([binaries],
++        AS_HELP_STRING([--enable-binaries], [Compilation of binaries code]),
++        [enable_binaries=${enableval}],
++        [enable_binaries=yes])
++AM_CONDITIONAL([BINARIES], [test "${enable_binaries}" = "yes"])
++
+ AC_ARG_ENABLE([tests],
+         AS_HELP_STRING([--enable-tests], [Compilation of tests code]),
+         [enable_tests=${enableval}],
+-- 
+2.7.4
+
diff --git a/package/libmaxminddb/libmaxminddb.mk b/package/libmaxminddb/libmaxminddb.mk
index 4d4f582c21..25d4d3378f 100644
--- a/package/libmaxminddb/libmaxminddb.mk
+++ b/package/libmaxminddb/libmaxminddb.mk
@@ -13,4 +13,11 @@ LIBMAXMINDDB_LICENSE_FILES = LICENSE
 LIBMAXMINDDB_AUTORECONF = YES
 LIBMAXMINDDB_CONF_OPTS = --disable-tests
 
+# mmdblookup binary depends on pthreads
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBMAXMINDDB_CONF_OPTS += --enable-binaries
+else
+LIBMAXMINDDB_CONF_OPTS += --disable-binaries
+endif
+
 $(eval $(autotools-package))
