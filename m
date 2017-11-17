From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Nov 2017 16:14:16 +0100
Subject: [Buildroot] [PATCH] libfastjson: indicate explicitly which gcc -std
 option to use
Message-ID: <20171117151416.26736-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit fixes the following build issue of libfastjson with old
enough compilers (4.8) and wchar disabled:

json_object.c: In function 'fjson_object_object_delete':
json_object.c:385:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (int i = 0 ; i < FJSON_OBJECT_CHLD_PG_SIZE ; ++i) {
   ^

The code of libfastjson requires C99. If your compiler is recent
enough (gcc 5.x), then no problem, it is C99 by default, no additional
flags are needed.

If your compiler is older (for example gcc 4.8), then -std=c99 or
-std=gnu99 is explicitly needed to tell the compiler to accept C99
constructs. Testing the compiler for the availability of such flags is
done by libfastjson configure script. However, the test program used
by the configure script uses some wchar_t types, and therefore the
test checking for C99 availability fails on toolchains with wchar
disabled. From config.log:

configure:3928: checking for /home/test/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc option to accept ISO C99
[...]
configure:4077: /home/test/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc -std=gnu99 -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
conftest.c:54:3: error: unknown type name 'wchar_t'
   const wchar_t *name;
   ^

So, just like we did in libv4l in commit
f01396a158f14c53b781c35f7ff29da0bea8c8d6 ("libv4l: fix uclibc-ng
configure/compile"), let's hint directly the configure script that it
should use -std=gnu99. This fixes the build of libfastjson with old
compilers and wchar disabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfastjson/libfastjson.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libfastjson/libfastjson.mk b/package/libfastjson/libfastjson.mk
index b1cdd6a158..06da0d8edd 100644
--- a/package/libfastjson/libfastjson.mk
+++ b/package/libfastjson/libfastjson.mk
@@ -7,6 +7,7 @@
 LIBFASTJSON_VERSION = v0.99.4
 LIBFASTJSON_SITE = $(call github,rsyslog,libfastjson,$(LIBFASTJSON_VERSION))
 LIBFASTJSON_INSTALL_STAGING = YES
+LIBFASTJSON_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 # From git
 LIBFASTJSON_AUTORECONF = YES
 LIBFASTJSON_LICENSE = MIT
-- 
2.13.6
