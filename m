From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:05:53 +0200
Subject: [Buildroot] [git commit] package/php: security bump version to 7.4.5
Message-ID: <20200417195137.161808EF62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db52b57c3dc625fc06d4408242252129ca47b026
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://www.php.net/ChangeLog-7.php#7.4.5

Fixes CVE-2020-7067.

Removed patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0005-Check-for-sys-auxv.h-before-using-it.patch | 60 ----------------------
 package/php/php.hash                               |  2 +-
 package/php/php.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 62 deletions(-)

diff --git a/package/php/0005-Check-for-sys-auxv.h-before-using-it.patch b/package/php/0005-Check-for-sys-auxv.h-before-using-it.patch
deleted file mode 100644
index 559c64db8a..0000000000
--- a/package/php/0005-Check-for-sys-auxv.h-before-using-it.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From f150702d5ab72878d45b722b6d7d4194db92c44a Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 9 Mar 2020 15:36:48 +0100
-Subject: [PATCH] Check for sys/auxv.h before using it.
-
-Fixes aarch64 compile wiht uclibc-ng (does not provide
-sys/auxv.h header file).
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-Upstream: https://github.com/php/php-src/commit/f73528f0e0d59ac744ccb4a94a3a9d7b9f0fba1b
----
- configure.ac         | 1 +
- ext/standard/crc32.c | 9 +++++++--
- 2 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5219a5f2..caf62302 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -440,6 +440,7 @@ resolv.h \
- strings.h \
- syslog.h \
- sysexits.h \
-+sys/auxv.h \
- sys/ioctl.h \
- sys/file.h \
- sys/mman.h \
-diff --git a/ext/standard/crc32.c b/ext/standard/crc32.c
-index c3ca5903..e59ab45f 100644
---- a/ext/standard/crc32.c
-+++ b/ext/standard/crc32.c
-@@ -17,10 +17,15 @@
- */
- 
- #include "php.h"
-+#ifdef PHP_WIN32
-+#include "config.w32.h"
-+#else
-+#include <php_config.h>
-+#endif
- #include "basic_functions.h"
- #include "crc32.h"
- 
--#if defined(__aarch64__)
-+#if defined(__aarch64__) && defined(HAVE_SYS_AUXV_H)
- # include <arm_acle.h>
- # if defined(__linux__)
- #  include <sys/auxv.h>
-@@ -85,7 +90,7 @@ PHP_NAMED_FUNCTION(php_if_crc32)
- 
- 	crc = crcinit^0xFFFFFFFF;
- 
--#if defined(__aarch64__)
-+#if defined(__aarch64__) && defined(HAVE_SYS_AUXV_H)
- 	if (has_crc32_insn()) {
- 		crc = crc32_aarch64(crc, p, nr);
- 		RETURN_LONG(crc^0xFFFFFFFF);
--- 
-2.25.1
-
diff --git a/package/php/php.hash b/package/php/php.hash
index 4584524f1c..a0b8fd4688 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256 1873c4cefdd3df9a78dcffb2198bba5c2f0464f55c9c960720c84df483fca74c  php-7.4.4.tar.xz
+sha256 d059fd7f55bdc4d2eada15a00a2976697010d3631ef6f83149cc5289e1f23c2c  php-7.4.5.tar.xz
 
 # License file
 sha256 0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index f62204c2a5..91f82dbf31 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.4
+PHP_VERSION = 7.4.5
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
