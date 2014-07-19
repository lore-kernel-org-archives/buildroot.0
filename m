From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 14:19:44 +0200
Subject: [Buildroot] [git commit] libmemcached: disable tests
Message-ID: <20140719122019.B17AB9D257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0556a1b7d62c4093d1c0ed64336e98f907497ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable test libraries and programs, even though it needs to autoreconf
it's a good tradeoff since it cuts the build time by half, and avoids
build issues with extra dependencies that aren't properly checked for.
Fixes:
http://autobuild.buildroot.net/results/739/739ae9b2f28486dec8900aa584145d2d38f44331/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libmemcached-01-disable-tests.patch            |   16 ++++++++++++++++
 package/libmemcached/libmemcached.mk               |    2 ++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/libmemcached/libmemcached-01-disable-tests.patch b/package/libmemcached/libmemcached-01-disable-tests.patch
new file mode 100644
index 0000000..d7da101
--- /dev/null
+++ b/package/libmemcached/libmemcached-01-disable-tests.patch
@@ -0,0 +1,16 @@
+Disable the tests, cuts build time by half and avoids build issues
+with extra dependencies.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura libmemcached-1.0.18.orig/Makefile.am libmemcached-1.0.18/Makefile.am
+--- libmemcached-1.0.18.orig/Makefile.am	2014-07-19 08:43:15.127031040 -0300
++++ libmemcached-1.0.18/Makefile.am	2014-07-19 08:48:11.327068987 -0300
+@@ -76,7 +76,6 @@
+ include libmemcachedinternal/util/include.am
+ include rpm/include.mk
+ include support/include.am
+-include tests/include.am
+ include util/include.am
+ include win32/include.am
+ 
diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index d901e70..fd5b418 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -11,6 +11,8 @@ LIBMEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 LIBMEMCACHED_CONF_OPT = --disable-dtrace
 LIBMEMCACHED_INSTALL_STAGING = YES
 LIBMEMCACHED_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBEVENT),libevent)
+# For libmemcached-01-disable-tests.patch
+LIBMEMCACHED_AUTORECONF = YES
 LIBMEMCACHED_LICENSE = BSD-3c
 LIBMEMCACHED_LICENSE_FILES = COPYING
 
