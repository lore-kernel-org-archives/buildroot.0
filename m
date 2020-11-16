From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 22:21:35 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/redis: security
 bump to version 6.0.9
Message-ID: <20201116211239.361E7817A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a76009d7393854ad15aae1e94a1049c88b4bce7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

This release fixes a potential heap overflow when using a heap allocator
other than jemalloc or glibc's malloc. See:
https://github.com/redis/redis/pull/7963

https://raw.githubusercontent.com/redis/redis/6.0/00-RELEASENOTES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f1bce086f6eb174e154a753c6608b3636345fd62)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/0001-uclibc.patch | 4 +++-
 package/redis/redis.hash        | 2 +-
 package/redis/redis.mk          | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/redis/0001-uclibc.patch b/package/redis/0001-uclibc.patch
index 3329a60edc..197f43e7a7 100644
--- a/package/redis/0001-uclibc.patch
+++ b/package/redis/0001-uclibc.patch
@@ -10,6 +10,8 @@ Signed-off-by: Daniel Price <daniel.price@gmail.com>
 Signed-off-by: Martin Bark <martin@barkynet.com>
 [Titouan: adapt to 5.0.4]
 Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
+[Fabrice: update for 6.0.9]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
 =========================================================================
 diff -ur old/src/config.h new/src/config.h
@@ -21,6 +23,6 @@ diff -ur old/src/config.h new/src/config.h
  /* Test for backtrace() */
 -#if defined(__APPLE__) || (defined(__linux__) && defined(__GLIBC__)) || \
 +#if defined(__APPLE__) || (defined(__linux__) && defined(__GLIBC__) && !defined(__UCLIBC__)) || \
-     defined(__FreeBSD__) || (defined(__OpenBSD__) && defined(USE_BACKTRACE))\
+     defined(__FreeBSD__) || ((defined(__OpenBSD__) || defined(__NetBSD__)) && defined(USE_BACKTRACE))\
   || defined(__DragonFly__)
  #define HAVE_BACKTRACE 1
diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index d686d59847..a16bf9dffb 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  04fa1fddc39bd1aecb6739dd5dd73858a3515b427acd1e2947a66dadce868d68  redis-6.0.8.tar.gz
+sha256  dc2bdcf81c620e9f09cfd12e85d3bc631c897b2db7a55218fd8a65eaa37f86dd  redis-6.0.9.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index c567d3200d..b0d8e1cd51 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.0.8
+REDIS_VERSION = 6.0.9
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
