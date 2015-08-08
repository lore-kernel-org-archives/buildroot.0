From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:39 -0000
Subject: [Buildroot] [git commit branch/next] package/redis: Bump version to
	3.0.3
Message-ID: <20150808105639.0FC9D803C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa24cb8b4fac7b2a6aae38ee0d1d798fdbf54f23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/redis/0001-uclibc.patch |   32 +++++---------------------------
 package/redis/redis.hash        |    4 ++--
 package/redis/redis.mk          |    2 +-
 3 files changed, 8 insertions(+), 30 deletions(-)

diff --git a/package/redis/0001-uclibc.patch b/package/redis/0001-uclibc.patch
index 01657d0..a0534d5 100644
--- a/package/redis/0001-uclibc.patch
+++ b/package/redis/0001-uclibc.patch
@@ -6,40 +6,18 @@ against uclibc.  Patch originates from:
   Mike Steinert, mike.steinert at gmail.com
 
 Signed-off-by: Daniel Price <daniel.price@gmail.com>
+[Martin: adapt to 3.0.3]
+Signed-off-by: Martin Bark <martin@barkynet.com>
 
 =========================================================================
 diff -ur old/src/config.h new/src/config.h
 --- old/src/config.h	2012-10-26 07:20:24.000000000 -0700
 +++ new/src/config.h	2012-10-31 13:41:51.206309564 -0700
-@@ -1,6 +1,10 @@
- #ifndef __CONFIG_H
- #define __CONFIG_H
- 
-+#if defined(__unix) || defined(__linux__)
-+#include <features.h>
-+#endif
-+
- #ifdef __APPLE__
- #include <AvailabilityMacros.h>
- #endif
-@@ -25,7 +29,7 @@
+@@ -62,7 +62,7 @@
  #endif
  
  /* Test for backtrace() */
--#if defined(__APPLE__) || defined(__linux__)
-+#if (defined(__APPLE__) || defined(__linux__) && !defined(__UCLIBC__))
+-#if defined(__APPLE__) || (defined(__linux__) && defined(__GLIBC__))
++#if defined(__APPLE__) || (defined(__linux__) && defined(__GLIBC__) && !defined(__UCLIBC__))
  #define HAVE_BACKTRACE 1
  #endif
- 
-diff -ur old/src/Makefile new/src/Makefile
---- old/src/Makefile	2012-10-26 07:20:24.000000000 -0700
-+++ new/src/Makefile	2012-10-31 13:40:39.224728830 -0700
-@@ -135,7 +135,7 @@
- 	echo REDIS_LDFLAGS=$(REDIS_LDFLAGS) >> .make-settings
- 	echo PREV_FINAL_CFLAGS=$(FINAL_CFLAGS) >> .make-settings
- 	echo PREV_FINAL_LDFLAGS=$(FINAL_LDFLAGS) >> .make-settings
--	-(cd ../deps && $(MAKE) $(DEPENDENCY_TARGETS))
-+	-(cd ../deps && $(MAKE) CC="$(CC)" $(DEPENDENCY_TARGETS))
- 
- .PHONY: persist-settings
- 
diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 5f91766..9afa94f 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	29bb08abfc3d392b2f0c3e7f48ec46dd09ab1023f9a5575fc2a93546f4ca5145	redis-2.8.19.tar.gz
+# From https://github.com/antirez/redis-hashes/blob/master/README
+sha1	0e2d7707327986ae652df717059354b358b83358 	redis-3.0.3.tar.gz
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 4cad061..51c1f9c 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 2.8.19
+REDIS_VERSION = 3.0.3
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
