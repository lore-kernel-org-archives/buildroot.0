From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Thu,  9 May 2019 09:43:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to 5.0.4
Message-ID: <20190509074311.102736-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Redis 5 now supports reproducible builds via SOURCE_DATE_EPOCH
* Add myself to DEVELOPERS for Redis

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 DEVELOPERS                      | 3 +++
 package/redis/0001-uclibc.patch | 9 ++++++---
 package/redis/redis.hash        | 2 +-
 package/redis/redis.mk          | 2 +-
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5bfc4561c0..b1c82dc304 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2221,6 +2221,9 @@ F:	toolchain/
 N:	Timo Ketola <timo.ketola@exertus.fi>
 F:	package/fbgrab/
 
+N:	Titouan Christophe <titouan.christophe@railnova.eu>
+F:	package/redis/
+
 N:	Trent Piepho <tpiepho@impinj.com>
 F:	package/libp11/
 
diff --git a/package/redis/0001-uclibc.patch b/package/redis/0001-uclibc.patch
index a0534d5748..3329a60edc 100644
--- a/package/redis/0001-uclibc.patch
+++ b/package/redis/0001-uclibc.patch
@@ -8,6 +8,8 @@ against uclibc.  Patch originates from:
 Signed-off-by: Daniel Price <daniel.price@gmail.com>
 [Martin: adapt to 3.0.3]
 Signed-off-by: Martin Bark <martin@barkynet.com>
+[Titouan: adapt to 5.0.4]
+Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
 
 =========================================================================
 diff -ur old/src/config.h new/src/config.h
@@ -17,7 +19,8 @@ diff -ur old/src/config.h new/src/config.h
  #endif
  
  /* Test for backtrace() */
--#if defined(__APPLE__) || (defined(__linux__) && defined(__GLIBC__))
-+#if defined(__APPLE__) || (defined(__linux__) && defined(__GLIBC__) && !defined(__UCLIBC__))
+-#if defined(__APPLE__) || (defined(__linux__) && defined(__GLIBC__)) || \
++#if defined(__APPLE__) || (defined(__linux__) && defined(__GLIBC__) && !defined(__UCLIBC__)) || \
+     defined(__FreeBSD__) || (defined(__OpenBSD__) && defined(USE_BACKTRACE))\
+  || defined(__DragonFly__)
  #define HAVE_BACKTRACE 1
- #endif
diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 0b4e25c61d..9ec243d7dd 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256 fc53e73ae7586bcdacb4b63875d1ff04f68c5474c1ddeda78f00e5ae2eed1bbb  redis-4.0.11.tar.gz
+sha256 3ce9ceff5a23f60913e1573f6dfcd4aa53b42d4a2789e28fa53ec2bd28c987dd  redis-5.0.4.tar.gz
 
 # Locally calculated
 sha256 cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index da2307d693..372676438a 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 4.0.11
+REDIS_VERSION = 5.0.4
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.21.0
