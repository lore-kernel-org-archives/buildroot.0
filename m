From: Titouan Christophe <titouanchristophe@gmail.com>
Date: Mon,  1 Mar 2021 15:37:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/redis: security bump to v6.2.0
Message-ID: <20210301143700.253226-1-titouanchristophe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version also needs a patch from upstream to compile on musl systems.

From the release notes:
================================================================================
Redis 6.2.0 GA  Released Tue Feb 22 14:00:00 IST 2021
================================================================================

Upgrade urgency: SECURITY if you use 32bit build of redis (see bellow), MODERATE
if you used earlier versions of Redis 6.2, LOW otherwise.

Integer overflow on 32-bit systems (CVE-2021-21309):
Redis 4.0 or newer uses a configurable limit for the maximum supported bulk
input size. By default, it is 512MB which is a safe value for all platforms.
If the limit is significantly increased, receiving a large request from a client
may trigger several integer overflow scenarios, which would result with buffer
overflow and heap corruption.

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 ...pile-errors-with-no-HAVE_MALLOC_SIZE.patch | 45 +++++++++++++++++++
 package/redis/redis.hash                      |  2 +-
 package/redis/redis.mk                        |  2 +-
 3 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 package/redis/0004-fix-compile-errors-with-no-HAVE_MALLOC_SIZE.patch

diff --git a/package/redis/0004-fix-compile-errors-with-no-HAVE_MALLOC_SIZE.patch b/package/redis/0004-fix-compile-errors-with-no-HAVE_MALLOC_SIZE.patch
new file mode 100644
index 0000000000..c6b2fc96f6
--- /dev/null
+++ b/package/redis/0004-fix-compile-errors-with-no-HAVE_MALLOC_SIZE.patch
@@ -0,0 +1,45 @@
+From cdfa9601d7b374b3ef6859a4c093046ad331f903 Mon Sep 17 00:00:00 2001
+From: Yossi Gottlieb <yossigo@gmail.com>
+Date: Tue, 23 Feb 2021 13:26:24 +0200
+Subject: [PATCH] Fix compile errors with no HAVE_MALLOC_SIZE.
+
+Fixes #8531
+
+[Backported from https://github.com/redis/redis/pull/8533/commits/cdfa9601d7b374b3ef6859a4c093046ad331f903]
+Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
+---
+ src/zmalloc.c | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/src/zmalloc.c b/src/zmalloc.c
+index c8d6c825f83..fbac0961623 100644
+--- a/src/zmalloc.c
++++ b/src/zmalloc.c
+@@ -32,6 +32,7 @@
+ #include <stdlib.h>
+ #include <stdint.h>
+ #include <unistd.h>
++#include <assert.h>
+ 
+ /* This function provide us access to the original libc free(). This is useful
+  * for instance to free results obtained by backtrace_symbols(). We need
+@@ -49,18 +50,14 @@ void zlibc_free(void *ptr) {
+ 
+ #ifdef HAVE_MALLOC_SIZE
+ #define PREFIX_SIZE (0)
++#define ASSERT_NO_SIZE_OVERFLOW(sz)
+ #else
+ #if defined(__sun) || defined(__sparc) || defined(__sparc__)
+ #define PREFIX_SIZE (sizeof(long long))
+ #else
+ #define PREFIX_SIZE (sizeof(size_t))
+ #endif
+-#endif
+-
+-#if PREFIX_SIZE > 0
+ #define ASSERT_NO_SIZE_OVERFLOW(sz) assert((sz) + PREFIX_SIZE > (sz))
+-#else
+-#define ASSERT_NO_SIZE_OVERFLOW(sz)
+ #endif
+ 
+ /* Explicitly override malloc/free etc when using tcmalloc. */
diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index b72605013e..8bce9a17fd 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  79bbb894f9dceb33ca699ee3ca4a4e1228be7fb5547aeb2f99d921e86c1285bd  redis-6.0.10.tar.gz
+sha256  67d624c25d962bd68aff8812a135df85bad07556b8825f3bcd5b522a9932dbca  redis-6.2.0.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 96132ae962..dace3eff55 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.0.10
+REDIS_VERSION = 6.2.0
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.25.3
