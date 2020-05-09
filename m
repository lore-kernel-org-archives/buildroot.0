From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat,  9 May 2020 18:50:36 +0200
Subject: [Buildroot] [PATCH 1/4] package/redis: bump to version 6.0.1
In-Reply-To: <20200509165039.10363-1-titouan.christophe@railnova.eu>
References: <20200509165039.10363-1-titouan.christophe@railnova.eu>
Message-ID: <20200509165039.10363-2-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update dependencies in Config.in because of new requirements
- Add patch for uclibc (accepted upstream, not released yet)
- Update the help text in Config.in to a more recent wording
- Update the hash file to the new 2 spaces convention

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 ...ake-struct-user-anonymous-for-uclibc.patch | 30 +++++++++++++++++++
 package/redis/Config.in                       | 15 ++++++----
 package/redis/redis.hash                      |  4 +--
 package/redis/redis.mk                        |  2 +-
 4 files changed, 42 insertions(+), 9 deletions(-)
 create mode 100644 package/redis/0004-make-struct-user-anonymous-for-uclibc.patch

diff --git a/package/redis/0004-make-struct-user-anonymous-for-uclibc.patch b/package/redis/0004-make-struct-user-anonymous-for-uclibc.patch
new file mode 100644
index 0000000000..944773bde7
--- /dev/null
+++ b/package/redis/0004-make-struct-user-anonymous-for-uclibc.patch
@@ -0,0 +1,30 @@
+From 1f246bfcc8fc2e55f05dd863f286a2057ad29ef7 Mon Sep 17 00:00:00 2001
+From: Titouan Christophe <titouan.christophe@railnova.eu>
+Date: Mon, 4 May 2020 14:11:43 +0200
+Subject: [PATCH] make struct user anonymous (only typedefed)
+
+This works because this struct is never referenced by its name,
+but always by its type.
+
+This prevents a conflict with struct user from <sys/user.h>
+when compiling against uclibc.
+
+Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
+[upstream status: https://github.com/antirez/redis/pull/7200]
+---
+ src/server.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/server.h b/src/server.h
+index 9c2b761c417..59cf1370e52 100644
+--- a/src/server.h
++++ b/src/server.h
+@@ -732,7 +732,7 @@ typedef struct readyList {
+                                            no AUTH is needed, and every
+                                            connection is immediately
+                                            authenticated. */
+-typedef struct user {
++typedef struct {
+     sds name;       /* The username as an SDS string. */
+     uint64_t flags; /* See USER_FLAG_* */
+ 
diff --git a/package/redis/Config.in b/package/redis/Config.in
index 2450ccdf7f..5c418da73c 100644
--- a/package/redis/Config.in
+++ b/package/redis/Config.in
@@ -2,16 +2,19 @@ config BR2_PACKAGE_REDIS
 	bool "redis"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # _Atomic keyword
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
 	help
-	  Redis is an open source, advanced key-value store. It is
-	  often referred to as a data structure server since keys can
-	  contain strings, hashes, lists, sets and sorted sets.
+	  Redis is an open source (BSD licensed), in-memory data structure
+	  store, used as a database, cache and message broker. It supports
+	  data structures such as strings, hashes, lists, sets, sorted sets
+	  with range queries, bitmaps, hyperloglogs, geospatial indexes with
+	  radius queries and streams.
 
 	  http://www.redis.io
 
-comment "redis needs a toolchain w/ dynamic library, threads"
+comment "redis needs a toolchain w/ gcc>=4.9, dynamic library, nptl"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index ee15b75e08..517c7c7330 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256 f3c7eac42f433326a8d981b50dba0169fdfaf46abb23fcda2f933a7552ee4ed7  redis-5.0.8.tar.gz
+sha256  b8756e430479edc162ba9c44dc89ac394316cd482f2dc6b91bcd5fe12593f273  redis-6.0.1.tar.gz
 
 # Locally calculated
-sha256 cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
+sha256  cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index d3954d87ca..bb7829522d 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 5.0.8
+REDIS_VERSION = 6.0.1
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.25.3
