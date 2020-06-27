From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 27 Jun 2020 06:50:16 +0200
Subject: [Buildroot] [PATCH] package/dropbear: bump to version 2020.80
Message-ID: <20200627045016.335661-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

remove merged patches.

LICENSE diff:
- Copyright (c) 2002-2015 Matt Johnston
+ Copyright (c) 2002-2020 Matt Johnston
- LibTomCrypt and LibTomMath are written by Tom St Denis, and are Public Domain.
+ LibTomCrypt and LibTomMath are written by Tom St Denis and others, see
+ libtomcrypt/LICENSE and libtommath/LICENSE.

and now, handles legal-info when LibTomMath & LibTomCrypt and bundled.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0001-_GNU_SOURCE-for-random.patch         | 25 --------------
 .../0002-move-GNU_SOURCE-earlier.patch        | 34 -------------------
 package/dropbear/dropbear.hash                |  6 ++--
 package/dropbear/dropbear.mk                  |  7 +++-
 4 files changed, 10 insertions(+), 62 deletions(-)
 delete mode 100644 package/dropbear/0001-_GNU_SOURCE-for-random.patch
 delete mode 100644 package/dropbear/0002-move-GNU_SOURCE-earlier.patch

diff --git a/package/dropbear/0001-_GNU_SOURCE-for-random.patch b/package/dropbear/0001-_GNU_SOURCE-for-random.patch
deleted file mode 100644
index dfb851411..000000000
--- a/package/dropbear/0001-_GNU_SOURCE-for-random.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 3f5c106a880a02b21739f2022746e6aa7672474c Mon Sep 17 00:00:00 2001
-From: Matt Johnston <matt@ucc.asn.au>
-Date: Tue, 23 Jun 2020 21:38:46 +0800
-Subject: [PATCH] _GNU_SOURCE for random
-
-[Retrieved from:
-https://github.com/mkj/dropbear/commit/3f5c106a880a02b21739f2022746e6aa7672474c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- includes.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/includes.h b/includes.h
-index e8c3e189..2789f23d 100644
---- a/includes.h
-+++ b/includes.h
-@@ -125,6 +125,8 @@
- #endif
- 
- #ifdef HAVE_SYS_RANDOM_H
-+/* uclibc needs _GNU_SOURCE */
-+#define _GNU_SOURCE
- #include <sys/random.h>
- #endif
- 
diff --git a/package/dropbear/0002-move-GNU_SOURCE-earlier.patch b/package/dropbear/0002-move-GNU_SOURCE-earlier.patch
deleted file mode 100644
index 81282e423..000000000
--- a/package/dropbear/0002-move-GNU_SOURCE-earlier.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a7a67585cbc3fe5df85c641618b347a51a943356 Mon Sep 17 00:00:00 2001
-From: Matt Johnston <matt@ucc.asn.au>
-Date: Tue, 23 Jun 2020 22:24:58 +0800
-Subject: [PATCH] move GNU_SOURCE earlier
-
-[Retrieved from:
-https://github.com/mkj/dropbear/commit/a7a67585cbc3fe5df85c641618b347a51a943356]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- includes.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/includes.h b/includes.h
-index 2789f23d..884ebf71 100644
---- a/includes.h
-+++ b/includes.h
-@@ -25,6 +25,8 @@
- #ifndef DROPBEAR_INCLUDES_H_
- #define DROPBEAR_INCLUDES_H_
- 
-+/* uclibc needs _GNU_SOURCE, maybe other things? */
-+#define _GNU_SOURCE
- 
- #include "options.h"
- #include "debug.h"
-@@ -125,8 +127,6 @@
- #endif
- 
- #ifdef HAVE_SYS_RANDOM_H
--/* uclibc needs _GNU_SOURCE */
--#define _GNU_SOURCE
- #include <sys/random.h>
- #endif
- 
diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index ab53197f3..af69cec53 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,7 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  084f00546b1610a3422a0773e2c04cbe1a220d984209e033b548b49f379cc441  dropbear-2020.79.tar.bz2
+sha256  d927941b91f2da150b2033f1a88b6a47999bf0afb1493a73e9216cffdb5d7949  dropbear-2020.80.tar.bz2
 
 # License file, locally computed
-sha256  2ac2be75a2232ec2473070dd791ee990253dffde6022d364809bbbcbc30f710e  LICENSE
+sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
+sha256  8f196cb13afd271f5e267fd29543fc454596382ad580e7592709492843996ac8  libtomcrypt/LICENSE
+sha256  2fa64b163659f41965c9815882a8296d3d03ff546b76153e11445f9bdecf955a  libtommath/LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index b7342cef5..d0158f022 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,11 +4,16 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2020.79
+DROPBEAR_VERSION = 2020.80
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
+ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
+DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain, Unlicense, WTFPL
+DROPBEAR_LICENSE_FILES = LICENSE, libtommath/LICENSE, libtomcrypt/LICENSE
+else
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
 DROPBEAR_LICENSE_FILES = LICENSE
+endif
 DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
 DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
 
-- 
2.25.1
