From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Feb 2020 09:41:49 +0100
Subject: [Buildroot] [git commit] package/php: security bump version to 7.4.3
Message-ID: <20200221083027.26C8E8E6F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b467d580638e78116fb10d7ea351158f49fa6e8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://www.php.net/ChangeLog-7.php#7.4.3

Fixes CVE-2020-7061, CVE-2020-7062 & CVE-2020-7063.

Removed patch applied upstream:
https://github.com/php/php-src/commit/f0f5c415a6e0abc40514f97113deb52a343174ee

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ompilation-failure-due-to-size_t-typecast.patch | 46 ----------------------
 package/php/php.hash                               |  2 +-
 package/php/php.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 48 deletions(-)

diff --git a/package/php/0005-fix-cross-compilation-failure-due-to-size_t-typecast.patch b/package/php/0005-fix-cross-compilation-failure-due-to-size_t-typecast.patch
deleted file mode 100644
index 342a210179..0000000000
--- a/package/php/0005-fix-cross-compilation-failure-due-to-size_t-typecast.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From f0f5c415a6e0abc40514f97113deb52a343174ee Mon Sep 17 00:00:00 2001
-From: Pascal de Bruijn <pmjdebruijn@pcode.nl>
-Date: Thu, 30 Jan 2020 13:48:44 +0100
-Subject: [PATCH] fix cross compilation failure due to size_t typecast in
- define
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The following commit introduces a cross-compilation failure:
-
-   93c728b77cfb47f5cfdd1863f8982ea59d344205
-  "Try to control ZEND_MM_ALIGNED_SIZE type"
-
-br-arm-full/build/php-7.4.2/Zend/zend_alloc.h:30:38:
-error: missing binary operator before token "8"
-                                              ^
-br-arm-full/build/php-7.4.2/ext/opcache/ZendAccelerator.c:1380:7:
-note: in expansion of macro ???ZEND_MM_ALIGNMENT???
-
-Closes GH-5128.
-
-Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
----
- Zend/zend_alloc.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Zend/zend_alloc.h b/Zend/zend_alloc.h
-index c5838f2ac684..8bb854328dbd 100644
---- a/Zend/zend_alloc.h
-+++ b/Zend/zend_alloc.h
-@@ -27,12 +27,12 @@
- #include "zend.h"
- 
- #ifndef ZEND_MM_ALIGNMENT
--# define ZEND_MM_ALIGNMENT ((size_t) 8)
-+# define ZEND_MM_ALIGNMENT Z_UL(8)
- # define ZEND_MM_ALIGNMENT_LOG2 Z_L(3)
- #elif ZEND_MM_ALIGNMENT < 4
- # undef ZEND_MM_ALIGNMENT
- # undef ZEND_MM_ALIGNMENT_LOG2
--# define ZEND_MM_ALIGNMENT ((size_t) 4)
-+# define ZEND_MM_ALIGNMENT Z_UL(4)
- # define ZEND_MM_ALIGNMENT_LOG2 Z_L(2)
- #endif
- 
diff --git a/package/php/php.hash b/package/php/php.hash
index 69bc1cb6a5..a01e936016 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256 98284deac017da0d426117ecae7599a1f1bf62ae3911e8bc16c4403a8f4bdf13  php-7.4.2.tar.xz
+sha256 cf1f856d877c268124ded1ede40c9fb6142b125fdaafdc54f855120b8bc6982a  php-7.4.3.tar.xz
 
 # License file
 sha256 0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index a0eb9d136b..d4829645e8 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.2
+PHP_VERSION = 7.4.3
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
