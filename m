From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2020 00:16:09 +0200
Subject: [Buildroot] [git commit] package/redis: bump to version 6.0.4
Message-ID: <20200605222828.2E7C0839EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3263a95a816bb9f8e91c9e832841952ff2123e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update dependencies in Config.in because of new requirements
- Update the help text in Config.in to a more recent wording
- Update the hash file to the new 2 spaces convention

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
[yann.morin.1998 at free.fr:
  - rewrap help text
  - wrap long depends line in comment
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/redis/Config.in  | 17 +++++++++++------
 package/redis/redis.hash |  4 ++--
 package/redis/redis.mk   |  2 +-
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/package/redis/Config.in b/package/redis/Config.in
index 2450ccdf7f..a2239b4a54 100644
--- a/package/redis/Config.in
+++ b/package/redis/Config.in
@@ -2,16 +2,21 @@ config BR2_PACKAGE_REDIS
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
+	  Redis is an open source (BSD licensed), in-memory data
+	  structure store, used as a database, cache and message
+	  broker. It supports data structures such as strings,
+	  hashes, lists, sets, sorted sets with range queries,
+	  bitmaps, hyperloglogs, geospatial indexes with radius
+	  queries and streams.
 
 	  http://www.redis.io
 
-comment "redis needs a toolchain w/ dynamic library, threads"
+comment "redis needs a toolchain w/ gcc>=4.9, dynamic library, nptl"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index ee15b75e08..cf13bb9c0a 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256 f3c7eac42f433326a8d981b50dba0169fdfaf46abb23fcda2f933a7552ee4ed7  redis-5.0.8.tar.gz
+sha256  3337005a1e0c3aa293c87c313467ea8ac11984921fab08807998ba765c9943de  redis-6.0.4.tar.gz
 
 # Locally calculated
-sha256 cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
+sha256  cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index d3954d87ca..1578f97e0d 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 5.0.8
+REDIS_VERSION = 6.0.4
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
